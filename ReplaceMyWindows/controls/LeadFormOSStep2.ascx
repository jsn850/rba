<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormOSStep2.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormOSStep2" %>

<script>
    //Form Submits after 20 mins
    setTimeout(function () {
        selectElement("howmanydoors", "0")
        selectElement("howmanywindowsdoors", "0")
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
    }
</script>
<input type="hidden" name="SesTimeOut" id="SesTimeOut" value="0" />
<input type="hidden" name="PhoneButtonClick" id="PhoneButtonClick" value="0" />
<!-- START FORM -->
<div class="forms pt-3 pb-3 py-md-7">
  <div
    class="ti-close-full-page"
    runat="server"
    id="ClosePage"
    OnClick="IncompleteForm()"
  >
    ×
  </div>
  <div class="form-step active">
    <div class="form-step-container">
      <div class="form-step-title pt-3">
        <h3>Almost there!</h3>
        <br />
        <p>We need a little more info so we can book your Free Consultation.</p>
      </div>

      <div class="form-step-controls pb-4 pr-2">
        <h4>Are you the owner of the property?</h4>
        <select name="HomeOwner" class="form-control">
          <option selected="selected" value="true">YES</option>
          <option value="false">NO</option>
        </select>
      </div>

      <div class="form-step-controls pb-4 pr-2">
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

      <div class="form-step-controls pb-4 pr-2">
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

      <div class="form-step-controls pb-4 pr-2">
        <h4>
          Approximately how many windows/doors are you looking to replace?
        </h4>
        <select
          name="howmanywindowsdoors"
          class="form-control"
          id="howmanywindowsdoors"
          required
        >
          <option value="0"># of Windows</option>
          <option value="0">None</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30+</option>
        </select>

        <select
          name="howmanydoors"
          class="form-control"
          id="howmanydoors"
          required
        >
          <option value="0"># of Doors</option>
          <option value="0">None</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10+</option>
        </select>
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
        <%--
        <input
          type="radio"
          id="materrerr"
          name="materials"
          value=""
          required
          style="opacity: 0"
        />--%>
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

      <div class="form-step-controls pb-4 pr-2">
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

        <asp:Button
          ID="step2next"
          runat="server"
          class="col btn btn-primary btn-next"
          Text="NEXT"
          OnClientClick="setTimeout(disableBtnStep2,1); gtag('event','click',{'event_category':'WizOS','event_label':'OnlineScheduleStep2'});"
          CausesValidation="true"
          UseSubmitBehavior="true"
          OnClick="btnAddtlQuest_Click"
        ></asp:Button
        ><span class="arrow"></span>
      </div>
    </div>
    <div
      class="ti-phone-call"
      runat="server"
      id="PhoneLCick"
      OnClick="IncompleteFormPhone()"
    >
      I'd prefer a phone call to discuss my project
    </div>
  </div>
</div>
<!-- END FORM -->
