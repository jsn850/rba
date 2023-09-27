<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormMSingle.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormMSingle" %>
 <asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>



<!-- START FORM -->
            <div class="col-12 col-md-6 forms pt-10 pb-1 py-md-4">
                    <div class="form-step-container">
						<h2>Get a <strong>FREE</strong> Quote Today!</h2>
						<div class="form-step-controls   form-row px-3 px-md-5">
				  <div class="col">
                           <asp:TextBox runat="server"  CssClass="form-control" ID="txtFirstName" placeholder="First Name"  ToolTip="First Name" MaxLength="80" ValidationGroup="Group1"  ></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="Group1"   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>    
                  </div>
                              <div class="col">
                               <asp:TextBox runat="server" placeholder="Last Name"  ToolTip="Last Name"  CssClass="form-control" ID="txtLastName" MaxLength="80" ValidationGroup="Group1"  ></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="Group1"   ControlToValidate="txtLastName" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>         
                                                 
                                  
                              </div>
                                
                       </div>
						
                  <div class="form-step-controls form-row px-3 px-md-5">
                            <div class="col">
                         <asp:TextBox runat="server"   placeholder="Zip Code" ToolTip="Zip Code" type="tel" CssClass="form-control" ID="txtZipCode" MaxLength="5" ValidationGroup="Group1" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="Group1"  InitialValue="" Display="Dynamic" CssClass="form-error"  SetFocusOnError="true"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator  ID="RegularExpressionValidator33"  runat="server" ValidationExpression="\d{5}(-\d{4})?"  ControlToValidate="txtZipCode"   ValidationGroup="Group1" Display="Dynamic"    ErrorMessage="Enter valid U.S. Zip Code!"   CssClass="form-error" InitialValue="" SetFocusOnError="true"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="form-error"   ValidationGroup="Group1" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />
                        </div>
                            <div class="col">
                                   <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="Street Address"  ToolTip="Street Address" ID="txtStreet" ValidationGroup="Group1"></asp:TextBox>
                              		
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Street is required." ValidationGroup="Group1"
                                                   ControlToValidate="txtStreet" Display="Dynamic" CssClass="form-error" InitialValue=""></asp:RequiredFieldValidator>
						   </div>
                        </div>

                        <div class="form-step-controls form-row px-3 px-md-5">
                            <div class="col">
                               <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" type="email" placeholder="Email"  ToolTip="Email" MaxLength="150" ValidationGroup="Group1" CausesValidation="true"></asp:TextBox>
                 <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="form-error"
                                                   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="Group3" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="Group1"
                                                   ControlToValidate="txtEmail" CssClass="form-error" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="Group1"
                                                   ControlToValidate="txtEmail" Display="Dynamic" CssClass="form-error" ></asp:RequiredFieldValidator>

                            </div>
                            <div class="col">
                        <asp:TextBox runat="server" CssClass="form-control"  ID="txtPhone"   type="tel" placeholder="Phone Number"  ToolTip="Phone Number" MaxLength="16" ValidationGroup="Group3"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="Group1"
                                                   ControlToValidate="txtPhone"  Display="Dynamic" CssClass="form-error" ></asp:RequiredFieldValidator>
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="Group1"
                                                   ControlToValidate="txtPhone" CssClass="form-error" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                                                               <asp:CustomValidator ID="CVPhone" runat="server"    ControlToValidate="txtPhone" Display="Dynamic" CssClass="form-error"   ValidationGroup="Group1" errormessage="Invalid Phone Number Entered" 
                                                ClientValidationFunction="isValidPhone"  EnableClientScript="true" ValidateEmptyText="true" ClientIDMode="Static" />
                            </div>
                        </div>
	<%--						<div class="form-group form-group-lg text-center">
								  <label class="lbl">
								   What Type of Consultation Would you Prefer?</label>
									<div class="input-with-icon">
								  <asp:RadioButton runat="server" ID="InHome" GroupName="ConsultType" CssClass="txt" ValidationGroup="LeadForm" Checked="true"> </asp:RadioButton> In-Home
									  <asp:RadioButton runat="server" ID="Virtual" GroupName="ConsultType" CssClass="txt" ValidationGroup="LeadForm"> </asp:RadioButton> Virtual  (where available) 
										</div>
								 </div>--%>
						
						<!--CTA BUTTON-->
                        <div class="form-step-actions row no-gutters px-3 px-md-5">
<%--                            <button class="col btn btn-primary btn-next">START FREE QUOTE</button>--%>
                             <asp:Button runat="server" ID="btnSubmit" Text="Get Started Now" CssClass="col btn btn-primary btn-next" OnClick="btnSubmit_Click" ValidationGroup="Group4" UseSubmitBehavior="false" OnClientClick="disableBtn(this); gtag('event','click',{'event_category':'MPAGE','event_label':'Address-Submit'});"  />
                        </div>
    <%--                    <div class="form-error">Please enter the fields in red</div>--%>
						<!--END CTA BUTTON-->
						<%--<div class="form-step-subtitle pt-4">We never share your personal information</div>--%>
	                      <div class="tcpa mt-10">
                                      <p id="tcpa" runat="server">
                                            By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party <a href="partners.html">organization</a> to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644  
                                      </p>	
                            </div>  
           
				</div></div>
			<!-- END FORM -->		
	


