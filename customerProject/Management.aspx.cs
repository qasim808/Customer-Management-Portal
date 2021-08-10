using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace customerProject
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["pwd"] == null)
            {
                Response.Redirect("~/Login");
            }

            if (!IsPostBack)
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        

        protected void btnHandleNewCustomer_Submit(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                DataAccess SqlHelper = new DataAccess();
                TextBox[] objs = new TextBox[5];
                objs[0] = newCustomer_CNIC;
                objs[1] = newCustomer_Phone;
                objs[2] = newCustomer_customerName;
                objs[3] = newCustomer_address;
                objs[4] = newCustomer_email;

                if (newCustomer_address.Text == "" || newCustomer_customerName.Text == "" || newCustomer_email.Text == "" || newCustomer_Phone.Text == "" || newCustomer_CNIC.Text == "")
                {
                    if (Page.IsPostBack && SiteMaster.countForModalLoad < 1)
                    {
                        failedReasonLiteral.Text = "One of the field is still blank.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                        SiteMaster.countForModalLoad++;
                        return;
                    }
                }
                else
                {
                    if (SqlHelper.executeSP("dbo.InsertCustomer", objs))
                    {
                        successLiteral.Text = "New Customer Registered/Added.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                    }
                    else
                    {
                        failedReasonLiteral.Text = "Customer already exists.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                    }
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
                return;
            }

        }
        protected void btnHandleUpdateCustomer_Proceed(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                if (updateForm_CustomerCNIC.Text != "")
                {
                    DataAccess SqlHelper = new DataAccess();
                    SqlHelper.isConnectionOpen();
                    string queryForUpdation = string.Format("SELECT * FROM dbo.customers WHERE customerCNIC = '{0}'", updateForm_CustomerCNIC.Text);
                    string[] values = SqlHelper.executeQuery(queryForUpdation);
                    if (values != null)
                    {
                        form2_UpdateCustomer_CNIC.Text = values[0];
                        form2_UpdateCustomer_Phone.Text = values[1];
                        form2_UpdateCustomer_Name.Text = values[2];
                        form2_UpdateCustomerAddress.Text = values[3];
                        form2_UpdateCustomer_Email.Text = values[4];
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "popUp_UpdateCustomerForm_2();", true);
                        SqlHelper.closeConnection();
                    }
                    else
                    {
                        failedReasonLiteral.Text = "No such record exists.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                    }
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }

        protected void btnHandleUpdateCustomer_Submit(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                DataAccess SqlHelper = new DataAccess();
                TextBox[] objs = new TextBox[6];
                objs[0] = updateForm_CustomerCNIC;
                objs[1] = form2_UpdateCustomer_Phone;
                objs[2] = form2_UpdateCustomer_Name;
                objs[3] = form2_UpdateCustomerAddress;
                objs[4] = form2_UpdateCustomer_Email;
                objs[5] = form2_UpdateCustomer_CNIC;

                if (SqlHelper.executeSP("updateCustomerRecord", objs))
                {
                    successLiteral.Text = "Customer updated.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                }
                else
                {
                    failedReasonLiteral.Text = "Customer updation failed.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }

        protected void btnHandleDeleterCustomer_Proceed(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                if (deleteForm_customerCNIC.Text != "")
                {
                    DataAccess SqlHelper = new DataAccess();
                    SqlHelper.isConnectionOpen();
                    string queryForDeletion = string.Format("SELECT * FROM dbo.customers WHERE customerCNIC = '{0}'", deleteForm_customerCNIC.Text);
                    string[] values = SqlHelper.executeQuery(queryForDeletion);
                    if (values != null)
                    {
                        delFormFinal_CNIC.Text = values[0];
                        delFormFinal_Phone.Text = values[1];
                        delFormFinal_Name.Text = values[2];
                        delFormFinal_Address.Text = values[3];
                        delFormFinal_Email.Text = values[4];
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "show_delForm_Final();", true);
                        SqlHelper.closeConnection();
                    }
                    else
                    {
                        failedReasonLiteral.Text = "No such record exists.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                    }
                }
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());

            }
        }
        protected void btn_DeleteConfirm(object sender, EventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
            {
                TextBox[] objs = new TextBox[1];
                DataAccess SqlHelper = new DataAccess();
                objs[0] = deleteForm_customerCNIC;

                if (SqlHelper.executeSP("deleteCustomer", objs))
                {
                    successLiteral.Text = "Customer Deleted.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                }
                else
                {
                    failedReasonLiteral.Text = "Not able to proceed.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }

                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];
        }
        protected void btn_listCustomers(object senders, EventArgs e)
        {
            Response.Redirect("customer_list");
        }
        
    }
}
