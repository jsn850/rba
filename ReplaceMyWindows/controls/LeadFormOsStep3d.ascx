<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormOsStep3d.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormOsStep3d" %>
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

<!-- START FORM -->
<div class="forms pb-3 py-md-7">
  <div class="form-step active">
    <div class="form-step-container">
      <div class="form-step-title">
        <h1
          style="
            font-size: 1.5em;
            font-weight: 500;
            margin-bottom: 2rem;
            font-family: 'Lato', sans-serif;
            color: rgba(0, 0, 0, 0.8);
          "
        >
          Choose a date and time for your appointment:
        </h1>
      </div>

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

        <asp:Label
          ID="ErrorMsg"
          CssClass="form-error"
          runat="server"
          Visible="false"
          >Appointment Date/Time is Required</asp:Label
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

        <div style="max-width: 300px; margin: auto;">

        <asp:Button
          ID="BTNConfirmAppt"
          runat="server"
          class="btn-next mt-3"
          Text="CONFIRM APPOINTMENT"
          OnClientClick="disableBtnApptcheck(this); startLoader(); gtag('event','click',{'event_category':'MPAGE','event_label':'ChooseAppt'});"
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
</div>
<!-- END FORM -->
