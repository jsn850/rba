<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormOSStep2c.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormOSStep2c" %>

<script>
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

<div class="forms pt-3" style="background: transparent">
  <div class="form-step active">
    <div class="form-step-container">
      <div class="form-step-controls pb-3">
        <h4>Are you the owner of the property?</h4>
        <select name="HomeOwner" class="form-control">
          <option selected="selected" value="true">YES</option>
          <option value="false">NO</option>
        </select>
      </div>

    <div class="form-step-controls pb-3 pr-2">
        <h4>
          If there is another member of your household that may join us at the
          visit, please list their name here:
        </h4>
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

      <div class="form-step-controls">
        <h4>What type of property is your home?</h4>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="singlefamily1"
            type="radio"
            name="propertytype"
            value="Single Family"
            checked="checked"
          />
          <label class="form-check-label" for="singlefamily1"
            >Single Family</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="TownhomeCondo1"
            type="radio"
            name="propertytype"
            value="Townhome/Condominium"
          />
          <label class="form-check-label" for="TownhomeCondo1"
            >Townhome/Condominium</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="MobileManufactured2"
            type="radio"
            name="propertytype"
            value="Mobile/Manufactured"
          />
          <label class="form-check-label" for="MobileManufactured2"
            >Mobile/Manufactured</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="otherproperty3"
            type="radio"
            name="propertytype"
            value="Other"
          />
          <label class="form-check-label" for="otherproperty3">Other</label>
        </div>
        <input
          type="radio"
          id="thenorm"
          name="propertytype"
          value=""
          required
          style="opacity: 0"
        />
      </div>

      <div class="form-step-controls pb-3">
        <h4>
          Approximately how many windows/doors are you looking to replace?
        </h4>

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

      <div class="form-step-controls pb-4 pr-2">
        <h4>What material are your current windows and/or doors?</h4>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="matwood"
            type="radio"
            name="materials"
            value="Wood"
          />
          <label class="form-check-label" for="matwood">Wood</label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="matmetal"
            type="radio"
            name="materials"
            value="Metal"
          />
          <label class="form-check-label" for="matmetal">Metal </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="matvinyl"
            type="radio"
            name="materials"
            value="Vinyl"
          />
          <label class="form-check-label" for="matvinyl">Vinyl </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            id="matunsure"
            type="radio"
            name="materials"
            value="Unsure"
            checked="checked"
          />
          <label class="form-check-label" for="matunsure">Unsure </label>
        </div>
      </div>

      <div class="form-step-controls pb-4 pr-2">
        <h4>What is the approximate age of your windows and/or doors?</h4>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="radio"
            name="windoorage"
            id="age5"
            value="Under 5 years"
          />
          <label class="form-check-label" for="age5">Under 5 years</label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="radio"
            name="windoorage"
            id="age5-10"
            value="5-10 years"
          />
          <label class="form-check-label" for="age5-10">5-10 years </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="radio"
            name="windoorage"
            id="age10-20"
            value="10-20 years"
          />
          <label class="form-check-label" for="age10-20">10-20 years </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="radio"
            name="windoorage"
            id="age20"
            value="Over 20 years"
          />
          <label class="form-check-label" for="age20">Over 20 years </label>
        </div>
      </div>

      <div class="form-step-controls pb-4 pr-2">
        <h4>What are your current window concerns?</h4>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernoperate"
            id="concernoperate"
            value="1"
          />
          <label class="form-check-label" for="concernoperate"
            >Hard to operate</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernee"
            id="concernee"
            value="1"
          />
          <label class="form-check-label" for="concernee"
            >Not energy efficient</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernrot"
            id="concernrot"
            value="1"
          />
          <label class="form-check-label" for="concernrot">Rotting </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernfog"
            id="concernfog"
            value="1"
          />
          <label class="form-check-label" for="concernfog"
            >Fogging/condensation</label
          >
        </div>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernstyle"
            id="concernstyle"
            value="1"
          />
          <label class="form-check-label" for="concernstyle"
            >I want to change the style</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernwarp"
            id="concernwarp"
            value="1"
          />
          <label class="form-check-label" for="concernwarp">Warping </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="concernnone"
            id="concernnone"
            value="1"
          />
          <label class="form-check-label" for="concernnone"
            >None of the above</label
          >
        </div>
      </div>

      <div class="form-step-controls pr-2">
        <h4>Please select any that apply.</h4>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extraconstruct"
            id="extraconstruct"
            value="1"
          />
          <label class="form-check-label" for="extraconstruct"
            >Home is under construction</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extrasale"
            id="extrasale"
            value="1"
          />
          <label class="form-check-label" for="extrasale"
            >Home is currently for sale</label
          >
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extrahistorix"
            id="extrahistorix"
            value="1"
          />
          <label class="form-check-label" for="extrahistorix"
            >Home is in a historic district
          </label>
        </div>
        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extrasunroom"
            id="extrasunroom"
            value="1"
          />
          <label class="form-check-label" for="extrasunroom"
            >Windows in sunroom/porch</label
          >
        </div>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extrarentcomm"
            id="extrarentcomm"
            value="1"
          />
          <label class="form-check-label" for="extrarentcomm"
            >Rental/Commercial property</label
          >
        </div>

        <div class="form-radio form-check-inline">
          <input
            class="form-check-input"
            type="checkbox"
            name="extranoneabove"
            id="extranoneabove"
            value="1"
          />
          <label class="form-check-label" for="extranoneabove"
            >None of the Above</label
          >
        </div>
      </div>

      <div>
        <div class="btn-row">
          <asp:Button
            style="width: 90%"
            ID="step2next"
            runat="server"
            class="btn-next single"
            Text="NEXT"
            OnClientClick="startLoader(); setTimeout(disableBtnStep2,1); gtag('event','click',{'event_category':'WizOS','event_label':'OnlineScheduleStep2'});"
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
      </script>

      <%--
      <div class="pb-2">
        <asp:Button
          style="width: 90%"
          ID="Button1"
          runat="server"
          class="col btn btn-primary btn-next"
          Text="NEXT"
          OnClientClick="setTimeout(disableBtnStep2,1); gtag('event','click',{'event_category':'WizOS','event_label':'OnlineScheduleStep2'});"
          CausesValidation="true"
          UseSubmitBehavior="true"
          OnClick="btnAddtlQuest_Click"
        ></asp:Button
        ><span class="arrow"></span>
        <div
          class="ti-phone-call pt-2"
          runat="server"
          id="Div1"
          OnClick="IncompleteFormPhone()"
        >
          I'd prefer a phone call to discuss my project
        </div>
      </div>
      --%>
    </div>
  </div>
  <script>
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
</div>
<!-- END FORM -->
