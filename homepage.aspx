<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="DemoProjet.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="demo/bootstrap.min.css" rel="stylesheet" />
    <link href="demo/style.css" rel="stylesheet" />
    <style>
        section{
          background-color: cyan;
        }
        Label12,Label13,Label15{color:darkgreen}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        
     <div class="container">
		<h1 class="text-center">our special offers</h1>
		<center><hr></center>
		<div class="row">
		 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="select * from car_tbl inner join promotions on car_tbl.car_id=promotions.car_id"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
				<ItemTemplate>
		        	<div class="col-md-4 product-grid">
				        <div class="image">
					        <a href="#">
						        <asp:Image ID="Image2" runat="server" Width="300px" Height="200px" ImageUrl='<%# Eval("car_img") %>' />
					        </a>
				        </div>
				        <center><asp:Label class="probrand" ID="Label4" runat="server" Text='<%# Eval("car_name") %>'></asp:Label></center>
                        <center><asp:Label class="probrand" ID="Label3" runat="server" Text="Discount:"></asp:Label>
                            <asp:Label class="probrand" ID="Label2" runat="server" Text='<%# Eval("pourcentage") %>'></asp:Label>
                            <asp:Label class="probrand" ID="Label5" runat="server" Text="%"></asp:Label>
                        </center>
						<br />
						<center><asp:Label class="probrand" ID="Label1" ForeColor="Green" runat="server" Text='<%# Eval("city") %>'></asp:Label></center>
                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn buy" CommandName="viewDetails" CommandArgument='<%# Eval("car_id") %>' Text="Details"></asp:Button>
			        </div>
				</ItemTemplate>
            </asp:Repeater>
		</div>
	</div>
        <img src="images/car-home.jpg"  class="img-fluid" style="height:40%; width:100%;"/>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center><h2>Home page</h2></center>
                </div>
            </div>
                
        </div>
    </section>
</asp:Content>
