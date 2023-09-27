<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormExpert.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormExpert" %>
<Style>
    input[type=number]::-webkit-inner-spin-button {
        -webkit-appearance: none;
         display: none;
         }
    </style>
   <asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
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

              <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone" MaxLength="12" placeholder="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm" type="tel"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
                   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CVPhone" runat=server    ControlToValidate="txtPhone" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid Phone Number Entered" 
                    ClientValidationFunction="isValidPhone"  EnableClientScript="true" ValidateEmptyText="true" ClientIDMode="Static" />
              </div>
            </div>
         <div class="form-row">
             


              <div class="col-3 mb-3">

                  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtZipCode"  placeholder="ZipCode" ToolTip="ZipCode"  MaxLength="5" ValidationGroup="LeadForm" type="number"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator  ID="RegularExpressionValidator33"  runat="server" ValidationExpression="\d{5}(-\d{4})?"  ControlToValidate="txtZipCode"   ValidationGroup="LeadForm" Display="Dynamic"    ErrorMessage="Enter valid U.S. Zip Code!"   CssClass="req" InitialValue=""></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />

            </div>
      
                
                     
               <div class="col-5 mb-0 text-right label">
                <span>Number of Windows</span></div>
                              <div class="col-4 mb-0">
                <div class="form-group">
                          <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="custom-select browser-default" ValidationGroup="LeadForm">
                           <asp:ListItem Text="Number of Windows" Value="0"></asp:ListItem>
                           <asp:ListItem Text="Under 3" Value="Under 3"></asp:ListItem>
                           <asp:ListItem Selected="True" Text="3-10" Value="3-10"></asp:ListItem>
                           <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
                          </asp:DropDownList>
              <div class="invalid-feedback"></div>
                </div>
              </div>
            </div>

     <div class="form-row">              
               <div class="col-12 mb-1 mt-0 text-center label">
  <label class="lbl">
   What Type of Consultation Would you Prefer?</label>
                    <div class="col-12 mb-1 mt-0">
                    <div class="form-group">
  <asp:RadioButton runat="server" ID="InHome" GroupName="ConsultType" CssClass="txt" ValidationGroup="LeadForm" Checked="true"> </asp:RadioButton> In-Home
      <asp:RadioButton runat="server" ID="Virtual" GroupName="ConsultType" CssClass="txt" ValidationGroup="LeadForm"> </asp:RadioButton> Virtual (where available)
 </div>
                        </div>
                    </div>

 </div>

       
            <p class="helper text-center">All fields are required.</p>



  <asp:Button runat="server" ID="btnSubmit" Text="GET STARTED NOW" CssClass="btn btn-lg btn-block" BackColor="Orange" ForeColor="white" Font-Size="18" Font-Bold="true"   OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />

 
    <label><input type="hidden" id="leadid_tcpa_disclosure"/>
  <p class="info" id="tcpa" runat="server">
   
   By pressing the Get Started Now button above, I agree to be contacted by Expert Windows, its <a href="partners.html">partners</a> and affiliates at the phone number and email address provided above which I certify is my own, through the use of automated technology including but not limited to SMS, artificial voice, pre-recorded message and email, for appointment scheduling, marketing materials and informational messages, and other offers and advertisements. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. I understand that I am not required to provide consent in order to schedule an appointment or to receive goods or services. If I do not wish to provide this consent, I may contact you directly at (516) 253-6644.
      </p>
    </label>

