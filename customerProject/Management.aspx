<%@ Page Title="Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="customerProject.Contact" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/styles/managebackground.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/styles/marks.css" type="text/css" media="screen" />

<div class="container px-4 py-5 mx-auto" style="height: 96.8vh;">
    <div class="card card0"style="height: 90vh;"">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1" style="width: 14%;height: 90vh;background-color: rgba(9, 192, 100, 0.712);">
                <div class="row justify-content-center my-auto">
                </div>
            </div>
            <div class="card card3" style="overflow-x: hidden;">
                <hr>
                <div class="my-5 px-3" style="width: 89vw;">
                    <div class="btn-toolbar px-5" role="toolbar">
                <div class="btn-group mr-5" role="group" style="width:430px">
                    <asp:Button runat="server" CssClass="btn btn-outline-info btn-lg" ID ="btnAddCustomer" style="width:inherit;" Text ="Add New Customer" OnClientClick="return popUp_AddNewCustomer(this);"/>
                 </div>
                <div class="btn-group mr-5" role="group" style="width:430px">
                    <asp:Button CssClass="btn btn-outline-info btn-lg" ID ="btnUpdateCustomer" Text ="Update Customer" runat="server" OnClientClick="return popUp_UpdateCustomer(this);"/>
                </div></div>
                    <br><br><br/><hr><br><br>
                    <div class="btn-toolbar px-5" role="toolbar"> 
                        <div class="btn-group mr-5" role="group" style="width:430px">
                            <asp:Button CssClass="btn btn-outline-info btn-lg" ID="btnDeleteCustomer" Text="Delete Customer" runat ="server" OnClientClick="return show_deleteCustomer_InitialModal(this);"/>
                        </div>
                        <div class="btn-group mr-5" role="group" style="width:430px">
                            <asp:Button CssClass="btn btn-outline-info btn-lg" ID="btnListCustomers" Text="List All Customers" runat ="server" onClick="btn_listCustomers"/>
                        </div></div>
                    
                </div>
            </div>
            <div class="card card2" style="width: 13%;height: 90vh;background-color: rgba(128, 128, 128, 0.747);">
                <div class="my-auto mx-md-5 px-md-5 right">
                </div>
            </div>
            
        </div>
    </div>
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
                                <asp:TextBox CssClass="form-control" ID="newCustomer_customerName" runat="server" placeholder="Customer Name" EnableViewState="true" onkeypress="return validateName()"/>
                                <p class="small text-danger display-4" id="nameChk" style="font-size:15px"></p>
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
                                <asp:TextBox CssClass="form-control" ID="newCustomer_email" placeholder="Email Address" EnableViewState="true" runat="server" onblur="return checkEmail()"/>
                                <p class="small text-danger display-4" id="emailChk" style="font-size:15px"></p>
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
                    <asp:Button type="button" id="AddNewCustomer_btnConfirm" class="btn btn-success" runat="server" Text="Submit" onClick="btnHandleNewCustomer_Submit"  onClientClick="return chkValidation()"/>
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

  <div class ="deleteCustomer">          
      <div id="deleteCustomer_ModalPopUp" class="modal fade" role="form">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h1 class="display-4 text-danger lead text-center">Delete Customer Form</h1>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">
                          <span id="spnTitle-delete">
                          </span>
                      </h4>
                  </div>
                  <div class="modal-body">
                              <div class="form-row">
                              <div class="form-group col-md-6">
                                  <label for="name">Customer CNIC</label>
                                  <asp:TextBox CssClass="form-control" ID="deleteForm_customerCNIC" runat="server" placeholder="XXXX-XXXXXXX-X" EnableViewState="true"/>
                              </div>
                              </div>
                 </div>
                  <div class="modal-footer">
                      <asp:Button type="button" class="btn btn-success" data-dismiss="modal" Text="Cancel" runat="server"/>
                      <asp:Button type="button" id="deleteForm_Proceed" class="btn btn-outline-danger" runat="server" Text="Proceed" OnClick="btnHandleDeleterCustomer_Proceed"/>
                  </div>
            </div>
          <asp:Literal ID="deleteLiteral" runat="server"></asp:Literal>        
    </div>
   </div>
  </div>
<div class ="deleteCustomerFinal">          
  <div id="deleteCustomerForm_Final" class="modal fade" role="form">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="display-4 text-success lead text-center">Customer Information</h1>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">
                      <span id="spnTitle_1">
                      </span>
                  </h4>
              </div>
              <div class="modal-body">
                          <div class="form-row">
                          <div class="form-group col-md-6">
                              <label for="name">Customer Name</label>
                              <asp:TextBox CssClass="form-control" ID="delFormFinal_Name" runat="server" placeholder="Customer Name" EnableViewState="true" ReadOnly="true"/>
                          </div>
                          <div class="form-group col-md-6">
                              <label for="phone-number">Phone Number</label>
                              <asp:TextBox CssClass="form-control" ID="delFormFinal_Phone" placeholder="03XX-XXXXXXX" runat="server" EnableViewState="true" ReadOnly="true"/>
                          </div>
                          </div>
                      <div class="form-row">
                          <div class="form-group col-md-6">
                          <label for="cnic">CNIC</label>
                              <asp:TextBox CssClass="form-control" ID="delFormFinal_CNIC" placeholder="XXXXX-XXXXXXX-X" runat="server" EnableViewState="true" ReadOnly="true"/>
                          </div>
                          <div class="form-group col md-4">
                          <label for="customer-email-address">Email Address</label>
                              <asp:TextBox CssClass="form-control" ID="delFormFinal_Email" placeholder="Email Address" EnableViewState="true" runat="server" ReadOnly="true"/>
                          </div>
                          </div>
                      <div class="form-group">
                          <label for ="inputAddress">Address</label>
                          <asp:TextBox CssClass="form-control" ID="delFormFinal_Address" placeholder="Address (House #, St #, ..)" runat="server" EnableViewState="true" ReadOnly="true" />              
                      </div>

              </div>
              <div class="modal-footer">
                  <asp:Button type="button" class="btn btn-success" data-dismiss="modal" Text="Cancel" runat="server"/>
                  <asp:Button type="button" id="Button2" class="btn btn-outline-danger" runat="server" Text="Confirm" OnClick="btn_DeleteConfirm"/>
              </div>
          </div>
      </div>
  </div>
      <asp:Literal ID="Literal11" runat="server"></asp:Literal>        
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
         function show_deleteCustomer_InitialModal(sender) {
             $('#deleteCustomer_ModalPopUp').modal('show');
             return false;
         }
         function show_delForm_Final() {
             $('#deleteCustomerForm_Final').modal('show');
             return false;
         }
     </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
        <script type="text/javascript">
            function validateName() {
                var name = $("#<%= newCustomer_customerName.ClientID%>").val();
                if (/\d/.test(name)) {
                    $('#nameChk').text('* Please enter valid customer name');
                    return false;
                }
                else {
                    $('#nameChk').text('');
                    return true;
                }
            }
            function checkEmail() {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var email = $("#<%= newCustomer_email.ClientID%>").val();
                if (!re.test(email)) {
                    $('#emailChk').text('* Incorrect Email');
                    return false;
                }
                $('#emailChk').text('');
                return true;
            }
            function chkValidation() {
                if (validateName() && checkEmail()) {
                    return true;
                }
                return false;
            }
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
            $(document).ready(function () {
                $("#<%= deleteForm_customerCNIC.ClientID%>").mask("99999-9999999-9");
            });
        </script>
</asp:Content>
