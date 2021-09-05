<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carDetails.aspx.cs" Inherits="DemoProjet.carDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="demo/carDetails.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
           <div class="row">
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [car_tbl] WHERE ([car_id] = @car_id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="car_id" QueryStringField="id" Type="String" />
                </SelectParameters>
               </asp:SqlDataSource>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="car_id" DataSourceID="SqlDataSource1" OnItemCommand="DataList2_ItemCommand" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
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
                                  <div class="row">
                                        <div class="col-12" style="font-weight: lighter">
                                             Brand :
                                            <asp:Label ID="Label3" runat="server"  Text='<%# Eval("brand") %>' Font-Bold="True"></asp:Label>
                                              &nbsp;| Year :
                                               <asp:Label ID="Label4" runat="server"  Text='<%# Eval("year") %>' Font-Bold="True"></asp:Label>
                                                &nbsp;| Color :&nbsp;
                                                <asp:Label ID="Label5" runat="server"  Text='<%# Eval("color") %>' Font-Bold="True"></asp:Label>
                                         </div>
                                    </div>
                                   <br />
                                   <div class="row">
                                        <div class="col-12">

                                           Price includes :<br />
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("price_includes") %>' Font-Bold="True"></asp:Label>
                                           </div>
                                     </div>
                                   <br />
                                    <div class="row">
                                         <div class="col-12">
                                                 Fuel Policy :
                                                 <asp:Label ID="Label7" runat="server" Text='<%# Eval("fuel_policy") %>' Font-Bold="True"></asp:Label>
                                           </div>
                                        </div>
                                   <br />
                                   <div class="row">
                                       <div class="col-12">
                                           AC :<asp:Label ID="Label8" runat="server" Text='<%# Eval("ac") %>' Font-Bold="True"></asp:Label>
                                              &nbsp;| Gearbox :
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("gearbox") %>' Font-Bold="True"></asp:Label>
                                       </div>
                                   </div>
                                   <br />
                                      <div class="row">
                                           <div class="col-12">
                                                 Seats :
                                                  <asp:Label ID="Label10" runat="server" Text='<%# Eval("seats") %>' Font-Bold="True"></asp:Label>
                                                  &nbsp;| Doors :
                                                   <asp:Label ID="Label11" runat="server" Text='<%# Eval("doors") %>' Font-Bold="True"></asp:Label>
                                                     &nbsp;| Large bag :
                                                     <asp:Label ID="Label12" runat="server" Text='<%# Eval("large_bag") %>' Font-Bold="True"></asp:Label>
                                                      &nbsp;| Small bag :
                                                      <asp:Label ID="Label13" runat="server" Text='<%# Eval("small_bag") %>' Font-Bold="True"></asp:Label>

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
                                   <div class="row">
                                       <div class="col-12">
                                           Rent cost (per day) : 
                                           <asp:Label ID="Label16"  runat="server" Text='<%# Eval("rent_cost") %>' Font-Bold="True"></asp:Label> MAD
                                           <br />
                                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>' Font-Bold="True" ForeColor="Red"></asp:Label> 
                                       </div>
                                   </div>
                                   <br />
                                   <div class="row">
                                       <div class="d-grid gap-2 col-6 mx-auto">
                                           <asp:Button  ID="Button1" runat="server" Text="Rent" CommandName="rentCar" CommandArgument='<%# Eval("car_id") %>'  />
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>

                   </div> 
            </ItemTemplate>
        </asp:DataList>

           </div>
       </div>
    
</asp:Content>
