using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace customerProject
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Session["UserName"] = null;
            Session["Pwd"] = null;*/
            FormsAuthentication.SignOut();
            Response.Redirect("Login");
        }
    }
}
