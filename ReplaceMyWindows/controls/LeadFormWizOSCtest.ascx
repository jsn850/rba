<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormWizOSCtest.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormWizOSCtest" %>
<asp:HiddenField
  id="leadid_token"
  value=""
  runat="server"
  ClientIDMode="Static"
/>
<% if (Session["CurrentStep"] == null || (int)Session["CurrentStep"] == 1) { %>

<% if (ApptTimes != null) {%>
        <script>
            $(document).ready(function () {
                let ApptTimes = ""
                if (<%= ApptTimes%>) {
                console.log("appt times: " + ApptTimes);

                }
            })
        </script>
                

               <% }  %>
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
          ID="RequiredFieldValidator3"
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

    <%--SUBMIT--%>
    <div class="form-step-actions btn-row">
      <asp:Button
        runat="server"
        ID="btnSubmit"
        Text="GET STARTED NOW"
        CssClass="btn-next single"
        OnClick="btnSubmit_Click"
        ValidationGroup="LeadFormWizc"
        UseSubmitBehavior="false"
        OnClientClick="return handleClientClick('LeadFormWizc', 'OSC');"
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
<% } else if ((int)Session["CurrentStep"] == 2) { %>
<script async defer>
    //Form Submits after 20 mins
    setTimeout(function () {
        // selectElement('howmanydoors', '0');
        //  selectElement('howmanywindowsdoors', '0');
        selectElement("SesTimeOut", "1")

        document.getElementById("LeadForm1_step2next").click()
    }, 18 * 60 * 1000) // 18 minutes * 60 seconds * 1000 ms

    function selectElement(id, valueToSelect) {
        let element = document.getElementById(id)
        element.value = valueToSelect
    }

    function IncompleteForm() {
        selectElement("SesTimeOut", "1")
        document.getElementById("LeadForm1_step2next").click()
    }
    function IncompleteFormPhone() {
        selectElement("SesTimeOut", "1")
        selectElement("PhoneButtonClick", "1")
        document.getElementById("LeadForm1_step2next").click()
    }

    function disableBtnStep2() {
        $("#LeadForm1_step2next").prop('disabled', true)
        $(".btn-next").addClass("disabled-btn")
    }
</script>
<input type="hidden" name="SesTimeOut" id="SesTimeOut" value="0" />
<input type="hidden" name="PhoneButtonClick" id="PhoneButtonClick" value="0" />

<style>
  .form-radio input:checked ~ .form-check-label {
    border-color: #222222;
    background: #52b058 !important;
    color: #fff !important;
  }
  .btn.btn-default.btn-number.numBtn {
    display: flex;
    justify-content: center;
    align-items: center;
    background: #52b058 !important;
    color: #fff !important;
    padding: 1.5rem !important;
  }
  .input-group.numWinDoors {
    display: flex;
    flex-wrap: nowrap;
    max-width: 300px;
    white-space: nowrap;
    margin: 0 auto;
  }
  .form-check-inline {
    margin-right: 0;
    background: white;
  }
</style>

    <div
      class="g-recaptcha"
      id="recaptcha-container"
      data-sitekey="6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha"
      style="display: none !important;"
    ></div>

<div class="forms pt-3" style="background: transparent">
  <div class="form-step active">
    <div class="form-step-container">
        <h4>Are you the owner of the property?</h4>
    <div class="input-container">
        <select name="HomeOwner" class="form-control">
          <option selected="selected" value="true">YES</option>
          <option value="false">NO</option>
        </select>
      </div>

        <h4>
          If there is another member of your household that may join us at the
          visit, please list their name here:
        </h4>

    <div class="input-container">
        <input
          type="text"
          class="form-control"
          placeholder="First Name"
          name="sFirstname"
        />

        <input
          type="text"
          class="form-control"
          placeholder="Last Name"
          name="sLastname"
        />
    </div>

        <style>
            .input-container {
                display: flex;
                justify-content: center;
                gap: 0.5rem;
                margin: 0.5rem 0;
                flex-wrap: wrap;
            }

            .input-container input,
            .input-container select {
                box-sizing: border-box;
                width: 100%;
                height: 55px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 1px !important;
            }
        </style>

      <h4>What type of property is your home?</h4>

        <div class="input-container propTypes">
          <input
            class="form-check-input"
            id="singlefamily1"
            type="button"
            name="propertytype"
            value="Single Family"
          />
          <input
            class="form-check-input"
            id="TownhomeCondo1"
            type="button"
            name="propertytype"
            value="Townhome/Condominium"
          />
          <input
            class="form-check-input"
            id="MobileManufactured2"
            type="button"
            name="propertytype"
            value="Mobile/Manufactured"
          />
          <input
            class="form-check-input"
            id="otherproperty3"
            type="button"
            name="propertytype"
            value="Other"
          />
          <input id="propertytype" type="hidden" value="Single Family" />
      </div>

        <h4>
          Approximately how many windows/doors are you looking to replace?
        </h4>

      <div class="form-step-controls pb-3">

        <label>How many windows?</label>
        <div class="input-group numWinDoors">
          <span class="input-group-btn">
            <button
              type="button"
              class="btn btn-default btn-number numBtn"
              data-type="minus"
            >
              -
            </button>
          </span>
          <input
            style="text-align: center"
            type="number"
            id="howmanywindowsdoors"
            name="howmanywindowsdoors"
            min="0"
            max="999"
            value="0"
            class="form-control input-number"
            step="1"
            required
          />
          <span class="input-group-btn">
            <button
              type="button"
              class="btn btn-default btn-number numBtn"
              data-type="plus"
            >
              +
            </button>
          </span>
        </div>

        <label>How many doors?</label>
        <div class="input-group numWinDoors">
          <span class="input-group-btn">
            <button
              type="button"
              class="btn btn-default btn-number numBtn"
              data-type="minus"
            >
              -
            </button>
          </span>
          <input
            style="text-align: center"
            name="howmanydoors"
            id="howmanydoors"
            type="number"
            min="0"
            max="999"
            value="0"
            class="form-control input-number"
            step="1"
            required
          />
          <span class="input-group-btn">
            <button
              type="button"
              class="btn btn-default btn-number numBtn"
              data-type="plus"
            >
              +
            </button>
          </span>
        </div>
      </div>

        <h4>What material are your current windows and/or doors?</h4>
      
        <div class="input-container materials">
          <input
            class="form-check-input"
            id="matwood"
            type="button"
            name="materials"
            value="Wood"
          />
          <input
            class="form-check-input"
            id="matmetal"
            type="button"
            name="materials"
            value="Metal"
          />
          <input
            class="form-check-input"
            id="matvinyl"
            type="button"
            name="materials"
            value="Vinyl"
          />
          <input
            class="form-check-input"
            id="matunsure"
            type="button"
            name="materials"
            value="Unsure"
          />
          <input id="materials" type="hidden" value="Unsure" />
      </div>

        <h4>What is the approximate age of your windows and/or doors?</h4>
      
        <div class="input-container windoorage">

          <input
            class="form-check-input"
            type="button"
            name="windoorage"
            id="age5"
            value="Under 5 years"
          />
          <input
            class="form-check-input"
            type="button"
            name="windoorage"
            id="age5-10"
            value="5-10 years"
          />
          <input
            class="form-check-input"
            type="button"
            name="windoorage"
            id="age10-20"
            value="10-20 years"
          />
          <input
            class="form-check-input"
            type="button"
            name="windoorage"
            id="age20"
            value="Over 20 years"
          />

          <input id="windoorage" type="hidden" value="" />
      </div>

        <h4>What are your current window concerns?</h4>

      <div class="input-container concerns">

          <input
            class="form-check-input"
            type="button"
            name="concernoperate"
            id="concernoperate"
            value="Hard to operate"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernee"
            id="concernee"
            value="Not energy efficient"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernrot"
            id="concernrot"
            value="Rotting"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernfog"
            id="concernfog"
            value="Fogging/Condensation"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernstyle"
            id="concernstyle"
            value="I want to change the style"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernwarp"
            id="concernwarp"
            value="Warping"
          />
          <input
            class="form-check-input"
            type="button"
            name="concernnone"
            id="concernnone"
            value="None of the above"
          />
          <input id="concerns" type="hidden" value="null" />
      </div>

        <h4>Please select any that apply.</h4>

      <div class="input-container other-issues">

          <input
            class="form-check-input"
            type="button"
            name="extraconstruct"
            id="extraconstruct"
            value="Home is under construction"
          />
          <input
            class="form-check-input"
            type="button"
            name="extrasale"
            id="extrasale"
            value="Home is currently for sale"
          />
          <input
            class="form-check-input"
            type="button"
            name="extrahistorix"
            id="extrahistorix"
            value="Home is in a historic district"
          />
          <input
            class="form-check-input"
            type="button"
            name="extrasunroom"
            id="extrasunroom"
            value="Windows in sunroom/porch"
          />
          <input
            class="form-check-input"
            type="button"
            name="extrarentcomm"
            id="extrarentcomm"
            value="Rental/Commercial property"
          />
          <input
            class="form-check-input"
            type="button"
            name="extranoneabove"
            id="extranoneabove"
            value="None of the above"
          />

          <input id="other-issues" type="hidden" value="null" />
      </div>

      <div>
        <div class="btn-row">
          <asp:Button
            style="width: 90%"
            ID="step2next"
            runat="server"
            class="btn-next single"
            Text="NEXT"
            OnClientClick="logger(); startLoader(); setTimeout(disableBtnStep2,1); gtag('event','click',{'event_category':'WizOS','event_label':'OnlineScheduleStep2'});"
            CausesValidation="true"
            UseSubmitBehavior="true"
            OnClick="btnAddtlQuest_Click"
          ></asp:Button>
        </div>
        <div
          class="ti-phone-call pt-2"
          runat="server"
          id="PhoneLCick"
          OnClick="IncompleteFormPhone()"
        >
          I'd prefer a phone call to discuss my project
        </div>
      </div>
      <%--LOADER--%>
      <div class="loader-div">
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
      <script>
          function startLoader() {
              $(".loader-div").addClass("active")
          }

          function logger() {
              console.log("Step 2 submit clicked: btnAddtlQuest_Click")
          }
      </script>
    </div>
  </div>
  <script async defer>
      $(".btn-number").click(function (e) {
          e.preventDefault()

          var input = $(this).closest(".input-group").find("input")
          var type = $(this).attr("data-type")
          var currentValue = parseInt(input.val())

          if (!isNaN(currentValue)) {
              if (type == "minus") {
                  input.val(
                      currentValue > input.attr("min")
                          ? currentValue - 1
                          : input.attr("min")
                  )
              } else if (type == "plus") {
                  input.val(
                      currentValue < input.attr("max")
                          ? currentValue + 1
                          : input.attr("max")
                  )
              }
          } else {
              input.val(1)
          }
      })
  </script>
  <script async defer>
        const progressSteps = $('.step')

        const progressBars = $('.bar')

        function progressNext(num) {
            if (num === 3) {
                $(progressSteps[num - 1]).html('<i class="fa-solid fa-check"></i>')
            } else {
                $(progressBars[num - 1]).addClass('animate')

                $(progressSteps[num]).css({
                    'background-color': '#4caf50'
                })

                setTimeout(() => {
                    $(progressSteps[num - 1]).html('<i class="fa-solid fa-check"></i>')
                }, 775)
            }
        }

        progressNext(1)
    </script>
</div>
<%--<% } %>--%>
<% } else if ((int)Session["CurrentStep"] == 3) { %>
<script>
    function disableBtnApptcheck(button) {
        if ($('.form-check-input').is(":checked")) {
            $(button).prop("disabled", true)
            $('.btn-next').addClass('disabled-btn')
        }
    }
</script>

<input type="hidden" name="SesTimeOut" id="SesTimeOut" value="0" />
<input type="hidden" name="PhoneButtonClick" id="PhoneButtonClick" value="0" />
<input type="hidden" name="SelectedApptDate" id="SelectedApptDate" value="0" />

    <div
      class="g-recaptcha"
      id="recaptcha-container"
      data-sitekey="6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha"
      style="display: none !important;"
    ></div>

<asp:HiddenField ID="hfApptTimes" runat="server" />
<input id="apptDateTime" type="hidden" value="" />

<!-- START FORM -->
<div class="forms pt-3 pb-3 py-md-7">
  <div class="form-step active">
    <div class="form-step-container">
        <div class="calendar-container">
      <header class="calendar-header">
        <p class="calendar-current-date"></p>
        <div class="calendar-navigation">
          <span id="calendar-prev" class="material-symbols-rounded">
            chevron_left
          </span>
          <span id="calendar-next" class="material-symbols-rounded">
            chevron_right
          </span>
        </div>
      </header>

      <div class="calendar-body">
        <ul class="calendar-weekdays">
          <li>Sun</li>
          <li>Mon</li>
          <li>Tue</li>
          <li>Wed</li>
          <li>Thu</li>
          <li>Fri</li>
          <li>Sat</li>
        </ul>
        <ul class="calendar-dates"></ul>
      </div>
    </div>

    <div class="btn-div" style="margin: 2rem auto">
      <div class="btn-container"></div>
    </div>
      <%--<div class="form-step-controls pb-4">
        <div class="row mb-3">
          <div class="col-12 col-md-6" align="center">
            <asp:Calendar
              ID="Calendar3"
              runat="server"
              OnDayRender="Calendar3_DayRender"
              OnSelectionChanged="Calendar3_SelectionChanged"
              TitleStyle-CssClass="TitleStyle"
            ></asp:Calendar>
          </div>
          <div class="col-12 col-md-6 apptTimesDiv">
            <p>
              Appointment Times Available on <br /><b
                ><span id="DateSelected" runat="server"
                  >Tuesday, February 14, 2023</span
                ></b
              ><br />
              Please Choose 1 or select another date.
            </p>

            <div class="row justify-content-center apptTimes">
              <div
                id="Time1"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input1"
                  value="1"
                />
                <input type="hidden" runat="server" id="ih1" />
                <label
                  class="form-check-labelSM"
                  for="Input1"
                  id="Label1"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time2"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input2"
                  value="2"
                />
                <input type="hidden" runat="server" id="ih2" />
                <label
                  class="form-check-labelSM"
                  for="Input2"
                  id="Label2"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time3"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input3"
                  value="3"
                />
                <input type="hidden" runat="server" id="ih3" />
                <label
                  class="form-check-labelSM"
                  for="Input3"
                  id="Label3"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time4"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input4"
                  value="4"
                />
                <input type="hidden" runat="server" id="ih4" />
                <label
                  class="form-check-labelSM"
                  for="Input4"
                  id="Label4"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time5"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input5"
                  value="5"
                />
                <input type="hidden" runat="server" id="ih5" />
                <label
                  class="form-check-labelSM"
                  for="Input5"
                  id="Label5"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time6"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input6"
                  value="6"
                />
                <input type="hidden" runat="server" id="ih6" />
                <label
                  class="form-check-labelSM"
                  for="Input6"
                  id="Label6"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time7"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input7"
                  value="7"
                />
                <input type="hidden" runat="server" id="ih7" />
                <label
                  class="form-check-labelSM"
                  for="Input7"
                  id="Label7"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time8"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input8"
                  value="8"
                />
                <input type="hidden" runat="server" id="ih8" />
                <label
                  class="form-check-labelSM"
                  for="Input8"
                  id="Label8"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time9"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input9"
                  value="9"
                />
                <input type="hidden" runat="server" id="ih9" />
                <label
                  class="form-check-labelSM"
                  for="Input9"
                  id="Label9"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time10"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input10"
                  value="10"
                />
                <input type="hidden" runat="server" id="ih10" />
                <label
                  class="form-check-labelSM"
                  for="Input10"
                  id="Label10"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time11"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input11"
                  value="11"
                />
                <input type="hidden" runat="server" id="ih11" />
                <label
                  class="form-check-labelSM"
                  for="Input11"
                  id="Label11"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time12"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input12"
                  value="12"
                />
                <input type="hidden" runat="server" id="ih12" />
                <label
                  class="form-check-labelSM"
                  for="Input12"
                  id="Label12"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time13"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input13"
                  value="13"
                />
                <input type="hidden" runat="server" id="ih13" />
                <label
                  class="form-check-labelSM"
                  for="Input13"
                  id="Label13"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time14"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input14"
                  value="14"
                />
                <input type="hidden" runat="server" id="ih14" />
                <label
                  class="form-check-labelSM"
                  for="Input14"
                  id="Label14"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time15"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input15"
                  value="15"
                />
                <input type="hidden" runat="server" id="ih15" />
                <label
                  class="form-check-labelSM"
                  for="Input15"
                  id="Label15"
                  runat="server"
                ></label>
              </div>
              <div
                id="Time16"
                runat="server"
                visible="false"
                class="form-radio form-check-labelSM col-4"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="weekOf"
                  id="Input16"
                  value="16"
                />
                <input type="hidden" runat="server" id="ih16" />
                <label
                  class="form-check-labelSM"
                  for="Input16"
                  id="Label16"
                  runat="server"
                ></label>
              </div>
            </div>
          </div>
        </div>

        <asp:Label
          ID="ErrorMsg"
          CssClass="form-error"
          runat="server"
          Visible="false"
          >Appointment Date/Time is Required</asp:Label
        >
        
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidatorappt"
          runat="server"
          ErrorMessage="Appointment Date/Time is Required"
          ValidationGroup="Group4"
          ControlToValidate="DDlApptTime"
          Display="Dynamic"
          CssClass="form-error"
          InitialValue=""
        ></asp:RequiredFieldValidator
        >

        <div
          id="NotAvailMessage"
          style="color: red"
          runat="server"
          visible="false"
        >
          <b>
            Sorry The Appointment time you selected is no longer available,
            please choose another option</b
          >
        </div>

        <div class="btn-row">

        <asp:Button
          ID="BTNConfirmAppt"
          runat="server"
          class="btn-next single mt-3"
          Text="CONFIRM APPOINTMENT"
          OnClientClick="disableBtnApptcheck(this); progressNext(3); startLoader(); gtag('event','click',{'event_category':'MPAGE','event_label':'ChooseAppt'});"
          UseSubmitBehavior="true"
          OnClick="btnSetAppt_Click"
          CausesValidation="true"
        ></asp:Button>
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
<script>
    function startLoader() {
        $('.loader-div').addClass('active')
    }
</script>
      </div>
    </div>
  </div>
<%--</div>--%>
<!-- END FORM -->

    
<%}%> 
