<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admincarmanagement.aspx.cs" Inherits="DemoProjet.admincarmanagement" %>
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
                           <h4>Car Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100" src="images/key.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Car ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="CarID" runat="server" placeholder="Car ID"></asp:TextBox>
                               <asp:Button class="form-control btn btn-primary" ID="LinkButtonGet"  runat="server" Text="search" OnClick="LinkButtonGet_Click" />
                           </div>
                        </div>
                     </div>
                      <div class="col-md-8">
                        <label>Owner</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Owner" runat="server" placeholder="Owner" ReadOnly="true" ></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                   <div class="row">
                       <div class="col-md-6">
                        <label>Car Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="CarName" runat="server" placeholder="Car Name" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <label>Fuel Policy</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="FuelPolicy" runat="server" placeholder="Fuel Policy" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                   </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Brand</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="Brand" runat="server" placeholder="Brand" ReadOnly="true"></asp:TextBox>
                        </div>
                         </div>
                      
                      <div class="col-md-6">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="State" runat="server" placeholder="State" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                      <div class="col-md-3">
                        <label>Year</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Year" runat="server" placeholder="Year" ReadOnly="true" ></asp:TextBox>
                        </div>
                     </div>
                   </div>
                    <div class="row">
                     <div class="col -md">
                        <label>Price Includes</label>
                        <div class="form-group">
                            <asp:ListBox CssClass="form-control" ID="ListBoxIncluded" runat="server" SelectionMode="Multiple">
                              <asp:ListItem Text="Cancellation" Value="Cancellation" /> 
                              <asp:ListItem Text="Theft Protection" Value="Theft Protection" />
                              <asp:ListItem Text="Airport fee" Value="Airport fee" />
                              <asp:ListItem Text="Tax" Value="Tax" />
                              <asp:ListItem Text="Standard Taxes 20.00%" Value="Standard Taxes 20.00%" />
                              <asp:ListItem Text="Road tax" Value="Road tax" />                              
                              <asp:ListItem Text="Unlimited mileage" Value="Unlimited mileage" />
                              <asp:ListItem Text="1 free additional driver" Value="1 free additional driver" />
                              <asp:ListItem Text="Collision Damage" Value="Collision Damage" />
                              <asp:ListItem Text="Breakdown assistance" Value="Breakdown assistance" />
                           </asp:ListBox>
                        </div>
                     </div>
                    </div>
                  </div>
                    <div class="row">
                     <div class="col-md-3">
                        <label>Seats</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Seats" runat="server" placeholder="Seats" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Doors</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Doors" runat="server" placeholder="Doors" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Large Bag</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="LargeBag" runat="server" placeholder="Large Bag" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Small bag</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="SmallBag" runat="server" placeholder="Small Bag" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Air Conditioning</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="AC" runat="server" placeholder="AC" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Gearbox</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="GearBox" runat="server" placeholder="GearBox" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Color</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Color" runat="server" placeholder="Color" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Rent Cost(per day)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="RentCost" runat="server" placeholder="Rent Cost(per day)" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-12">
                        <label>Pick up</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Pickup" runat="server" placeholder="Pick Up" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-12">
                        <label>Drop off</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Dropoff" runat="server" placeholder="Drop Off" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     
                     <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button ID="ButtonDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
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
                           <h4>Cars List</h4>
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT [car_id], [car_name], [owner_username], [rent_cost], [car_img] FROM [car_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="car_id" DataSourceID="SqlDataSource1">
                           <Columns>
                                <asp:BoundField DataField="car_id" HeaderText="ID" ReadOnly="True" SortExpression="car_id" />
                                   <asp:TemplateField>
                                       <ItemTemplate>
                                           <div class="container-fluid">
                                               <div class="row">
                                                   <div class="col-lg-10">
                                                       <div class="row">
                                                           <div class="col-12">
                                                               <asp:Label ID="LabelName" Font-Bold="True" runat="server" Text='<%# Eval("car_name") %>'></asp:Label>
                                                           </div>
                                                       </div>
                                                    
                                                      
                                                       <div class="row">
                                                           <div class="col-12">

                                                               Price (per day) :
                                                               <asp:Label ID="Label20" runat="server" Text='<%# Eval("rent_cost") %>' Font-Bold="True"></asp:Label>

                                                           </div>
                                                       </div>
                                                       <div class="row">
                                                           <div class="col-12">

                                                               Owner :
                                                               <asp:Label ID="Label1" runat="server" Text='<%# Eval("owner_username") %>' Font-Bold="True" ForeColor="Green"></asp:Label>

                                                           </div>
                                                       </div>
                                                       
                                                   </div>
                                                   <div class="col-lg-2">
                                                       <asp:Image class="img-fluid p-2" ID="imgCar" runat="server" ImageUrl='<%# Eval("car_img") %>' />
                                                   </div>
                                               </div>
                                           </div>
                                       </ItemTemplate>
                                </asp:TemplateField>
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
