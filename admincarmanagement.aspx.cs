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
    public partial class admincarmanagement : System.Web.UI.Page
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
                else
                {
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
                Response.Redirect("homepage.aspx");
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            if (checkIfCarExists())
            {
                //deleteCar();
            }
            else
            {
                Response.Write("<script>alert('Car does not exist');</script>");
            }
        }

        protected void LinkButtonGet_Click(object sender, EventArgs e)
        {
            getCarByID();
        }
        void getCarByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from car_tbl where car_id ='" + CarID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    CarName.Text = dt.Rows[0][1].ToString();
                    Owner.Text = dt.Rows[0]["owner_username"].ToString();
                    Seats.Text = dt.Rows[0][8].ToString();
                    Doors.Text = dt.Rows[0][9].ToString();
                    LargeBag.Text = dt.Rows[0][10].ToString();
                    SmallBag.Text = dt.Rows[0][11].ToString();
                    Color.Text = dt.Rows[0][5].ToString();
                    RentCost.Text = dt.Rows[0][14].ToString();
                    Year.Text = dt.Rows[0][4].ToString();
                    Pickup.Text = dt.Rows[0]["pickup"].ToString();
                    Dropoff.Text = dt.Rows[0]["dropoff"].ToString();
                    State.Text = dt.Rows[0]["state"].ToString().Trim();
                    Brand.Text = dt.Rows[0]["brand"].ToString().Trim();
                    FuelPolicy.Text = dt.Rows[0]["fuel_policy"].ToString().Trim();
                    AC.Text = dt.Rows[0]["ac"].ToString().Trim();
                    GearBox.Text = dt.Rows[0]["gearbox"].ToString().Trim();
                    ListBoxIncluded.ClearSelection();
                    string[] included = dt.Rows[0]["price_includes"].ToString().Trim().Split(',');
                    for (int i = 0; i < included.Length; i++)
                    {
                        for (int j = 0; j < ListBoxIncluded.Items.Count; j++)
                        {
                            if (ListBoxIncluded.Items[j].ToString() == included[i])
                            {
                                ListBoxIncluded.Items[j].Selected = true;
                            }
                        }
                    }
                   
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }

        bool checkIfCarExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from car_tbl where car_id ='" + CarID.Text.Trim() + "';", con);
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
                Response.Write("<script>alert(" + ex.Message + ");</script>");
                return false;
            }
        }

        void deleteCar()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from car_tbl WHERE car_id ='" + CarID.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Delete successful');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }

        void clearForm()
        {
            CarID.Text = "";
            CarName.Text = "";
            Owner.Text = "";
            Seats.Text = "";
            Doors.Text = "";
            LargeBag.Text = "";
            SmallBag.Text = "";
            Color.Text = "";
            RentCost.Text = "";
            Year.Text = "";
            Pickup.Text = "";
            Dropoff.Text = "";
            State.Text = "";
            Brand.Text = "";
            FuelPolicy.Text = "";
            AC.Text = "";
            GearBox.Text = "";
            ListBoxIncluded.ClearSelection();
        }
    }
}