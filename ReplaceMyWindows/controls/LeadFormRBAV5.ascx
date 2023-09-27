<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormRBAV5.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormRBAV5" %>
   <asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
 <div class="col-sm-6">

  <asp:TextBox runat="server" Text="" CssClass="txt" placeholder="First Name" ToolTip="First Name" ID="txtFirstName" MaxLength="80" ValidationGroup="LeadForm" ></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>

 <div class="col-sm-6">

  <asp:TextBox runat="server" Text="" CssClass="txt" placeholder="Last Name" ToolTip="Last Name" ID="txtLastName" MaxLength="80" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>
 <div class="col-sm-6">

  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtEmail" MaxLength="150" placeholder="Email Address" ToolTip="Email Address" ValidationGroup="LeadForm" CausesValidation="true"></asp:TextBox>
  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>

 </div>
 <div class="col-sm-6">

      <asp:TextBox runat="server" CssClass="txt" ID="txtPhone" MaxLength="12" placeholder="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
           ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
           ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
 </div>
 <div class="col-sm-12">

  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtStreet" ValidationGroup="LeadForm" placeholder="Street Address" ToolTip="Street Address"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
   ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>
 <div class="col-sm-4">

  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtCity"  placeholder="City"  ToolTip="City" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>

 <div class="col-sm-4">

  <asp:DropDownList runat="server" CssClass="ddl" ID="ddlStates" ValidationGroup="LeadForm">
  </asp:DropDownList>
 </div>

 <div class="col-sm-4">

  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtZipCode"  placeholder="Zip Code" ToolTip="Zip Code" MaxLength="5" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>

  <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="ddl" ValidationGroup="LeadForm" Visible="false">
   <asp:ListItem Text="Number of Windows" Value="0"></asp:ListItem>
   <asp:ListItem Text="Under 3" Value="Under 3"></asp:ListItem>
   <asp:ListItem Selected="True" Text="3-10" Value="3-10"></asp:ListItem>
   <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
  </asp:DropDownList>


                 <!-- NO NO NO -->
                        <div class="col-sm-4">   
                          <div class="page-header">
                          <h3>NO</h3>
                          <p>$ Down*</p>
                          </div> 
                        </div>
                        <div class="col-sm-4">   
                          <div class="page-header">
                          <h3>NO</h3>
                          <p>Payments*</p>
                          </div> 
                        </div>
                        <div class="col-sm-4">   
                          <div class="page-header">
                          <h3>NO</h3>
                          <p>Interest*</p>
                          </div> 
                        </div>
                        
                        <div class="col-sm-12 fine text-center">
                        <p>*Minimum purchase required. Interest accrues from the purchase date but is waived if paid in full within 12 months<sup>1</sup>.</p></div>
               <!-- /NO NO NO -->
 <div class="field">
  <asp:Button runat="server" ID="btnSubmit" Text="SCHEDULE FREE CONSULTATION &rsaquo;&rsaquo;" CssClass="btn-primary fs18 strong" OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />
 </div>
<div class="legal fine">  
    <label><input type="hidden" id="leadid_tcpa_disclosure"/>
  <p id="tcpa" runat="server">
    By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party organization to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at 1-646-588-5009
 
  </p>
    </label>
 </div>
