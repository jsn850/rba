<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormOsStep3test.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormOsStep3test" %> <%@ Register
TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<%--<script>
    let responseToken

    function recaptchaCallback() {
        alert('grecaptcha ready');

        try {
            const siteKey = "6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha";
            const widgetId = grecaptcha.render("recaptcha-container", {
                sitekey: siteKey,
                theme: "light"
            });

            function checkForToken() {
                const token = grecaptcha.getResponse(widgetId);
                if (token) {
                    responseToken = token;
                    console.log(responseToken);

                    // Once we have the response token, call the handleClientClick function
                    handleClientClick();
                } else {
                    setTimeout(checkForToken, 100);
                }
            }

            checkForToken();
        } catch (error) {
            console.log('reCAPTCHA error', error);
        }
    }

    function startLoader() {
        $(".loader-div").addClass("active")
    }

    function disableBtnApptcheck(button) {
        if ($(".form-check-input").checked == true) {
            button.disabled = true
            $(".btn-next").addClass("disabled-btn")
        }
    }

    function handleClientClick() {
        if (responseToken) {
            $.ajax({
                type: 'POST',
                url: `VerifyRecaptcha.ashx?token=${responseToken}`,
                success: function (response) {
                    // response is either true or false
                    if (response) {
                        $('.error-container').removeClass('active');

                        // Assuming you want to submit the form after successful reCAPTCHA verification
                        // If not, replace the following line with your desired logic
                        __doPostBack('<%= BTNConfirmAppt.ID %>', ''); // Trigger server-side click event
                    } else {
                        console.log('reCAPTCHA verification failed. Please try again.');
                        $('.error-container').addClass('active');
                    }
                },
                error: function () {
                    console.log('Error verifying reCAPTCHA. Please try again later.');
                    $('.error-container').addClass('active');
                }
            });
        } else {
            console.log('Error verifying reCAPTCHA. Please try again later.');
            $('.error-container').addClass('active');
        }

        return false;
    }
</script>--%>

<script>
    $(document).ready(function () {
        $(".form-check-input").on('change', function () {
            if ($(this).is(':checked')) {
                $('.appt-error-container').removeClass('active')
            }
        })
    })

    function startLoader() {
        $(".loader-div").addClass("active")
    }

    function disableBtnApptcheck(button) {
        if ($(".form-check-input").is(":checked")) {
            button.disabled = true
            $(".btn-next").addClass("disabled-btn")
        }
    }

    let responseToken;

    function recaptchaCallback() {
        try {
            const siteKey = "6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha";
            const widgetId = grecaptcha.render("recaptcha-container", {
                sitekey: siteKey,
                theme: "light"
            });

            function checkForToken() {
                const token = grecaptcha.getResponse(widgetId);
                if (token) {
                    responseToken = token;
                } else {
                    setTimeout(checkForToken, 100);
                }
            }

            checkForToken();
        } catch (error) {
            console.log('reCAPTCHA error', error);
        }
    }

    function handleClientClick() {
        if (!$(".form-check-input").is(":checked")) {
            $('.appt-error-container').addClass('active')
            return false
        } else if (responseToken) {

            $('.appt-error-container').removeClass('active')

            $.ajax({
                type: 'POST',
                url: `controls/VerifyRecaptcha.ashx?token=${responseToken}`,
                success: function (response) {
                    // response is either true or false
                    if (response) {
                        $('.error-container').removeClass('active')
                        $('.appt-error-container').removeClass('active')

            // Submit the form after successful reCAPTCHA verification
            <%= Page.ClientScript.GetPostBackEventReference(BTNConfirmAppt, "") %>;

                        startLoader()
                        disableBtnApptcheck($('#LeadForm1_BTNConfirmAppt'))
              } else {
                  $('.error-container').addClass('active');
              }
          },
          error: function () {
              $('.error-container').addClass('active');
          }
      });
        } else {
            $('.error-container').addClass('active');
        }

        return false;
    }
</script>

<style>
#recaptcha-container {
    display: flex;
    justify-content: center;
    margin-top: 1rem;
 
}

.error-container,
.appt-error-container {
    display: none;
}

.error-container.active,
.appt-error-container.active {
    display: block;
}

.recaptcha-form-error,
.os-form-error {
    color: #D0021B;
    font-size: 16px;
    font-weight: bold;
    font-style: italic;
    text-align: center;
}
@media(min-width: 768px) {
.recaptcha-form-error,
.os-form-error {
    font-size: 18px;
    }
}
</style>

<input type="hidden" name="SesTimeOut" id="SesTimeOut" value="0" />
<input type="hidden" name="PhoneButtonClick" id="PhoneButtonClick" value="0" />
<input type="hidden" name="SelectedApptDate" id="SelectedApptDate" value="0" />

<!-- START FORM -->
<div class="forms pt-3 pb-3 py-md-7">
  <div class="form-step active">
    <div class="form-step-container">
      <div class="form-step-controls pb-4">
        <div class="row mb-3">
          <div class="col-12 col-md-6" align="center">
            <asp:Calendar
              ID="Calendar3"
              runat="server"
              OnSelectionChanged="Calendar3_SelectionChanged"
              OnDayRender="Calendar3_DayRender"
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

<%--        <asp:Label
          ID="ErrorMsg"
          CssClass="form-error"
          runat="server"
          Visible="false"
          >Appointment Date/Time is Required</asp:Label
        >--%>

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
          
         <div class="error-container">
         <p class="recaptcha-form-error">Please click the I’m not a robot checkbox and then confirm your appointment.</p>
         </div>

          <div class="appt-error-container">
              <p class="os-form-error">Please select an appointment date/time to continue.</p>
          </div>

        <div class="g-recaptcha" id="recaptcha-container" data-sitekey="6Ldn8yMnAAAAAOrywHo5468PoUOLKUUHhjB09Cha"></div>

        <div class="btn-row" style="margin: 1rem auto;">
          <asp:Button
            ID="BTNConfirmAppt"
            runat="server"
            class="btn-next single mt-3"
            Text="CONFIRM APPOINTMENT"
            OnClientClick="return handleClientClick();"
            OnClick="btnSetAppt_Click"
            CausesValidation="false"
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
      </div>
    </div>
  </div>
</div>
<!-- END FORM -->
