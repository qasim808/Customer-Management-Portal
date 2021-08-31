<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerGrid.aspx.cs" Inherits="customerProject.CustomerGrid" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="position:relative;">
    <link rel="stylesheet" href="styles/customerGrid.css" type="text/css" media="screen" />
    <hr />
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <asp:DropDownList ID="selectPageSize" runat="server" CssClass="btn btn-secondary dropdown-toggle" />
    <asp:Button ID="loadGrid" CssClass="btn btn-primary" runat="server" Text="Load" OnClick="loadBtn_BtnClick"/>
    <br /><br /><hr />
    <asp:Label ID="errorLabel" runat="server" />
    <asp:GridView ID ="customerGrid" runat="server" AutoGenerateColumns="false" CssClass="customerGrid">
        <Columns>
            <asp:BoundField  DataField="customerCNIC" HeaderText="CNIC" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="20px" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="15px"/>
            <asp:BoundField  DataField="customerPhone" HeaderText="Phone" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="20px" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="15px"/>
             <asp:BoundField  DataField="customerName" HeaderText="Full Name" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="20px" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="15px"/>
             <asp:BoundField  DataField="customerAddress" HeaderText="Residential Address" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="20px" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="15px"/>
              <asp:BoundField  DataField="emailAddress" HeaderText="Email Address" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="20px" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="15px"/>
        </Columns>
    </asp:GridView>
    <br /><br />
    <asp:PlaceHolder runat="server" ID="placeHolderForButtons"></asp:PlaceHolder>
    <asp:Button ID ="currentPg" CssClass="pgNoHolder" Text="0" runat="server" />
    <asp:Label ID="amtOfButtons" Text="" runat="server"/>
    <asp:Label ID="pageOffset" runat="server" />


</body>
</html>
</asp:Content>
