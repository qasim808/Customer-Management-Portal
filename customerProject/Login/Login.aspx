<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="customerProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/styles/login.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/styles/marks.css" type="text/css" media="screen" />
    <div class ="left"></div>
<div class ="loginContent">
  <div class="container px-4 py-1">
    <div class="card card0">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1">
                <div class="row justify-content-center my-auto">
                    <div class="col-md-8 col-10 my-5">
                        <div class="row justify-content-center px-3 mb-3"> <img id="logo" src="/styles/management-logo.png" style="height: 80px;width: 100px;"> </div>
                        <h3 class="mb-5 text-center heading">Customer Management Portal</h3>
                        <h6 class="msg-info">Please login to your account</h6>
                        <div class="form-group"> <label class="form-control-label text-muted">Email/Username</label> <asp:TextBox ID="emailTxt" class="form-control" runat="server" EnableViewState="true" onblur="return checkEmail(this)"/>
                            <p class ="small text-danger display-4" id="emailError" style="font-size:15px;"></p>
                            <p id="errorMsg"></p>
                        </div>
                        <div class="form-group"> <label class="form-control-label text-muted">Password</label> <asp:TextBox CssClass="form-control" ID="passwordTxt" runat="server" TextMode="Password" EnableViewState="true" onblur="return ValidPasssword(this)"/><br />
                        <p class ="small text-danger display-4" id="passwordError" style="font-size:15px;"></p> </div>
                        <div class="row justify-content-center my-3 px-3"> <asp:Button class="btn btn-success text-white" ID="btnSubmit" runat="server" Text="Login" OnClick="onButton_Submit" OnClientClick="return chkValidation();"/> </div>
                        
                    </div>
                </div>
                <div class="bottom text-center mb-2">
                    <p class="sm-text mx-auto mb-0">Don't have an account? <a href="javascript:popUp_UpdateCustomerForm_2(self);"> Register now.</a></p>
                </div>
            </div>
            <div class="card card2">
                <div class="my-auto mx-md-5 px-md-5 right">
                    <h3 class="text-white text-center">About Us</h3> <small class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</small>
                </div>
            </div>
        </div>
    </div>
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
                                <asp:TextBox CssClass="form-control" ID="newUser_email" runat="server" placeholder="example@gmail.com" EnableViewState="true" onblur="return checkNewEmail(this)"/>
                                <p class ="small text-danger display-4" id="newEmailError" style="font-size:15px;"></p>
                                <p id="newErrorMsg"></p>
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
                    <asp:Button type="button" class="btn btn-danger text-white" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="btnRegister" class="btn btn-outline-success btn-sm" runat="server" Text="Register" OnClick="onRegistrationBtn_handle"/>
                    
                </div>
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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script>
        function tickSign(sender) {
            $('#checkModal').modal('show');
            setTimeout(function () {
                $('#checkModal').modal('hide');
            }, 3000);
            return false;
        }
        function checkEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var email = $("#<%= emailTxt.ClientID%>").val();
            if (!re.test(email)) {
                $('#emailError').text('* Incorrect Email');
                return false;
            }
            $('#emailError').text('');
            return true;
        }
        function checkNewEmail() {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var email = $("#<%= newUser_email.ClientID%>").val();
            if (!re.test(email)) {
                $('#newEmailError').text('* Incorrect Email');
                return false;
            }
            $('#newEmailError').text('');
            return true;
        }
        function ValidPassword() {
            var password = $("#<%= passwordTxt.ClientID%>").val();
            var re = '';
            if (re.test(password)) {
                $('#passwordError').text('* Incorrect Password');
                return false;
            }
            $('#passwordError').text('');
            return true;
        }
        function chkValidation() {
            var noErrors = true;
            var clientEmail = $("#<%= emailTxt.ClientID%>").val();
            if (!checkEmail() && !ValidPassword()) {
                noErrors = false;
            }
            return noErrors;
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
