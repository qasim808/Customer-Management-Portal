using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProject
{
    public partial class AdminRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["pwd"] == null)
                Response.Redirect("~/Login");

            if (!Page.IsPostBack)
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
                BindGrid();
            }
        }
        protected void BindGrid()
        {
            DataAccess SqlHelper = new DataAccess();
            DataTable table = SqlHelper.gridViewSP("getPendingApproval");
            using (table)
            {
                PendingRequests.DataSource = table;
                PendingRequests.DataBind();
                if (PendingRequests.Rows.Count == 0)
                {
                    msgLiteral.Text = "No records to display.";
                }
            }

        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PendingRequests.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void PendingRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = PendingRequests.Rows[rowIndex];
                string email = row.Cells[0].Text;
                string password = row.Cells[1].Text;
                DataAccess SqlHelper = new DataAccess();

                if (e.CommandName == "Approve")
                {
                    //Determine the RowIndex of the Row whose Button was clicked.

                    if (SqlHelper.executeAdminSPs("addToMasterLogin", new string[] { email, password }))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                        this.DataBind();
                        if (PendingRequests.Rows.Count == 0)
                        {
                            msgLiteral.Text = "No records to display.";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                    }
                }
                else if (e.CommandName == "Deny")
                {
                    if (SqlHelper.executeAdminSPs("removeRegistration", new string[] { email, password }))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                        this.DataBind();
                        if (PendingRequests.Rows.Count == 0)
                        {
                            msgLiteral.Text = "No records to display.";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                    }
                }
            }
            Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];
        }
        
    }
}
