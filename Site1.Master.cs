using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoProjet
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("")) // aucun utilisateur connecté
                {
                    LinkButtonUserLogin.Visible = true;
                    LinkButtonSignUp.Visible = true;
                    LinkButtonHello.Visible = false;
                    LinkButtonLogout.Visible = false;

                    LinkButtonMemberManagement.Visible = false;
                    LinkButtonCarsList.Visible = false;
                    LinkButtonRentedCars.Visible = false;
                    LinkButtonList.Visible = false;
                    LinkButtonAdminLogin.Visible = true;
                }
                else if(Session["role"].Equals("user") && Session["status"].Equals("Lodger"))
                {
                    LinkButtonAdminLogin.Visible = false;
                    LinkButtonHello.Visible = true;
                    LinkButtonHello.Text ="Hello "+ Session["fullname"].ToString();
                    LinkButtonLogout.Visible = true;
                    LinkButtonUserLogin.Visible = false;
                    LinkButtonSignUp.Visible = false;
                    LinkButtonMemberManagement.Visible = false;
                    LinkButtonCarsList.Visible = false;
                    LinkButtonRentedCars.Visible = false;
                    LinkButtonList.Visible = false;
                    LinkButtonViewCars.Visible = true;
                    LinkButtonSearch.Visible = true ;
                }
                else if (Session["role"].Equals("user")  && Session["status"].Equals("Owner"))
                {
                    LinkButtonAdminLogin.Visible = false;
                    LinkButtonOwnerCar.Visible = true;
                    LinkButtonHello.Visible = true;
                    LinkButtonHello.Text = "Hello " + Session["fullname"].ToString();
                    LinkButtonLogout.Visible = true;
                    LinkButtonUserLogin.Visible = false;
                    LinkButtonSignUp.Visible = false;
                    LinkButtonMemberManagement.Visible = false;
                    LinkButtonCarsList.Visible = false;
                    LinkButtonRentedCars.Visible = false;
                    LinkButtonList.Visible = false;
                    LinkButtonSearch.Visible = false;
                    LinkButtonViewCars.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButtonUserLogin.Visible = false;
                    LinkButtonSignUp.Visible = false;
                    LinkButtonHello.Visible = true;
                    LinkButtonAdminLogin.Visible = false;
                    LinkButtonLogout.Visible = true;
                    LinkButtonViewCars.Visible = false;
                    LinkButtonHello.Text = "Hello Admin";
                    LinkButtonMemberManagement.Visible = true;
                    LinkButtonCarsList.Visible = true;
                    LinkButtonRentedCars.Visible = true;
                    LinkButtonList.Visible = true;
                    LinkButtonSearch.Visible = false;
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }

        protected void LinkButtonAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }


        protected void LinkButtonCarsList_Click(object sender, EventArgs e)
        {
            Response.Redirect("admincarmanagement.aspx");
        }

        protected void LinkButtonRentedCars_Click(object sender, EventArgs e)
        {
            Response.Redirect("rentedcars.aspx");
        }

        protected void LinkButtonSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session["username"] ="";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            LinkButtonUserLogin.Visible = true;
            LinkButtonSignUp.Visible = true;
            LinkButtonHello.Visible = false;
            LinkButtonLogout.Visible = false;
            LinkButtonAdminLogin.Visible = true;
            LinkButtonMemberManagement.Visible = false;
            LinkButtonCarsList.Visible = false;
            LinkButtonRentedCars.Visible = false;
            LinkButtonList.Visible = false;
            LinkButtonSearch.Visible = false;
            Response.Redirect("homepage.aspx");
        }

        protected void LinkButtonOwnerCar_Click(object sender, EventArgs e)
        {
            Response.Redirect("OwnerCar.aspx");
        }

        protected void LinkButtonMemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("membermanagement.aspx");
        }

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void LinkButtonViewCars_Click(object sender, EventArgs e)
        {
            Response.Redirect("carsList.aspx");
        }

        protected void LinkButtonHello_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("admin"))
            {

            } else
            {
                Response.Redirect("userprofile.aspx");
            }
                
        }

        protected void LinkButtonList_Click(object sender, EventArgs e)
        {
            Response.Redirect("clientsList.aspx");
        }
    }
}