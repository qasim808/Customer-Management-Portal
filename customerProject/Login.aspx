<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="customerProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="styles/login-2.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/marks.css" type="text/css" media="screen" />
    <div class ="left"></div>
    <div id ="loginContent">
        <div class ="center-login">
            <div class="row">
                <div class="col-sm-4" ></div>
                <div class="col-sm-4" ><img src="styles/management-logo.png" width="80" height="80" alt="" style="filter:invert(100%)"></div><br />
                <p style="padding-left:95px; padding-top: 10px">Customer Management Portal</p>
                <div class="col-sm-4" ></div>
                </div><hr />
            <label for="exampleInputEmail1" class="display-4" style="font-size:15px">Email address</label><br />
            <asp:TextBox class="form-control h4" ID="emailTxt" runat="server" EnableViewState="true"/>
            <p id="errorMsg"></p>
            <label for="exampleInputPassword1" class="display-4" style="font-size:15px">Password</label>
            <asp:TextBox CssClass="form-control h4" ID="passwordTxt" runat="server" ToolTip="Enter Password" TextMode="Password"/><br />
            <asp:Button class="btn btn btn-outline-success" ID="btnSubmit" runat="server" Text="Login" OnClick="onButton_Submit" /><br /><br />
            <p class ="small"> New? Register <a href="javascript:popUp_UpdateCustomerForm_2(self);"> now.</a></p>
            <br />
        </div>
     </div>
        <div class="message">
            <asp:Literal ID="ltMessage" runat="server"/>
        </div>
        <br /><br /><br /><br />
   <div class ="newUser">          
    <div id="registerAdmin" class="modal fade" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="display-4 lead text-primary">Register</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <span id="spnTitle-2">
                        </span>
                    </h4>
                </div>
                <div class="modal-body">
                            <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">Email</label>
                                <asp:TextBox CssClass="form-control" ID="newUser_email" runat="server" placeholder="example@gmail.com" EnableViewState="true"/>
                            </div>
                        <div class="form-row">
                            <div class="form-group">
                            <label for="password" style="padding-left:10px;">Password</label>
                                <asp:TextBox CssClass="form-control" ID="newUser_password" placeholder="Password" runat="server" EnableViewState="true" TextMode="Password"/>
                            </div>
                            </div>
                </div>
                    </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="btnRegister" class="btn btn-outline-success" runat="server" Text="Register" OnClick="onRegistrationBtn_handle"/>
                </div>
            </div>
        </div>
    </div>
       </div>
    
    <div class="ml12 text-white h4" id="textSlider">
            <p>Login or Register to proceed.</p>
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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script>
        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var clientEmail = document.getElementById("<%=emailTxt.ClientID%>");
            if (!re.test(clientEmail.value)) {

                return false;
            }
            return true;
        }

        var textWrapper = document.querySelector('.ml12');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
        anime.timeline({ loop: false })
            .add({
                targets: '.ml12 .letter',
                translateX: [40, 0],
                translateZ: 0,
                opacity: [0, 1],
                easing: "easeOutExpo",
                duration: 1200,
                delay: (el, i) => 500 + 30 * i
            }).add({
                targets: '.ml12 .letter',
                translateX: [0, -30],
                opacity: [1, 0],
                easing: "easeInExpo",
                duration: 1100,
                delay: (el, i) => 100 + 30 * i
            });

        $('#loginContent').hide();
        var txtInterval = setInterval(function () {
            $('#textSlider').slideUp();
            clearInterval(txtInterval);
            var loginInterval = setInterval(function () {
                $('#loginContent').slideDown();
                clearInterval(loginInterval);
            }, 500);
        }, 5000);

        function popUp_UpdateCustomerForm_2(sender) {
            $('#registerAdmin').modal('show');
            $('#Button1').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
            return false;
        }

        function failModal(sender) {
            $('#crossModal').modal('show');
            setTimeout(function () {
                $('#crossModal').modal('hide');
            }, 3000);
            return false;
        }
        $(document).ready(function () {
            $('#crossModal').modal('hide');;
        });
        
            </script>
    <style>
        
    </style>
</asp:Content>
