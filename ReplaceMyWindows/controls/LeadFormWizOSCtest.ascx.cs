using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormWizOSCtest : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();
        FormProperties fp = new FormProperties();
        public int Locationid = 0;

        //public string ApptTimes { get; set; }
        public string[] ApptTimes { get; set; }

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["CurrentStep"] == null)
        //    {
        //        Session["CurrentStep"] = 1;
        //    }

        //    int CurrentStep = (int)Session["CurrentStep"];

        //    switch (CurrentStep)
        //    {
        //        case 1:
        //            LoadStep1();
        //            break;

        //        case 2:
        //            LoadStep2();
        //            break;

        //        case 3:
        //            LoadStep3();
        //            break;
        //    }
        //}

        protected override void OnInit(EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentStep"] == null)
            {
                Session["CurrentStep"] = 3;
            }

            int CurrentStep = (int)Session["CurrentStep"];

            switch (CurrentStep)
            {
                case 1:
                        if (!IsPostBack)
                        {
                            Session["SessionStart"] = DateTime.Now;
                        }
                        fp.strAppPath = Request.PhysicalApplicationPath;
                        fp.strCtSource = "0";
                        fp.strIsTest = "0";
                        fp.strCampaignID = "1202";
                        if (Request.QueryString["Offerid"] != null)
                        {
                            Session["Offerid"] = Request.QueryString["Offerid"].ToString();
                            fp.StrOfferId = Request.QueryString["Offerid"].ToString();
                        }
                        if (Request.QueryString["s2"] != null)
                        {
                            fp.strs2ID = Request.QueryString["s2"].ToString();
                        }
                        if (Request.QueryString["s3"] != null)
                        {
                            fp.strs3ID = Request.QueryString["s3"].ToString();
                        }
                        if (Request.QueryString["ctsource"] != null)
                        {
                            fp.strCtSource = Request.QueryString["ctsource"].ToString();
                            Session["strCtSource"] = Request.QueryString["ctsource"].ToString();
                        }
                        if (Request.QueryString["ecsource"] != null)
                        {
                            fp.strCtSource = Request.QueryString["ecsource"].ToString();
                            Session["strCtSource"] = Request.QueryString["ecsource"].ToString();
                        }
                        if (Request.QueryString["test"] != null)
                        {
                            fp.strIsTest = Request.QueryString["test"].ToString();
                            Session["isTesting"] = fp.strIsTest;
                        }
                        else
                        {
                            Session["isTesting"] = "0";
                            fp.strIsTest = "0";
                        }
                        if (Request.UrlReferrer != null)
                        {
                            fp.strReferralURL = Request.UrlReferrer.ToString();
                        }
                        if (Request.QueryString["ctcampaign"] != null)
                        {
                            fp.strCtCampaign = Request.QueryString["ctcampaign"].ToString();
                            Session["campid"] = Request.QueryString["ctcampaign"].ToString();
                        }
                        if (Request.QueryString["eccmp"] != null)
                        {
                            fp.strCtCampaign = Request.QueryString["eccmp"].ToString();
                            Session["campid"] = Request.QueryString["eccmp"].ToString();
                        }
                        if (Request.QueryString["ctkwd"] != null)
                        {
                            fp.strCtKwd = Request.QueryString["ctkwd"].ToString();
                            Session["ctkwd"] = Request.QueryString["ctkwd"].ToString();
                        }
                        if (Request.QueryString["ecsubid"] != null)
                        {
                            Session["ecsubid"] = Request.QueryString["ecsubid"].ToString();
                        }
                        if (Request.QueryString["eckwd"] != null)
                        {
                            fp.strCtKwd = Request.QueryString["eckwd"].ToString();
                        }
                        if ((Request.QueryString["zip"] != null) && !Request.QueryString["zip"].Contains("ZIPCODE") && Request.QueryString["zip"] != "")
                        {
                            txtZipCode.Text = Request.QueryString["zip"].ToString();
                        }
                        if (Request.QueryString["fname"] != null && Request.QueryString["fname"] != "")
                        {
                            txtFirstName.Text = Request.QueryString["fname"].ToString();
                        }
                        if (Request.QueryString["lname"] != null && Request.QueryString["lname"] != "")
                        {
                            txtLastName.Text = Request.QueryString["lname"].ToString();
                        }
                        if (Request.QueryString["street"] != null && Request.QueryString["street"] != "")
                        {
                            txtStreet.Text = Request.QueryString["street"].ToString();
                        }
                        if (Request.QueryString["email"] != null && Request.QueryString["email"] != "")
                        {
                            txtEmail.Text = Request.QueryString["email"].ToString();
                        }
                        if ((Request.QueryString["phone"] != null) && (Request.QueryString["phone"].Contains("-")))
                        {
                            txtPhone.Text = Request.QueryString["phone"].ToString();
                        }
                        fp.strIpAddress = Request.UserHostAddress.ToString();

                        if ((Request.QueryString["ecadid"] != null))
                        {
                            Session["EcAdid"] = Request.QueryString["ecadid"].ToString();
                        }
                        if ((Request.QueryString["reqses"] != null))
                        {
                            Session["reqses"] = Request.QueryString["reqses"].ToString();
                        }
                        //CJ EVENT Capture
                        try
                        {
                            if ((Request.QueryString["cjevent"] != null))
                            {
                                Session["cjevent"] = Request.QueryString["cjevent"].ToString();
                                fp.Strcjevent = Request.QueryString["cjevent"].ToString();
                            }
                        }
                        catch { }

                        string domainName = HttpContext.Current.Request.Url.ToString().ToLower();
                        if (domainName.Contains("low-e-replacementwindows"))
                        {
                            DiscDomain.InnerText = "Low-E-ReplacementWindows.com";

                        }
                        else if (domainName.Contains("expertwindows.com"))
                        {
                            DiscDomain.InnerText = "expertwindows.com";

                        }
                        else if (domainName.Contains("rbawindowoffers.com"))
                        {
                            DiscDomain.InnerText = "rbawindowoffers.com";

                        }
                        else if (domainName.Contains("qualitywindowsdirect.com"))
                        {
                            DiscDomain.InnerText = "qualitywindowsdirect.com";
                        }
                        else if (domainName.Contains("elitereplacementwindows.com"))
                        {
                            DiscDomain.InnerText = "elitereplacementwindows.com";
                        }
                    break;

                case 2:
                        if (!IsPostBack)
                        {
                            //try
                            //{
                            //    if (Convert.ToString(Session["Submissionid"]) == "-1")
                            //    {
                            //        // COMMENT OUT FOR TESTING ONLY

                            //        Session["CurrentStep"] = 1; // redirect to step 1 if Submissionid =-1,  meaning user completed and tried to come back
                            //    }

                            //    fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                            //    fp.StrSubmissionId = Convert.ToString(Session["Submissionid"]);
                            //    int OnlineId = f.InsertOSLeadStartSavetoDB(Convert.ToInt32(fp.strLeadID), fp.StrSubmissionId);

                            //    fp.IntOnlineLeadId = OnlineId;
                            //    Session["OnlineLeadId"] = fp.IntOnlineLeadId;

                            //    f.saveResponseLog("Online Sched step 2 Lead ID: " + fp.strLeadID);
                            //    f.saveResponseLog("Online Sched step 2 Lead ID: " + fp.StrSubmissionId);
                            //}
                            //catch (Exception osex2)
                            //{
                            //    f.saveResponseLog("Online Sched step 2 intialize failed: " + osex2.Message);

                            //Session["CurrentStep"] = 1; //redirect to step 1 if we dont have leadid or intial insert fails
                            ////Response.Redirect("Rbaw40-OSCtest.aspx");
                            //}
                        }
                    break;

                case 3:
                    string IP = Request.UserHostAddress.ToString();

                    Session["ApptImes"] = "[\"10/14/2023 10:00:00 AM\",\"10/14/2023 10:30:00 AM\",\"10/14/2023 2:00:00 PM\",\"10/14/2023 2:30:00 PM\",\"10/15/2023 10:00:00 AM\",\"10/15/2023 10:30:00 AM\",\"10/15/2023 2:00:00 PM\",\"10/15/2023 2:30:00 PM\",\"10/16/2023 10:00:00 AM\",\"10/16/2023 10:30:00 AM\",\"10/16/2023 2:00:00 PM\",\"10/16/2023 2:30:00 PM\",\"10/16/2023 6:00:00 PM\",\"10/16/2023 6:30:00 PM\",\"10/16/2023 7:00:00 PM\",\"10/17/2023 10:00:00 AM\",\"10/17/2023 10:30:00 AM\",\"10/17/2023 2:00:00 PM\",\"10/17/2023 2:30:00 PM\",\"10/17/2023 6:00:00 PM\",\"10/17/2023 6:30:00 PM\",\"10/17/2023 7:00:00 PM\",\"10/18/2023 2:00:00 PM\",\"10/18/2023 2:30:00 PM\",\"10/18/2023 6:00:00 PM\",\"10/18/2023 6:30:00 PM\",\"10/18/2023 7:00:00 PM\",\"10/19/2023 2:00:00 PM\",\"10/19/2023 2:30:00 PM\",\"10/19/2023 10:00:00 AM\",\"10/19/2023 10:30:00 AM\",\"10/19/2023 6:00:00 PM\",\"10/19/2023 6:30:00 PM\",\"10/19/2023 7:00:00 PM\",\"10/20/2023 2:00:00 PM\",\"10/20/2023 2:30:00 PM\",\"10/20/2023 10:00:00 AM\",\"10/20/2023 10:30:00 AM\",\"10/20/2023 6:00:00 PM\",\"10/20/2023 6:30:00 PM\",\"10/20/2023 7:00:00 PM\",\"10/22/2023 10:00:00 AM\",\"10/22/2023 10:30:00 AM\",\"10/22/2023 2:00:00 PM\",\"10/22/2023 2:30:00 PM\",\"10/22/2023 6:00:00 PM\",\"10/22/2023 6:30:00 PM\",\"10/22/2023 7:00:00 PM\",\"10/22/2023 10:00:00 AM\",\"10/22/2023 10:30:00 AM\",\"10/22/2023 2:00:00 PM\",\"10/22/2023 2:30:00 PM\",\"10/22/2023 6:00:00 PM\",\"10/22/2023 6:30:00 PM\",\"10/22/2023 7:00:00 PM\",\"10/23/2023 10:00:00 AM\",\"10/23/2023 10:30:00 AM\",\"10/23/2023 2:00:00 PM\",\"10/23/2023 2:30:00 PM\",\"10/23/2023 6:00:00 PM\",\"10/23/2023 6:30:00 PM\",\"10/23/2023 7:00:00 PM\"]";
                    String ApptString = "";
                    try
                    {
                        ApptString = Session["ApptImes"].ToString();
                    }
                    catch
                    {
                        f.saveResponseLog("OSPage3bLoadError: No session Appts, USERIP:" + IP);
                        //Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have a Session apptimes

                    }

                    if (ApptString.Length < 9)
                    {
                        //No available Appts
                        f.saveResponseLog("OSPage3bLoadError: No Appts (length less than 8), USERIP:" + IP);
                        //Response.Redirect("thankyourba.aspx?TPResponse=6");  //redirect to thank you with error message
                    } else
                    {
                        f.saveResponseLog(ApptString);
                    }



                    try
                    {

                        if (Convert.ToString(Session["Submissionid"]) == "-1" || Session["Submissionid"] == null)
                        {
                            //Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if Submissionid =-1,  meaning user completed and tried ot come back
                        }
                    }
                    catch
                    {
                        f.saveResponseLog("OSPage3bLoadError: No submisssionID, USERIP:" + IP);
                        //Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have a sessionid

                    }



                    if (!IsPostBack)
                    {
                        char[] Seperator = { ',' };

                        ApptString = ApptString.Replace("\"", "");
                        ApptString = ApptString.Replace("[", "");
                        ApptString = ApptString.Replace("]", "");
                        ApptString = ApptString.Replace("00:00", "00");//remove second
                        ApptString = ApptString.Replace("\r\n", "");

                        ApptTimes = ApptString.Split(Seperator);

                        hfApptTimes.Value = string.Join(",", ApptTimes);

                        //try
                        //{
                        //    DateTime FirstDate = Convert.ToDateTime(Appts[0]);

                        //    Calendar3.SelectedDate = FirstDate;
                        //}
                        //catch
                        //{
                        //    f.saveResponseLog("OSPage3bLoadError: No Appts (non valid date), USERIP:" + IP);
                        //    Response.Redirect("thankyourba.aspx?TPResponse=6");  //redirect to thank you with error message
                        //}
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
                        //Response.Redirect("Rbaw40-OS.aspx");  //redirect to step 1 if we dont have correct session info
                    }


                    
                    break;
            }
        }

        public void validatephone(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string ValidateResponse;
            ValidateResponse = "";

            args.IsValid = true;


            ValidateResponse = f.ValidateLead_melissadata(txtStreet.Text, "", "", txtZipCode.Text, txtEmail.Text, txtPhone.Text, "118709003");
            fp.strValidation = ValidateResponse;
            if (ValidateResponse.Contains("PE"))
            {
                args.IsValid = false;
                f.saveResponseLog("Phone Validation Error:" + ValidateResponse + " Phone: " + txtPhone.Text);
            }
        }

        protected void LoadStep1()
        {
            Session["CurrentStep"] = 1;

            if (!IsPostBack)
            {
                Session["SessionStart"] = DateTime.Now;
            }
            fp.strAppPath = Request.PhysicalApplicationPath;
            fp.strCtSource = "0";
            fp.strIsTest = "0";
            fp.strCampaignID = "1202";
            if (Request.QueryString["Offerid"] != null)
            {
                Session["Offerid"] = Request.QueryString["Offerid"].ToString();
                fp.StrOfferId = Request.QueryString["Offerid"].ToString();
            }
            if (Request.QueryString["s2"] != null)
            {
                fp.strs2ID = Request.QueryString["s2"].ToString();
            }
            if (Request.QueryString["s3"] != null)
            {
                fp.strs3ID = Request.QueryString["s3"].ToString();
            }
            if (Request.QueryString["ctsource"] != null)
            {
                fp.strCtSource = Request.QueryString["ctsource"].ToString();
                Session["strCtSource"] = Request.QueryString["ctsource"].ToString();
            }
            if (Request.QueryString["ecsource"] != null)
            {
                fp.strCtSource = Request.QueryString["ecsource"].ToString();
                Session["strCtSource"] = Request.QueryString["ecsource"].ToString();
            }
            if (Request.QueryString["test"] != null)
            {
                fp.strIsTest = Request.QueryString["test"].ToString();
                Session["isTesting"] = fp.strIsTest;
            }
            else
            {
                Session["isTesting"] = "0";
                fp.strIsTest = "0";
            }
            if (Request.UrlReferrer != null)
            {
                fp.strReferralURL = Request.UrlReferrer.ToString();
            }
            if (Request.QueryString["ctcampaign"] != null)
            {
                fp.strCtCampaign = Request.QueryString["ctcampaign"].ToString();
                Session["campid"] = Request.QueryString["ctcampaign"].ToString();
            }
            if (Request.QueryString["eccmp"] != null)
            {
                fp.strCtCampaign = Request.QueryString["eccmp"].ToString();
                Session["campid"] = Request.QueryString["eccmp"].ToString();
            }
            if (Request.QueryString["ctkwd"] != null)
            {
                fp.strCtKwd = Request.QueryString["ctkwd"].ToString();
                Session["ctkwd"] = Request.QueryString["ctkwd"].ToString();
            }
            if (Request.QueryString["ecsubid"] != null)
            {
                Session["ecsubid"] = Request.QueryString["ecsubid"].ToString();
            }
            if (Request.QueryString["eckwd"] != null)
            {
                fp.strCtKwd = Request.QueryString["eckwd"].ToString();
            }
            if ((Request.QueryString["zip"] != null) && !Request.QueryString["zip"].Contains("ZIPCODE") && Request.QueryString["zip"] != "")
            {
                txtZipCode.Text = Request.QueryString["zip"].ToString();
            }
            if (Request.QueryString["fname"] != null && Request.QueryString["fname"] != "")
            {
                txtFirstName.Text = Request.QueryString["fname"].ToString();
            }
            if (Request.QueryString["lname"] != null && Request.QueryString["lname"] != "")
            {
                txtLastName.Text = Request.QueryString["lname"].ToString();
            }
            if (Request.QueryString["street"] != null && Request.QueryString["street"] != "")
            {
                txtStreet.Text = Request.QueryString["street"].ToString();
            }
            if (Request.QueryString["email"] != null && Request.QueryString["email"] != "")
            {
                txtEmail.Text = Request.QueryString["email"].ToString();
            }
            if ((Request.QueryString["phone"] != null) && (Request.QueryString["phone"].Contains("-")))
            {
                txtPhone.Text = Request.QueryString["phone"].ToString();
            }
            fp.strIpAddress = Request.UserHostAddress.ToString();

            if ((Request.QueryString["ecadid"] != null))
            {
                Session["EcAdid"] = Request.QueryString["ecadid"].ToString();
            }
            if ((Request.QueryString["reqses"] != null))
            {
                Session["reqses"] = Request.QueryString["reqses"].ToString();
            }
            //CJ EVENT Capture
            try
            {
                if ((Request.QueryString["cjevent"] != null))
                {
                    Session["cjevent"] = Request.QueryString["cjevent"].ToString();
                    fp.Strcjevent = Request.QueryString["cjevent"].ToString();
                }
            }
            catch { }

            string domainName = HttpContext.Current.Request.Url.ToString().ToLower();
            if (domainName.Contains("low-e-replacementwindows"))
            {
                DiscDomain.InnerText = "Low-E-ReplacementWindows.com";

            }
            else if (domainName.Contains("expertwindows.com"))
            {
                DiscDomain.InnerText = "expertwindows.com";

            }
            else if (domainName.Contains("rbawindowoffers.com"))
            {
                DiscDomain.InnerText = "rbawindowoffers.com";

            }
            else if (domainName.Contains("qualitywindowsdirect.com"))
            {
                DiscDomain.InnerText = "qualitywindowsdirect.com";
            }
            else if (domainName.Contains("elitereplacementwindows.com"))
            {
                DiscDomain.InnerText = "elitereplacementwindows.com";
            }
        }
        protected void LoadStep2()
        {
            Session["CurrentStep"] = 2;

            if (!IsPostBack)
            {
                try
                {
                    if (Convert.ToString(Session["Submissionid"]) == "-1")
                    {
                        // COMMENT OUT FOR TESTING ONLY

                        Session["CurrentStep"] = 1; // redirect to step 1 if Submissionid =-1,  meaning user completed and tried to come back
                    }

                    fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                    fp.StrSubmissionId = Convert.ToString(Session["Submissionid"]);
                    int OnlineId = f.InsertOSLeadStartSavetoDB(Convert.ToInt32(fp.strLeadID), fp.StrSubmissionId);

                    fp.IntOnlineLeadId = OnlineId;
                    Session["OnlineLeadId"] = fp.IntOnlineLeadId;

                    f.saveResponseLog("Online Sched step 2 Lead ID: " + fp.strLeadID);
                    f.saveResponseLog("Online Sched step 2 Lead ID: " + fp.StrSubmissionId);
                }
                catch (Exception osex2)
                {
                    f.saveResponseLog("Online Sched step 2 intialize failed: " + osex2.Message);

                    Session["CurrentStep"] = 3;
                    Response.Redirect("Rbaw40-OSCtest.aspx"); //redirect to step 1 if we dont have leadid or intial insert fails
                }
            }
            
        }
        protected void LoadStep3()
        {
            Session["CurrentStep"] = 3;

            string IP = Request.UserHostAddress.ToString();
            // UNCOMMENT FOR TESTING ONLY
            //Session["ApptImes"] = "[\"10/14/2023 10:00:00 AM\",\"10/14/2023 10:30:00 AM\",\"10/14/2023 2:00:00 PM\",\"10/14/2023 2:30:00 PM\",\"10/15/2023 10:00:00 AM\",\"10/15/2023 10:30:00 AM\",\"10/15/2023 2:00:00 PM\",\"10/15/2023 2:30:00 PM\",\"10/16/2023 10:00:00 AM\",\"10/16/2023 10:30:00 AM\",\"10/16/2023 2:00:00 PM\",\"10/16/2023 2:30:00 PM\",\"10/16/2023 6:00:00 PM\",\"10/16/2023 6:30:00 PM\",\"10/16/2023 7:00:00 PM\",\"10/17/2023 10:00:00 AM\",\"10/17/2023 10:30:00 AM\",\"10/17/2023 2:00:00 PM\",\"10/17/2023 2:30:00 PM\",\"10/17/2023 6:00:00 PM\",\"10/17/2023 6:30:00 PM\",\"10/17/2023 7:00:00 PM\",\"10/18/2023 2:00:00 PM\",\"10/18/2023 2:30:00 PM\",\"10/18/2023 6:00:00 PM\",\"10/18/2023 6:30:00 PM\",\"10/18/2023 7:00:00 PM\",\"10/19/2023 2:00:00 PM\",\"10/19/2023 2:30:00 PM\",\"10/19/2023 10:00:00 AM\",\"10/19/2023 10:30:00 AM\",\"10/19/2023 6:00:00 PM\",\"10/19/2023 6:30:00 PM\",\"10/19/2023 7:00:00 PM\",\"10/20/2023 2:00:00 PM\",\"10/20/2023 2:30:00 PM\",\"10/20/2023 10:00:00 AM\",\"10/20/2023 10:30:00 AM\",\"10/20/2023 6:00:00 PM\",\"10/20/2023 6:30:00 PM\",\"10/20/2023 7:00:00 PM\",\"10/22/2023 10:00:00 AM\",\"10/22/2023 10:30:00 AM\",\"10/22/2023 2:00:00 PM\",\"10/22/2023 2:30:00 PM\",\"10/22/2023 6:00:00 PM\",\"10/22/2023 6:30:00 PM\",\"10/22/2023 7:00:00 PM\",\"10/22/2023 10:00:00 AM\",\"10/22/2023 10:30:00 AM\",\"10/22/2023 2:00:00 PM\",\"10/22/2023 2:30:00 PM\",\"10/22/2023 6:00:00 PM\",\"10/22/2023 6:30:00 PM\",\"10/22/2023 7:00:00 PM\",\"10/23/2023 10:00:00 AM\",\"10/23/2023 10:30:00 AM\",\"10/23/2023 2:00:00 PM\",\"10/23/2023 2:30:00 PM\",\"10/23/2023 6:00:00 PM\",\"10/23/2023 6:30:00 PM\",\"10/23/2023 7:00:00 PM\"]";
            String ApptString = "";
            try
            {
                ApptString = Session["ApptImes"].ToString();
            }
            catch
            {
                f.saveResponseLog("OSPage3cLoadError: No session Appts, USERIP:" + IP);

                // COMMENT OUT FOR TESTING ONLY
                Session["CurrentStep"] = 1;
                Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 1 if we dont have a Session apptimes
            }

            if (ApptString.Length < 9)
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

                    Session["CurrentStep"] = 1;
                    Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 1 if Submissionid =-1,  meaning user completed and tried to come back
                }
            }
            catch
            {
                f.saveResponseLog("OSPage3cLoadError: No submisssionID, USERIP:" + IP);

                // COMMENT OUT FOR TESTING ONLY

                Session["CurrentStep"] = 1;
                Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 1 if we dont have a sessionid
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

                    //Calendar3.SelectedDate = FirstDate;
                }
                catch
                {
                    f.saveResponseLog("OSPage3cLoadError: No Appts (non valid date), USERIP:" + IP);
                    Response.Redirect("thankyourba.aspx?TPResponse=6");  //redirect to thank you with error message
                }
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
            }
            catch (Exception OS3Pageex)
            {
                f.saveResponseLog("OSPage3LaodError:" + OS3Pageex.Message);

                // COMMENT OUT FOR TESTING ONLY

                Session["CurrentStep"] = 1;
                Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 1 if we dont have correct session info
            }


            //try
            //{
            //    if (Request.QueryString["message"] == "NotAvailable")
            //    {
            //        NotAvailMessage.Visible = true;
            //    }
            //}
            //catch { }
        }

        // Step 1 Submit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            string useragent = string.Empty;
            string browser = string.Empty;
            useragent = Request.UserAgent;
            browser = Request.Browser.Browser;

            if (Page.IsValid)
            {
                string TCPAText = "";
                try
                {
                    var sb = new StringBuilder();
                    tcpa.RenderControl(new HtmlTextWriter(new StringWriter(sb)));

                    TCPAText = sb.ToString();
                    sb = null;
                }
                catch
                {
                    TCPAText = "";
                }

                //Active Prospect Token
                string APToken = "";
                try
                {
                    APToken = Request.Form["xxTrustedFormToken"].ToString();
                }
                catch
                {
                    APToken = "";
                }

                string NumberofWindows = "3-10";

                int ConsultType = 1;

                string PrefApptTime = "";

                fp.strFirstName = txtFirstName.Text;
                fp.strLastName = txtLastName.Text;
                fp.strEmail = txtEmail.Text;
                fp.strStreet = txtStreet.Text;
                fp.strCity = "";
                fp.strState = "";
                fp.strZipCode = txtZipCode.Text;
                fp.strPhoneNumber = txtPhone.Text;
                fp.strBestTimetoCall = "No Preference";
                fp.strNumberofWindows = NumberofWindows;
                fp.strVendorLeadID = "";
                fp.StrConsultType = ConsultType.ToString();
                fp.strCtSourceName = "direct_email_ECEM_Converge_-_Email";
                fp.StrPreFAppt = "";

                if (fp.strState == "" && fp.strCity == "")
                {
                    //Get City and State form Zipcode
                    try
                    {
                        f.GetCity_State_fromZip(fp.strZipCode, ref fp);
                    }
                    catch { }
                }

                bool isTest = false;
                if ((txtLastName.Text.ToLower() == "test" || txtLastName.Text.ToLower() == "test") && (txtFirstName.Text.ToLower() == "test" || txtFirstName.Text.ToLower() == "test"))
                {
                    isTest = true;
                    fp.strIsTest = "1";
                }

                int Duplicate = 0;
                bool Litigator = false;

                //Litigator Check,  Set as dup if we have one
                String CheckLitigate = f.LitigatorCheck(0, txtPhone.Text);

                if (CheckLitigate.ToLower().Contains("true"))
                {
                    Duplicate = 1;
                    Litigator = true;
                }

                f.getEmailAddressforLead(ref fp, 0);

                int response = 0;

                //Set online Scheudliugn to true
                fp.BoolIsOnlineSched = true;

                response = f.sendLead(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtStreet.Text, "", "", txtZipCode.Text, txtPhone.Text, "No Preference", NumberofWindows, TCPAText, "", leadid_token.Value, useragent, browser, ref fp, APToken, ConsultType, PrefApptTime);


                //If Online Scheduling is true move user to next step
                if (fp.BoolIsOnlineSched)
                {
                    response = 5;
                    Session["Submissionid"] = fp.StrSubmissionId;
                    Session["SaleRepId"] = fp.IntSalesRepid;
                }

                // set Session Variables for ThankyouPage
                Session["strEmail"] = fp.strEmail;
                Session["strLeadID"] = fp.strLeadID;
                Session["strs2ID"] = fp.strs2ID;
                Session["strs3ID"] = fp.strs3ID;
                Session["strLocationID"] = fp.strLocationID;
                Session["zip"] = fp.strZipCode;
                Session["Address"] = fp.strStreet;
                Session["city"] = fp.strCity;
                Session["State"] = fp.strState;
                Session["strPhone"] = fp.strPhoneNumber;
                Session["strfname"] = fp.strFirstName;
                Session["strLname"] = fp.strLastName;
                try
                {
                    Session["Journaya"] = leadid_token.Value;
                }
                catch { }

                fp = null;

                if (response == 0)
                {
                    Response.Redirect("ThankYouRBA.aspx");
                }
                else if (response == 4)
                {
                    Response.Redirect("ThankYouDup.aspx");
                }
                else if (response == 5)
                {
                    Session["CurrentStep"] = 2;
                    Response.Redirect("Rbaw40-OSCtest.aspx");
                }
                else
                {
                    Response.Redirect("ThankYouRBANA.aspx");
                }
            }
        }

        // Step 2 Submit
        protected void btnAddtlQuest_Click(object sender, EventArgs e)
        {
            f.saveResponseLog("STEP 2 BUTTON CLICKED");

            int response = 1;

            //String Concerns = "";
            //int Concerncount = 0;

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

            string Concerns = Request.Form["concerns"];
            string PropertyType = Request.Form["propertytype"];
            int howmanywindowsdoors = 0;
            int howmanydoors = 0;
            string materials = Request.Form["materials"];
            string WindowAge = Request.Form["windoorage"];
            fp.IntOnlineLeadId = 0;
            fp.IntSalesRepid = 0;

            try
            {
                howmanywindowsdoors = Convert.ToInt32(Request.Form["howmanywindowsdoors"]);
                howmanydoors = Convert.ToInt32(Request.Form["howmanydoors"]);
                fp.IntOnlineLeadId = Convert.ToInt32(Session["OnlineLeadId"]);
                fp.IntSalesRepid = Convert.ToInt32(Session["SaleRepId"]);

                f.saveResponseLog("Convert to integer success: \n howmanywindowsdoors: " + howmanywindowsdoors + "\n howmanydoors: " + howmanywindowsdoors + "\n IntOnlineLeadId: " + fp.IntOnlineLeadId + "\n fp.IntSalesRepid: " + fp.IntSalesRepid);
            }

            catch (Exception ex)
            {
                f.saveResponseLog("Convert to integer failed: " + ex.Message);
            }

            if (WindowAge == null)
            {
                WindowAge = "10-20 years";
            }

            if (Concerns == null)
            {
                Concerns = "None of the above";
            }


            string HomeOwner = Request.Form["HomeOwner"];

            string sFirstname = Request.Form["sFirstname"];
            string sLastname = Request.Form["sLastname"];
            string OtherIssues = Request.Form["other-issues"];

            //Default, nothign chosen
            if (OtherIssues == null)
            {
                OtherIssues = "None of the above";
            }

            string Address2 = "";

            try
            {
                fp.strIsTest = Convert.ToString(Session["isTesting"]);
                fp.strEmail = Convert.ToString(Session["strEmail"]);
                fp.strLeadID = Convert.ToString(Session["strLeadID"]);
                //fp.IntOnlineLeadId = Convert.ToInt32(Session["OnlineLeadId"]);
                fp.strLocationID = Convert.ToString(Session["strLocationID"]);
                fp.strZipCode = Convert.ToString(Session["zip"]);
                fp.strStreet = Convert.ToString(Session["Address"]);
                fp.strCity = Convert.ToString(Session["city"]);
                fp.strState = Convert.ToString(Session["State"]);
                fp.strPhoneNumber = Convert.ToString(Session["strPhone"]);
                fp.strFirstName = Convert.ToString(Session["strfname"]);
                fp.strLastName = Convert.ToString(Session["strLname"]);
                fp.StrSubmissionId = Convert.ToString(Session["Submissionid"]);
                //fp.IntSalesRepid = Convert.ToInt32(Session["SaleRepId"]);

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
            response = f.SaveOnlineSchedQuest(ref fp, Convert.ToInt32(fp.strLeadID), Convert.ToBoolean(HomeOwner), sFirstname, sLastname, fp.strStreet, Address2, fp.strCity, fp.strState, fp.strZipCode, "How Can WE Help", PropertyType, howmanywindowsdoors, howmanydoors, materials, WindowAge, Concerns, OtherIssues, "Comments", SessionTimeout, PhoneButton);

            Session["OnlineLeadId"] = fp.IntOnlineLeadId;
            Session["SaleRepId"] = fp.IntSalesRepid;
            Session["StrResultid"] = fp.IntResultId;
            Session["Submissionid"] = fp.StrSubmissionId;
            Session["ApptImes"] = fp.StrAvailableAppts;

            string Message = "";

            // Session["ApptImes"] ="['10/8/2022 2:00:00 PM','10/8/2022 6:00:00 PM','10/9/2022 10:00:00 AM','10/9/2022 2:00:00 PM','10/9/2022 6:00:00 PM','10/10/2022 10:00:00 AM','10/10/2022 2:00:00 PM','10/10/2022 6:00:00 PM','10/11/2022 2:00:00 PM','10/11/2022 6:00:00 PM','10/11/2022 10:00:00 AM','10/12/2022 10:00:00 AM','10/12/2022 2:00:00 PM','10/12/2022 6:00:00 PM','10/13/2022 10:00:00 AM','10/13/2022 2:00:00 PM','10/13/2022 6:00:00 PM']";

            if (response == 3) //Duplicate
            {
                f.saveResponseLog("OSCtest step 2 DUP");
                Session["TPResponse"] = 3;
                Response.Redirect("ThankYouDup.aspx?Response=3");
            }
            else
            if (response == 4) //Existing Appt
            {
                f.saveResponseLog("OSCtest step 2 Existing Appt");
                Session["TPResponse"] = 4;
                Session["AppointmentBookedFor"] = fp.StrPreFAppt;
                Response.Redirect("ThankYouDup.aspx?Response=4");
            }
            if (response == 5) //TimeOut
            {
                f.saveResponseLog("OSCtest step 2 DUP Timeout");
                Session["TPResponse"] = 5;
                Response.Redirect("ThankYouDup.aspx?Response=5");
            }
            if (response == 6) //Error
            {
                f.saveResponseLog("OSCtest step 2 ERROR");
                Session["TPResponse"] = 6;
                Response.Redirect("ThankYouDup.aspx?Response=6");
            }
            else
            {
                f.saveResponseLog("OSCtest step 2 saved");
                Session["CurrentStep"] = 3;
                Response.Redirect("Rbaw40-OSCtest.aspx");
            }
        }

        // Step 3 Submit

        //protected void btnSetAppt_Click(object sender, EventArgs e)
        //{

        //    string SesTimeOut = Request.Form["SesTimeOut"];
        //    string PhoneButtonClick = Request.Form["PhoneButtonClick"];
        //    bool SessionTimeout = false;
        //    if (SesTimeOut == "1")
        //    {
        //        SessionTimeout = true;
        //    }
        //    bool PhoneButton = false;
        //    if (PhoneButtonClick == "1")
        //    {
        //        PhoneButton = true;
        //    }
        //    if (SessionTimeout) //TimeOut
        //    {
        //        Session["TPResponse"] = 5;
        //        Response.Redirect("ThankYouDup.aspx?Response=5");
        //    }


        //    String AppointmentDateTime = DDlApptTime.SelectedValue;

        //    bool IsTest = false;
        //    try
        //    {
        //        if (fp.strIsTest == "1")
        //        {
        //            IsTest = true;
        //        }
        //    }
        //    catch { }
        //    string response = f.PostToEnabledOnlineSchedSetAppt(AppointmentDateTime, ref fp, IsTest);

        //    try
        //    {
        //        Convert.ToInt32(fp.strLeadID);
        //    }
        //    catch
        //    {
        //        fp.strLeadID = "0";
        //    }


        //    f.UpdateOnlineSchedAppttoDB(Convert.ToInt32(fp.strLeadID), fp.IntOnlineLeadId, response, AppointmentDateTime, PhoneButton);

        //    // string response = "success";
        //    if (response.Contains("not available"))
        //    {
        //        //Remove selected Appointment from list when its not available
        //        try
        //        {
        //            String Currentappts = Session["ApptImes"].ToString();
        //            f.saveResponseLog("OS3 appt not Avail Current appts: " + Currentappts);


        //            Currentappts = Currentappts.Replace(AppointmentDateTime, "");  //remove appointment from list
        //            Currentappts = Currentappts.Replace(",,", ",");                //Remove extra comma
        //            Currentappts = Currentappts.Replace("\"\",", "");                //Remove extra doble quote and comma

        //            f.saveResponseLog("OS3 appt not Avail New appts: " + Currentappts);

        //            Session["ApptImes"] = Currentappts;
        //        }
        //        catch (Exception exnotavail)
        //        {
        //            f.saveResponseLog("OS3 appt not availble removal error " + exnotavail.Message);
        //        }


        //        Response.Redirect("Rbaw40-OS3.aspx?message=NotAvailable");
        //    }
        //    else if (response.Contains("No Response Returned") || response.Contains("error"))
        //    {
        //        Session["TPResponse"] = 6;
        //        Response.Redirect("ThankYouDup.aspx?Response=6");

        //    }
        //    else if (response.Contains("success"))
        //    {
        //        Session["TPResponse"] = 7;
        //        Session["AppointmentBookedFor"] = AppointmentDateTime;
        //        Response.Redirect("ThankyouRba.aspx");
        //    }
        //    else
        //    {
        //        Session["TPResponse"] = 6;
        //        Response.Redirect("ThankYouDup.aspx?Response=6");
        //    }

        //}

        //protected void btnSetAppt_Click(object sender, EventArgs e)
        //{

        //    string ApptRadioValue = Request.Form["weekof"];

        //    if (ApptRadioValue == null)
        //    {
        //        ErrorMsg.Visible = true;
        //        BTNConfirmAppt.Enabled = true;
        //    }
        //    else
        //    {
        //        string SesTimeOut = Request.Form["SesTimeOut"];
        //        string PhoneButtonClick = Request.Form["PhoneButtonClick"];
        //        bool SessionTimeout = false;
        //        if (SesTimeOut == "1")
        //        {
        //            SessionTimeout = true;
        //        }
        //        bool PhoneButton = false;
        //        if (PhoneButtonClick == "1")
        //        {
        //            PhoneButton = true;
        //        }
        //        if (SessionTimeout) //TimeOut
        //        {
        //            Session["TPResponse"] = 5;
        //            Response.Redirect("ThankYouDup.aspx?Response=5");
        //        }

        //        String AppointmentDateTime = "";

        //        try
        //        {
        //            string Datestring = "";

        //            //HtmlGenericControl lControl = (HtmlGenericControl)FindControl(ApptRadioValue);

        //            String LableId;

        //            LableId = "ih" + ApptRadioValue;

        //            HtmlInputHidden inputcontrol = FindControl(LableId) as System.Web.UI.HtmlControls.HtmlInputHidden;

        //            Datestring = inputcontrol.Value;

        //            Datestring = Datestring.Replace("\"", "");
        //            Datestring = Datestring.Replace("[", "");
        //            Datestring = Datestring.Replace("]", "");
        //            Datestring = Datestring.Replace("\r\n", "");
        //            Datestring = Datestring.Trim();

        //            AppointmentDateTime = Datestring;
        //        }
        //        catch (Exception Apptset)
        //        {
        //            f.saveResponseLog("OSCtest Step 3 Appt Error: " + Apptset.Message);

        //            Session["CurrentStep"] = 1;
        //            Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 1
        //        }

        //        if (AppointmentDateTime == "")
        //        {
        //            f.saveResponseLog("OSCtest Step 3 Appt Error: Appt Date empty");

        //            Session["CurrentStep"] = 3;
        //            Response.Redirect("Rbaw40-OSCtest.aspx");  //redirect to step 3
        //        }

        //        bool IsTest = false;
        //        try
        //        {
        //            if (fp.strIsTest == "1")
        //            {
        //                IsTest = true;
        //            }
        //        }
        //        catch { }
        //        string response = f.PostToEnabledOnlineSchedSetAppt(AppointmentDateTime, ref fp, IsTest);

        //        try
        //        {
        //            Convert.ToInt32(fp.strLeadID);
        //        }
        //        catch
        //        {
        //            fp.strLeadID = "0";
        //        }

        //        f.UpdateOnlineSchedAppttoDB(Convert.ToInt32(fp.strLeadID), fp.IntOnlineLeadId, response, AppointmentDateTime, PhoneButton);

        //        // string response = "success";
        //        if (response.Contains("not available"))
        //        {
        //            //Remove selected Appointment from list when its not available
        //            try
        //            {
        //                String Currentappts = Session["ApptImes"].ToString();
        //                f.saveResponseLog("OSCtest appt not Avail Current appts: " + Currentappts);


        //                Currentappts = Currentappts.Replace(AppointmentDateTime, "");  //remove appointment from list
        //                Currentappts = Currentappts.Replace(",,", ",");                //Remove extra comma
        //                Currentappts = Currentappts.Replace("\"\",", "");                //Remove extra doble quote and comma

        //                f.saveResponseLog("OSCtest appt not Avail New appts: " + Currentappts);

        //                Session["ApptImes"] = Currentappts;
        //            }
        //            catch (Exception exnotavail)
        //            {
        //                f.saveResponseLog("OSCtest appt not availble removal error " + exnotavail.Message);
        //            }
        //            Session["CurrentStep"] = 3;
        //            Response.Redirect("Rbaw40-OSCtest.aspx?message=NotAvailable");
        //        }
        //        else if (response.Contains("No Response Returned") || response.Contains("error"))
        //        {
        //            Session["TPResponse"] = 6;
        //            Session["Submissionid"] = "-1";  //Clear SessionId
        //            Response.Redirect("ThankYouDup.aspx?Response=6");

        //        }
        //        else if (response.Contains("success"))
        //        {
        //            Session["TPResponse"] = 7;
        //            Session["AppointmentBookedFor"] = AppointmentDateTime;
        //            Session["Submissionid"] = "-1";  //Clear SessionId
        //            Session["ApptImes"] = null;
        //            Response.Redirect("ThankyouRba.aspx");
        //        }
        //        else
        //        {
        //            Session["TPResponse"] = 6;
        //            Session["Submissionid"] = "-1";  //Clear SessionId
        //            Response.Redirect("ThankYouDup.aspx?Response=6");
        //        }
        //    }
        //}

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

        protected void ShowTime(DateTime SelectedDate)
        {

        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {

            //DateSelected.InnerText = Calendar3.SelectedDate.ToLongDateString();

            //ShowTime(Calendar3.SelectedDate);
        }

        //protected void Calendar3_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    try
        //    {
        //        string divname = "";
        //        string Inputname = "";
        //        string LabelName = "";

        //        String ApptString = Session["ApptImes"].ToString();
        //        char[] Seperator = { ',' };

        //        ApptString = ApptString.Replace("\"", "");
        //        ApptString = ApptString.Replace("[", "");
        //        ApptString = ApptString.Replace("]", "");
        //        ApptString = ApptString.Replace("00:00", "00");//remove second
        //        ApptString = ApptString.Replace("\r\n", "");

        //        string[] Appts = ApptString.Split(Seperator);
        //        Array.Sort(Appts, StringComparer.CurrentCultureIgnoreCase);

        //        DateTime today = DateTime.Now;

        //        String DateString1;
        //        String DateString1value;

        //        DateTime SelectedDate = Calendar3.SelectedDate;
        //        DateSelected.InnerText = Calendar3.SelectedDate.ToLongDateString();
        //        Calendar3.SelectedDayStyle.BackColor = System.Drawing.Color.Silver;


        //        e.Day.IsSelectable = false;
        //        e.Cell.CssClass = "DayDisabled";


        //        if (e.Day.Date < DateTime.Now)
        //        {
        //            e.Day.IsSelectable = false;
        //            e.Cell.CssClass = "DayDisabled";
        //        }
        //        else
        //        {
        //            int TimeCount = 1;
        //            foreach (string ddate in Appts)
        //            {
        //                DateTime ApptDate = Convert.ToDateTime(ddate);

        //                f.saveResponseLog("ApptDate: " + ApptDate.ToString() + "\n"); 

        //                if (ApptDate.ToShortDateString() == e.Day.Date.ToShortDateString())
        //                {
        //                    e.Day.IsSelectable = true;
        //                    e.Cell.CssClass = "DayActive";
        //                }

        //                if (ApptDate.ToShortDateString() == SelectedDate.ToShortDateString())
        //                {

        //                    if (e.Day.Date.ToShortDateString() == SelectedDate.ToShortDateString())
        //                    {
        //                        e.Cell.CssClass = "DaySelected";
        //                    }

        //                    DateString1 = ApptDate.ToString();

        //                    divname = "Time" + TimeCount.ToString();
        //                    Inputname = "ih" + TimeCount.ToString();
        //                    LabelName = "Label" + TimeCount.ToString();
        //                    HtmlGenericControl lControl = (HtmlGenericControl)FindControl(LabelName);

        //                    HtmlInputHidden inputcontrol = FindControl(Inputname) as System.Web.UI.HtmlControls.HtmlInputHidden;
        //                    inputcontrol.Value = ddate;
        //                    lControl.InnerText = ApptDate.ToShortTimeString();


        //                    Control divcontrol = FindControl(divname);
        //                    divcontrol.Visible = true;

        //                    TimeCount++;
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception apptsetex)
        //    {
        //        f.saveResponseLog("OSPage3ApptSetError:" + apptsetex.Message);
        //        Response.Redirect("Rbaw40-OS3.aspx");  //redirect to step 3 drop down versions if we have an error
        //    }
        //}
    }
}