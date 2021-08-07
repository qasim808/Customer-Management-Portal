using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace customerProject
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void onButton_Submit(object sender, EventArgs e)
        {
            
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["DBConn"];
            using (SqlConnection dbConn = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dbConn.Open();
                    ltMessage.Text = "Connection OPEN.";
                    try
                    {
                        SqlCommand command = new SqlCommand(string.Format("SELECT * FROM dbo.masterLogin WHERE email = '{0}' AND account_password = '{1}'", emailTxt.Text, passwordTxt.Text), dbConn);
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            Site1.successfulLogin = true;
                            Response.Redirect("~/Management");
                        }
                        else
                        {
                            ltMessage.Text = "NOT ALLOWED TO LOG IN";
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
                //perform login and password checks here and then redirect to another aspx.
                // string message = String.Format("Email Entered {0} with password {1}", emailTxt.Text, passwordTxt.Text);
                //  ltMessage.Text = message
        }
        }
}
