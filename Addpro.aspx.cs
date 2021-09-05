using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        String strcon = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["status"].Equals("Owner"))
                {
                   
                }
                else
                {
                    Response.Redirect("homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
                Response.Redirect("homepage.aspx");
            }

            if (!IsPostBack)
            {
                string user = Session["username"].ToString();
                SqlConnection con = new SqlConnection(strcon);
                if (con.State != System.Data.ConnectionState.Open)
                    con.Open();
                SqlCommand cm = new SqlCommand("select car_id from car_tbl where owner_username='"+user+"'", con);
                SqlDataReader r = cm.ExecuteReader();
                while (r.Read())
                    idcar.Items.Add(r["car_id"].ToString());
                con.Close();
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            string id = idcar.SelectedValue.ToString();
            string start = Pickup.Text.ToString();
            string end = dropoff.Text.ToString();
            int prce =int.Parse(prc.Text.ToString());

            string query = "insert into promotions(car_id,pourcentage,begin_date,end_date)" +
                "values(@id,@prce,@start,@end)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@prce", prce);
            cmd.Parameters.AddWithValue("@start", start);
            cmd.Parameters.AddWithValue("@end", end);
            try {
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
                Response.Write("<script>alert('promotion registered');</script>");
                Response.Redirect("homepage.aspx");
            }
            catch(Exception m)
            {
                Response.Write("<script>alert("+m+");</script>");
            }
        }
    }
}