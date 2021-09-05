<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="DemoProjet.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card form-container">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/user.png" width="150" />
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <br />
                                    <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Member Username"></asp:TextBox>
                                </div>
                                <div class="form-group ">
                                    <br />
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Member Password" TextMode="Password"></asp:TextBox>
                                </div><br />
                                <div class="form-group d-grid gap-2">
                                    <asp:Button class="btn btn-info  btn-lg" ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
                                </div><br />
                                <div class="form-group d-grid gap-2">
                                    <asp:Button  PostBackUrl="~/usersignup.aspx" class="btn btn-secondary btn-block btn-lg" id="ButtonSignUp" runat="server" Text="Sign up" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <a href="homepage.aspx"> Return</a> <br /> <br />

            </div>
        </div>
    </div>

</asp:Content>
