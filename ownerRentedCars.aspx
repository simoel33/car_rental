<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ownerRentedCars.aspx.cs" Inherits="DemoProjet.ownerRentedCars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="row">
                   <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                       <Columns>
                           <asp:BoundField DataField="orderId" HeaderText="Order ID" SortExpression="orderID" ReadOnly="True"/>
                           <asp:BoundField DataField="car_id" HeaderText="Car ID" SortExpression="car_id" ReadOnly="True" />
                           <asp:BoundField DataField="lodger_username" HeaderText="Lodger" SortExpression="lodger_username" ReadOnly="True"/>
                           <asp:BoundField DataField="pick_up_date" HeaderText="Pick up" SortExpression="pick_up_date" ReadOnly="True"/>
                           <asp:BoundField DataField="drop_off_date" HeaderText="Drop off" SortExpression="drop_off_date" ReadOnly="True" />
                           <asp:BoundField DataField="price" HeaderText="Charges" SortExpression="price" />
                           <asp:BoundField DataField="delay" HeaderText="Delay" SortExpression="delay" />
                           <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                           <asp:BoundField DataField="booking_status" HeaderText="Status" SortExpression="booking_status"/>
                           <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-outline-dark " EditText="Edit" ShowEditButton="True" />
                       </Columns>
                   </asp:GridView>
        </div>
            </div>
        </div>
    </div>
</asp:Content>
