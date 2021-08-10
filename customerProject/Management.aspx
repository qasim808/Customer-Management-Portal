<%@ Page Title="Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="customerProject.Contact" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="styles/managebackground.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="styles/marks.css" type="text/css" media="screen" />
    <div class="content-1">
    <div class="btn-toolbar px-5" role="toolbar">
        <div class="btn-group mr-5" role="group" style="width:350px">
    <asp:Button class ="btn btn-primary py-3 px-5 rounded" ID ="btnAddCustomer" Text ="Add New Customer" runat="server"  OnClientClick="return popUp_AddNewCustomer(this);"/>
            </div>
            <div class="btn-group mr-5" role="group" style="width:350px">
    <asp:Button class ="btn btn-primary py-3 px-5 rounded" ID ="btnUpdateCustomer" Text ="Update Customer" runat="server" OnClientClick="return popUp_UpdateCustomer(this);"/>
                </div></div>
    <br />
        </div>
    <div class="content-2">
    <div class="btn-toolbar px-5" role="toolbar">
        <div class="btn-group mr-5" role="group" style="width:360px">
    <asp:Button class="btn btn-success py-3 px-5 rounded" ID="btnDelCustomer" Text="Delete Customer" runat ="server" />
    </div>
        <div class="btn-group mr-5" role="group" style="width:350px">
            <asp:Button class="btn btn-success py-3 px-5 rounded" ID="btnListCustomers" Text="List All Customers" runat ="server" onClick="btn_listCustomers"/>
            </div></div>
        </div>

<div class ="addNewCustomerPopUp">          
    <div id="AddNewCustomer_modalPopUp" class="modal fade" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="display-4 text-success lead text-center">New Customer Form</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <span id="spnTitle">
                        </span>
                    </h4>
                </div>
                <div class="modal-body">
                            <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="name">Customer Name</label>
                                <asp:TextBox CssClass="form-control" ID="newCustomer_customerName" runat="server" placeholder="Customer Name" EnableViewState="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="phone-number">Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="newCustomer_Phone" placeholder="03XX-XXXXXXX" runat="server" EnableViewState="true"/>
                            </div>
                            </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="cnic">CNIC</label>
                                <asp:TextBox CssClass="form-control" ID="newCustomer_CNIC" placeholder="XXXXX-XXXXXXX-X" runat="server" EnableViewState="true"/>
                            </div>
                            <div class="form-group col md-4">
                            <label for="customer-email-address">Email Address</label>
                                <asp:TextBox CssClass="form-control" ID="newCustomer_email" placeholder="Email Address" EnableViewState="true" runat="server" />
                            </div>
                            </div>
                            <!-- <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="disabled-date-input">Date</label>
                                <asp:TextBox CssClass="form-control" ID="date" placeholder="DD/MM/YYY" EnableViewState="true" runat="server" Enabled="false"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputAddresss">Address</label>
                                <asp:TextBox CssClass="form-control" ID="customer_address" placeholder="Address (House #, St #, ..)" runat="server" EnableViewState="true" />
                            </div>
                            </div>-->
                        <div class="form-group">
                            <label for ="inputAddress">Address</label>
                            <asp:TextBox CssClass="form-control" ID="newCustomer_address" placeholder="Address (House #, St #, ..)" runat="server" EnableViewState="true" />              
                        </div>

                </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="AddNewCustomer_btnConfirm" class="btn btn-success" runat="server" Text="Submit" onClick="btnHandleNewCustomer_Submit"  AutoPostback = "false"/>
                </div>
            </div>
        </div>
    </div>
        <asp:Literal ID="litMsg" runat="server"></asp:Literal>        
</div>

<div class ="updateCustomer">          
    <div id="UpdateCustomer_modalPopUp" class="modal fade" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="display-4 text-success lead text-center">Update Existing Customer Form</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <span id="spnTitle-update">
                        </span>
                    </h4>
                </div>
                <div class="modal-body">
                            <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="name">Customer Name</label>
                                <asp:TextBox CssClass="form-control" ID="updateForm_CustomerName" runat="server" placeholder="Customer Name" EnableViewState="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="phone-number">Customer Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="updateForm_CustomerPhone" placeholder="03XX-XXXXXXX" runat="server" EnableViewState="true"/>
                            </div>
                            </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                            <label for="cnic">CNIC</label>
                                <asp:TextBox CssClass="form-control" ID="updateForm_CustomerCNIC" placeholder="XXXXX-XXXXXXX-X" runat="server" EnableViewState="true"/>
                            </div>
                            </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="updateForm_btnConfirm" class="btn btn-success" runat="server" Text="Confirm" OnClick="btnHandleUpdateCustomer_Proceed"/>
                </div>
        </div>
    </div>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>        
</div>
</div>
    </div>
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
                            <asp:TextBox CssClass="form-control" ID="form2_UpdateCustomerAddress" placeholder="Address (House #, St #, ..)" runat="server" EnableViewState="true" />              
                        </div>

                </div>
                <div class="modal-footer">
                    <asp:Button type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel" runat="server"/>
                    <asp:Button type="button" id="Button1" class="btn btn-success" runat="server" Text="Submit & Update" onClick="btnHandleUpdateCustomer_Submit"/>
                </div>
            </div>
        </div>
    </div>
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>        
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
    

     <script type="text/javascript">
         function popUp_AddNewCustomer(sender) {
             $('#AddNewCustomer_modalPopUp').modal('show');
             $('#AddNewCustomer_btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
             return false;
         }
         function popUp_UpdateCustomer(sender) {
             $('#UpdateCustomer_modalPopUp').modal('show');
             $('#UpdateForm_btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
             return false;
         }
         function popUp_UpdateCustomerForm_2(sender) {
             $('#updateCustomerForm').modal('show');
             $('#Button1').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
             return false;
         }
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#<%= updateForm_CustomerCNIC.ClientID%>").mask("99999-9999999-9");
            });
            $(document).ready(function () {
                $("#<%= updateForm_CustomerPhone.ClientID %>").mask("0399-99999999");
            });
            $(document).ready(function () {
                $("#<%=  newCustomer_CNIC.ClientID %>").mask("99999-9999999-9");
            });
            $(document).ready(function () {
                $("#<%= newCustomer_Phone.ClientID %>").mask("0399-99999999");
            });
        </script>
</asp:Content>
