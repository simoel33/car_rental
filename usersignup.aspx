<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="DemoProjet.usersignup" %>
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
                                    <h3>Sign up</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                </hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="fullname" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Date of birth</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="date" runat="server" CssClass="form-control" placeholder="Member Password" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-6">
                                <label>Contact N°</label>
                                <div class="form-group">
                                    <asp:TextBox ID="number" runat="server" CssClass="form-control" placeholder="Contact N°"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Email</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Tanger-Tétouan-Al Hoceïma" Value="Tanger-Tétouan-Al Hoceïma"/>
                                        <asp:ListItem Text="L'Oriental" Value="Oriental"/>
                                        <asp:ListItem Text="Fès-Meknès" Value="Fès-Meknès"/>
                                        <asp:ListItem Text="Rabat-Salé-Kénitra" Value="Rabat-Salé-Kénitra"/>
                                        <asp:ListItem Text="Béni Mellal-Khénifra" Value="Béni Mellal-Khénifra"/>
                                        <asp:ListItem Text="Casablanca-Settat" Value="Casablanca-Settat"/>
                                        <asp:ListItem Text="Marrakech-Safi" Value="Marrakech-Safi"/>
                                        <asp:ListItem Text="Drâa-Tafilalet" Value="Drâa-Tafilalet"/>
                                        <asp:ListItem Text="Souss-Massa" Value="Souss-Massa"/>
                                        <asp:ListItem Text="Guelmim-Oued Noun" Value="Guelmim-Oued Noun"/>
                                        <asp:ListItem Text="Laâyoune-Sakia El Hamra" Value="Laâyoune-Sakia El Hamra"/>
                                        <asp:ListItem Text="Dakhla-Oued Ed-Dahab" Value="Dakhla-Oued Ed-Dahab"/>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                 <label>City</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="city" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                                 <label>PinCode</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="pincode" runat="server" CssClass="form-control" placeholder="PinCode" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <label>Full Adress</label>
                                <div class="form-group">
                                    <asp:TextBox ID="adress" runat="server" CssClass="form-control" placeholder="Full Adress" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> 
                            <div class="col">
                               <center><span class="badge rounded-pill bg-dark">Login Credentials</span></center> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col -md-4">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox ID="username" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col -md-4">
                                <label>User Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="password" runat="server" Class="form-control" placeholder="User Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col -md-4">
                                <label>Status</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                         <asp:ListItem Text="Lodger" Value="Lodger" />
                                         <asp:ListItem Text="Owner" Value="Owner" />
                                    </asp:DropDownList>                         

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                               <br />
                                <div class="form-group d-grid gap-2">
                                    <asp:Button  PostBackUrl="~/usersignup.aspx" class="btn btn-success btn-block btn-lg" id="ButtonSignUp" runat="server" Text="Sign up" OnClick="ButtonSignUp_Click" />
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
