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
    public partial class LeadFormRBAV4 : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string domainName = HttpContext.Current.Request.Url.ToString().ToLower();
            if (domainName.Contains("low-e-replacementwindows"))
            {
                TCPADomain.InnerText = "Low-E-ReplacementWindows.com";
            }


            FormProperties.strCtSource = "0";
            FormProperties.strAppPath = Request.PhysicalApplicationPath;
            FormProperties.strIsTest = "0";
            FormProperties.strCampaignID = "1202";
            //  f.populateStates(ddlStates);

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
            if ((Request.QueryString["state"] != null))
            {
                txtState.Text = Request.QueryString["state"].ToString();
            }
            FormProperties.strIpAddress = Request.UserHostAddress.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string useragent = string.Empty;
            string browser = string.Empty;
            useragent = Request.UserAgent;
            browser = Request.Browser.Browser;

            try
            {
                string ValidateResponse;
                ValidateResponse = "";

                ValidateResponse = f.ValidateLead_melissadata(txtStreet.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtEmail.Text, txtPhone.Text, "118709003");

                //if (ValidateResponse.Contains("PE"))
                //{
                //    Page.IsValid == false;
                //}
            }
            catch 
            {

            }

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
                }
                catch
                {

                    TCPAText = "";
                }

                int response = f.sendLead(firstName, lastName, txtEmail.Text, txtStreet.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtPhone.Text, "", ddlNumWindows.SelectedValue, TCPAText,"", leadid_token.Value, useragent, browser);
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