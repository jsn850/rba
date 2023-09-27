using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormVendor : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            FormProperties.strAppPath = Request.PhysicalApplicationPath;
            f.populateStates(ddlStates);
            FormProperties.strCtSource = "0";
            FormProperties.strIsTest = "0";
            FormProperties.strCampaignID = "1202";
            if (Request.QueryString["ctsource"] != null)
            {
                FormProperties.strCtSource = Request.QueryString["ctsource"].ToString();
            }
            else
            {
                FormProperties.strCtSource = "0";
            }
            if (Request.QueryString["test"] != null)
            {
                FormProperties.strIsTest = Request.QueryString["test"].ToString();
            }
            if (Request.UrlReferrer != null)
            {
                FormProperties.strReferralURL = Request.UrlReferrer.ToString();
            }
            if (Request.QueryString["ctcampaign"] != null)
            {
                FormProperties.strCtCampaign = Request.QueryString["ctcampaign"].ToString();
            }
            if (Request.QueryString["eccmp"] != null)
            {
                FormProperties.strCtCampaign = Request.QueryString["eccmp"].ToString();
            }
            if (Request.QueryString["ctkwd"] != null)
            {
                FormProperties.strCtKwd = Request.QueryString["ctkwd"].ToString();
            }
            if (Request.QueryString["eckwd"] != null)
            {
                FormProperties.strCtKwd = Request.QueryString["eckwd"].ToString();
            }
            if ((Request.QueryString["zip"] != null) && !Request.QueryString["zip"].Contains("ZIPCODE"))
            {
                txtZipCode.Text = Request.QueryString["zip"].ToString();
            }
            if (Request.QueryString["city"] != null)
            {
                txtCity.Text = Request.QueryString["city"].ToString();
            }
            if (Request.QueryString["fname"] != null)
            {
                txtFirstName.Text = Request.QueryString["fname"].ToString();
            }
            if (Request.QueryString["lname"] != null)
            {
                txtLastName.Text = Request.QueryString["lname"].ToString();
            }
            if (Request.QueryString["street"] != null)
            {
                txtStreet.Text = Request.QueryString["street"].ToString();
            }
            if (Request.QueryString["email"] != null)
            {
                txtEmail.Text = Request.QueryString["email"].ToString();
            }
            if ((Request.QueryString["phone"] != null) && (Request.QueryString["phone"].Contains("-")))
            {
                txtPhone.Text = Request.QueryString["phone"].ToString();
            }
            try
            {
                if (Request.QueryString["state"] != null)
                {


                    ddlStates.SelectedIndex = ddlStates.Items.IndexOf(ddlStates.Items.FindByValue(Request.QueryString["state"].ToString().ToUpper()));

                    if (ddlStates.SelectedIndex <= 0)
                    {
                        string inString = Request.QueryString["state"].ToString();
                        TextInfo cultInfo = new CultureInfo("en-US", false).TextInfo;
                        string output = cultInfo.ToTitleCase(inString);

                        ddlStates.SelectedIndex = ddlStates.Items.IndexOf(ddlStates.Items.FindByText(output));
                    }


                }
            }
            catch { }


            FormProperties.strIpAddress = Request.UserHostAddress.ToString();

            string domainName = HttpContext.Current.Request.Url.ToString().ToLower();
            if (domainName.Contains("low-e-replacementwindows"))
            {
                DiscDomain.InnerText = "Low-E-ReplacementWindows.com";

            }
        }

        public void validatephone(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string ValidateResponse;
            ValidateResponse = "";

            args.IsValid = true;





            ValidateResponse = f.ValidateLead_melissadata(txtStreet.Text, txtCity.Text, ddlStates.SelectedValue, txtZipCode.Text, txtEmail.Text, txtPhone.Text, "118709003");
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


                int response = f.sendLead(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtStreet.Text, txtCity.Text, ddlStates.SelectedValue, txtZipCode.Text, txtPhone.Text, ddlBestTimetoCall.SelectedValue, ddlNumWindows.SelectedValue, TCPAText,TxtLeadID.Text, useragent, browser);
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