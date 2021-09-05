<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="clientsList.aspx.cs" Inherits="DemoProjet.clientsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h4>Favorite List</h4>
                                </center>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                         </div>
                        <br />
                        <div class="row">
                            <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [favorite_list_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_username"   OnRowDeleting="GridView1_RowDeleting" >
                       <Columns>
                           <asp:BoundField DataField="member_username" HeaderText="Client" SortExpression="member_username" ReadOnly="True"/>
                           <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" ReadOnly="True"/>
                           
                           <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-outline-dark " ShowDeleteButton="True">
                           <ControlStyle BackColor="Red" ForeColor="White" />
                           </asp:CommandField>
                           
                       </Columns>
                   </asp:GridView>
                     </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h4>Favorite List</h4>
                                </center>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                         </div>
                        <br />
                        <div class="row">
                            <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetASPConnectionString %>" SelectCommand="SELECT * FROM [black_list_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="member_username"   OnRowDeleting="GridView2_RowDeleting" >
                       <Columns>
                           <asp:BoundField DataField="member_username" HeaderText="Username" SortExpression="member_username" ReadOnly="True"/>
                           <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" ReadOnly="True"/>
                           
                           <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-outline-dark " ShowDeleteButton="True">
                           <ControlStyle BackColor="Red" ForeColor="White" />
                           </asp:CommandField>
                           
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
