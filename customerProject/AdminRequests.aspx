<%@ Page Title="Admin Requests" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminRequests.aspx.cs" Inherits="customerProject.AdminRequests" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="position:relative;">
<link rel="stylesheet" href="styles/adminRegistration.css" type="text/css" media="screen" />
<link rel="stylesheet" href="styles/marks.css" type="text/css" media="screen" />
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
    <div id="checkModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title text-success text-center" style="font-weight:700">Success!</h5>
            </div>
            <div class="modal-body">
                <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
            </div>
            <div class="modal-footer text-success h4">
                <asp:Literal ID="successLiteral" runat="server"></asp:Literal>   
            </div>
        </div>
        </div>
    </div>
    <div id="crossModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title text-danger text-center" style="font-weight:700">Failed!</h5>
                    </div>
                    <div class="modal-body">
                    <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                        <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                        <path class="checkmark__check" fill="none" d="M16 16 36 36 M36 16 16 36" />
                    </svg>   
                    </div>
                    <div class="modal-footer text-danger h4 text-center">
                        <asp:Literal ID="failedReasonLiteral" runat="server"></asp:Literal>   
                    </div>
                </div>
                </div>
            </div>
    <script>
        function completeForm(sender) {
            $('#checkModal').modal('show');
            setTimeout(function () {
                $('#checkModal').modal('hide');
            }, 3000);
            return false;
        }
        function failModal(sender) {
            $('#crossModal').modal('show');
            setTimeout(function () {
                $('#crossModal').modal('hide');
            }, 3000);
            return false;
        }
     </script>
</body>
</html>
    </asp:Content>
