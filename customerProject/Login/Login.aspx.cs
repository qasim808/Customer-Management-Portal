using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;
using System.Threading;

namespace customerProject
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Redirect("Management");
            }
            if (!IsPostBack)
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
        }
        protected void onButton_Submit(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["DBConn"];
            using (SqlConnection dbConn = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dbConn.Open();
                    try
                    {
                        SqlCommand command = new SqlCommand(string.Format("SELECT * FROM dbo.masterLogin WHERE email = '{0}' AND account_password = '{1}'", emailTxt.Text, passwordTxt.Text), dbConn);
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            /*Session["UserName"] = emailTxt.Text;
                            Session["Pwd"] = passwordTxt.Text;
                            Response.Redirect("~/Management");*/
                            FormsAuthentication.RedirectFromLoginPage(emailTxt.Text, false);
                            /* else
                                {
                                    failedReasonLiteral.Text = "User is already logged in.";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                                    //Response.Redirect("~/Login");
                                }*/
                        }
                        else
                        {
                            failedReasonLiteral.Text = "Wrong Credentials";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                                
                            //Response.Redirect("~/Login");
                        }
                    }

                    catch (SqlException error)
                    {
                        ltMessage.Text = error.Message;
                    }

                }
                catch (SqlException error)
                {
                    ltMessage.Text = error.ToString();
                }
            }

            Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            //perform login and password checks here and then redirect to another aspx.
            // string message = String.Format("Email Entered {0} with password {1}", emailTxt.Text, passwordTxt.Text);
            //  ltMessage.Text = message
        }

        protected void onRegistrationBtn_handle(object sender, EventArgs e)
        {
            DataAccess SqlHelper = new DataAccess();
            if (newUser_email.Text != "" && newUser_password.Text != "")
            {
                if (SqlHelper.executeAdminSPs("registerNewUser", new string[] { newUser_email.Text, newUser_password.Text }))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "tickSign();", true);
                }
                else
                {
                    failedReasonLiteral.Text = "Error.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }
            }
            else
            {
                failedReasonLiteral.Text = "Empty Fields";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
            }

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];
        }

    }
}
