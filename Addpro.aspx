<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Addpro.aspx.cs" Inherits="DemoProjet.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
    <div class="col-md-4">
                        <label>Car id</label>
                        <div class="form-group">
                           <asp:DropDownList CssClass="form-control" ID="idcar" runat="server"  ></asp:DropDownList>
                        </div>
                     </div>
        </div>
    <br /> <br />
         <div class="col-md-4">
                        <label>percentage</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="prc" runat="server" placeholder="Color" Text=" "></asp:TextBox>
                        </div>
                     </div>
     <div class="row">
                      <div class="col">
                          <label> the start date of the promotion:</label>
                        <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="Pickup" runat="server" placeholder="PickUp Date" TextMode="Date"></asp:TextBox>
                                 </div>
                           <div class="form-group">
                               <label>the end date of the promotion:</label>
                                 <asp:TextBox CssClass="form-control" ID="dropoff" runat="server" placeholder="PickUp Date" TextMode="Date"></asp:TextBox>
                                 </div>
                     </div>
                  </div>
    <br />
    <div class="row">
        <div class="d-grid gap-2 col-6 mx-auto">
                                <asp:Button ID="btn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Apply" OnClick="Button_Click" Width="195px" />
                             </div>
    </div>
        </div>
      
    <br /><br />
</asp:Content>
