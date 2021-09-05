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
    public partial class Search : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string state = Convert.ToString(DropDownListState.SelectedValue);
            string brand = Convert.ToString(DropDownListBrand.SelectedValue);
            string color = Color.Text.ToString();
            string year = Year.Text.ToString();
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "select * from car_tbl where state=@state";
                SqlCommand cmd = new SqlCommand(query.ToString(), con);
                if (brand != " ")
                {
                    query+=" and brand=@brand";
                    cmd = new SqlCommand(query.ToString(), con);
                }
                if (color != " ")
                {
                    query += " and color=@color";
                    cmd = new SqlCommand(query.ToString(), con);
                }
                if (year != " ")
                {
                    query += " and year=@year";
                   cmd = new SqlCommand(query.ToString(), con);
                }
                cmd.Parameters.AddWithValue("state", Convert.ToString(DropDownListState.SelectedValue));
                cmd.Parameters.AddWithValue("brand", Convert.ToString(DropDownListBrand.SelectedValue));
                cmd.Parameters.AddWithValue("color", Color.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("year", Year.Text.ToString().Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    clearform();
                } 
                else
                {
                    Response.Write("<script>alert('Not found');</script>");
                    clearform();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewDetails")
            {
                Response.Redirect("carDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }
        void clearform()
        {
            DropDownListBrand.SelectedIndex = 0;
            DropDownListState.SelectedIndex = 0;
            Year.Text = " ";
            Color.Text = " ";
        }

        protected void ButtonSearchbyOwner_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from car_tbl where owner_username=@owner", con);
                cmd.Parameters.AddWithValue("owner", Owner.Text.ToString().Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    clearform();
                }
                else
                {
                    Response.Write("<script>alert('Not found');</script>");
                    clearform();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }

        protected void ButtonSearchbyAvailability_Click(object sender, EventArgs e)
        {

            string pick = Pickup.Text.ToString();
            string drop = dropoff.Text.ToString();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string st = "select * from car_tbl where car_id not in (select car_id from rent_tbl)" +
                "or car_id in(select car_tbl.car_id from car_tbl inner join rent_tbl on car_tbl.car_id=rent_tbl.car_id where " +
                " rent_tbl.pick_up_date not between '" + pick + "' and '" + drop + "' and rent_tbl.drop_off_date not between  '" + pick + "' and '" + drop + "')";
            SqlCommand cm = new SqlCommand(st, con);
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    clearform();
                }
                else
                {
                    Response.Write("<script>alert('Not found');</script>");
                    clearform();
                }
                con.Close();
            }
            catch (Exception exp)
            {
                Response.Write("<script>alert(" + exp.Message + ");</script>");
            }
        }
    }
}