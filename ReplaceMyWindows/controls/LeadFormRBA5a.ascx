﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFormRBA5a.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFormRBA5a" %>
<asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>
<div class="form-container">
							<div class="form-wrapper">

								<div class="form-step active" data-form-step="1">
                               <h3 class="text-center mt-0 mb-20 ff-bitter fw-700 fs-30">
                                        Buy One Get One <span class="text-green">40% OFF</span>
                                       <br>
                                        <span class="fs-20 small">No Money Down, No Payments + No Interest till 2020*</span>
                                    </h3>
                                   <p class="text-center mb-15">*minimum purchase required.</p>
									<div class="form-group form-group-lg">
                                     
                                      <h4 class="text-center ff-lato">
                                       
                                        Submit the Form Below to Get a Free Quote.
                                    </h4>
										<div class="input-with-icon">
											<div class="input-icon"><i class="icon-map-marker"></i></div>
											
                                              <asp:TextBox runat="server"   placeholder="Zip Code" ToolTip="Zip Code" type="tel" CssClass="form-control" ID="txtZipCode" MaxLength="5" ValidationGroup="LeadForm" ></asp:TextBox>
										</div>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="Group1"  InitialValue=""
                                               Display="Dynamic" CssClass="req"  SetFocusOnError="true"></asp:RequiredFieldValidator>
									</div>
									<div class="form-group form-group-lg">
										<div class="custom-select">
		                                  <asp:DropDownList runat="server" ID="ddlNumWindows" CssClass="form-control" ValidationGroup="LeadForm">
                                            <asp:ListItem Text="Number of Windows to Replace" Value=""></asp:ListItem>                                               
                                              <asp:ListItem Text="1-3" Value="Under 3"></asp:ListItem>
                                               <asp:ListItem Text="3-10" Value="3-10" ></asp:ListItem>
                                               <asp:ListItem Text="10+" Value="10+"></asp:ListItem>
                                              </asp:DropDownList>                                                                  
										</div>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Number of Windows is required." ValidationGroup="Group1"
                                               ControlToValidate="ddlNumWindows" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
									</div>
									<asp:Button runat="server" ValidationGroup="Group1" class="btn btn-lg btn-block btn-primary btn-with-icon btn-next" Text="Get Started"  ></asp:Button><span class="arrow"></span>

									<div class="trust-logos text-center mt-50">
										 <a id="Awarn3"  href="warranty.html" data-fancybox-type="iframe" class="fancybox"><img src="images/trust.png" class="img-responsive" alt=""></a>
									</div>
								</div>

								<div class="form-step" data-form-step="2">
									<h3 class="mt-0 fw-500 text-primary text-shadow text-center">What is Your Name?</h3>
									<div class="answers">
										<div class="form-group form-group-lg">
											<div class="input-with-icon">
												<div class="input-icon"><i class="icon-user"></i></div>
			                                      <asp:TextBox runat="server"  CssClass="form-control" ID="txtFirstName" placeholder="First Name"  ToolTip="First Name" MaxLength="80" ValidationGroup="Group2"  ></asp:TextBox>

											</div>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="Group2"
                                                   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
										</div>
										<div class="form-group form-group-lg">
											<div class="input-with-icon">
												<div class="input-icon"><i class="icon-user"></i></div>
                                                  <asp:TextBox runat="server" placeholder="Last Name"  ToolTip="Last Name"  CssClass="form-control" ID="txtLastName" MaxLength="80" ValidationGroup="Group2"  ></asp:TextBox>

											</div>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="Group2"
                                                   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
										</div>
										<asp:Button runat="server" class="btn btn-lg btn-block btn-primary btn-with-icon btn-next" ValidationGroup="Group2" Text="Next"></asp:Button><span class="arrow"></span>
									</div>
								</div>

							<div class="form-step" data-form-step="3">
									<h3 class="mt-0 fw-500 text-primary text-shadow text-center">Your Contact Info</h3>
									<div class="answers">				                  							
										<div class="form-group form-group-lg">
 											<div class="input-with-icon">
												<div class="input-icon"><i class="icon-phone"></i></div>
                                                 
                                <asp:Panel runat="server" ID ="contact">
                                                  <asp:TextBox runat="server" CssClass="form-control"  ID="txtPhone"   type="tel" placeholder="Phone Number"  ToolTip="Phone Number" MaxLength="16" ValidationGroup="Group3"></asp:TextBox>
        </asp:Panel>
											</div>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="Group3"
                                                   ControlToValidate="txtPhone"  Display="Dynamic" CssClass="req" ></asp:RequiredFieldValidator>
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="Group3"
                                                   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                                     <%--<asp:CustomValidator runat=server   controltovalidate="txtPhone" Display="Dynamic" CssClass="req" errormessage="Invalid Phone Number Entered"     OnServerValidate="validatephone" SetFocusOnError="true" />--%>
										</div>
										<div class="form-group form-group-lg">
											<div class="input-with-icon">
												<div class="input-icon"><i class="icon-envelope"></i></div>
                                                  <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" type="email" placeholder="Email"  ToolTip="Email" MaxLength="150" ValidationGroup="Group3" CausesValidation="true"></asp:TextBox>
               
											</div>
                                   <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
                                                   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="Group3" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="Group3"
                                                   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="Group3"
                                                   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" ></asp:RequiredFieldValidator>
										</div>										


										<asp:Button runat="server" class="btn btn-lg btn-block btn-primary btn-with-icon btn-next" ValidationGroup="Group3" Text="Next"></asp:Button><span class="arrow"></span>
									</div>
								</div>
                            

								<div class="form-step" data-form-step="4">
									<h3 class="mt-0 fw-500 text-primary text-shadow text-center">What is Your Street Address?</h3>
									<div class="answers">
										<div class="form-group form-group-lg">
											<div class="input-with-icon">
												<div class="input-icon"><i class="icon-street-sign"></i></div>
                                                  <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="Street Address"  ToolTip="Street Address" ID="txtStreet" ValidationGroup="Group4"></asp:TextBox>

											</div>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street is required." ValidationGroup="Group4"
                                                   ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
										</div>
	
										<asp:Button runat="server" ID="btnSubmit" Text="Get Started Now" CssClass="btn btn-lg btn-block btn-primary btn-with-icon btn-next" OnClick="btnSubmit_Click" ValidationGroup="Group4"
   UseSubmitBehavior="false" OnClientClick="disableBtn(this);" /><span class="arrow"></span>
									</div>
									<div class="tcpa mt-10">
                                      <p id="tcpa" runat="server">
  By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party organization to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at 1-646-588-5009
  
                                      
                                      </p>										
									</div>
								</div>



							</div>
								<div class="mt-30">
									<div class="btn-back pull-right mt-5 hidden">Back</div>
								</div>
<%-- <div class="disclaimer">
     <label><input type="hidden" id="leadid_tcpa_disclosure"/>

     </label>
 </div>--%>
</div>




