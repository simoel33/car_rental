<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="membermanagement.aspx.cs" Inherits="DemoProjet.lodgermanagement" %>
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
                           <h4>Member Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="50" src="images/user.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Member Username</label>
 
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="Username" runat="server" placeholder="Member username"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButtonGet" runat="server" OnClick="LinkButtonGet_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Status</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Status" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col">
                        <label>Full Name</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="FullName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Date Of Birth</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="DOB" runat="server" placeholder="Date Of Birth" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact N°</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Number" runat="server" placeholder="Contact N°" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Email </label>
                         &nbsp;<div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="State" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="City" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Pin Code</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="PinCode" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Full Postal Address</label>
 
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Adress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="form-group d-grid gap-2">
                        <br /><asp:Button ID="Delete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User" OnClick="Delete_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home></a>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Members List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [member_tbl]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_username" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="member_username" HeaderText="Username" ReadOnly="True" SortExpression="member_username" />
                                <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                <asp:BoundField DataField="number" HeaderText="Number" SortExpression="number" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
    
</asp:Content>
