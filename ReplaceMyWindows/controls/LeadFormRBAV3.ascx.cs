﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFromRBAV3 : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();
        FormProperties fp = new FormProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SessionStart"] = DateTime.Now;
            }
            string domainName = HttpContext.Current.Request.Url.ToString().ToLower();
            if (domainName.Contains("low-e-replacementwindows"))
            {
                TCPADomain.InnerText = "Low-E-ReplacementWindows.com";
            }
            else if (domainName.Contains("expertwindows.com"))
            { 
                TCPADomain.InnerText = "expertwindows.com";

            }


            fp.strCtSource = "0";
            fp.strAppPath = Request.PhysicalApplicationPath;
            fp.strIsTest = "0";
            fp.strCampaignID = "1202";
            if (Request.QueryString["Offerid"] != null)
            {
                Session["Offerid"] = Request.QueryString["Offerid"].ToString();
            }
            if (Request.QueryString["s2"] != null)
            {
                fp.strs2ID = Request.QueryString["s2"].ToString();
            }
            if (Request.QueryString["s3"] != null)
            {
                fp.strs3ID = Request.QueryString["s3"].ToString();
            }

            //  f.populateStates(ddlStates);

            if (Request.QueryString["ctsource"] != null)
            {
                fp.strCtSource = Request.QueryString["ctsource"].ToString();
            }
            else
            {
                fp.strCtSource = "0";
            }
            if (Request.QueryString["test"] != null)
            {
                fp.strIsTest = Request.QueryString["test"].ToString();
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
            if ((Request.QueryString["zip"] != null) && !Request.QueryString["zip"].Contains("ZIPCODE"))
            {
                txtZipCode.Text = Request.QueryString["zip"].ToString();
            }
            if (Request.QueryString["city"] != null)
            {
                txtCity.Text = Request.QueryString["city"].ToString();
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
            if ((Request.QueryString["state"] != null))
            {
                txtState.Text = Request.QueryString["state"].ToString();
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
        }

        public void validatephone(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string ValidateResponse;
            ValidateResponse = "";

            args.IsValid = true;

            ValidateResponse = f.ValidateLead_melissadata(txtStreet.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtEmail.Text, txtPhone.Text, "118709003");
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
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                //try
                //{
                //    string fullName = txtFirstName.Text;
                //    var names = fullName.Split(' ');
                //    firstName = names[0];
                //    lastName = names[1];
                //}
                //catch
                //{
                //    firstName = txtFirstName.Text;
                //    lastName = txtFirstName.Text;
                //}


                string TCPAText = "";
                try
                {

                    var sb = new StringBuilder();
                    tcpa.RenderControl(new HtmlTextWriter(new StringWriter(sb)));

                    TCPAText = sb.ToString();
                    sb = null;
                }catch
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

                int response = f.sendLead(firstName, lastName, txtEmail.Text, txtStreet.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtPhone.Text, "", ddlNumWindows.SelectedValue, TCPAText,"", leadid_token.Value, useragent, browser,ref fp, APToken,1);
                
                // set Session Variables for ThankyouPage
                Session["strEmail"] = fp.strEmail;
                Session["strLeadID"] = fp.strLeadID;
                Session["strs2ID"] = fp.strs2ID;
                Session["strs3ID"] = fp.strs3ID;
                Session["strLocationID"] = fp.strLocationID;
                Session["DGBathZip"] = fp.StrDGBathZip;
                Session["BTGZip"] = fp.StrBTGZip;

                fp = null;
                if (response == 0)
                {
                    Response.Redirect("ThankYouRBA.aspx");
                }
                else if (response == 4)
                {
                    Response.Redirect("ThankYouDup.aspx");
                }
                else
                {
                    Response.Redirect("ThankYouRBANA.aspx");
                }
            }
        }
    }
}