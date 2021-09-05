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
    public partial class RentCar : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static double cost=0;
        static string owner = "";
        static string LodgerNumber = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["status"].Equals("Lodger"))
                {
                    MemberUsername.Text = Session["username"].ToString();
                    MemberName.Text = Session["fullname"].ToString();
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

        protected void Get_Click(object sender, EventArgs e)
        {
            if(available())
             {
                 getInfos();
            } 
            else 
            { 
                Response.Write("<script>alert('Non Available');</script>"); 
                getInfos();
                ButtonRent.Enabled = false;
            }

        }
        void getInfos()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from car_tbl WHERE car_id='" + CarID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    CarName.Text = dt.Rows[0]["car_name"].ToString();
                    cost = Convert.ToDouble(dt.Rows[0]["rent_cost"]);
                    owner = dt.Rows[0]["owner_username"].ToString();
                    Cost_.Text = dt.Rows[0]["rent_cost"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Car ID');</script>");
                }
                cmd = new SqlCommand("select * from member_tbl WHERE member_username='" + owner + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    OwnerNumber.Text = dt.Rows[0]["number"].ToString();
                    OwnerEmail.Text = dt.Rows[0]["email"].ToString();
                }
                cmd = new SqlCommand("select * from member_tbl WHERE member_username='" + Session["username"] + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    LodgerNumber= dt.Rows[0]["number"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {

            }
        }
        protected void ButtonRent_Click(object sender, EventArgs e)
        {
                if(checkIfCarRented())
                {
                    Response.Write("<script>alert('Car already rented');</script>");

                } else
                {
                    rentCar();
                }             
        }
        bool available()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from car_tbl WHERE car_id='" + CarID.Text.Trim() + "' AND status = 'available'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                     return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        bool checkIfCarRented()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from rent_tbl WHERE lodger_username='" + MemberUsername.Text.Trim() + "' AND car_id='" + CarID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        void rentCar()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[rent_tbl]
                                                       ([lodger_username]
                                                       ,[lodger_number]
                                                       ,[owner_username]
                                                       ,[pick_up_date]
                                                       ,[drop_off_date]
                                                       ,[booking_date]
                                                       ,[price]
                                                       ,[payment]
                                                       ,[car_id])
                                                 VALUES
                                                       (@lodger_username
                                                       ,@lodger_number
                                                       ,@owner_username
                                                       ,@pick_up_date
                                                       ,@drop_off_date
                                                       ,@booking_date
                                                       ,@price
                                                       ,@payment
                                                       ,@car_id)", con);

                cmd.Parameters.AddWithValue("@owner_username", owner);
                cmd.Parameters.AddWithValue("@lodger_username", MemberUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@lodger_number", LodgerNumber);
                cmd.Parameters.AddWithValue("@car_id", CarID.Text.Trim());
                cmd.Parameters.AddWithValue("@pick_up_date", Pickup.Text.Trim());
                cmd.Parameters.AddWithValue("@drop_off_date", DropOff.Text.Trim());
                cmd.Parameters.AddWithValue("@price", Cost_.Text.Trim());
                cmd.Parameters.AddWithValue("@booking_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@payment",DropDownListPayment.SelectedValue.ToString().Trim());
                cmd.ExecuteNonQuery();
                /*
                cmd = new SqlCommand(@"UPDATE car_tbl
                                           SET status
                                         WHERE car_id = '" + CarID.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                */
                con.Close();
                Response.Write("<script>alert('Booked! The owner will contact you!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButtonDate_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime pickup = Convert.ToDateTime(Pickup.Text);
                DateTime dropoff = Convert.ToDateTime(DropOff.Text);
                DateTime today = DateTime.Today;

                if (pickup < today || dropoff < today || pickup == today || dropoff == today)
                {
                    Response.Write("<script>alert(' Dont choose a previous date or today's date ');</script>");
                }
                else if (dropoff < pickup || dropoff == pickup)
                {
                    Response.Write("<script>alert(' Invalid dates ');</script>");
                }
                else
                {
                    TimeSpan ts = dropoff.Subtract(pickup);
                    int days = Convert.ToInt16(ts.Days);
                    Cost_.Text = Convert.ToString(days * cost);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}