<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="DemoProjet.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row" >
            <div class="col-md-6 mx-auto" >
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/admin.png" width="150" />
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                </hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Admin ID"></asp:TextBox>
                                </div>
                                <label>Member Password</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                                </div><br />
                                <div class="form-group d-grid gap-2">
                                    <asp:Button class="btn btn-info  btn-lg" ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
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
