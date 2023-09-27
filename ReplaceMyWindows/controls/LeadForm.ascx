<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadForm.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadForm" %>
   <asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
<div class="frm">
 <div class="field">
  
  <asp:TextBox runat="server" CssClass="txt" ID="txtFirstName" MaxLength="80" Text="First Name" ToolTip="First Name" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue="First Name"></asp:RequiredFieldValidator>
 </div>
 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtLastName" MaxLength="80" Text="Last Name" ToolTip="Last Name" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue="Last Name"></asp:RequiredFieldValidator>
 </div>
 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtEmail" MaxLength="150" Text="Email Address" ToolTip="Email Address" ValidationGroup="LeadForm" CausesValidation="true" ClientIDMode="Static"></asp:TextBox>
  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" ValidateEmptyText="true" EnableClientScript="true" ID="CustomValidator" ClientIDMode="Static" />
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue="Email Address"></asp:RequiredFieldValidator>
 </div>
 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtPhone" MaxLength="12" Text="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue="Phone Number"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
 </div>
 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtStreet" Text="Street Address" ToolTip="Street Address" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
   ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue="Street Address"></asp:RequiredFieldValidator>
 </div>
 <div class="field">
  <asp:DropDownList runat="server" CssClass="ddl" ID="ddlStates" ValidationGroup="LeadForm">
    <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
  </asp:DropDownList>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="State is required." ValidationGroup="LeadForm"
   ControlToValidate="ddlStates" Display="Dynamic" CssClass="req" InitialValue="0"></asp:RequiredFieldValidator>
 </div>

 <div class="field">
  <asp:TextBox runat="server" CssClass="txt" ID="txtZipCode" MaxLength="5" Text="Zip Code" ToolTip="Zip Code" ValidationGroup="LeadForm"></asp:TextBox>
  <asp:RequiredFieldValidator     ID="RequiredFieldValidator6"      runat ="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="req" InitialValue="Zip Code"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator  ID="RegularExpressionValidator99" runat="server" ErrorMessage="Invalid Zipcode." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="req" InitialValue="Zip Code" ValidationExpression = "^[\s\S]{5,}$" ></asp:RegularExpressionValidator>
 </div>
 <div class="field med">
  <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="ddl" ValidationGroup="LeadForm">
   <asp:ListItem Text="Number of Windows" Value="0"></asp:ListItem>
   <asp:ListItem Text="Under 3" Value="Under 3"></asp:ListItem>
   <asp:ListItem Text="3-10" Value="3-10"></asp:ListItem>
   <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
  </asp:DropDownList>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Number of Windows are required." ValidationGroup="LeadForm"
   ControlToValidate="ddlNumWindows" Display="Dynamic" CssClass="req" InitialValue="0"></asp:RequiredFieldValidator>
 </div>
 <%-- <div class="field lng">
  <asp:TextBox runat="server" Text="" CssClass="txt" ID="txtCity"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity"
   Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
 </div>
 <div class="field sm">
  <label class="lbl">
   State</label>
  <asp:DropDownList runat="server" CssClass="ddl" ID="ddlStates">
  </asp:DropDownList>
 </div>
 <div class="field med">
  <label class="lbl">
   Best Time to Call</label>
  <asp:DropDownList runat="server" ID="ddlBestTimetoCall" CssClass="ddl">
   <asp:ListItem Text="Morning" Value="Morning"></asp:ListItem>
   <asp:ListItem Text="Afternoon" Value="Afternoon"></asp:ListItem>
   <asp:ListItem Text="Evening" Value="Evening"></asp:ListItem>
  </asp:DropDownList>
 </div>--%>
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
   By pressing the Get Started Now button above, you authorize Replace My Windows 4 Less and up to four home
   improvement companies that can help with your project to call and/or email you at the phone number(s)/email
   address(es) above, including your wireless number if provided with automated technology. Please note that
   you are not required to provide this consent in order for us to evaluate your case. If you do not wish to
   provide us with this consent, you may contact us directly at 1-855-209-1471
  </p>
     </label>
 </div>
</div>
