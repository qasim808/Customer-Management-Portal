<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="customerProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="styles/default.css" type="text/css" media="screen" />
    <br /><br /><br /> <br /><br /><br />
        <video autoplay muted loop id="myVideo">
             <source src="styles/video.mp4" type="video/mp4">
                Your browser does not support HTML5 video.
            </video>
    <div class="container">
        <br /><br /><br /><br />
        <div class="row">
            <div class="col">
               <div class="content">
               </div>
            </div>
        </div>
        <br /> <br />
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4 px-5"><asp:Button runat="server" Text="Login/Register" CssClass="btn btn-success animatebutton" OnClick="btn_RedirectHandle"/></div>
        </div>
     </div>

</asp:Content>
