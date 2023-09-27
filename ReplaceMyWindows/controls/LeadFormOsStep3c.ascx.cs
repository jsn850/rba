using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Globalization;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormOsStep3c : System.Web.UI.UserControl
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
             string IP = Request.UserHostAddress.ToString();
            // UNCOMMENT FOR TESTING ONLY
            //Session["ApptImes"] = "[\"2/14/2023 10:00:00 AM\",\"2/14/2023 10:30:00 AM\",\"2/14/2023 2:00:00 PM\",\"2/14/2023 2:30:00 PM\",\"2/15/2023 10:00:00 AM\",\"2/15/2023 10:30:00 AM\",\"2/15/2023 2:00:00 PM\",\"2/15/2023 2:30:00 PM\",\"2/16/2023 10:00:00 AM\",\"2/16/2023 10:30:00 AM\",\"2/16/2023 2:00:00 PM\",\"2/16/2023 2:30:00 PM\",\"2/16/2023 6:00:00 PM\",\"2/16/2023 6:30:00 PM\",\"2/16/2023 7:00:00 PM\",\"2/17/2023 10:00:00 AM\",\"2/17/2023 10:30:00 AM\",\"2/17/2023 2:00:00 PM\",\"2/17/2023 2:30:00 PM\",\"2/17/2023 6:00:00 PM\",\"2/17/2023 6:30:00 PM\",\"2/17/2023 7:00:00 PM\",\"2/18/2023 2:00:00 PM\",\"2/18/2023 2:30:00 PM\",\"2/18/2023 6:00:00 PM\",\"2/18/2023 6:30:00 PM\",\"2/18/2023 7:00:00 PM\",\"2/19/2023 2:00:00 PM\",\"2/19/2023 2:30:00 PM\",\"2/19/2023 10:00:00 AM\",\"2/19/2023 10:30:00 AM\",\"2/19/2023 6:00:00 PM\",\"2/19/2023 6:30:00 PM\",\"2/19/2023 7:00:00 PM\",\"2/20/2023 2:00:00 PM\",\"2/20/2023 2:30:00 PM\",\"2/20/2023 10:00:00 AM\",\"2/20/2023 10:30:00 AM\",\"2/20/2023 6:00:00 PM\",\"2/20/2023 6:30:00 PM\",\"2/20/2023 7:00:00 PM\",\"2/22/2023 10:00:00 AM\",\"2/22/2023 10:30:00 AM\",\"2/22/2023 2:00:00 PM\",\"2/22/2023 2:30:00 PM\",\"2/22/2023 6:00:00 PM\",\"2/22/2023 6:30:00 PM\",\"2/22/2023 7:00:00 PM\",\"2/22/2023 10:00:00 AM\",\"2/22/2023 10:30:00 AM\",\"2/22/2023 2:00:00 PM\",\"2/22/2023 2:30:00 PM\",\"2/22/2023 6:00:00 PM\",\"2/22/2023 6:30:00 PM\",\"2/22/2023 7:00:00 PM\",\"2/23/2023 10:00:00 AM\",\"2/23/2023 10:30:00 AM\",\"2/23/2023 2:00:00 PM\",\"2/23/2023 2:30:00 PM\",\"2/23/2023 6:00:00 PM\",\"2/23/2023 6:30:00 PM\",\"2/23/2023 7:00:00 PM\"]";
            String ApptString = "";
            try
            {
                 ApptString = Session["ApptImes"].ToString();
            }
            catch
            {
                f.saveResponseLog("OSPage3cLoadError: No session Appts, USERIP:" + IP);

                // COMMENT OUT FOR TESTING ONLY
                Response.Redirect("Rbaw40-OSa.aspx");  //redirect to step 1 if we dont have a Session apptimes

            }

            if (ApptString.Length <9)
            {
                //No available Appts
                f.saveResponseLog("OSPage3cLoadError: No Appts (length less than 8), USERIP:" + IP);
                Response.Redirect("thankyourba.aspx?TPResponse=6");  //redirect to thank you with error message
            }



            try
            {

                if (Convert.ToString(Session["Submissionid"]) == "-1" || Session["Submissionid"] == null)
                {
                    // COMMENT OUT FOR TESTING ONLY

                    Response.Redirect("Rbaw40-OSa.aspx");  //redirect to step 1 if Submissionid =-1,  meaning user completed and tried ot come back
                }
            }
            catch
            {
                f.saveResponseLog("OSPage3cLoadError: No submisssionID, USERIP:" + IP);

                // COMMENT OUT FOR TESTING ONLY

                Response.Redirect("Rbaw40-OSa.aspx");  //redirect to step 1 if we dont have a sessionid

            }



            if (!IsPostBack)
            {
                char[] Seperator = { ',' };

                ApptString = ApptString.Replace("\"", "");
                ApptString = ApptString.Replace("[", "");
                ApptString = ApptString.Replace("]", "");
                ApptString = ApptString.Replace("00:00", "00");//remove second
                ApptString = ApptString.Replace("\r\n", "");

                string[] Appts = ApptString.Split(Seperator);

                try
                {
                    DateTime FirstDate = Convert.ToDateTime(Appts[0]);

                    Calendar3.SelectedDate = FirstDate;
                }
                catch
                {
                    f.saveResponseLog("OSPage3cLoadError: No Appts (non valid date), USERIP:" + IP);
                    Response.Redirect("thankyourba.aspx?TPResponse=6");  //redirect to thank you with error message
                }
            }
            //Calendar3.TodaysDate = FirstDate;
            //Calendar3.SelectedDayStyle.CssClass = "DaySelected";
            //Calendar3.SelectedDayStyle.BackColor = System.Drawing.Color.Silver;

            // DateSelected.InnerText = FirstDate.ToLongDateString();

 


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


                //try
                //{
                //    populateOnlineSchedApptDatesByWeek(Session["ApptImes"].ToString());
                //}
                //catch(Exception apptsetex) 
                //{
                //    f.saveResponseLog("OSPage3ApptSetError:" + apptsetex.Message);                   
                //    Response.Redirect("Rbaw40-OS3.aspx");  //redirect to step 3 drop down versions if we have an error

                //}
            }
            catch (Exception OS3Pageex)
            {
                f.saveResponseLog("OSPage3LaodError:" + OS3Pageex.Message);

                // COMMENT OUT FOR TESTING ONLY

                Response.Redirect("Rbaw40-OSa.aspx");  //redirect to step 1 if we dont have correct session info
            }


            try
            {
                if (Request.QueryString["message"] == "NotAvailable")
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

            string ApptRadioValue = Request.Form["weekof"];

            if (ApptRadioValue == null)
            {
                ErrorMsg.Visible = true;
                BTNConfirmAppt.Enabled = true;
            }
            else
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

                String AppointmentDateTime = "";

                try
                {



                    string Datestring = "";

                    //HtmlGenericControl lControl = (HtmlGenericControl)FindControl(ApptRadioValue);

                    String LableId;

 
                    LableId = "ih" + ApptRadioValue;

                    HtmlInputHidden inputcontrol = FindControl(LableId) as System.Web.UI.HtmlControls.HtmlInputHidden;



                    Datestring = inputcontrol.Value;

                    Datestring = Datestring.Replace("\"", "");
                    Datestring = Datestring.Replace("[", "");
                    Datestring = Datestring.Replace("]", "");
                    Datestring = Datestring.Replace("\r\n", "");
                    Datestring = Datestring.Trim();




                    AppointmentDateTime = Datestring;
                }
                catch (Exception Apptset)
                {
                    f.saveResponseLog("OSPage3ApptError:" + Apptset.Message);

                    // COMMENT OUT FOR TESTING ONLY

                    Response.Redirect("Rbaw40-OSa.aspx");  //redirect to step 1
                }

                if (AppointmentDateTime == "")
                {
                    f.saveResponseLog("OSPage3ApptError Appt Date empty");
                    Response.Redirect("Rbaw40-OS3c.aspx");  //redirect to step 3c
                }


                bool IsTest = false;
                try
                {
                    if (fp.strIsTest == "1")
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


                f.UpdateOnlineSchedAppttoDB(Convert.ToInt32(fp.strLeadID), fp.IntOnlineLeadId, response, AppointmentDateTime, PhoneButton);

                // string response = "success";
                if (response.Contains("not available"))
                {
                    //Remove selected Appointment from list when its not available
                    try
                    {
                        String Currentappts = Session["ApptImes"].ToString();
                         f.saveResponseLog("OS3c appt not Avail Current appts: " + Currentappts);


                      Currentappts =  Currentappts.Replace(AppointmentDateTime, "");  //remove appointment from list
                      Currentappts =  Currentappts.Replace(",,", ",");                //Remove extra comma
                       Currentappts =  Currentappts.Replace("\"\",","");                //Remove extra doble quote and comma
                       
                        f.saveResponseLog("OS3c appt not Avail New appts: " + Currentappts);

                        Session["ApptImes"] = Currentappts;                    
                    }
                    catch(Exception exnotavail) 
                    {
                        f.saveResponseLog("OS3c appt not availble removal error " + exnotavail.Message);
                    }
                    Response.Redirect("Rbaw40-OS3c.aspx?message=NotAvailable");
                }
                else if (response.Contains("No Response Returned") || response.Contains("error"))
                {
                    Session["TPResponse"] = 6;
                    Session["Submissionid"] = "-1";  //Clear SessionId
                    Response.Redirect("ThankYouDup.aspx?Response=6");

                }
                else if (response.Contains("success"))
                {
                    Session["TPResponse"] = 7;
                    Session["AppointmentBookedFor"] = AppointmentDateTime;
                    Session["Submissionid"] = "-1";  //Clear SessionId
                    Session["ApptImes"] = null;
                    Response.Redirect("ThankyouRba.aspx");
                }
                else
                {
                    Session["TPResponse"] = 6;
                    Session["Submissionid"] = "-1";  //Clear SessionId
                    Response.Redirect("ThankYouDup.aspx?Response=6");
                }
            }
        }

        #region Populate Appt Dates and Times -
        public void populateOnlineSchedApptDatesByWeek(String ApptString)
        {
            //char[] Seperator = { ',' };

            //ApptString = ApptString.Replace("\"", "");
            //ApptString = ApptString.Replace("[", "");
            //ApptString = ApptString.Replace("]", "");
            //ApptString = ApptString.Replace("00:00", "00");//remove second
            //ApptString = ApptString.Replace("\r\n", "");

            //string[] Appts = ApptString.Split(Seperator);
            //Array.Sort(Appts, StringComparer.CurrentCultureIgnoreCase);

            //DateTime today = DateTime.Now;

            //String DateString1;
            //String DateString1value;

          

            //DateTime NextSunday = DateTime.Now.AddDays(7 - ((int)DateTime.Now.DayOfWeek));
            //DateTime Sundayweek2 = DateTime.Now.AddDays(14 - ((int)DateTime.Now.DayOfWeek));
            //DateTime Sundayweek3 = DateTime.Now.AddDays(21 - ((int)DateTime.Now.DayOfWeek));

            //DateTime[] DateArray = new DateTime[Appts.Length];

            ////If we have too many appoinments move to drop down page
            //if (Appts.Length>40)
            //{
            //    Response.Redirect("RbaW40-OS3.aspx", false);
            //}
            //else 
            //{ 

            //    for (int d = 0; d < Appts.Length; d++)
            //    {
            //        DateString1 = Appts[d];


            //        DateString1 = DateString1.Replace("\"", "");
            //        DateString1 = DateString1.Replace("[", "");
            //        DateString1 = DateString1.Replace("]", "");
            //        DateString1 = DateString1.Replace("00:00", "00");//remove seconds

            //        DateArray[d] = Convert.ToDateTime(DateString1);

            //    }
            //    Array.Sort(DateArray, StringComparer.CurrentCultureIgnoreCase);

            //    int week2 = 1;
            //    int week3 = 1;

            //        for (int i = 1; i < DateArray.Length; i++)
            //        {

            //            DateString1value = DateArray[i - 1].ToString();
            //            DateString1 = DateArray[i - 1].ToString();

            //            DateString1value = DateString1value.Replace("\"", "");
            //            DateString1value = DateString1value.Replace("[", "");
            //            DateString1value = DateString1value.Replace("]", "");
            //            DateString1value = DateString1value.Replace("\r\n", "");
            //            DateString1value = DateString1value.Trim();

            //            string divname = "";
            //            string Inputname = "";
            //            string LabelName = "";
            //            if (Convert.ToDateTime(DateString1) < NextSunday)
            //            {

            //                //Week1
            //                divname = "wk1d" + i.ToString();
            //                Inputname = "wk1r" + i.ToString();
            //                LabelName = "wk1L" + i.ToString();
            //            }
            //            else if (Convert.ToDateTime(DateString1) >= NextSunday && Convert.ToDateTime(DateString1) < Sundayweek2)
            //            {

            //                //Week2
            //                divname = "wk2d" + week2.ToString();
            //                Inputname = "wk2r" + week2.ToString();
            //                LabelName = "wk2L" + week2.ToString();
            //                Week2h.Visible = true;
            //                week2++;
            //            }
            //            else if (Convert.ToDateTime(DateString1) >= Sundayweek2 && Convert.ToDateTime(DateString1) < Sundayweek3)
            //            {
            //                //Week3
            //                divname = "wk3d" + week3.ToString();
            //                Inputname = "wk3r" + week3.ToString();
            //                LabelName = "wk3L" + week3.ToString();
            //                Week3h.Visible = true;
            //                week3++;
            //            }


            //            Control divcontrol = FindControl(divname);
            //            //                HtmlInputRadioButton inputcontrol = FindControl(Inputname) as System.Web.UI.HtmlControls.HtmlInputRadioButton;
            //            //  HtmlInputControl ControlApptDate = FindControl("SelectedApptDate") as System.Web.UI.HtmlControls.HtmlInputControl;
            //            HtmlGenericControl lControl = (HtmlGenericControl)FindControl(LabelName);
            //            divcontrol.Visible = true;


            //            //inputcontrol.Value = DateString1value;
            //            lControl.InnerText = DateString1;

            //    }




          //  }

        }
        #endregion

        protected void ShowTime( DateTime SelectedDate)
        {
      
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
               
            //DateSelected.InnerText = Calendar3.SelectedDate.ToLongDateString();

            //ShowTime(Calendar3.SelectedDate);
        }

        protected void Calendar3_DayRender(object sender, DayRenderEventArgs e)
        {
            try
            {


                string divname = "";
                string Inputname = "";
                string LabelName = "";

                String ApptString = Session["ApptImes"].ToString();
                char[] Seperator = { ',' };

                ApptString = ApptString.Replace("\"", "");
                ApptString = ApptString.Replace("[", "");
                ApptString = ApptString.Replace("]", "");
                ApptString = ApptString.Replace("00:00", "00");//remove second
                ApptString = ApptString.Replace("\r\n", "");

                string[] Appts = ApptString.Split(Seperator);
                Array.Sort(Appts, StringComparer.CurrentCultureIgnoreCase);

                DateTime today = DateTime.Now;

                String DateString1;
                String DateString1value;

                DateTime SelectedDate = Calendar3.SelectedDate;
                DateSelected.InnerText = Calendar3.SelectedDate.ToLongDateString();
                Calendar3.SelectedDayStyle.BackColor = System.Drawing.Color.Silver;


                e.Day.IsSelectable = false;
                e.Cell.CssClass = "DayDisabled";


                if (e.Day.Date < DateTime.Now)
                {
                    e.Day.IsSelectable = false;
                    e.Cell.CssClass = "DayDisabled";
                }
                else
                {
                    int TimeCount = 1;
                    foreach (string ddate in Appts)
                    {
                        DateTime ApptDate = Convert.ToDateTime(ddate);

                        if (ApptDate.ToShortDateString() == e.Day.Date.ToShortDateString())
                        {
                            e.Day.IsSelectable = true;
                            e.Cell.CssClass = "DayActive";
                        }




                        if (ApptDate.ToShortDateString() == SelectedDate.ToShortDateString())
                        {

                            if (e.Day.Date.ToShortDateString() == SelectedDate.ToShortDateString())
                            {
                                e.Cell.CssClass = "DaySelected";
                            }


                            DateString1 = ApptDate.ToString();

                            divname = "Time" + TimeCount.ToString();
                            Inputname = "ih" + TimeCount.ToString();
                            LabelName = "Label" + TimeCount.ToString();
                            HtmlGenericControl lControl = (HtmlGenericControl)FindControl(LabelName);



                            HtmlInputHidden inputcontrol = FindControl(Inputname) as System.Web.UI.HtmlControls.HtmlInputHidden;
                            inputcontrol.Value = ddate;
                            lControl.InnerText = ApptDate.ToShortTimeString();


                            Control divcontrol = FindControl(divname);
                            divcontrol.Visible = true;

                            //Button lControl = (Button)FindControl(Inputname);

                            //lControl.Text =  ApptDate.ToShortTimeString();

                            TimeCount++;
                        }
                    }
                }
            }
            catch (Exception apptsetex)
            {
                f.saveResponseLog("OSPage3ApptSetError:" + apptsetex.Message);
                Response.Redirect("Rbaw40-OS3c.aspx");  //redirect to step 3 drop down versions if we have an error

            }
        }
       }
}