<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormWiz-1.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormWiz_1" %>
<asp:HiddenField
  id="leadid_token"
  value=""
  runat="server"
  ClientIDMode="Static"
/>
<!-- START FORM -->
<div class="form-step active">
  <div class="input-container-single">
    <%--ADDRESS--%>
    <div class="input-row">
      <%--STREET--%>
      <div class="input-col">
        <label for="LeadForm1_txtStreet">Street Address</label>
        <asp:TextBox
          runat="server"
          Text=""
          CssClass="form-control"
          placeholder="Street Address"
          ToolTip="Street Address"
          ID="txtStreet"
          ValidationGroup="LeadFormWizc"
        ></asp:TextBox>
           <asp:RequiredFieldValidator
          ID="RequiredFieldValidator4"
          runat="server"
          ErrorMessage="Street is required."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtStreet"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        >
        </asp:RequiredFieldValidator>
      </div>

      <%--ZIP CODE--%>
      <div class="input-col">
        <label for="LeadForm1_txtZipCode">Zip Code</label>
        <asp:TextBox
          runat="server"
          placeholder="Zip Code"
          ToolTip="Zip Code"
          type="tel"
          CssClass="form-control"
          ID="txtZipCode"
          MaxLength="5"
          ValidationGroup="LeadFormWizc"
        >
        </asp:TextBox>
          <asp:RequiredFieldValidator
          ID="RequiredFieldValidator9"
          runat="server"
          ErrorMessage="Zip is required."
          ControlToValidate="txtZipCode"
          ValidationGroup="LeadFormWizc"
          InitialValue=""
          Display="Dynamic"
          CssClass="form-error"
          SetFocusOnError="true"
        >
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator33"
          runat="server"
          ValidationExpression="\d{5}(-\d{4})?"
          ControlToValidate="txtZipCode"
          ValidationGroup="LeadFormWizc"
          Display="Dynamic"
          ErrorMessage="Enter valid U.S. Zip Code!"
          CssClass="form-error"
          InitialValue=""
          SetFocusOnError="true"
        >
        </asp:RegularExpressionValidator>
        <asp:CustomValidator
          ID="CustomValidatorZip"
          runat="server"
          ControlToValidate="txtZipCode"
          Display="Dynamic"
          CssClass="form-error"
          ValidationGroup="LeadFormWizc"
          errormessage="Invalid ZipCode Entered"
          ClientValidationFunction="isValidZip"
          EnableClientScript="true"
          ValidateEmptyText="false"
          ClientIDMode="Static"
        />
      </div>
    </div>

    <%--NAME--%>
    <div class="input-row">
      <%--FIRST NAME--%>
      <div class="input-col">
        <label for="LeadForm1_txtFirstName">First Name</label>
        <asp:TextBox
          runat="server"
          CssClass="form-control"
          ID="txtFirstName"
          placeholder="First Name"
          ToolTip="First Name"
          MaxLength="80"
          ValidationGroup="LeadFormWizc"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator1"
          runat="server"
          ErrorMessage="First Name is required."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtFirstName"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        ></asp:RequiredFieldValidator>
      </div>

      <%--LAST NAME--%>
      <div class="input-col">
        <label for="LeadForm1_txtLastName">Last Name</label>
        <asp:TextBox
          runat="server"
          placeholder="Last Name"
          ToolTip="Last Name"
          CssClass="form-control"
          ID="txtLastName"
          MaxLength="80"
          ValidationGroup="LeadFormWizc"
        >
        </asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator2"
          runat="server"
          ErrorMessage="Last Name is required."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtLastName"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        >
        </asp:RequiredFieldValidator>
      </div>
    </div>

    <%--EMAIL/PHONE--%>
    <div class="input-row">
      <%--EMAIL--%>
      <div class="input-col">
        <label for="LeadForm1_txtEmail">Email</label>
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
          ValidationGroup="LeadFormWizc"
          EnableClientScript="true"
          ValidateEmptyText="true"
          ID="CustomValidator"
          ClientIDMode="Static"
        />
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator1"
          runat="server"
          ErrorMessage="Email is invalid."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtEmail"
          CssClass="form-error"
          Display="Dynamic"
          ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
        >
        </asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator5"
          runat="server"
          ErrorMessage="Email is required."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtEmail"
          Display="Dynamic"
          CssClass="form-error"
        ></asp:RequiredFieldValidator>
      </div>

      <%--PHONE--%>
      <div class="input-col">
        <label for="LeadForm1_txtPhone">Phone</label>
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
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtPhone"
          Display="Dynamic"
          CssClass="form-error"
        ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator2"
          runat="server"
          ErrorMessage="Phone is incorrect."
          ValidationGroup="LeadFormWizc"
          ControlToValidate="txtPhone"
          CssClass="form-error"
          Display="Dynamic"
          ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
        >
        </asp:RegularExpressionValidator>
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

    <%--SUBMIT--%>
    <div class="form-step-actions btn-row mt-3">
      <asp:Button
        runat="server"
        ID="btnSubmit"
        Text="GET STARTED NOW"
        CssClass="btn-next single"
        OnClick="btnSubmit_Click"
        ValidationGroup="LeadFormWizc"
        UseSubmitBehavior="false"
        OnClientClick="disableBtnAllCheck(this); gtag('event','click',{'event_category':'WizOS','event_label':'WizOSAddress-Submit'});
      gtag('event','click',{'event_category':'WizOS','event_label':'WizOSZip'});
      gtag('event','click',{'event_category':'WizOS','event_label':'WizOSName'});
      gtag('event','click',{'event_category':'WizOS','event_label':'WizOSContactInfo'});"
      >
      </asp:Button>
    </div>

    <%--LOADER--%>
    <div class="loader-div mt-3">
      <div class="spinner-grow text-secondary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow text-secondary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow text-secondary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow text-secondary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
    <%--END LOADER--%>

    <div class="mt3">
      <div id="apptwrapper" style="display: none">
        <asp:DropDownList
          runat="server"
          ID="DDlApptTime"
          CssClass="form-control"
          ValidationGroup=""
        >
          <asp:ListItem
            Text="Preferred Appointment Date/Time"
            Value=""
          ></asp:ListItem>
          <asp:ListItem Text="Not Sure" Value=""></asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
  </div>

  <div class="tcpa mt-10">
    <p id="tcpa" runat="server">
      By pressing the Get Started Now button above, you acknowledge that you’d
      like to learn more about Renewal by Andersen windows. You also authorize
      Renewal by Andersen or any third-party
      <a href="partners.html" target="_blank">organization</a> to call, SMS
      and/or email you at the phone number(s)/email address(es) above, including
      your wireless number if provided, with automated technology in order to
      schedule a convenient day and time. If you live in a territory where
      Renewal by Andersen is not currently working with
      <span id="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span>
      or that is not serviced by Renewal by Andersen, we will send your
      information to up to four home improvement companies that can help with
      your project. You acknowledge that you are submitting this form so that
      you can be contacted via email, phone or text message and informed about
      products, services and sales, as well as third-party offers including,
      without limitation, from our affiliates and/or unrelated third parties.
      You understand that you do not need to submit this form to schedule an
      in-home price quote. If you do not wish to provide us with this consent,
      you may contact us directly at (516) 253-6644
    </p>
  </div>
</div>
<!-- END FORM -->
