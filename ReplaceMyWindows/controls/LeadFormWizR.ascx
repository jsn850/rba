﻿<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormWizR.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormWizR" %>
<asp:HiddenField
  id="leadid_token"
  value=""
  runat="server"
  ClientIDMode="Static"
/>
<!-- START FORM -->
<div class="forms pt-3 pb-3 py-md-7">
  <div class="form-step active">
    <div class="form-step-container">
      <div id="Step1" runat="server" class="step-loader">
        <img src="images/loader-4stepc-1.png" width="80%" alt="20%" />
      </div>
      <div class="form-step-title" id="ZipTitleDiv" runat="server">
        Where is your window project?
      </div>
      <div class="form-step-controls mx-auto">
        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-map-marker"></i></div>
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
        </div>
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

        <div class="form-step-actions mx-auto style='width: 100%'">
          <asp:Button
            runat="server"
            ValidationGroup="Group1"
            class="col btn btn-primary btn-next"
            Text="START FREE QUOTE"
            onClientClick="CheckZipShowAppt(); gtag('event','click',{'event_category':'Wiz','event_label':'WizZipcode'});"
          ></asp:Button
          ><span class="arrow"></span>
        </div>
      </div>
    </div>
  </div>

  <div class="form-step">
    <div class="form-step-container">
      <div id="Step2" runat="server" class="step-loader">
        <img src="images/loader-4stepc-2.png" width="80%" />
      </div>
      <div class="form-step-title">Who are we speaking with?</div>
      <%--
      <div class="form-step-subtitle">Let us know your name below</div>
      --%>
      <div class="form-step-controls px-3 px-md-5">
        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-user"></i></div>
          <asp:TextBox
            runat="server"
            CssClass="form-control"
            ID="txtFirstName"
            placeholder="First Name"
            ToolTip="First Name"
            MaxLength="80"
            ValidationGroup="Group2"
          ></asp:TextBox>
        </div>
        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-user"></i></div>
          <asp:TextBox
            runat="server"
            placeholder="Last Name"
            ToolTip="Last Name"
            CssClass="form-control"
            ID="txtLastName"
            MaxLength="80"
            ValidationGroup="Group2"
          ></asp:TextBox>
        </div>
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
      <div class="form-step-actions row no-gutters px-3 px-md-5">
        <button class="col mr-2 btn btn-light btn-back">Back</button>
        <%-- <button class="col btn btn-primary btn-next">Next</button>--%>
        <asp:Button
          runat="server"
          ValidationGroup="Group2"
          class="col btn btn-primary btn-next"
          Text="NEXT"
          OnClientClick="gtag('event','click',{'event_category':'Wiz','event_label':'WizName'});"
        ></asp:Button
        ><span class="arrow"></span>
      </div>
    </div>
  </div>

  <div class="form-step">
    <div class="form-step-container">
      <div id="Step3" runat="server" class="step-loader">
        <img src="images/loader-4stepc-3.png" width="80%" alt="40%" />
      </div>
      <div class="form-step-title">Let us know how we can reach you</div>
      <div class="form-step-controls px-3 px-md-5">
        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-envelope"></i></div>
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
        </div>

        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-phone"></i></div>
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
        </div>
      </div>

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
      <div class="form-step-actions row no-gutters px-3 px-md-5">
        <button class="col mr-2 btn btn-light btn-back">Back</button>

        <asp:Button
          runat="server"
          ValidationGroup="Group3"
          class="col btn btn-primary btn-next"
          Text="NEXT"
          OnClientClick="gtag('event','click',{'event_category':'Wiz','event_label':'WizContactInfo'});"
        ></asp:Button
        ><span class="arrow"></span>
      </div>
    </div>
  </div>
  <div class="form-step">
    <div class="form-step-container">
      <div id="Step4" runat="server" class="step-loader">
        <img src="images/loader-4stepc-4.png" width="80%" alt="60%" />
      </div>
      <div class="form-step-title" id="LastStepTitle">
        What is your home address?
      </div>
      <div class="form-step-controls px-1 px-md-5">
        <div class="input-with-icon">
          <div class="input-icon"><i class="icon-street-sign"></i></div>
          <asp:TextBox
            runat="server"
            Text=""
            CssClass="form-control"
            placeholder="Street Address"
            ToolTip="Street Address"
            ID="txtStreet"
            ValidationGroup="Group4"
          ></asp:TextBox>
        </div>
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

        <div class="row no-gutters px-3 px-md-5 justify-content-center">
        <asp:Button
          runat="server"
          ID="btnSubmit"
          Text="Get Started Now"
          CssClass="col btn btn-primary btn-next"
          OnClick="btnSubmit_Click"
          ValidationGroup="Group4"
          UseSubmitBehavior="false"
          OnClientClick="return handleClientClick('Group4', 'wiz');"
        />
        </div>
      </div>
      <div class="tcpa mt-10">
        <p id="tcpa" runat="server">
          By pressing the Get Started Now button above, you acknowledge that
          you’d like to learn more about Renewal by Andersen windows. You also
          authorize Renewal by Andersen or any third-party
          <a href="partners.html" target="_blank">organization</a> to call, SMS
          and/or email you at the phone number(s)/email address(es) above,
          including your wireless number if provided, with automated technology
          in order to schedule a convenient day and time. If you live in a
          territory where Renewal by Andersen is not currently working with
          <span id="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span>
          or that is not serviced by Renewal by Andersen, we will send your
          information to up to four home improvement companies that can help
          with your project. You acknowledge that you are submitting this form
          so that you can be contacted via email, phone or text message and
          informed about products, services and sales, as well as third-party
          offers including, without limitation, from our affiliates and/or
          unrelated third parties. You understand that you do not need to submit
          this form to schedule an in-home price quote. If you do not wish to
          provide us with this consent, you may contact us directly at (516)
          253-6644
        </p>
      </div>
        <button class="mr-2 btn btn-light btn-back">Back</button>
    </div>
  </div>
</div>
<!-- END FORM -->
