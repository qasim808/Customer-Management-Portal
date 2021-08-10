<%@ Page Title="Customer List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="customer_list.aspx.cs" Inherits="customerProject.customer_list" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="position:relative;">
    <link rel="stylesheet" href="styles/customerList.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/marks.css" type="text/css" media="screen" />
    <br /><br />
<html xmlns="http://www.w3.org/1999/xhtml">
    <body>
<div class ="main-content">
    <br />
        <div class="container">
        <div class="row">
            <div class="col-sm-2"> <img src="styles/management-logo.png" width="40" height="40" class="d-inline-block align-top" alt=""></div>
            <div class="col-sm-4 px-0 py-2 display-4" style="font-size:20px; font-weight: 400"><p> Customer Management</p>
            </div>
        </div><hr />
        <br />
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4 display-4" id="customer_name" style="font-size:20px;font-weight:700"></div>
            <div class="col-sm-4 px-5"><img src="https://www.pngfind.com/pngs/m/304-3045489_png-file-svg-blank-person-transparent-png.png" width="100" height="100"/></div>
        </div>
        <div class="row">
            <div class="col-sm-2 display-4" style="font-size:20px;font-weight:400">Customer CNIC: </div>
            <div class="col-sm-4 display-4" style="font-size:19px;font-weight:300" id="customer_cnic"></div>
            <div class="col-sm-6"></div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-2 display-4" style="font-size:20px;font-weight:400">Customer Phone:</div>
            <div class="col-sm-5 display-4" style="font-size:19px;font-weight:300" id="customer_phone"></div>
            <div class="col-sm-5"></div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-2 display-4" style="font-size:20px;font-weight:400">Customer Address:</div>
            <div class="col-sm-5 display-4 py-3" style="font-size:19px;font-weight:300" id="customer_address"></div>
            <div class="col-sm-4"></div>
            </div>
        <br />
        <div class="row">
            <div class="col-sm-2 display-4" style="font-size:20px;font-weight:400">Email:</div>
            <div class="col-sm-5 display-4" style="font-size:19px;font-weight:300" id="customer_email"></div>
            <div class="col-sm-4"></div>
            </div>
        <div class="row">
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <asp:Button class ="btn btn-outline-success col rounded" ID ="btnUpdateCustomer" Text ="Update" runat="server" OnClick="btn_handleUpdate"/>
            <div class="col"></div>
            </div>
        <br />
        <div class="row">
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <asp:Button class ="btn btn-outline-danger col rounded" style="width:20px;" ID ="btn_deleteCustomer" Text ="Delete" runat="server" OnClick="btn_deleteHelper"/>
            <div class="col"></div>
            </div>
        <div class="row">
            <div class="col-sm-2 display-4" style="font-size:20px;font-weight:400">DEBUG:</div>
            <div class="col-sm-5 display-4" style="font-size:19px;font-weight:300" id="debug"></div>
            <div class="col-sm-4"></div>
            </div>
    </div>
</div>
    <div id="empty-alert" hidden ="true">
        <div class="row align-items-center">
            <div class="col">
            </div>
            <div class="col-8 display-4" style="font-size:40px; padding-left:160px">
                <p> No records to display. </p>
            </div>
            <div class="col">
            </div>
        </div>
    </div>
    <asp:Literal ID="msgLiteral" runat="server" />
        <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging" PageSize="1" CssClass ="mygridview">
            <Columns>
                <asp:BoundField  DataField="customerCNIC" HeaderText="CNIC" ItemStyle-CssClass="cnic"/>
                <asp:BoundField  DataField="customerPhone" HeaderText="Phone" ItemStyle-CssClass="phone"/>
                <asp:BoundField  DataField="customerName" HeaderText="Full Name" ItemStyle-CssClass="name"/>
                <asp:BoundField  DataField="customerAddress" HeaderText="Residential Address" ItemStyle-CssClass="address"/>
                <asp:BoundField  DataField="emailAddress" HeaderText="Email Address" ItemStyle-CssClass="email"/>
            </Columns>
        </asp:GridView>

    <div class ="updateCustomer-2">          
    <div id="updateCustomerForm" class="modal fade" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="display-4 text-success lead text-center">Update Customer Form</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <span id="spnTitle-2">
                        </span>
                    </h4>
                </div>
                <div class="modal-body">
                            <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="name">Customer Name</label>
                                <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomer_Name" runat="server" placeholder="Customer Name" EnableViewState="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="phone-number">Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomer_Phone" placeholder="03XX-XXXXXXX" runat="server" EnableViewState="true"/>
                            </div>
                            </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="cnic">CNIC</label>
                                <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomer_CNIC" placeholder="XXXXX-XXXXXXX-X" runat="server" EnableViewState="true"/>
                            </div>
                            <div class="form-group col md-4">
                            <label for="customer-email-address">Email Address</label>
                                <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomer_Email" placeholder="Email Address" EnableViewState="true" runat="server" />
                            </div>
                            </div>
                        <div class="form-group">
                            <label for ="inputAddress">Address</label>
                            <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomer_Address" placeholder="Address (House #, St #, ..)" runat="server" EnableViewState="true" />              
                             <asp:TextBox CssClass="form-control" ID="tempCNICHolder" runat="server" style="display:none;"/>
                        </div>
                </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="Button2" class="btn btn-success" runat="server" Text="Submit & Update" onClick="btnHandleUpdateCustomer_Submit"/>
                </div>
            </div>
        </div>
    </div>
</div>

        <div id="deleteForm" class="modal fade" role="form">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="display-4 text-danger lead text-center">Confirmation</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <span id="spnTitle2">
                            </span>
                        </h4>
              </div>
                <div class="modal-body">
                            <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="cnic">CNIC</label>
                                <asp:TextBox CssClass="form-control" ID="delForm_CNIC" placeholder="XXXXX-XXXXXXX-X" runat="server" EnableViewState="true" ReadOnly="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="phone-number">Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="delForm_phone" placeholder="03XX-XXXXXXX" runat="server" EnableViewState="true" ReadOnly="true"/>
                            </div>
                            </div>
                 </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-success" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="Button1" class="btn btn-danger" runat="server" Text="Delete" onClick="btn_delete"/>
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
        $(document).ready(function () {
           $('.cnic').each(function () {
               $("#customer_cnic").html($(this).html());
            });
        });
        $(document).ready(function () {
            $('.name').each(function () {
                $("#customer_name").html($(this).html());
            });
        });
        $(document).ready(function () {
            $('.phone').each(function () {
                $("#customer_phone").html($(this).html());
            });
        });
        $(document).ready(function () {
            $('.address').each(function () {
                $('#customer_address').html($(this).html());
            });
        });
        $(document).ready(function () {
            $('.email').each(function () {
                $('#customer_email').html($(this).html());
            });
        });
        function popUp_UpdateCustomerForm_2(sender) {
            $('#updateCustomerForm').modal('show');
            var cnic = $('.cnic').html();
            $("#<%= form2_UpdateCustomer_CNIC.ClientID %>").val(cnic);
            $("#<%= tempCNICHolder.ClientID %>").val(cnic);
            var email = $('.email').html();
            $("#<%= form2_UpdateCustomer_Email.ClientID %>").val(email);
            var phone = $('.phone').html();
            $("#<%= form2_UpdateCustomer_Phone.ClientID %>").val(phone);
            var name = $('.name').html();
            $("#<%= form2_UpdateCustomer_Name.ClientID %>").val(name);
            var addr = $('.address').html();
            $("#<%= form2_UpdateCustomer_Address.ClientID %>").val(addr);
            return false;
        }
        function popUp_DeleteForm(sender) {
            $('#deleteForm').modal('show');
            var cnic = $('.cnic').html();
            $("#<%= delForm_CNIC.ClientID %>").val(cnic);
            var phone = $('.phone').html();
            $("#<%= delForm_phone.ClientID%>").val(phone);
        }
        function storeCNIC(sender) {
            $("#<%= tempCNICHolder.ClientID %>").val(cnic);
        }
        function tickModal(sender) {
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
        function disableContainer(sender) {
            $('.main-content').hide();
            $('#empty-alert').show();
        }
        function enableContainer(sender) {
            $('.main-content').show();
            $('#empty-alert').hide();
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

</body>
</html>
    </asp:Content>
