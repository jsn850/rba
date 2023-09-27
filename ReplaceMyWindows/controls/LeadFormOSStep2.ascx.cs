using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormOSStep2 : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();
        FormProperties fp = new FormProperties();
        public int Locationid = 0;
       
        protected override void OnInit(EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {



                try
                {
                   if (Convert.ToString(Session["Submissionid"]) == "-1")
                        {
                            Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if Submissionid =-1,  meaning user completed and tried ot come back
                        }



                    fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                    fp.StrSubmissionId = Convert.ToString(Session["Submissionid"]);
                    int OnlineId= f.InsertOSLeadStartSavetoDB(Convert.ToInt32(fp.strLeadID), fp.StrSubmissionId);

                    fp.IntOnlineLeadId = OnlineId;
                    Session["OnlineLeadId"] = fp.IntOnlineLeadId;
                }
                catch( Exception osex2)
                {
                    f.saveResponseLog("Online Sched step 2 intialize failed: " + osex2.Message);
                    Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have leadid or intial insert fails
                }
            }



        }


        protected void btnAddtlQuest_Click(object sender, EventArgs e)
        {
          //  fp.strLeadID = "9099999";

            int response = 1;

            String Concerns = "";
            int Concerncount = 0;


            string SesTimeOut = Request.Form["SesTimeOut"];
            string PhoneButtonClick = Request.Form["PhoneButtonClick"];
            bool SessionTimeout = false;
            if(SesTimeOut=="1")
            {
                SessionTimeout = true;
            }
            bool PhoneButton = false;
            if (PhoneButtonClick == "1")
            {
                PhoneButton = true;
            }

            string PropertyTYpe = Request.Form["propertytype"];
            int howmanywindowsdoors = Convert.ToInt32(Request.Form["howmanywindowsdoors"]);
            int howmanydoors = Convert.ToInt32(Request.Form["howmanydoors"]);
            string materials = Request.Form["materials"];
            string WindowAge = Request.Form["windoorage"];

            if(WindowAge == null)
            {
                WindowAge = "10-20 years";
            }

            try
            {
                if (Request.Form["concernoperate"] == "1")
                {

                    Concerns = "Hard to operate";
                    Concerncount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["concernee"] == "1")
                {
                    if (Concerncount > 0)
                    {
                        Concerns = Concerns + ",";
                    }

                    Concerns = Concerns + "Not energy efficient";
                    Concerncount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["concernrot"] == "1")
                {
                    if (Concerncount > 0)
                    {
                        Concerns = Concerns + ",";
                    }
                    Concerns = Concerns + "Rotting";
                    Concerncount++;
                }
            }
            catch {; }

            try
            {
                if (Request.Form["concernfog"] == "1")
                {
                    if (Concerncount > 0)
                    {
                        Concerns = Concerns + ",";
                    }
                    Concerns = Concerns + "Fogging/Condensation";
                    Concerncount++;
                }
            }
            catch { }
            try
            {
                if (Request.Form["concernstyle"] == "1")
                {
                    if (Concerncount > 0)
                    {
                        Concerns = Concerns + ",";
                    }
                    Concerns = Concerns + "I want to change the style";
                    Concerncount++;
                }
            }
            catch { }
            try
            {
                if (Request.Form["concernwarp"] == "1")
                {
                    if (Concerncount > 0)
                    {
                        Concerns = Concerns + ",";
                    }
                    Concerns = Concerns + "Warping";
                    Concerncount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["concernnone"] == "1")
                {

                    Concerns = "None of the above";
                }
            }
            catch { }

            //Default, nothign chosen
            if (Concerncount == 0)
            {
                Concerns = "None of the above";
            }


            string HomeOwner = Request.Form["HomeOwner"];


            string sFirstname = Request.Form["sFirstname"];
            string sLastname = Request.Form["sLastname"];

            string OtherIssues = "";
            int othercount = 0;

            try
            {
                if (Request.Form["extraconstruct"] == "1")
                {

                    OtherIssues = OtherIssues + "My home is under construction";
                    othercount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["extrasale"] == "1")
                {
                    if (othercount > 0)
                    {
                        OtherIssues = OtherIssues + ",";
                    }

                    OtherIssues = OtherIssues + "My home is currently for sale";
                    othercount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["extrahistorix"] == "1")
                {
                    if (othercount > 0)
                    {
                        OtherIssues = OtherIssues + ",";
                    }
                    OtherIssues = OtherIssues + "My home is in a historic district";
                    othercount++;
                }
            }
            catch {; }

            try
            {
                if (Request.Form["extrasunroom"] == "1")
                {
                    if (othercount > 0)
                    {
                        OtherIssues = OtherIssues + ",";
                    }
                    OtherIssues = OtherIssues + "The windows I want to replace are located in a sunroom or porch";
                    othercount++;
                }
            }
            catch { }

            try
            {
                if (Request.Form["extrarentcomm"] == "1")
                {
                    if (othercount > 0)
                    {
                        OtherIssues = OtherIssues + ",";
                    }
                    OtherIssues = OtherIssues + "My home is a rental or commercial property";
                    othercount++;
                }
            }
            catch { }


            try
            {
                if (Request.Form["extranoneabove"] == "1")
                {

                    OtherIssues = "None of the above";
                }
            }
            catch { }

            //Default, nothign chosen
            if (othercount == 0)
            {
                OtherIssues = "None of the above";
            }

            string Address2 = "";

        
            try
            {
                fp.strIsTest = Convert.ToString(Session["isTesting"]);
                fp.strEmail = Convert.ToString(Session["strEmail"]);
                fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                fp.IntOnlineLeadId = Convert.ToInt32(Session["OnlineLeadId"]);
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

            }
            catch { }


            try
            {
                Convert.ToInt32(fp.strLeadID);
            }
            catch
            {
                fp.strLeadID = "0";
            }
            response = f.SaveOnlineSchedQuest(ref fp, Convert.ToInt32(fp.strLeadID), Convert.ToBoolean(HomeOwner), sFirstname, sLastname, fp.strStreet, Address2, fp.strCity, fp.strState, fp.strZipCode, "How Can WE Help", PropertyTYpe, howmanywindowsdoors, howmanydoors, materials, WindowAge, Concerns, OtherIssues, "Comments", SessionTimeout, PhoneButton);

            Session["OnlineLeadId"] = fp.IntOnlineLeadId;

            Session["SaleRepId"] = fp.IntSalesRepid;
            Session["StrResultid"] = fp.IntResultId;
            Session["Submissionid"] = fp.StrSubmissionId;
            Session["ApptImes"] = fp.StrAvailableAppts;

            string Message = "";


            // Session["ApptImes"] ="['10/8/2022 2:00:00 PM','10/8/2022 6:00:00 PM','10/9/2022 10:00:00 AM','10/9/2022 2:00:00 PM','10/9/2022 6:00:00 PM','10/10/2022 10:00:00 AM','10/10/2022 2:00:00 PM','10/10/2022 6:00:00 PM','10/11/2022 2:00:00 PM','10/11/2022 6:00:00 PM','10/11/2022 10:00:00 AM','10/12/2022 10:00:00 AM','10/12/2022 2:00:00 PM','10/12/2022 6:00:00 PM','10/13/2022 10:00:00 AM','10/13/2022 2:00:00 PM','10/13/2022 6:00:00 PM']";

            if (response == 3) //Duplicate
            {
                Session["TPResponse"] = 3;
                Response.Redirect("ThankYouDup.aspx?Response=3");
            }
            else
            if (response == 4) //Existing Appt
            {
                Session["TPResponse"] = 4;
                Session["AppointmentBookedFor"] = fp.StrPreFAppt;
                Response.Redirect("ThankYouDup.aspx?Response=4");
            }
            if (response == 5) //TimeOut
            {
                Session["TPResponse"] = 5;
                Response.Redirect("ThankYouDup.aspx?Response=5");
            }
            if (response == 6) //Error
            {
                Session["TPResponse"] = 6;
                Response.Redirect("ThankYouDup.aspx?Response=6");
            }
            else
            {
                Response.Redirect("Rbaw40-OS3b.aspx");
            }
        }
    }
}