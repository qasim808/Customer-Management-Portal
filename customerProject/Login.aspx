<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="customerProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="styles/login.css" type="text/css" media="screen" />
    <div class ="left"></div>
    <div class ="loginContent">
        <div class ="center-login">
            <label for="exampleInputEmail1">Email address</label><br />
            <asp:TextBox class="form-control" ID="emailTxt" runat="server" EnableViewState="true"></asp:TextBox>
            <p id="errorMsg"></p>
            <label for="exampleInputPassword1">Password</label>
            <asp:TextBox class="form-control" ID="passwordTxt" runat="server" ToolTip="Enter Password" TextMode="Password"></asp:TextBox><br />
            <asp:Button class="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="onButton_Submit"></asp:Button>
            <br />
        </div>
        <div class="message">
            <asp:Literal ID="ltMessage" runat="server"/>
        </div>
        <br /><br /><br /><br />
        </div>
    <script>
        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var clientEmail = document.getElementById("<%=emailTxt.ClientID%>");
            if (!re.test(clientEmail.value)) {
                document.getElementById('errorMsg').innerHTML = "Wrong email address";
                return false;
            }
            return true;
        }
    </script>
    <style>
        
    </style>
</asp:Content>
