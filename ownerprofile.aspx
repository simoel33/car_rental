<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ownerprofile.aspx.cs" Inherits="DemoProjet.ownerprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-5">
                <div class="card">
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
                                    <h4>Your profile</h4>
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
                                    <asp:TextBox ID="FullName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Date of birth</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="DOB" runat="server" CssClass="form-control" placeholder="DOB" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-6">
                                <label>Contact N°</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Number" runat="server" CssClass="form-control" placeholder="Contact N°"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <label>Email</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownListState" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"/>
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
                                    <asp:TextBox ID="City" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                                 <label>PinCode</label>
                                <div class="form-group ">
                                    <asp:TextBox ID="PinCode" runat="server" CssClass="form-control" placeholder="PinCode" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <label>Full Adress</label>
                                <div class="form-group">
                                    <asp:TextBox ID="Adress" runat="server" CssClass="form-control" placeholder="Full Adress" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> 
                            <div class="col">
                                <br />
                               <center><span class="badge rounded-pill bg-dark">Login Credentials</span></center> 
                            </div>
                        </div>
                         <div class="row">
                     <div class="col-md-4">
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="Username" runat="server" placeholder="Username" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Old Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="OldPassword" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>New Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="NewPassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                               <br />
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Update" runat="server" Text="Update" OnClick="Update_Click"  />
                           </div>
                        </center>
                     </div>
                  </div>
                    </div>
                </div>
                
                <a href="homepage.aspx"> Return</a> <br /> <br />

            </div>
        </div>
    </div>
</asp:Content>
