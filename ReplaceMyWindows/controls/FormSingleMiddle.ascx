<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSingleMiddle.ascx.cs" Inherits="ReplaceMyWindows.controls.FormSingleMiddle" %>
<asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
        
<form id="RegisterForm">    
            <!-- START FORM -->
            <div class="col-12 forms">

            <div class="form-step-container">
                <h1>Savings up to 20% Off<sup>1</sup> <br>on Replacement Windows</h1>
				
				
               <!--     <span class="mincopy col-16 col-md-auto ml-auto">1 Minimum purchase required. </span>-->
				    <br>
				    <div class="formTitle">Tell us where your project is located.</div>
               

                <div class="form-step-controls form-row px-3 px-md-5 ">
<!--FIELD-->
                <div class="col-12 col-md-4">
                    <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="First Name" ToolTip="First Name" ID="txtFirstName" MaxLength="80" ValidationGroup="LeadForm" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
             </div>
<!--FIELD-->
                <div class="col-12 col-md-4">

						                  <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="Last Name" ToolTip="Last Name" ID="txtLastName" MaxLength="80" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtLastName" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
                 </div>
<!--FIELD-->					
				  <div class="col-12 col-md-4">
							                  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtEmail" MaxLength="150" placeholder="Email Address" ToolTip="Email Address" ValidationGroup="LeadForm" CausesValidation="true"></asp:TextBox>
                  <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="form-error"
                   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="LeadForm" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="LeadForm"
                   ControlToValidate="txtEmail" CssClass="form-error" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtEmail" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
                  </div>
					

               </div>

                <div class="form-step-controls form-row px-3 px-md-5 ">
<!--FIELD-->					
						<div class="col-12 col-md-4">
							              <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone" MaxLength="14" placeholder="Phone Number" ToolTip="Phone Number" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="LeadForm"
                   ControlToValidate="txtPhone" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="LeadForm"
                   ControlToValidate="txtPhone" CssClass="form-error" Display="Dynamic" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}"></asp:RegularExpressionValidator>--%>
                    <asp:CustomValidator ID="CVPhone" runat=server    ControlToValidate="txtPhone" Display="Dynamic" CssClass="form-error"   ValidationGroup="LeadForm" errormessage="Invalid Phone Number Entered" 
                    ClientValidationFunction="isValidPhone"  EnableClientScript="true" ValidateEmptyText="true" ClientIDMode="Static" />
				   </div>
					
					
<!--FIELD-->					
						<div class="col-12 col-md-4">
							           <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtStreet" ValidationGroup="LeadForm" placeholder="Street Address" ToolTip="Street Address"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="LeadForm"
                       ControlToValidate="txtStreet" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
               			 </div>
					
<!--FIELD-->					
						<div class="col-12 col-md-4">
							                  <asp:TextBox runat="server" Text="" CssClass="form-control" ID="txtZipCode"  placeholder="Zip Code" ToolTip="Zip Code"  MaxLength="5" ValidationGroup="LeadForm"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="LeadForm" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator  ID="RegularExpressionValidator33"  runat="server" ValidationExpression="\d{5}(-\d{4})?"  ControlToValidate="txtZipCode"   ValidationGroup="LeadForm" Display="Dynamic"    ErrorMessage="Enter valid U.S. Zip Code!"   CssClass="form-error" InitialValue=""></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="form-error"   ValidationGroup="LeadForm" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />
               			 </div>					
					
				</div>

                <!--CTA BUTTON-->
 <div class="form-step-actions row no-gutters px-3 px-md-5 mb-3">
	
                        
  <asp:Button runat="server" ID="btnSubmit" Text="Schedule a Free Estimate" CssClass="col btn btn-primary btn-next"    OnClick="btnSubmit_Click" ValidationGroup="LeadForm"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" />
        </div>
                <!--END CTA BUTTON-->
     	
					
					
<div class="tcpa mt-10">	
<p  id="tcpa"  runat="server">By pressing the Schedule a Free Estimate button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party organization to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" style="font-size:14px;" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644</p>
</div>	     
    
</div>
				
			  </div>
	
				
    <!-- END FORM -->		
     </form>