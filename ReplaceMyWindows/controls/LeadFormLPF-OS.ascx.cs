﻿using EllipticCurve;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormLPF_OS : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();
        FormProperties fp = new FormProperties();
        public int Locationid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Url.AbsoluteUri.ToLower().Contains("military"))
            {
                fp.BoolIsMilitary = true;
            }

            if (!IsPostBack)
            {
                Session["SessionStart"] = DateTime.Now;
            }
            fp.strAppPath = Request.PhysicalApplicationPath;
            //   f.populateStates(ddlStates, Request.PhysicalApplicationPath);

            try
            {
                f.populateApptDates(DDlApptTime);
            }
            catch { }
            fp.strCtSource = "0";
            fp.strIsTest = "0";
            fp.strCampaignID = "1202";
            if (Request.QueryString["Offerid"] != null)
            {
                Session["Offerid"] = Request.QueryString["Offerid"].ToString();
                fp.StrOfferId= Request.QueryString["Offerid"].ToString();
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
                Session["strCtSource"]= Request.QueryString["ctsource"].ToString();
            }
            if (Request.QueryString["ecsource"] != null)
            {
                fp.strCtSource = Request.QueryString["ecsource"].ToString();
                Session["strCtSource"]= Request.QueryString["ecsource"].ToString();
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
                fp.StrEcAdid =  Request.QueryString["ecadid"].ToString();
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
                try
                {
                    PrefApptTime = DDlApptTime.SelectedValue;
                }
                catch { }



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
                    Response.Redirect("Rbaw40-OS2b.aspx");
                }
                else
                {
                    Response.Redirect("ThankYouRBANA.aspx");
                }
            }
        }


    }
}