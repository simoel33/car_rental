using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class ownerprofile : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string status;

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["status"].Equals("Owner"))
                {
                    getInfos();
                }
                else
                {
                    Response.Redirect("userlogin.aspx");
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert(" + ex.Message + ");</script>");
                //Response.Redirect("userlogin.aspx");
               
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
                DateTime dob;
                SqlCommand cmd = new SqlCommand("select * from member_tbl where member_username ='" + Session["username"] + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    status = dt.Rows[0]["status"].ToString();
                    FullName.Text = dt.Rows[0]["full_name"].ToString();
                    Number.Text = dt.Rows[0]["number"].ToString();
                    Adress.Text = dt.Rows[0]["adress"].ToString();
                    Username.Text = dt.Rows[0]["member_username"].ToString();
                    OldPassword.Text = dt.Rows[0]["password"].ToString();
                    Email.Text = dt.Rows[0]["email"].ToString();
                    City.Text = dt.Rows[0]["city"].ToString();
                    PinCode.Text = dt.Rows[0]["pin_code"].ToString();
                    DropDownListState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                    dob = Convert.ToDateTime(dt.Rows[0]["dob"].ToString());
                    //DOB.Text = dt.Rows[0]["dob"].ToString();
                    DOB.Text = dob.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateInfos();

            }
        }

        private void updateInfos()
        {
            String password;
            if (NewPassword.Text.Trim() == "")
            {
                password = OldPassword.Text.Trim();
            }
            else
            {
                password = NewPassword.Text.Trim();
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                con.Open();

                SqlCommand cmd = new SqlCommand(@"UPDATE member_tbl
                                                   SET [full_name] = @full_name
                                                      ,[password] =  @password
                                                      ,[adress] =  @adress
                                                      ,[pin_code] =  @pin_code
                                                      ,[number] =  @number
                                                      ,[email] =  @email
                                                      ,[state] =  @state
                                                      ,[city] =  @city
                                                 WHERE member_username ='" + Session["username"] + "';", con);

                cmd.Parameters.AddWithValue("@full_name", FullName.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@adress", Adress.Text.Trim());
                cmd.Parameters.AddWithValue("@pin_code", PinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@number", Number.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@city", City.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownListState.SelectedItem.Value);

                cmd.ExecuteNonQuery();

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Updated');</script>");
                    getInfos();
                }
                else
                {
                    Response.Write("<script>alert('Invalid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void delete()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from member_tbl WHERE member_username ='" + Username.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }

    }
}