<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormSingleRight.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormSingleRight" %>
<asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
        <div class="start-form">
          <h2 class="text-center mt-2">REQUEST A FREE</h2>
          <h3 class="text-center">Window Replacement Consultation</h3>
        
            <div class="form-row">
              <div class="col-6 mb-3">

                  <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="First Name" ToolTip="First Name" ID="txtFirstName" MaxLength="80" ValidationGroup="LeadForm" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
              </div>
              <div class="col-6 mb-3">
                  <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="Last Name" ToolTip="Last Name" ID="txtLastName" MaxLength="80" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
             </div>
            </div>
            <div class="form-row">
              <div class="col-6 mb-3">

                  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtEmail" MaxLength="150" placeholder="Email Address" ToolTip="Email Address" ValidationGroup="LeadForm" CausesValidation="true"></asp:TextBox>
                  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
                   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
                   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>

              </div>
              <div class="col-6 mb-3">

              <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone" MaxLength="16" placeholder="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
                ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CVPhone" runat=server    ControlToValidate="txtPhone" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid Phone Number Entered" 
                    ClientValidationFunction="isValidPhone"  EnableClientScript="true" ValidateEmptyText="true" ClientIDMode="Static" />
              </div>
            </div>
            <div class="form-row">
              <div class="col-6 mb-3">

                      <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtStreet" ValidationGroup="LeadForm" placeholder="Street Address" ToolTip="Street Address"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
              </div>
              <div class="col-6 mb-3">

                  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtZipCode"  placeholder="Zip Code" ToolTip="Zip Code"  MaxLength="5" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator  ID="RegularExpressionValidator33"  runat="server" ValidationExpression="\d{5}(-\d{4})?"  ControlToValidate="txtZipCode"   ValidationGroup="LeadForm" Display="Dynamic"    ErrorMessage="Enter valid U.S. Zip Code!"   CssClass="req" InitialValue=""></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />


            </div>
            </div>
   
                

  <asp:Button runat="server" ID="btnSubmit" Text="GET STARTED NOW" CssClass="btn btn-lg btn-block"  style="color: #fff; font-weight: 700;font-size: 23px;background: #ae1319;	border-radius: 5px;	padding: 12px 17px;" OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />

 
    <label><input type="hidden" id="leadid_tcpa_disclosure"/>
  <p class="info" id="tcpa" runat="server">
   By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party <a href="partners.html">organization</a> to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" style="font-size:11px;" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644
 
      </p>
    </label>

       </div>
        <!-- Form -->