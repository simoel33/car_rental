using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class clientsList : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["role"].Equals("")) // aucun utilisateur connecté
                {
                    Response.Redirect("homepage.aspx");
                }
                
                else if (Session["role"].Equals("admin"))
                {
                    if (!IsPostBack)
                    {
                        grid1Bind(); grid2Bind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
                Response.Redirect("homepage.aspx");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e) 
        {
            string username = GridView1.DataKeys[e.RowIndex].Value.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"DELETE FROM [dbo].[favorite_list_tbl]
                                                            WHERE member_username=@username", con);
                    cmd.Parameters.AddWithValue("@username", username);
                    
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Write("<script>alert('Deleted');</script>");
                        GridView1.EditIndex = -1;
                        grid1Bind();
                    }
                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = GridView2.DataKeys[e.RowIndex].Value.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"DELETE FROM [dbo].[black_list_tbl]
                                                            WHERE member_username=@username", con);
                    cmd.Parameters.AddWithValue("@username", username);

                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Write("<script>alert('Deleted');</script>");
                        GridView2.EditIndex = -1;
                        grid2Bind();
                    }
                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }
        void grid1Bind()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from [dbo].[favorite_list_tbl]", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
        void grid2Bind()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from [dbo].[black_list_tbl]", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    GridView2.DataSource = dr;
                    GridView2.DataBind();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
    }
}