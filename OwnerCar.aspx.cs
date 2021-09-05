using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class OwnerCar : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["status"].Equals("Owner"))
                {
                    if (!IsPostBack)
                    {
                        getCars();
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

        private void getCars()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from car_tbl where owner_username ='" + Session["username"] + "';", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (checkIfCarExists())
            {
                Response.Write("<script>alert('Car exists');</script>");
            }
            else
            {
                addNewCar();
            }
        }
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfCarExists())
            {
                updateCar();
            }
            else
            {
                Response.Write("<script>alert('Car does not exist');</script>");
            }
        }
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            if (checkIfCarExists())
            {
                deleteCar();
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
                    Seats.Text = dt.Rows[0][8].ToString();
                    Doors.Text = dt.Rows[0][9].ToString();
                    LargeBag.Text = dt.Rows[0][10].ToString();
                    SmallBag.Text = dt.Rows[0][11].ToString();
                    Color.Text = dt.Rows[0][5].ToString();
                    RentCost.Text = dt.Rows[0][14].ToString();
                    Year.Text = dt.Rows[0][4].ToString();
                    Pickup.Text = dt.Rows[0]["pickup"].ToString();
                    Dropoff.Text = dt.Rows[0]["dropoff"].ToString();
                    City.Text = dt.Rows[0]["city"].ToString();
                    DropDownListState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                    DropDownListBrand.SelectedValue = dt.Rows[0]["brand"].ToString().Trim();
                    DropDownListFuelPolicy.SelectedValue = dt.Rows[0]["fuel_policy"].ToString().Trim();
                    DropDownListAC.SelectedValue = dt.Rows[0]["ac"].ToString().Trim();
                    DropDownListGearBox.SelectedValue = dt.Rows[0]["gearbox"].ToString().Trim();
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
                    global_filepath = dt.Rows[0]["car_img"].ToString();
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

        void addNewCar()
        {
            try
            {
                string included = "";
                foreach (int i in ListBoxIncluded.GetSelectedIndices())
                {
                    included = included + ListBoxIncluded.Items[i] + ",";
                }

                included = included.Remove(included.Length - 1); // enlever la virgule à la fin

                string filepath = "~/cars/key128.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("cars/" + filename));
                filepath = "~/cars/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into car_tbl " +
                    "(car_id,car_name,city,brand,fuel_policy,price_includes,seats,doors,large_bag,small_bag,ac,gearbox,color,rent_cost,owner_username,year,car_img,state,pickup,dropoff,status) " +
                    "values(@car_id,@car_name,@city,@brand,@fuel_policy,@price_includes,@seats,@doors,@large_bag,@small_bag,@ac,@gearbox,@color,@rent_cost,@owner_username,@year,@img,@state,@pickup,@dropoff,@status)", con);

                cmd.Parameters.AddWithValue("@car_id", CarID.Text.Trim());
                cmd.Parameters.AddWithValue("@city", City.Text.Trim());
                cmd.Parameters.AddWithValue("@car_name", CarName.Text.Trim());
                cmd.Parameters.AddWithValue("@brand", DropDownListBrand.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@fuel_policy", DropDownListFuelPolicy.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@price_includes", included);
                cmd.Parameters.AddWithValue("@seats", Seats.Text.Trim());
                cmd.Parameters.AddWithValue("@doors", Doors.Text.Trim());
                cmd.Parameters.AddWithValue("@large_bag", LargeBag.Text.Trim());
                cmd.Parameters.AddWithValue("@small_bag", SmallBag.Text.Trim());
                cmd.Parameters.AddWithValue("@ac", DropDownListAC.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@gearbox", DropDownListGearBox.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@color", Color.Text.Trim());
                cmd.Parameters.AddWithValue("@rent_cost", RentCost.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownListState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pickup", Pickup.Text.Trim());
                cmd.Parameters.AddWithValue("@dropoff", Dropoff.Text.Trim());
                cmd.Parameters.AddWithValue("@owner_username", Session["username"].ToString());
                cmd.Parameters.AddWithValue("@year", Year.Text.Trim());
                cmd.Parameters.AddWithValue("@img", filepath);
                cmd.Parameters.AddWithValue("@status", "available");


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Add successful');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }


        void updateCar()
        {
            if (checkIfCarExists())
            {
                try
                {
                    string included = "";
                    foreach (int i in ListBoxIncluded.GetSelectedIndices())
                    {
                        included = included + ListBoxIncluded.Items[i] + ",";
                    }
                    included = included.Remove(included.Length - 1);

                    string filepath = "~/cars/key128";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("cars/" + filename));
                        filepath = "~/cars/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand(@"UPDATE [dbo].[car_tbl]
                                                       SET [car_id] = @car_id
                                                          ,[car_name] = @car_name
                                                          ,[owner_username] = @owner_username
                                                          ,[brand] = @brand
                                                          ,[year] = @year
                                                          ,[color] = @color
                                                          ,[fuel_policy] = @fuel_policy
                                                          ,[price_includes] = @price_includes
                                                          ,[seats] = @seats
                                                          ,[doors] = @doors
                                                          ,[large_bag] = @large_bag
                                                          ,[small_bag] = @small_bag
                                                          ,[ac] = @ac
                                                          ,[gearbox] = @gearbox
                                                          ,[rent_cost] = @rent_cost
                                                          ,[car_img] = @img
                                                          ,[state] = @state
                                                          ,[city] = @city
                                                          ,[dropoff] = @dropoff
                                                          ,[pickup] = @pickup
                                                     WHERE car_id='" + CarID.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@car_id", CarID.Text.Trim());
                    cmd.Parameters.AddWithValue("@car_name", CarName.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", City.Text.Trim());
                    cmd.Parameters.AddWithValue("@brand", DropDownListBrand.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@fuel_policy", DropDownListFuelPolicy.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@price_includes", included);
                    cmd.Parameters.AddWithValue("@seats", Seats.Text.Trim());
                    cmd.Parameters.AddWithValue("@doors", Doors.Text.Trim());
                    cmd.Parameters.AddWithValue("@large_bag", LargeBag.Text.Trim());
                    cmd.Parameters.AddWithValue("@small_bag", SmallBag.Text.Trim());
                    cmd.Parameters.AddWithValue("@ac", DropDownListAC.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@gearbox", DropDownListGearBox.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@color", Color.Text.Trim());
                    cmd.Parameters.AddWithValue("@rent_cost", RentCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownListState.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@pickup", Pickup.Text.Trim());
                    cmd.Parameters.AddWithValue("@dropoff", Dropoff.Text.Trim());
                    cmd.Parameters.AddWithValue("@owner_username", Session["username"].ToString());
                    cmd.Parameters.AddWithValue("@year", Year.Text.Trim());
                    cmd.Parameters.AddWithValue("@img", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Car Updated Successfully');</script>");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Car ID');</script>");
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
            DropDownListBrand.SelectedIndex = 0;
            DropDownListFuelPolicy.SelectedIndex = 0;
            ListBoxIncluded.SelectedIndex = 0;
            Seats.Text = "";
            Doors.Text = "";
            LargeBag.Text = "";
            SmallBag.Text = "";
            DropDownListAC.SelectedIndex = 0;
            DropDownListGearBox.SelectedIndex = 0;
            Color.Text = "";
            RentCost.Text = "";
            Pickup.Text = "";
            Dropoff.Text = "";
            City.Text = "";
            DropDownListState.SelectedIndex = 0;
            Year.Text = "";
        }

        protected void ButtonAddpro_Click(object sender, EventArgs e)
        {
            // Response..Redirect("Addpro.aspx");
            Response.Redirect("Addpro.aspx");
        }
    }
}