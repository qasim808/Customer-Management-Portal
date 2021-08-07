using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProject
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Site1.successfulLogin)
                Response.Redirect("~/Login");
        }

        protected void btnHandleNewCustomer_Submit(object sender, EventArgs e)
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
            }
            else
            {
                if (SqlHelper.executeSP("dbo.InsertCustomer", objs))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "completeForm();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "failModal();", true);
                }
            }

        }
        protected void btnHandleUpdateCustomer_Proceed(object sender, EventArgs e) {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AnyType", "popUp_UpdateCustomerForm_2();", true);
        }

        protected void btnHandleUpdateCustomer_Submit (object sender, EventArgs e)
        {

        }
    }
}
