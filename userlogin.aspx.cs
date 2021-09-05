using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class userlogin : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_tbl where member_username ='" + username.Text.Trim() + "' and password ='"+password.Text.Trim()+"'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while(dr.Read())
                    {
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["fullname"] = dr.GetValue(1).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
               
            }
        }
    }
}