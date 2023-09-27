<%@ Control Language="C#" AutoEventWireup="true"
CodeBehind="LeadFormOSStep3.ascx.cs"
Inherits="ReplaceMyWindows.controls.LeadFormOSStep3" %>
<script>
    function disableBtnApptcheck(button) {
        if (Page_ClientValidate("LeadForm")) {
            if (LeadForm1_DDlApptTime.value != "") {
                $(button).prop("disabled", true)
            }
        }
    }
</script>

<input type="hidden" name="SesTimeOut" id="SesTimeOut" value="0" />
<input type="hidden" name="PhoneButtonClick" id="PhoneButtonClick" value="0" />

<!-- START FORM -->
<div class="forms pt-3 pb-3 py-md-7">
  <div class="form-step active">
    <hr />

    <div class="form-step-controls pb-4 pt-3">
      <h4>Final Step</h4>
      <h4>
        Please select a date and time that all homeowners are available for your
        appointment:
      </h4>

      <!--DATEPICKER-->
      <asp:DropDownList
        runat="server"
        ID="DDlApptTime"
        CssClass="form-control"
        ValidationGroup=""
      >
        <asp:ListItem
          Text="Select Appointment Date/Time"
          Value=""
        ></asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator
        ID="RequiredFieldValidatorappt"
        runat="server"
        ErrorMessage="Appointment Date/Time is Required"
        ValidationGroup="Group4"
        ControlToValidate="DDlApptTime"
        Display="Dynamic"
        CssClass="form-error"
        InitialValue=""
      ></asp:RequiredFieldValidator>

      <div
        id="NotAvailMessage"
        style="color: red"
        runat="server"
        visible="false"
      >
        <b>
          Sorry The Appointment time you selected is no longer available, please
          choose another option</b
        >
      </div>
    </div>

    <asp:Button
      ID="BTNConfirmAppt"
      runat="server"
      class="col btn btn-primary btn-next"
      Text="Confirm Appointment"
      OnClientClick="disableBtnApptcheck(this); gtag('event','click',{'event_category':'MPAGE','event_label':'ChooseAppt'});"
      UseSubmitBehavior="false"
      OnClick="btnSetAppt_Click"
      ValidationGroup="Group4"
    ></asp:Button
    ><span class="arrow"></span>
  </div>
</div>

<!-- END FORM -->
