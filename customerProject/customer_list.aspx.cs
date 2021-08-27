using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace customerProject
{
    public partial class customer_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           /*if (Session["UserName"] == null || Session["pwd"] == null)
            {
                Response.Redirect("~/Login");
            }
            else*/ if (!this.IsPostBack)
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
                this.BindGrid();
                if (GridView1.Rows.Count == 0)
                {
                   Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "disableContainer();", true);
                    //msgLiteral.Text = "No records to display.";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "enableContainer();", true);
                }
            }
        }
        private void BindGrid()
        {
            DataAccess SqlHelper = new DataAccess();
            DataTable table = SqlHelper.gridViewSP("getDataForGridView");
            using (table) {
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
        }
        private bool BindSearchGrid()
        {
            string name = searchBar.Text;
            DataAccess sqlHelper = new DataAccess();
            DataTable table = sqlHelper.searchBarSP(name);
            if (table.Rows.Count > 0)
            {
                using (table)
                {
                    GridView1.DataSource = table;
                    GridView1.DataBind();
                    return true;
                }
            }
            return false;
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (checkbtn.Text == "1")
            {
                this.BindGrid();
            }
            else
            {
                BindSearchGrid();
            }
        }
        protected void btn_handleUpdate(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "popUp_UpdateCustomerForm_2();", true);
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void btnHandleUpdateCustomer_Submit(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                DataAccess SqlHelper = new DataAccess();
                TextBox[] objs = new TextBox[6];
                objs[0] = tempCNICHolder;
                objs[1] = form2_UpdateCustomer_Phone;
                objs[2] = form2_UpdateCustomer_Name;
                objs[3] = form2_UpdateCustomer_Address;
                objs[4] = form2_UpdateCustomer_Email;
                objs[5] = form2_UpdateCustomer_CNIC;

                if (SqlHelper.executeSP("updateCustomerRecord", objs))
                {
                    this.BindGrid();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "tickModal();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void btn_delete(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                DataAccess SqlHelper = new DataAccess();
                TextBox[] objs = new TextBox[1];
                objs[0] = delForm_CNIC;
                if (SqlHelper.executeSP("deleteCustomer", objs))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "tickModal();", true);
                    this.BindGrid();
                    if (GridView1.Rows.Count == 0)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "disableContainer();", true);
                        //msgLiteral.Text = "No records to display.";
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void btn_deleteHelper(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "popUp_DeleteForm();", true);
                
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void initiateSearch_BtnClick(object sender, EventArgs e)
        {
            if (BindSearchGrid())
            {
                checkbtn.Text = "2";
            }
            else
            {
                checkbtn.Text = "1";
                //no user found.
            }
        }
        protected void reset_BtnClick(object sender, EventArgs e)
        {
            this.BindGrid();
            checkbtn.Text = "1";

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];
        }
    }
}
