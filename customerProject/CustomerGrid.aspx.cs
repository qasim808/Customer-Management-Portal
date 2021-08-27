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
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess sqlHelper = new DataAccess();
            SqlDataReader reader = sqlHelper.executeFetchQuery("SELECT COUNT(*) FROM CUSTOMERS");
            if (reader.Read())
            {
                rows = Int32.Parse(reader.GetValue(0).ToString());
            }
            /* if (Session["UserName"]  == null || Session["pwd"] == null)
             {
                 Response.Redirect("~/Login");
             }

             else*/
            if (!this.IsPostBack)
            {
                this.BindGrid();
                currentPg.Visible = false;
                pageNumber.CssClass = "col-md-auto";
                pageNumber.Text = "Page - 1/" + ((rows / 5) + 1).ToString();
            }
            

        }
        protected bool BindGrid()
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
        }
    }
}
