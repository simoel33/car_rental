<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DemoProjet.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="demo/bootstrap.min.css" rel="stylesheet" />
    <link href="demo/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-4">
            <div class="card">
               <div class="card-body">
                   <div class="row">
                     <div class="col">
                        <center>
                           <h4>Find your ideal car</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center><hr></center>
                     </div>
                  </div>
                   <div class="row">
                       <div class="col">
                           <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownListState" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select a state" Value=" " />
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
                   </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Brand</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownListBrand" runat="server">
                              <asp:ListItem Text="Select a brand" Value=" " />
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
                      <div class="col-md-4">
                        <label>Year</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Year" runat="server" placeholder="Year" Text=" "></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Color</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Color" runat="server" placeholder="Color" Text=" "></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                      <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button ID="ButtonSearch" class="btn btn-dark" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
                     </div>
                  </div>
                      <br />
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Search by owner username</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center><hr></center>
                     </div>
                  </div>    
                  <div class="row">
                      <div class="col">
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Owner" runat="server" placeholder="Owner username"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                      <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button ID="ButtonSearchbyOwner" class="btn btn-dark" runat="server" Text="Search" OnClick="ButtonSearchbyOwner_Click" />
                     </div>
                  </div>
                   <br /> 
                    <div class="row">
                     <div class="col">
                        <center>
                           <h4>Search by owner username</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center><hr></center>
                     </div>
                  </div>    
                  <div class="row">
                      <div class="col">
                          <label>Pick up date:</label>
                        <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="Pickup" runat="server" placeholder="PickUp Date" TextMode="Date"></asp:TextBox>
                                 </div>
                           <div class="form-group">
                               <label>Pick up date:</label>
                                 <asp:TextBox CssClass="form-control" ID="dropoff" runat="server" placeholder="PickUp Date" TextMode="Date"></asp:TextBox>
                                 </div>
                     </div>
                  </div>
                   <div class="row">
                      <div class="d-grid gap-2 col-6 mx-auto">
                         <asp:Button ID="btnav" class="btn btn-dark" runat="server" Text="Search" OnClick="ButtonSearchbyAvailability_Click" />
                     </div>
                  </div>

               </div>
         </div>
        </div>
         <div class="col-md-8">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Label runat="server" Text="Search Results" ID="Results" Visible="False" ></asp:Label></h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
				<ItemTemplate>
		        	<div class="col-md-4 product-grid">
				        <div class="image">
					        <a href="#">
						        <asp:Image ID="Image2" runat="server" Width="300px" Height="200px" ImageUrl='<%# Eval("car_img") %>' />
					        </a>
				        </div>
				        <center><asp:Label class="probrand" ID="Label4" runat="server" Text='<%# Eval("car_name") %>'></asp:Label></center>
                        <br />
						<center><asp:Label class="probrand" ID="Label1" ForeColor="Green" runat="server" Text='<%# Eval("city") %>'></asp:Label></center>
                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn buy" CommandName="viewDetails" CommandArgument='<%# Eval("car_id") %>' Text="Details"></asp:Button>
			        </div>
				</ItemTemplate>
            </asp:Repeater>
                     </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
