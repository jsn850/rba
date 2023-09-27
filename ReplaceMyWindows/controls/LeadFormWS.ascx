<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormWS.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormWS" %>
<asp:HiddenField
  id="leadid_token"
  value=""
  runat="server"
  ClientIDMode="Static"
/>
<!-- START FORM -->
<div class="forms">
  <div class="form-step active">
    <h3 class="form-step-title" id="ZipTitleDiv" runat="server">
      Where is your window project?
    </h3>
    <div class="form-step-controls input-row">
      <div class="input-col">
        <asp:TextBox
          runat="server"
          placeholder="Zip Code"
          ToolTip="Zip Code"
          type="tel"
          CssClass="form-control"
          ID="txtZipCode"
          MaxLength="5"
          ValidationGroup="Group1"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator9"
          runat="server"
          ErrorMessage="Zip is required."
          ControlToValidate="txtZipCode"
          ValidationGroup="Group1"
          InitialValue=""
          Display="Dynamic"
          CssClass="form-error"
          SetFocusOnError="true"
        ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator33"
          runat="server"
          ValidationExpression="\d{5}(-\d{4})?"
          ControlToValidate="txtZipCode"
          ValidationGroup="Group1"
          Display="Dynamic"
          ErrorMessage="Enter valid U.S. Zip Code!"
          CssClass="form-error"
          InitialValue=""
          SetFocusOnError="true"
        ></asp:RegularExpressionValidator>
        <asp:CustomValidator
          ID="CustomValidatorZip"
          runat="server"
          ControlToValidate="txtZipCode"
          Display="Dynamic"
          CssClass="form-error"
          ValidationGroup="Group1"
          errormessage="Invalid ZipCode Entered"
          ClientValidationFunction="isValidZip"
          EnableClientScript="true"
          ValidateEmptyText="false"
          ClientIDMode="Static"
        />
      </div>
    </div>

    <div class="form-step-actions btn-row">
      <div class="btn-col">
        <asp:Button
          runat="server"
          ValidationGroup="Group1"
          class="btn-next"
          Text="START FREE QUOTE"
        ></asp:Button>
      </div>
    </div>
  </div>

  <div class="form-step">
    <h3 class="form-step-title">Who are we speaking with?</h3>

    <div class="form-step-controls input-row">
      <div class="input-col">
        <asp:TextBox
          runat="server"
          CssClass="form-control"
          ID="txtFirstName"
          placeholder="First Name"
          ToolTip="First Name"
          MaxLength="80"
          ValidationGroup="Group2"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator1"
          runat="server"
          ErrorMessage="First Name is required."
          ValidationGroup="Group2"
          ControlToValidate="txtFirstName"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        ></asp:RequiredFieldValidator>
      </div>
      <div class="input-col">
        <asp:TextBox
          runat="server"
          placeholder="Last Name"
          ToolTip="Last Name"
          CssClass="form-control"
          ID="txtLastName"
          MaxLength="80"
          ValidationGroup="Group2"
        ></asp:TextBox>

        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator2"
          runat="server"
          ErrorMessage="Last Name is required."
          ValidationGroup="Group2"
          ControlToValidate="txtLastName"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        ></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="form-step-actions btn-row">
      <div class="btn-col">
        <button class="btn-back">BACK</button>
      </div>
      <div class="btn-col">
        <asp:Button
          runat="server"
          ValidationGroup="Group2"
          class="btn-next"
          Text="NEXT"
          OnClientClick="gtag('event','click',{'event_category':'MPAGE','event_label':'Name'});"
        ></asp:Button>
      </div>
    </div>
  </div>

  <div class="form-step">
    <h3 class="form-step-title">Let us know how we can reach you</h3>
    <div class="form-step-controls input-row">
      <div class="input-col">
        <asp:TextBox
          runat="server"
          CssClass="form-control"
          ID="txtEmail"
          type="email"
          placeholder="Email"
          ToolTip="Email"
          MaxLength="150"
          ValidationGroup="Group3"
          CausesValidation="true"
        ></asp:TextBox>

        <asp:CustomValidator
          ControlToValidate="txtEmail"
          Display="Dynamic"
          ErrorMessage="Email has already been submitted"
          CssClass="form-error"
          ClientValidationFunction="isValidEmail"
          runat="server"
          ValidationGroup="Group3"
          EnableClientScript="true"
          ValidateEmptyText="true"
          ID="CustomValidator"
          ClientIDMode="Static"
        />
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator1"
          runat="server"
          ErrorMessage="Email is invalid."
          ValidationGroup="Group3"
          ControlToValidate="txtEmail"
          CssClass="form-error"
          Display="Dynamic"
          ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
        ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator5"
          runat="server"
          ErrorMessage="Email is required."
          ValidationGroup="Group3"
          ControlToValidate="txtEmail"
          Display="Dynamic"
          CssClass="form-error"
        ></asp:RequiredFieldValidator>
      </div>

      <div class="input-col">
        <asp:TextBox
          runat="server"
          CssClass="form-control"
          ID="txtPhone"
          type="tel"
          placeholder="Phone Number"
          ToolTip="Phone Number"
          MaxLength="16"
          ValidationGroup="Group3"
        ></asp:TextBox>

        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator7"
          runat="server"
          ErrorMessage="Phone is required."
          ValidationGroup="Group3"
          ControlToValidate="txtPhone"
          Display="Dynamic"
          CssClass="form-error"
        ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator2"
          runat="server"
          ErrorMessage="Phone is incorrect."
          ValidationGroup="Group3"
          ControlToValidate="txtPhone"
          CssClass="form-error"
          Display="Dynamic"
          ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
        ></asp:RegularExpressionValidator>

        <asp:CustomValidator
          ID="CVPhone"
          runat="server"
          ControlToValidate="txtPhone"
          Display="Dynamic"
          CssClass="form-error"
          ValidationGroup="Group3"
          errormessage="Invalid Phone Number Entered"
          ClientValidationFunction="isValidPhone"
          EnableClientScript="true"
          ValidateEmptyText="true"
          ClientIDMode="Static"
        />
      </div>
    </div>

    <div class="form-step-actions btn-row">
      <div class="btn-col">
        <button class="btn-back">BACK</button>
      </div>

      <div class="btn-col">
        <asp:Button
          runat="server"
          ValidationGroup="Group3"
          class="btn-next"
          Text="NEXT"
          OnClientClick="gtag('event','click',{'event_category':'MPAGE','event_label':'ContactInfo'});"
        ></asp:Button>
      </div>
    </div>
  </div>

  <div class="form-step">
    <h3 class="form-step-title" id="LastStepTitle">
      What is your home address?
    </h3>
    <div class="form-step-controls input-row">
      <div class="input-col">
        <asp:TextBox
          runat="server"
          Text=""
          CssClass="form-control"
          placeholder="Street Address"
          ToolTip="Street Address"
          ID="txtStreet"
          ValidationGroup="Group4"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator4"
          runat="server"
          ErrorMessage="Street is required."
          ValidationGroup="Group4"
          ControlToValidate="txtStreet"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        ></asp:RequiredFieldValidator>
      </div>
    </div>

    <div class="btn-row">
      <div class="btn-col">
        <button class="btn-back">BACK</button>
      </div>
      <div class="btn-col">
        <asp:Button
          runat="server"
          ID="btnSubmit"
          Text="Get Started Now"
          CssClass="btn-next"
          OnClick="btnSubmit_Click"
          ValidationGroup="Group4"
          UseSubmitBehavior="false"
          OnClientClick="disableBtnAddresscheck(this); gtag('event','click',{'event_category':'MPAGE','event_label':'Address-Submit'});"
        />
      </div>
    </div>

    <div class="tcpa mt-10">
      <p id="tcpa" runat="server" style="color: white; font-size: 12px; font-weight: 300;">
        By pressing the Get Started Now button above, you acknowledge that you’d
        like to learn more about Replacement windows. You also authorize
        ExpertWindows.com Partners or any third-party
        <a href="partners.html" target="_blank">organization</a> to call, SMS
        and/or email you at the phone number(s)/email address(es) above,
        including your wireless number if provided, with automated technology in
        order to schedule a convenient day and time. If you live in a territory
        where ExpertWindows.com Partners are not currently working, we will send
        your information to up to four home improvement companies that can help
        with your project. You acknowledge that you are submitting this form so
        that you can be contacted via email, phone or text message and informed
        about products, services and sales, as well as third-party offers
        including, without limitation, from our affiliates and/or unrelated
        third parties. You understand that you do not need to submit this form
        to schedule an in-home price quote. If you do not wish to provide us
        with this consent, you may contact us directly at (516) 253-6644
      </p>
    </div>
  </div>
</div>
<!-- END FORM -->
