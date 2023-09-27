<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormRBAShort.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormRBAShort" %>
   <asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
<div class="frm">
 <div class="field lng">
  <label class="lblLrg">
   First Name</label>
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtFirstName" MaxLength="80" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>
 <div class="field clear">
  &nbsp;
 </div>
 <div class="field lng">
  <label class="lblLrg">
   Last Name</label>
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtLastName" MaxLength="80" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>



 <div class="field lng">
  <label class="lblLrg">
   Email Address</label>
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtEmail" MaxLength="150" ValidationGroup="LeadForm" CausesValidation="true"></asp:TextBox>
  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>

 </div>
 <div class="field clear">
  &nbsp;
 </div>


 <div class="field med">
  <label class="lblLrg">
   Phone Number</label>
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtPhone" MaxLength="12" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
     <asp:CustomValidator runat=server
            controltovalidate="txtPhone" Display="Dynamic" CssClass="req"
            errormessage="Invalid Phone Number Entered" 
            OnServerValidate="validatephone" />
 </div>

 <div class="field clear">
  &nbsp;
 </div>
     <div class="field sm">
  <label class="lblLrg">
   Zip</label>
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtZipCode" MaxLength="5" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />
 </div>
     <div class="field clear">
  &nbsp;
 </div>
     <div class="field" style="text-align:center">              
       
  <div class="lblLrg">
   What Type of Consultation Would you Prefer?</div>
          
                   
  <asp:RadioButton runat="server" ID="InHome" GroupName="ConsultType" CssClass="lblRadio" ValidationGroup="LeadForm" Checked="true"> </asp:RadioButton> In-Home
      <asp:RadioButton runat="server" ID="Virtual" GroupName="ConsultType" CssClass="lblRadio" ValidationGroup="LeadForm"> </asp:RadioButton> Virtual (where available)                
 </div>



 <div class="required">
  <p>
   All fields are required
  </p>
 </div>
 <div class="field">
  <asp:Button runat="server" ID="btnSubmit" Text="GET STARTED NOW" CssClass="btn" OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />
 </div>
 <div class="disclaimer">
     <label><input type="hidden" id="leadid_tcpa_disclosure"/>
  <p id="tcpa" runat="server">
  By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party <a href="partners.html" target="_blank">organization</a> to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644
  
  </p>
     </label>
 </div>
</div>

