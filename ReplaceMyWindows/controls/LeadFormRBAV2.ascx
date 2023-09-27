<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormRBAV2.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormRBAV2" %>
<div class="frm">
 <div class="field med">
  <asp:TextBox runat="server" CssClass="txt" ID="txtFirstName" MaxLength="80" Text="First Name" ToolTip="First Name" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue="First Name"></asp:RequiredFieldValidator>
 </div>
 <div class="clear">
 </div>
 <div class="field med">
  <asp:TextBox runat="server" CssClass="txt" ID="txtLastName" MaxLength="80" Text="Last Name" ToolTip="Last Name" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue="Last Name"></asp:RequiredFieldValidator>
 </div>
 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtStreet" Text="Street Address" ToolTip="Street Address" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
   ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue="Street Address"></asp:RequiredFieldValidator>
 </div>
 <div class="field lng">
  <asp:TextBox runat="server" Text="City" CssClass="txt" ID="txtCity" ToolTip="City" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue="City"></asp:RequiredFieldValidator>
 </div>
 <div class="field med">
  <asp:DropDownList runat="server" CssClass="ddl" ID="ddlStates" ValidationGroup="LeadForm">
   <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
  </asp:DropDownList>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="State is required." ValidationGroup="LeadForm"
   ControlToValidate="ddlStates" Display="Dynamic" CssClass="req" InitialValue="0"></asp:RequiredFieldValidator>
 </div>
 <div class="clear">
 </div>
 <div class="field med">
  <asp:TextBox runat="server" CssClass="txt" ID="txtZipCode" MaxLength="5" Text="Zip Code" ToolTip="Zip Code" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue="Zip Code"></asp:RequiredFieldValidator>
 </div>
 <div class="field med">
  <asp:TextBox runat="server" CssClass="txt" ID="txtEmail" MaxLength="150" Text="Email Address" ToolTip="Email Address" ClientIDMode="Static" CausesValidation="true" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been used" CssClass="req"
   ClientValidationFunction="isValidEmail" runat="server" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue="Email Address"></asp:RequiredFieldValidator>
 </div>
 <div class="clear">
 </div>
 <div class="field med">
  <asp:TextBox runat="server" CssClass="txt" ID="txtPhone" MaxLength="12" Text="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue="Phone Number"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
 </div>
 <div class="field">
  <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="ddl" ValidationGroup="LeadForm">
   <asp:ListItem Text="Number of Windows" Value="0"></asp:ListItem>
   <asp:ListItem Text="Under 3" Value="Under 3"></asp:ListItem>
   <asp:ListItem Text="3-10" Value="3-10"></asp:ListItem>
   <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
  </asp:DropDownList>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Number of Windows are required." ValidationGroup="LeadForm"
   ControlToValidate="ddlNumWindows" Display="Dynamic" CssClass="req" InitialValue="0"></asp:RequiredFieldValidator>
 </div>
 <%-- 
 
 <div class="field med">
  <label class="lbl">
   Best Time to Call</label>
  <asp:DropDownList runat="server" ID="ddlBestTimetoCall" CssClass="ddl">
   <asp:ListItem Text="Morning" Value="Morning"></asp:ListItem>
   <asp:ListItem Text="Afternoon" Value="Afternoon"></asp:ListItem>
   <asp:ListItem Text="Evening" Value="Evening"></asp:ListItem>
  </asp:DropDownList>
 </div>--%>

 <div class="field">
  <asp:Button runat="server" ID="btnSubmit" Text="GET STARTED NOW" CssClass="btn" OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />
 </div>
 <div class="disclaimer">
  <p id="tcpa" runat="server">
By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen to call and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with Low-E-ReplacementWindows.com or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted and informed about products, services and sales. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at 1-646-588-5009
  </p>
 </div>
</div>
