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
    public partial class lodgermanagement : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["role"].Equals("admin"))
                {
                    if (!IsPostBack)
                    {
                        GridView1.DataBind();
                    }
                } else
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

        protected void LinkButtonGet_Click(object sender, EventArgs e)
        {
            getInfo();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            deleteMember();
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
                        Status.Text = dr.GetValue(10).ToString();
                        FullName.Text= dr.GetValue(1).ToString();
                        DOB.Text= dr.GetValue(3).ToString();
                        Number.Text= dr.GetValue(6).ToString();
                        Email.Text= dr.GetValue(7).ToString();
                        State.Text= dr.GetValue(8).ToString();
                        City.Text= dr.GetValue(9).ToString();
                        PinCode.Text = dr.GetValue(5).ToString();
                        Adress.Text = dr.GetValue(4).ToString();
                    }
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

        void deleteMember()
        {
            if(checkIfMemberExists())
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
                    Response.Write("<script>alert('Delete successful');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(" + ex.Message + ");</script>");

                }
            }
            else
            {
               Response.Write("<script>alert('Invalid Username');</script>");

            }
        }
        
        void clearForm()
        {
            Username.Text = "";
            FullName.Text = "";
            City.Text = "";
            State.Text = "";
            Adress.Text = "";
            Number.Text = "";
            Email.Text = "";
            DOB.Text = "";
            Status.Text = "";
            PinCode.Text = "";
        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_tbl where member_username ='" + Username.Text.Trim() + "';", con);
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
    }
}