<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carsList.aspx.cs" Inherits="DemoProjet.carsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="demo/bootstrap.min.css" rel="stylesheet" />
    <link href="demo/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
		<h1 class="text-center">Cars List</h1>
		<center><hr></center>
		<div class="row">
		 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [car_tbl]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
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
</asp:Content>
