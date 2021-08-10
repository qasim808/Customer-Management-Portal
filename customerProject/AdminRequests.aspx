<%@ Page Title="Admin Requests" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminRequests.aspx.cs" Inherits="customerProject.AdminRequests" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="position:relative;">
<link rel="stylesheet" href="styles/adminRegistration.css" type="text/css" media="screen" />
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <br /><br />
       <asp:GridView ID="PendingRequests" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging" PageSize="10" CssClass="adminGrid" OnRowCommand="PendingRequests_RowCommand">
            <Columns>
                <asp:BoundField  DataField="email" HeaderText="Email" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="17px" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="25px"/>
                <asp:BoundField  DataField="account_password" HeaderText="Password" ItemStyle-CssClass="display-4" ItemStyle-Font-Size="17px" HeaderStyle-CssClass="display-4" HeaderStyle-Font-Size="25px"/>
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" Text="Approve" CssClass="btn btn-outline-success" CommandName="Approve" CommandArgument="<%# Container.DataItemIndex %>"/>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:Button ID="Button2" runat="server" CausesValidation="false" Text="Deny"  CssClass="btn btn-danger" CommandName="Deny" CommandArgument="<%# Container.DataItemIndex %>"/>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    <div class="row align-items-center">
    <div class="col">
    </div>
    <div class="col-8 display-4" style="font-size:40px; padding-left:160px">
        <asp:Literal ID="msgLiteral" runat="server" />
    </div>
    <div class="col">
    </div>
  </div>
</body>
</html>
    </asp:Content>
