using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
    public partial class LeadFormLowE2 : System.Web.UI.UserControl
    {
        FormClass f = new FormClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            FormProperties.strCtSource = "0";
            FormProperties.strAppPath = Request.PhysicalApplicationPath;
            FormProperties.strIsTest = "0";
            FormProperties.strCampaignID = "1202";
            f.populateStates(ddlStates);

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
            if (Request.QueryString["zip"] != null)
            {
                txtZipCode.Text = Request.QueryString["zip"].ToString();
            }
            if (Request.QueryString["city"] != null)
            {
                txtCity.Text = Request.QueryString["city"].ToString();
            }
            FormProperties.strIpAddress = Request.UserHostAddress.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string useragent = string.Empty;
            string browser = string.Empty;
            useragent = Request.UserAgent;
            browser = Request.Browser.Browser;
            if (Page.IsValid)
            {
                int response = f.sendLead(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtStreet.Text, txtCity.Text, ddlStates.SelectedValue, txtZipCode.Text, txtPhone.Text, "", ddlNumWindows.SelectedValue, tcpa.InnerText, useragent, browser);
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