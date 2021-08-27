using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProject
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = this.Page.GetType().Name.ToString();
            if (type == "login_default_aspx")
            {
                management.Visible = false;
                customers.Visible = false;
                admin.Visible = false;
                logout.Visible = false;
                login.Visible = true;
                grid.Visible = false;
            }
            else
            {
                login.Visible = false;
            }
        }
    }
}
