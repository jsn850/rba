<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormDA.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormDA" %>
<asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>


   <div class="row inputs textfield">
                  <div class="col" style="padding-right:10px;">

                      <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtFirstName" MaxLength="80" ValidationGroup="LeadForm"  placeholder="First Name"  ToolTip="First Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                  </div>
                  <div class="col">
                      <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtLastName" MaxLength="80" ValidationGroup="LeadForm"  placeholder="Last Name"  ToolTip="Last Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class="row inputs textfield">
                  <div class="col" style="padding-right:10px;">

                      <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtEmail" MaxLength="150" ValidationGroup="LeadForm" CausesValidation="true"  placeholder="Email"  ToolTip="Email"></asp:TextBox>
                      <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
                       ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
                       ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>

                 </div>
                  <div class="col">
                      <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtStreet" ValidationGroup="LeadForm" placeholder="Street Address"  ToolTip="Street Address"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                  </div>
                </div>

                 <div class="row inputs textfield">
                  <div class="col" style="padding-right:10px;">
  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtCity" ValidationGroup="LeadForm"  placeholder="City"  ToolTip="City" ></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
   
                  </div>
               
                  <div class="col">
  <asp:DropDownList runat="server" CssClass="form-control state" ID="ddlStates" ValidationGroup="LeadForm">
  </asp:DropDownList>
  <asp:TextBox runat="server" Text="" CssClass="form-control zip" ID="txtZipCode" MaxLength="5" ValidationGroup="LeadForm"  placeholder="Zip Code" ToolTip="Zip Code"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is REQ." ControlToValidate="txtZipCode" ValidationGroup="LeadForm"
   Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="req"   ValidationGroup="LeadForm" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />

 </div>
                </div>


                <div class="row inputs textfield">
                  <div class="col" style="padding-right:10px;">


 
  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtPhone" MaxLength="14" ValidationGroup="LeadForm"  placeholder="Phone Number"  ToolTip="Phone Number" ></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>
     <asp:CustomValidator runat=server
            controltovalidate="txtPhone" Display="Dynamic" CssClass="req"
            errormessage="Invalid Phone Number Entered" 
            OnServerValidate="validatephone" />

                    
                  </div>
                  <div class="col">
  <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="form-control" ValidationGroup="LeadForm">
 
   <asp:ListItem Text="Number of windows" Value="3-10"></asp:ListItem>
   <asp:ListItem Text="Under 3" Value="Under 3"></asp:ListItem>
   <asp:ListItem Text="3-10" Value="3-10"></asp:ListItem>
   <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
  </asp:DropDownList>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Number of Windows is required." ValidationGroup="LeadForm"
   ControlToValidate="ddlNumWindows" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                  </div>
                </div>

                
              <div class="row inputs text-center white">
                  <div class="col-lg-12">
                   All fields are required
                  </div>
                </div>

             <div class="row inputs">
                  <div class="col-lg-12">
  <asp:Button runat="server" ID="btnSubmit" Text="GET STARTED NOW" CssClass="btn btn-primary" style="width:100%"  OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />
                  </div>
                </div>

                 <div class="row">
                  <div class="col-lg-12">
                    <div class="white disclaimer text-center">
                         <label><input type="hidden" id="leadid_tcpa_disclosure"/>
  <p id="tcpa" runat="server">
  By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party organization to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644
  
  
      </p>
     </label>


  </div>
                  </div>
                </div>



                