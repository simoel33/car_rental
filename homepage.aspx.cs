using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DemoProjet
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cm = new SqlCommand("delete from promotions where end_date< '" + DateTime.Now.ToString("yyyy-MM-dd") + "';", con);
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
            cm.ExecuteNonQuery();
            con.Close();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewDetails")
            {
                Response.Redirect("carDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}