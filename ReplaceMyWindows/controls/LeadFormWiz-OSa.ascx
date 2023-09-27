<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormWiz-OSa.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormWiz_OSa" %>
<asp:HiddenField
  id="leadid_token"
  value=""
  runat="server"
  ClientIDMode="Static"
/>

<div class="form-step form-step1 active">
  <div class="form-step-container">
    <div id="Step1" runat="server" class="step-loader-a">
        <img data-src="images/loader-4stepc-1.png" alt="step 1" />
      </div>
    <div class="form-step-title" id="ZipTitleDiv" runat="server">
      <h3>Where is your window project?</h3>
    </div>
    <div class="form-step-controls input-container">
      <div class="input-with-icon mb-3">
        <i class="fa-sharp fa-solid fa-location-dot"></i>
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
          ErrorMessage="Please enter a valid U.S. zip code."
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
          errormessage="Invalid zip code entered."
          ClientValidationFunction="isValidZip"
          EnableClientScript="true"
          ValidateEmptyText="false"
          ClientIDMode="Static"
        />
      </div>

      <div class="form-step-actions mx-auto">
        <asp:Button
          runat="server"
          ValidationGroup="Group1"
          class="btn-next"
          Text="START FREE QUOTE"
          onClientClick="gtag('event','click',{'event_category':'WizOS','event_label':'WizOSZip'});"
        ></asp:Button>
      </div>
    </div>
  </div>
</div>

<div class="form-step form-step2">
  <div class="form-step-container">
    <div id="Step2" runat="server" class="step-loader-a">
        <img data-src="images/loader-4stepc-2.png" alt="step 2" />
    </div>
    <div class="form-step-title" style="margin-bottom: 1rem;">
      <h3>Who are we speaking with?</h3>
    </div>

    <div class="form-step-controls input-container name">
      <div class="name-inputs">
        <div class="name">
          <asp:TextBox
            runat="server"
            CssClass="form-control first-name-input"
            ID="txtFirstName"
            placeholder="First Name"
            ToolTip="First Name"
            MaxLength="80"
            ValidationGroup="Group2"
          ></asp:TextBox>
          <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ErrorMessage="First name is required."
            ValidationGroup="Group2"
            ControlToValidate="txtFirstName"
            Display="Dynamic"
            CssClass="form-error"
            InitialValue=""
          ></asp:RequiredFieldValidator>
        </div>
        <div class="name">
          <asp:TextBox
            runat="server"
            placeholder="Last Name"
            ToolTip="Last Name"
            CssClass="form-control last-name-input"
            ID="txtLastName"
            MaxLength="80"
            ValidationGroup="Group2"
          ></asp:TextBox>
          <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ErrorMessage="Last name is required."
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
            OnClientClick="gtag('event','click',{'event_category':'WizOS','event_label':'WizOSName'});"
          ></asp:Button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="form-step form-step3">
  <div class="form-step-container">
    <div id="Step3" runat="server" class="step-loader-a">
        <img data-src="images/loader-4stepc-3.png" alt="step 3" />
    </div>
    <div class="form-step-title" style="margin-bottom: 1rem;">
      <h3>Let us know how we can reach you.</h3>
    </div>

    <div class="form-step-controls input-container name">
      <div class="name-inputs">
        <div class="name">
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
            errormessage="Invalid phone number entered."
            ClientValidationFunction="isValidPhone"
            EnableClientScript="true"
            ValidateEmptyText="true"
            ClientIDMode="Static"
          />
        </div>

        <div class="name">
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
          <asp:CustomValidator
            ControlToValidate="txtEmail"
            Display="Dynamic"
            ErrorMessage="Email has already been submitted."
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
      </div>

      <div class="btn-row">
        <div class="btn-col">
          <button class="btn-back">BACK</button>
        </div>
        <div class="btn-col">
          <asp:Button
            runat="server"
            ValidationGroup="Group3"
            class="btn-next"
            Text="NEXT"
            OnClientClick="gtag('event','click',{'event_category':'WizOS','event_label':'WizOSContactInfo'});"
          ></asp:Button>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="form-step form-step4">
  <div class="form-step-container">
    <div id="Step4" class="step-loader-a">
        <img data-src="images/loader-4stepc-4.png" alt="step 4" />
    </div>
    <div class="form-step-title" style="margin-bottom: 1rem;">
      <h3>What is your home address?</h3>
    </div>

    <div class="form-step-controls input-container">
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

    <div class="error-container">
      <p class="recaptcha-form-error">
        Please click the I’m not a robot checkbox to continue.
      </p>
    </div>

    <div
      class="g-recaptcha"
      id="recaptcha-container"
      data-sitekey="6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha"
    ></div>

    <div class="form-step-actions btn-row">
      <div class="btn-col">
        <button class="btn-back">BACK</button>
      </div>
      <div class="btn-col">
        <asp:Button
          runat="server"
          ID="btnSubmit"
          Text="GET STARTED NOW"
          CssClass="btn-next"
          OnClick="btnSubmit_Click"
          ValidationGroup="Group4"
          UseSubmitBehavior="false"
          OnClientClick="return handleClientClick('Group4', 'OSB');"
        />
      </div>
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

    <div class="tcpa">
      <p id="tcpa" runat="server">
        By pressing the Get Started Now button above, you acknowledge that you’d
        like to learn more about Renewal by Andersen windows. You also authorize
        Renewal by Andersen or any third-party
        <a href="partners.html" target="_blank">organization</a> to call, SMS
        and/or email you at the phone number(s)/email address(es) above,
        including your wireless number if provided, with automated technology in
        order to schedule a convenient day and time. If you live in a territory
        where Renewal by Andersen is not currently working with
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
</div>
<!-- END FORM -->
