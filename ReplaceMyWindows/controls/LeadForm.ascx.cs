using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows.controls
{
 public partial class LeadForm : System.Web.UI.UserControl
 {
  protected FormClass f = new FormClass();
  FormProperties fp = new FormProperties();
  protected void Page_Load(object sender, EventArgs e)
  {
        if (!IsPostBack)
        {
            Session["SessionStart"] = DateTime.Now;
        }
        f.populateStates(ddlStates, Request.PhysicalApplicationPath);
       fp.strCtSource = "0";
       fp.strAppPath = Request.PhysicalApplicationPath;
                fp.strIsTest = "0";
                fp.strCampaignID = "1202";

    if (Request.QueryString["Offerid"] != null)
    {
              Session["Offerid"] = Request.QueryString["Offerid"].ToString();
    }
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

  protected void btnSubmit_Click(object sender, EventArgs e)
  {
   string useragent = string.Empty;
   string browser = string.Empty;
   useragent = Request.UserAgent;
   browser = Request.Browser.Browser;
   if (Page.IsValid)
   {
    int response = f.sendLead(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtStreet.Text, "", "", txtZipCode.Text, txtPhone.Text, "", ddlNumWindows.SelectedValue, tcpa.InnerText,"",leadid_token.Value, useragent, browser, ref fp,"",1);
    // set Session Variables for ThankyouPage
    Session["strEmail"] = fp.strEmail;
    Session["strLeadID"] = fp.strLeadID;
    Session["strs2ID"] = fp.strs2ID;
    Session["strLocationID"] = fp.strLocationID;
    Session["DGBathZip"] = fp.StrDGBathZip;
    Session["BTGZip"] = fp.StrBTGZip;

    fp = null;
    if (response == 0)
    {
     Response.Redirect("ThankYou.aspx");
    }
    else if (response == 4)
    {
        Response.Redirect("ThankYouDup.aspx");
    }
    else
    {
     Response.Redirect("ThankYouNA.aspx");
    }
   }
  }
  
 }
}