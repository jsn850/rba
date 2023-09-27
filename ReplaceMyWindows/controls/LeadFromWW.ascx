﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadFromWW.ascx.cs" Inherits="ReplaceMyWindows.controls.LeadFromWW" %>
<asp:HiddenField id="leadid_token"  value="" runat="server" ClientIDMode="Static"/>

            <!-- START FORM -->
			<div class="col-12 d-flex justify-content-center">	
                <div class="form-step active">
<%--                    <div  class="form-bg-image" id="fbg1" runat="server"><img id="imgstep1" runat="server" src="../img/wedo-hero1.jpg"></div>--%>


                         <div class="form-step-title" id="ZipTitleDiv" runat="server">Where is your window project?</div>
                        <div class="form-step-controls">
         
                             <asp:TextBox runat="server"   placeholder="Zip Code" ToolTip="Zip Code" type="tel" CssClass="form-control" ID="txtZipCode" MaxLength="5" ValidationGroup="Group1" ></asp:TextBox>
               
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Zip is required." ControlToValidate="txtZipCode" ValidationGroup="Group1"  InitialValue="" Display="Dynamic" CssClass="req"  SetFocusOnError="true"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator  ID="RegularExpressionValidator33"  runat="server" ValidationExpression="\d{5}(-\d{4})?"  ControlToValidate="txtZipCode"   ValidationGroup="Group1" Display="Dynamic"    ErrorMessage="Enter valid U.S. Zip Code!"   CssClass="req" InitialValue="" SetFocusOnError="true"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidatorZip" runat="server"    ControlToValidate="txtZipCode" Display="Dynamic" CssClass="req"   ValidationGroup="Group1" errormessage="Invalid ZipCode Entered" 
                    ClientValidationFunction="isValidZip"  EnableClientScript="true" ValidateEmptyText="false" ClientIDMode="Static" />

                        </div>

                        <div class="form-step-actions row no-gutters">
	                    <asp:Button runat="server" ValidationGroup="Group1" class="col btn btn-primary btn-next" Text="START FREE QUOTE" OnClientClick ="gtag('event','click',{'event_category':'MPAGE','event_label':'ZIP'});"  ></asp:Button><span class="arrow"></span>

                        </div>
            

               
                </div>
                
                
                <div class="form-step">
                    <div class="form-bg-image"><img id="imgstep3" runat="server" src="../img/wedo-hero2.jpg"></div>
                    <div class="form-step-container">

                <div class="form-step-title"><p class="color-text">We Back Our Products, Giving You Peace Of Mind.</p>Who are we speaking with?</div>
                        <div class="form-step-subtitle">Let us know your name below</div>
                        <div class="form-step-controls px-3 px-md-5">

                              <asp:TextBox runat="server"  CssClass="form-control" ID="txtFirstName" placeholder="First Name"  ToolTip="First Name" MaxLength="80" ValidationGroup="Group2"  ></asp:TextBox>
                                                        
						
                               <asp:TextBox runat="server" placeholder="Last Name"  ToolTip="Last Name"  CssClass="form-control" ID="txtLastName" MaxLength="80" ValidationGroup="Group2"  ></asp:TextBox>
                                         
                                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ValidationGroup="Group2"
                                                   ControlToValidate="txtFirstName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ValidationGroup="Group2"
                                                   ControlToValidate="txtLastName" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-step-actions row no-gutters">
                            <button class="col mr-2 btn btn-light btn-back">Back</button>
                         <%--   <button class="col btn btn-primary btn-next">Next</button>--%>
                            <asp:Button runat="server" ValidationGroup="Group2" class="col btn btn-primary btn-next" Text="NEXT" OnClientClick ="gtag('event','click',{'event_category':'MPAGE','event_label':'Name'});" ></asp:Button><span class="arrow"></span>
                        </div> 
               


              
                   </div>
                </div>

                <div class="form-step">
                    <div class="form-bg-image"  ><img id="imgstep5" runat="server" src="../img/wedo-hero3.jpg"></div>
                    <div class="form-step-container">
                       <div class="form-step-title"><p class="color-text">America's Premier Window Manufacturer!</p>Let us know how we can reach you</div>
                        <div class="form-step-subtitle">Enter Your Contact Info Below</div>
                        <div class="form-step-controls px-3 px-md-5">
                      

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" type="email" placeholder="Email"  ToolTip="Email" MaxLength="150" ValidationGroup="Group3" CausesValidation="true"></asp:TextBox>
          
                         
                                        <asp:TextBox runat="server" CssClass="form-control"  ID="txtPhone"   type="tel" placeholder="Phone Number"  ToolTip="Phone Number" MaxLength="16" ValidationGroup="Group3"></asp:TextBox>
                          </div>
                        

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone is required." ValidationGroup="Group3"
                                                   ControlToValidate="txtPhone"  Display="Dynamic" CssClass="req" ></asp:RequiredFieldValidator>
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone is incorrect." ValidationGroup="Group3"
                                                   ControlToValidate="txtPhone" CssClass="req" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                                    <asp:CustomValidator ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email has already been submitted" CssClass="req"
                                                   ClientValidationFunction="isValidEmail" runat="server" ValidationGroup="Group3" EnableClientScript="true" ValidateEmptyText="true" ID="CustomValidator" ClientIDMode="Static" />
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid." ValidationGroup="Group3"
                                                   ControlToValidate="txtEmail" CssClass="req" Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required." ValidationGroup="Group3"
                                                   ControlToValidate="txtEmail" Display="Dynamic" CssClass="req" ></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="CVPhone" runat=server    ControlToValidate="txtPhone" Display="Dynamic" CssClass="req"   ValidationGroup="Group3" errormessage="Invalid Phone Number Entered" 
                                                ClientValidationFunction="isValidPhone"  EnableClientScript="true" ValidateEmptyText="true" ClientIDMode="Static" />
                        <div class="form-step-actions row no-gutters ">
                            <button class="col mr-2 btn btn-light btn-back">Back</button>

                            <asp:Button runat="server" ValidationGroup="Group3" class="col btn btn-primary btn-next" Text="NEXT" OnClientClick ="gtag('event','click',{'event_category':'MPAGE','event_label':'ContactInfo'});" ></asp:Button><span class="arrow"></span>
                        </div> 

                    </div>
                </div>
                <div class="form-step">
                    <div class="form-bg-image"><img id="imgstep6" runat="server" src="../img/wedo-hero4.jpg"></div>
                    <div class="form-step-container">

                        <div class="form-step-title">What is your home address?</div>
                        <div class="form-step-controls px-1 px-md-5">
       
                                           <asp:TextBox runat="server" Text="" CssClass="form-control" placeholder="Street Address"  ToolTip="Street Address" ID="txtStreet" ValidationGroup="Group4"></asp:TextBox>
                         
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Street is required." ValidationGroup="Group4"
                                                   ControlToValidate="txtStreet" Display="Dynamic" CssClass="req" InitialValue=""></asp:RequiredFieldValidator>

                            <asp:Button runat="server" ID="btnSubmit" Text="Get Started Now" CssClass="col btn btn-primary btn-next" OnClick="btnSubmit_Click" ValidationGroup="Group4" UseSubmitBehavior="false" OnClientClick="disableBtnAddresscheck(this); gtag('event','click',{'event_category':'MPAGE','event_label':'Address-Submit'});"  />
                       
                        </div>
                       <div class="tcpa mt-10">
                                      <p id="tcpa" runat="server">
                                            By pressing the Get Started Now button above, you acknowledge that you’d like to learn more about Renewal by Andersen windows. You also authorize Renewal by Andersen or any third-party <a href="partners.html">organization</a> to call,  SMS and/or email you at the phone number(s)/email address(es) above, including your wireless number if provided, with automated technology in order to schedule a convenient day and time. If you live in a territory where Renewal by Andersen is not currently working with <span id ="DiscDomain" runat="server">ReplaceMyWindows4Less.com</span> or that is not serviced by Renewal by Andersen, we will send your information to up to four home improvement companies that can help with your project. You acknowledge that you are submitting this form so that you can be contacted via email, phone or text message and informed about products, services and sales, as well as third-party offers including, without limitation, from our affiliates and/or unrelated third parties. You understand that you do not need to submit this form to schedule an in-home price quote. If you do not wish to provide us with this consent, you may contact us directly at (516) 253-6644  
                                      </p>	
                            </div>                               
<%--                        <div class="form-step-actions row no-gutters px-3 px-md-5">--%>
<%--                            <div class="btn-back mt-1 hidden">Back</div>--%>
                         <button class="mr-2 btn btn-light btn-back">Back</button>
<%--                        </div> --%>

                    </div>
                </div>
                </div>
            <!-- END FORM -->