using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProject
{
    public partial class CustomerGrid : System.Web.UI.Page
    {
        protected int currentPageNo = 0;
        protected int rows;
        string occupiedButton = "btn btn-info ml-1";
        string unOccupiedButton = "btn btn-outline-info ml-1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                errorLabel.Text = "Please select offset to load the grid.";
                errorLabel.Visible = true;
                errorLabel.CssClass = "display-4 text-center";
                currentPg.Visible = false;
                amtOfButtons.Visible = false;
                pageOffset.Visible = false;
                DataAccess sqlHelper = new DataAccess();
                int rows = sqlHelper.getTotalRowCount();
                //Display 5 options
                int totalNumOfOptions = 5;
                int choiceJump = rows / totalNumOfOptions;
                for (int i = choiceJump; i <= rows; i = i + choiceJump)
                {
                    ListItem optionToList = new ListItem(i.ToString(), i.ToString());
                    selectPageSize.Items.Add(optionToList);
                }
                ListItem totalRows = new ListItem(rows.ToString(), rows.ToString());
                selectPageSize.Items.Add(totalRows);
                /*this.BindGrid();
                currentPg.Visible = false;
                pageNumber.CssClass = "col-md-auto";
                pageNumber.Text = "Page - 1/" + ((rows / 5) + 1).ToString();*/
            }
            else
            {
                if (amtOfButtons != null && amtOfButtons.Text != "")
                    createButtons(Int32.Parse(pageOffset.Text));
            }

        }
        protected void createButtons(int selectedSize)
        {
            DataAccess sqlHelper = new DataAccess();
            int rows = sqlHelper.getTotalRowCount();
            decimal amtOfPages = Math.Ceiling((decimal)rows / selectedSize);
            placeHolderForButtons.Controls.Clear();
            for (int i=1; i<=(int)amtOfPages; i++)
            {
                Button newBtn = new Button();
                newBtn.Text = i.ToString();
                newBtn.CssClass = unOccupiedButton;
                newBtn.Attributes.Add("runat", "server");
                newBtn.Click += new EventHandler(this.handleIndexBtn_Click);
                placeHolderForButtons.Controls.Add(newBtn);
            }
            amtOfButtons.Text = amtOfPages.ToString();
        }
        protected void BindGrid(int pageNo, int selectedSize)
        {
            DataAccess SqlHelper = new DataAccess();
            DataTable table = SqlHelper.customerGridSP(pageNo-1, selectedSize);
            using (table)
            {
                customerGrid.DataSource = table;
                customerGrid.DataBind();
            }
            if (errorLabel.Visible)
                errorLabel.Visible = false;
        }
        protected void loadBtn_BtnClick(object sender, EventArgs e)
        {
            int selectedSize = Int32.Parse(selectPageSize.SelectedValue);
            pageOffset.Text = selectedSize.ToString();
            BindGrid(1, selectedSize);
            createButtons(selectedSize);
            Button temp = (Button)placeHolderForButtons.Controls[0];
            temp.CssClass = occupiedButton;
        }
        protected void handleIndexBtn_Click(object sender, EventArgs e)
        {
            Button temp = new Button();
            temp = (Button)sender;
            setRemainderButtonsBlank(Int32.Parse(temp.Text));
            temp.CssClass = occupiedButton;
            BindGrid(Int32.Parse(temp.Text), Int32.Parse(pageOffset.Text));
        }
        protected void setRemainderButtonsBlank (int index) {
            for (int i = index-1; i >= 0; i--)
            {
                Button btn_temp = (Button)placeHolderForButtons.Controls[i];
                btn_temp.CssClass = unOccupiedButton;
            }
            for (int i=index-1; i<placeHolderForButtons.Controls.Count; i++)
            {
                Button btn_temp = (Button)placeHolderForButtons.Controls[i];
                btn_temp.CssClass = unOccupiedButton;
            }
        }
        /*protected bool BindGrid()
        {
            DataAccess sqlHelper = new DataAccess();
            DataTable dataTable = sqlHelper.customerGridSP(currentPageNo);
            float totalPossiblePages = rows / 5;
            float currentPage = float.Parse(currentPg.Text);
            if (dataTable.Rows.Count == 0)
            {
                errorLabel.CssClass = "display-4";
                errorLabel.Text = "No records to show.";
                errorLabel.Visible = true;
                nextPage.Visible = false;
            }
            //2 or more pages
            else if (totalPossiblePages >= 2)
            {
                if ((float)currentPageNo < totalPossiblePages)
                {
                    errorLabel.Visible = false;
                    firstPage.Visible = true;
                    lastPage.Visible = true;
                    nextPage.Visible = true;
                    if ((float)currentPageNo == 0)
                    {
                        prevPage.Visible = false;
                        firstPage.Visible = false;
                    }
                    else
                    {
                        prevPage.Visible = true;
                        firstPage.Visible = true;
                    }
                }
                else if ((float)currentPageNo == totalPossiblePages)
                {
                    lastPage.Visible = false;
                    prevPage.Visible = true;
                    nextPage.Visible = false;
                    firstPage.Visible = true;
                }
                else
                {
                    nextPage.Visible = false;
                    lastPage.Visible = false;
                }
            }
            else if (totalPossiblePages > 1)
            {
                if ((float)currentPageNo < totalPossiblePages)
                {
                    errorLabel.Visible = false;
                    nextPage.Visible = true;
                    lastPage.Visible = false;
                    if ((float)currentPageNo == 0)
                    {
                        prevPage.Visible = false;
                        firstPage.Visible = false;
                    }
                    else
                    {
                        prevPage.Visible = true;
                        firstPage.Visible = true;
                    }
                }
                else if ((float)currentPageNo == totalPossiblePages)
                {
                    lastPage.Visible = false;
                    prevPage.Visible = true;
                    nextPage.Visible = false;
                    firstPage.Visible = true;
                }
                else
                {
                    nextPage.Visible = false;
                    lastPage.Visible = false;
                }
            }
            else if (totalPossiblePages == 1)
            {
                firstPage.Visible = true;
                lastPage.Visible = false;
                nextPage.Visible = false;
                prevPage.Visible = false;
                errorLabel.Visible = false;
            }
            else
            {
                errorLabel.Visible = true;
                lastPage.Visible = false;
                nextPage.Visible = false;
                prevPage.Visible = false;
                firstPage.Visible = false;
            }
            
            using (dataTable)
            {
                customerGrid.DataSource = dataTable;
                customerGrid.DataBind();
            }
            return dataTable.Rows.Count > 0 ? true : false;
            
        }
        protected void nxtPg_BtnClick(object sender, EventArgs e)
        {
            string cPageNo = currentPg.Text;
            currentPageNo = Int32.Parse(cPageNo);
            ++currentPageNo;
            if (!BindGrid() && currentPageNo > 1)
            {
                --currentPageNo;
            }
            currentPg.Text = currentPageNo.ToString();
            pageNumber.Text = "Page - " + (currentPageNo + 1).ToString() +"/" + ((rows / 5) + 1).ToString();
        }
        protected void prevpg_BtnClick(object sender, EventArgs e)
        {
            if (Int32.Parse(currentPg.Text) > 0)
            {
                string cPageNo = currentPg.Text;
                currentPageNo = Int32.Parse(cPageNo);
                --currentPageNo;
                if (!BindGrid())
                {
                    ++currentPageNo;
                }
                currentPg.Text = currentPageNo.ToString();
            }
            pageNumber.Text = "Page - " + (currentPageNo + 1).ToString() + "/" + ((rows / 5) + 1).ToString();
        }
        protected void firstpg_BtnClick(object sender, EventArgs e)
        {
            currentPageNo = 0;
            BindGrid();
            currentPg.Text = currentPageNo.ToString();
            pageNumber.Text = "Page - 1/" + ((rows / 5) + 1).ToString();

        }
        protected void lastpg_BtnClick(object sender, EventArgs e)
        {
            currentPageNo = rows / 5;
            BindGrid();
            currentPg.Text = currentPageNo.ToString();
            pageNumber.Text = "Page - " + ((rows / 5) + 1).ToString() + "/" + ((rows / 5) + 1).ToString();
        }*/
    }
}
