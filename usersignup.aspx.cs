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
    public partial class usersignup : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            if(checkUsername())
            {
                Response.Write("<script>alert('Try another username');</script>");
            }
            else
            {
                signUp();
            }
            
        }
        
        bool checkUsername()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_tbl where member_username ='"+ username.Text.Trim()+"';",con) ;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>=1)
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

        void signUp()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into member_tbl " +
                    "(member_username,full_name,password,dob,adress,pin_code,number,email ,state,city,status) " +
                    "values(@member_username,@full_name,@password,@dob,@adress,@pin_code,@number,@email,@state,@city,@status)", con);

                cmd.Parameters.AddWithValue("@member_username", username.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", date.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@adress", adress.Text.Trim());
                cmd.Parameters.AddWithValue("@pin_code", pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@number", number.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@status", DropDownList2.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign up successful');</script>");
                Response.Redirect("userlogin.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");

            }
        }
    }
}