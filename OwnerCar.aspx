<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OwnerCar.aspx.cs" Inherits="DemoProjet.OwnerCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
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
                           <img id="image" width="100" src="cars/key128.png" />
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
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Car ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="CarID" runat="server" placeholder="ID"></asp:TextBox>
                               <asp:Button class="form-control btn btn-primary" ID="LinkButtonGet"  OnClick="LinkButtonGet_Click" runat="server" Text="▼" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Car Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="CarName" runat="server" placeholder="Car Name" TextMode="MultiLine" ></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="City" runat="server" placeholder="City"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Brand</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownListBrand" runat="server">
                              <asp:ListItem Text="Toyota" Value="Toyota" />
                              <asp:ListItem Text="Hyundai" Value="Hyundai" />
                              <asp:ListItem Text="Ford" Value="Ford" />
                              <asp:ListItem Text="Renault" Value="Renault" />
                              <asp:ListItem Text="Fiat" Value="Fiat" />
                              <asp:ListItem Text="Kia" Value="Kia" />
                              <asp:ListItem Text="Peugeot" Value="Peugeot" />
                              <asp:ListItem Text="Dacia" Value="Dacia" />  
                              <asp:ListItem Text="Seat" Value="Seat" />
                              <asp:ListItem Text="Skoda" Value="Skoda" />
                              <asp:ListItem Text="Volkswagen" Value="Volkswagen" />                           
                              <asp:ListItem Text="Mercedes" Value="Mercedes" />                           
                              <asp:ListItem Text="Citroen" Value="Citroen" />                          
                              <asp:ListItem Text="Chevrolet" Value="Chevrolet" />                           
                           </asp:DropDownList>
                        </div>
                         </div>
                      <div class="col-md-3">
                        <label>Fuel Policy</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownListFuelPolicy" runat="server">
                              <asp:ListItem Text="Return with same as Pick-up." Value="Return with same as Pick-up." />
                              <asp:ListItem Text="Pick-up half full and return empty." Value="Pick-up half full and return empty." />
                              <asp:ListItem Text="Pick up and return full." Value="Pick up and return full." />
                           </asp:DropDownList>
                        </div>
                     </div>
                      <div class="col-md-3">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownListState" CssClass="form-control" runat="server">
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
                      <div class="col-md-3">
                        <label>Year</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Year" runat="server" placeholder="Year" TextMode="Number" ></asp:TextBox>
                        </div>
                     </div>
                   </div>
                    <div class="row">
                     <div class="col -md">
                        <label>Price Includes</label>
                        <div class="form-group">
                            <asp:ListBox CssClass="form-control" ID="ListBoxIncluded" runat="server" SelectionMode="Multiple">
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
                           <asp:TextBox CssClass="form-control" ID="Seats" runat="server" placeholder="Seats" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Doors</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Doors" runat="server" placeholder="Doors" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Large Bag</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="LargeBag" runat="server" placeholder="Large Bag" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Small bag</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="SmallBag" runat="server" placeholder="Small Bag" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Air Conditioning</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" runat="server" ID="DropDownListAC">
                                <asp:ListItem Text="yes" Value="Available" />
                                <asp:ListItem Text="no" Value="Non available" />
                            </asp:DropDownList>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Gearbox</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" runat="server" ID="DropDownListGearBox">
                                <asp:ListItem Text="Automatic" Value="Automatic" />
                                <asp:ListItem Text="Manual" Value="Manual" />
                            </asp:DropDownList>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Color</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Color" runat="server" placeholder="Color" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Rent Cost(per day)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="RentCost" runat="server" placeholder="Rent Cost(per day)" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-12">
                        <label>Pick up</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Pickup" runat="server" placeholder="Pick Up" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-12">
                        <label>Drop off</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Dropoff" runat="server" placeholder="Drop Off" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-4">
                        <asp:Button ID="ButtonAdd" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="ButtonUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="ButtonDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
                     </div>
                  </div>
                <br />
                <div class="row">
                   <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-warning" runat="server" Text="Add promotion" OnClick="ButtonAddpro_Click" />
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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [car_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="car_id" >
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
                                                           <div class="col-12" style="font-weight: lighter">

                                                               Brand :
                                                               <asp:Label ID="Label1" runat="server"  Text='<%# Eval("brand") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Year :
                                                               <asp:Label ID="Label2" runat="server"  Text='<%# Eval("year") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Color :&nbsp;
                                                               <asp:Label ID="Label3" runat="server"  Text='<%# Eval("color") %>' Font-Bold="True"></asp:Label>

                                                           </div>
                                                       </div>
                                                       <div class="row">
                                                           <div class="col-12">

                                                               Price includes :
                                                               <br />
                                                               <asp:Label ID="Label4" runat="server" Text='<%# Eval("price_includes") %>' Font-Bold="True"></asp:Label>

                                                           </div>
                                                       </div>
                                                       <div class="row">
                                                           <div class="col-12">

                                                               Fuel Policy :
                                                               <asp:Label ID="Label5" runat="server" Text='<%# Eval("fuel_policy") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| AC :<asp:Label ID="Label6" runat="server" Text='<%# Eval("ac") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Gearbox :
                                                               <asp:Label ID="Label7" runat="server" Text='<%# Eval("gearbox") %>' Font-Bold="True"></asp:Label>

                                                           </div>
                                                       </div>
                                                       <div class="row">
                                                           <div class="col-12">

                                                               Seats :
                                                               <asp:Label ID="Label8" runat="server" Text='<%# Eval("seats") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Doors :
                                                               <asp:Label ID="Label9" runat="server" Text='<%# Eval("doors") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Large bag :
                                                               <asp:Label ID="Label10" runat="server" Text='<%# Eval("large_bag") %>' Font-Bold="True"></asp:Label>
                                                               &nbsp;| Small bag :
                                                               <asp:Label ID="Label11" runat="server" Text='<%# Eval("small_bag") %>' Font-Bold="True"></asp:Label>

                                                           </div>
                                                       </div>
                                                       <div class="row">
                                                           <div class="col-12">
                                                               Price :
                                                               <asp:Label ID="Label20" runat="server" Text='<%# Eval("rent_cost") %>' Font-Bold="True"></asp:Label>
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
