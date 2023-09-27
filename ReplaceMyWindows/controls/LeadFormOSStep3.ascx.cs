using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormOSStep3 : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();
        FormProperties fp = new FormProperties();
        public int Locationid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string IP = Request.UserHostAddress.ToString();
            try
            {

                if(Convert.ToString(Session["Submissionid"]) == "-1")
                {
                    Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if Submissionid =-1,  meaning user completed and tried ot come back
                }
            }
            catch 
            {
                Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have a sessionid
            }


            try
            {
                fp.strIsTest = Convert.ToString(Session["isTesting"]);
                fp.IntOnlineLeadId = Convert.ToInt32(Session["OnlineLeadId"]);
                fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                fp.strEmail = Convert.ToString(Session["strEmail"]);
                fp.IntResultId = Convert.ToInt32(Session["StrResultid"]);

                fp.strLocationID = Convert.ToString(Session["strLocationID"]);

                fp.strZipCode = Convert.ToString(Session["zip"]);
                fp.strStreet = Convert.ToString(Session["Address"]);
                fp.strCity = Convert.ToString(Session["city"]);
                fp.strState = Convert.ToString(Session["State"]);
                fp.strPhoneNumber = Convert.ToString(Session["strPhone"]);
                fp.strFirstName = Convert.ToString(Session["strfname"]);
                fp.strLastName = Convert.ToString(Session["strLname"]);
                fp.StrSubmissionId = Convert.ToString(Session["Submissionid"]);
                fp.IntSalesRepid = Convert.ToInt32(Session["SaleRepId"]);


                f.populateOnlineSchedApptDates(DDlApptTime, Session["ApptImes"].ToString());
              }
            catch (Exception OS3Pageex)
            {
                f.saveResponseLog("OSPage3LoadError:" + OS3Pageex.Message);
                Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have correct session info
            }


            try
            {
                if(Request.QueryString["message"] == "NotAvailable")
                {
                    NotAvailMessage.Visible = true;
                }
            }
            catch { }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }


        protected void btnSetAppt_Click(object sender, EventArgs e)
        {

            string SesTimeOut = Request.Form["SesTimeOut"];
            string PhoneButtonClick = Request.Form["PhoneButtonClick"];
            bool SessionTimeout = false;
            if (SesTimeOut == "1")
            {
                SessionTimeout = true;
            }
            bool PhoneButton = false;
            if (PhoneButtonClick == "1")
            {
                PhoneButton = true;
            }
            if (SessionTimeout) //TimeOut
            {
                Session["TPResponse"] = 5;
                Response.Redirect("ThankYouDup.aspx?Response=5");
            }


            String AppointmentDateTime = DDlApptTime.SelectedValue;
            
            bool IsTest = false;
            try
            {
                if (fp.strIsTest=="1")
                {
                    IsTest = true;
                }
            }
            catch { }
            string response = f.PostToEnabledOnlineSchedSetAppt(AppointmentDateTime, ref fp, IsTest);

            try
            {
                Convert.ToInt32(fp.strLeadID);
            }
            catch
            {
                fp.strLeadID = "0";
            }


            f.UpdateOnlineSchedAppttoDB(Convert.ToInt32(fp.strLeadID), fp.IntOnlineLeadId, response, AppointmentDateTime,PhoneButton);

           // string response = "success";
            if (response.Contains("not available"))
            {
                //Remove selected Appointment from list when its not available
                try
                {
                    String Currentappts = Session["ApptImes"].ToString();
                     f.saveResponseLog("OS3 appt not Avail Current appts: " + Currentappts);


                      Currentappts =  Currentappts.Replace(AppointmentDateTime, "");  //remove appointment from list
                      Currentappts =  Currentappts.Replace(",,", ",");                //Remove extra comma
                       Currentappts =  Currentappts.Replace("\"\",","");                //Remove extra doble quote and comma
                       
                    f.saveResponseLog("OS3 appt not Avail New appts: " + Currentappts);

                    Session["ApptImes"] = Currentappts;                    
                }
                catch(Exception exnotavail) 
                {
                    f.saveResponseLog("OS3 appt not availble removal error " + exnotavail.Message);
                }


                Response.Redirect("Rbaw40-OS3.aspx?message=NotAvailable");
            }
            else if(response.Contains("No Response Returned") || response.Contains("error"))
            {
                Session["TPResponse"] = 6;
                Response.Redirect("ThankYouDup.aspx?Response=6");

            }
            else if (response.Contains("success"))
            {
                Session["TPResponse"] = 7;
                Session["AppointmentBookedFor"] = AppointmentDateTime;
                Response.Redirect("ThankyouRba.aspx");
            }
            else
            {
                Session["TPResponse"] = 6;
                Response.Redirect("ThankYouDup.aspx?Response=6");
            }

        }
      


    }
}