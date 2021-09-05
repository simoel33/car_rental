using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class carDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "rentCar")
            {
                Response.Redirect("RentCar.aspx?id=" + e.CommandArgument.ToString());               
            }
        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}