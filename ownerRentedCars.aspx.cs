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
    public partial class ownerRentedCars : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["status"].Equals("Owner"))
                {
                    if (!IsPostBack)
                    {
                        gridBind();
                    }
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
        }
        
        void gridBind()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from rent_tbl where owner_username ='" + Session["username"] + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows==true)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gridBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string car_id = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string charges = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            string delay = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string remarks = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
            string status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text;


            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"UPDATE [dbo].[rent_tbl]
                                                       SET [price] = @charges
                                                          ,[booking_status] = @status
                                                          ,[delay] = @delay
                                                          ,[remarks] = @remarks
                                                     WHERE [orderId] = @id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@charges", charges);
                    cmd.Parameters.AddWithValue("@delay", delay);
                    cmd.Parameters.AddWithValue("@remarks", remarks);
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Write("<script>alert('Data updated');</script>");
                        GridView1.EditIndex = -1;
                        gridBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gridBind();
        }
    }
}