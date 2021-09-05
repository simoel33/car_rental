<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rentedcars.aspx.cs" Inherits="DemoProjet.rentedcars" %>
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
                                    <img width="70" src="images/membertype.png" />
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
                              <asp:LinkButton class="btn btn-dark" ID="LinkButtonGet" runat="server" OnClick="LinkButtonGet_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Member Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="FullName" runat="server" placeholder="Member Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                        <br />
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="ButtonFav" class="btn btn-lg btn-block btn-danger" runat="server" Text="Add To Favorite" OnClick="ButtonFav_Click" Enabled="false"/>
                     </div>
                     <div class="col-6">
                        <asp:Button ID="ButtonBlack" class="btn btn-lg btn-block btn-dark" runat="server" Text="Add To Black List" OnClick="ButtonBlack_Click" Enabled="false" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Rented car List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [rent_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" >
                       <Columns>
                           <asp:BoundField DataField="orderId" HeaderText="Order ID" SortExpression="orderID" ReadOnly="True"/>
                           <asp:BoundField DataField="car_id" HeaderText="Car ID" SortExpression="car_id" ReadOnly="True" />
                           <asp:BoundField DataField="lodger_username" HeaderText="Client" SortExpression="lodger_username" ReadOnly="True"/>
                           <asp:BoundField DataField="owner_username" HeaderText="Owner" SortExpression="owner_username" ReadOnly="True"/>
                           <asp:BoundField DataField="pick_up_date" HeaderText="Pick up" SortExpression="pick_up_date" ReadOnly="True"/>
                           <asp:BoundField DataField="drop_off_date" HeaderText="Drop off" SortExpression="drop_off_date" ReadOnly="True" />
                           <asp:BoundField DataField="price" HeaderText="Charges" SortExpression="price" />
                           <asp:BoundField DataField="delay" HeaderText="Delay" SortExpression="delay" />
                           <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                           <asp:BoundField DataField="booking_status" HeaderText="Status" SortExpression="booking_status"/>
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
