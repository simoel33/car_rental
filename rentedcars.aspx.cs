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
    public partial class rentedcars : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (!Session["role"].Equals("admin"))
                {
                    Response.Redirect("homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
                Response.Redirect("homepage.aspx");
            }
        }

        protected void ButtonFav_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[favorite_list_tbl]
                                                       ([member_username]
                                                       ,[full_name])
                                                 VALUES
                                                       (@username
                                                       ,@fullname)", con);

                cmd.Parameters.AddWithValue("@username", Username.Text.Trim());
                cmd.Parameters.AddWithValue("@fullname", FullName.Text.Trim());
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Write("<script>alert('Done!');</script>");
                    ButtonFav.Enabled = false;
                    ButtonBlack.Enabled = false;
                    clearform();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ButtonBlack_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[black_list_tbl]
                                                       ([member_username]
                                                       ,[full_name])
                                                 VALUES
                                                       (@username
                                                       ,@fullname)", con);

                cmd.Parameters.AddWithValue("@username", Username.Text.Trim());
                cmd.Parameters.AddWithValue("@fullname", FullName.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Done!');</script>");
                clearform();
                ButtonFav.Enabled = false;
                ButtonBlack.Enabled = false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButtonGet_Click(object sender, EventArgs e)
        {
            getInfo();
        }
        void getInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_tbl where member_username ='" + Username.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        FullName.Text = dr.GetValue(1).ToString();
                    }
                    ButtonFav.Enabled = true;
                    ButtonBlack.Enabled = true;

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
        void clearform()
        {
            Username.Text = "";
            FullName.Text = "";
        }

    }
}