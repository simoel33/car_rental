<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RentCar.aspx.cs" Inherits="DemoProjet.RentCar" %>
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
                                 <h4>Rent</h4>
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
                               <div class="col-md-6">
                                 <label>Member Username</label>
                                 <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="MemberUsername" runat="server" placeholder="Member Username" ReadOnly="true"></asp:TextBox>
                                 </div>
                                </div>
                               <div class="col-md-6">
                                 <label>Member Name</label>
                                 <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="MemberName" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                 </div>
                             </div>
                        </div>
                        <div class="row">
                             
                            <div class="col-md-6">
                                     <label>Car ID</label>

                                     <div class="input-group">
                                         <asp:TextBox class="form-control" ID="CarID" runat="server" placeholder="Car ID"></asp:TextBox>
                                         <asp:Button for="TextBox1" class="btn btn-dark" ID="Get" runat="server" Text="Get" OnClick="Get_Click" />
                                     </div>
                                     </div>
                             <div class="col-md-6">
                                 <label>Car Name</label>

                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="CarName" runat="server" placeholder="Car Name" ReadOnly="True"></asp:TextBox>
                                 </div>
                             </div>
                         </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Owner number </label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="OwnerNumber" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Owner email  </label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="OwnerEmail" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <div class="col-md-6">
                                 <label>PickUp Date</label>

                                 <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="Pickup" runat="server" placeholder="PickUp Date" TextMode="Date"></asp:TextBox>
                                 </div>
                              </div>
                             <div class="col-md-6">
                                 <label>Dropoff Date</label>

                                 <div class="input-group">
                                 <asp:TextBox CssClass="form-control" ID="DropOff" runat="server" placeholder="Dropoff Date" TextMode="Date"></asp:TextBox>
                              <asp:LinkButton class="btn btn-dark" ID="LinkButtonDate" runat="server" OnClick="LinkButtonDate_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                 </div>
                             </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Price </label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="Cost_" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Payment Method </label>
                                <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownListPayment" runat="server">
                              <asp:ListItem Text="Card" Value="Card" />
                              <asp:ListItem Text="Cash" Value="Cash" />
                              <asp:ListItem Text="Cheque" Value="Cheque" />
                           </asp:DropDownList>
                        </div>
                            </div>
                        </div>
                            <br />
                        <div class="row">
                             <div class="d-grid gap-2 col-6 mx-auto">
                                <asp:Button ID="ButtonRent" class="btn btn-lg btn-block btn-primary" runat="server" Text="Rent" OnClick="ButtonRent_Click" />
                             </div>
                         </div>
                     </div>
                  </div>

            <a href="homepage.aspx"><< Back to Home </a> <br><br>

            </div>
         <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                     <div class="row">
                         <div class="col"> <hr> </div> 
                     </div>
                     <div class="row">
                         <div class="col">
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [car_tbl] WHERE ([car_id] = @car_id)">
                                 <SelectParameters>
                                     <asp:QueryStringParameter Name="car_id" QueryStringField="id" Type="String" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                             <asp:DataList ID="DataList1" runat="server" DataKeyField="car_id" DataSourceID="SqlDataSource1">
                                  <ItemTemplate>
                   <div class="card">
                       <div class="card-body">
                           <div class="row">
                               <div class="col-md-5">
                                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("car_img") %>' />
                               </div>
                               <div class="col-md-7 ">
                                  <div class="row">
                                     <div class="col">
                                        <asp:Label ID="carName"  runat="server" Text='<%# Eval("car_name") %>' Font-Bold="True" Font-Italic="True" Font-Names="Leelawadee" Font-Size="XX-Large"></asp:Label>
                                      </div>
                                   </div>
                                   <br />
                                   <div class="row">
                                     <div class="col">
                                        Car ID : <asp:Label ID="Label1"  runat="server" Text='<%# Eval("car_id") %>' Font-Bold="True"  Font-Names="Leelawadee" Font-Size="X-Large"></asp:Label>
                                      </div>
                                   </div>
                                   <br />
                                   <div class="row">
                                       <div class="col-12">
                                           Pick up Address : 
                                           <asp:Label ID="Label14" runat="server" Text='<%# Eval("pickup") %>' Font-Bold="True"></asp:Label>
                                           <br /><br />
                                           Drop off Address :
                                           <asp:Label ID="Label15" runat="server" Text='<%# Eval("dropoff") %>' Font-Bold="True"></asp:Label>
                                       </div>
                                   </div>
                                   <br />
                               </div>
                           </div>
                       </div>

                   </div> 
            </ItemTemplate>
                             </asp:DataList>
                         </div>
                         </div>
                </div>
            </div>
         </div>
       </div>
 </div>
   
</asp:Content>
