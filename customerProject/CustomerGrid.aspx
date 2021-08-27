<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerGrid.aspx.cs" Inherits="customerProject.CustomerGrid" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="position:relative;">
    <link rel="stylesheet" href="styles/customerGrid.css" type="text/css" media="screen" />
    <br /><br /><br />
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
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
    <asp:Button ID ="currentPg" CssClass="pgNoHolder" Text="0" runat="server" />
    <asp:Button ID="firstPage" CssClass="btn btn-outline-danger" runat="server" Text="1" OnClick="firstpg_BtnClick"/>
    <asp:Button ID="prevPage" CssClass="btn btn-outline-danger" runat="server" Text="Prev." OnClick="prevpg_BtnClick"/>
    <asp:Button ID="nextPage" CssClass="btn btn-outline-success" runat="server" Text="Next" OnClick="nxtPg_BtnClick"/>
    <asp:Button ID="lastPage" CssClass="btn btn-outline-success" runat="server" Text=">>" OnClick="lastpg_BtnClick"/>
    <asp:Label ID="pageNumber" runat="server" />
</body>
</html>
</asp:Content>
