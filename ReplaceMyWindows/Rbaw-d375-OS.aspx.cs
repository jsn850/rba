using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReplaceMyWindows
{
    public partial class Rbaw_d375_OS : System.Web.UI.Page
    {
        public FormClass f = new FormClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            string domainName = HttpContext.Current.Request.Url.ToString().ToLower();

            if (domainName.Contains("low-e-replacementwindows"))
            {
                FooterDomain.InnerText = "Low-E-ReplacementWindows.com";
                Terms_Conds.HRef = "TermsofUseLowE.html";
                PrivacyPolicy.HRef = "PrivacyLowE.html";
            }
            else if (domainName.Contains("renewalbyandersen.com"))
            {
                //FooterDomain.InnerText = "renewalbyandersen.com";
                //Terms_Conds.HRef = " http://www.renewalbyandersen.com/about/terms-of-use.aspx";
                //PrivacyPolicy.HRef = "http://www.renewalbyandersen.com/about/legal-privacy.aspx";                           
            }
            else if (domainName.Contains("expertwindows.com"))
            {
                FooterDomain.InnerText = "ExpertWindows.com";
                Terms_Conds.HRef = "TermsofUseExpert.html";
                PrivacyPolicy.HRef = "PrivacyExpert.html";
                CaPrivacy.HRef = "CA-Privacy-Expert.html";
                DoNotSell.HRef = "Ca-Privacy-Expert.html#DoNotSell";
            }
            else if (domainName.Contains("rbawindowoffers.com"))
            {
                FooterDomain.InnerText = "RbaWindowoffers.com";
                Terms_Conds.HRef = "TermsofUseRbaOffers.html";
                PrivacyPolicy.HRef = "PrivacyRbaoffers.html";
                CaPrivacy.HRef = "CA-Privacy-RbaOffers.html";
                DoNotSell.HRef = "Ca-Privacy-RbaOffers.html#DoNotSell";
            }
            else if (domainName.Contains("windowrateadvisor.com"))
            {
                FooterDomain.InnerText = "WindowRateAdvisor.com";
                Terms_Conds.HRef = "TermsOfUseWRA.html";
                PrivacyPolicy.HRef = "PrivacyWRA.html";
                CaPrivacy.HRef = "CA-Privacy-Expert.html";
                DoNotSell.HRef = "Ca-Privacy-Expert.html#DoNotSell";
            }
            else if (domainName.Contains("replacemywindows4less.com"))
            {
                FooterDomain.InnerText = "ReplaceMyWindows4Less.com";
                Terms_Conds.HRef = "Terms of Use.html";
                PrivacyPolicy.HRef = "Privacy-Policy.html";
                CaPrivacy.HRef = "Ca-Privacy-Replace4less.html";
                DoNotSell.HRef = "Ca-Privacy-Replace4less.html#DoNotSell";
            }
            else if (domainName.Contains("elitereplacementwindows.com"))
            {
                FooterDomain.InnerText = "EliteReplacementWindows.com";
                Terms_Conds.HRef = "TermsofUseElite.html";
                PrivacyPolicy.HRef = "PrivacyElite.html";
                CaPrivacy.HRef = "Ca-Privacy-Elite.html";
                DoNotSell.HRef = "Ca-Privacy-Elite.html#DoNotSell";
            }
            else if (domainName.Contains("qualitywindowsdirect.com"))
            {
                FooterDomain.InnerText = "QualityWindowsDirect.com";
                Terms_Conds.HRef = "TermsofUseQWD.html";
                PrivacyPolicy.HRef = "PrivacyQWD.html";
                CaPrivacy.HRef = "Ca-Privacy-QWD.html";
                DoNotSell.HRef = "Ca-Privacy-QWD.html#DoNotSell";
            }
            ////Change a few colors green
            //try
            //{
            //    if (Request.QueryString["colg"].ToString() == "Y")
            //    {
            //        formsec.Style.Add("background-color", "#77ad5c");
            //    }

            //}
            //catch { }
            string RBANnSublink = ConfigurationManager.AppSettings["RbaUnsublink"];

            //Path 56 Unsub
            try
            {
                if (Request.QueryString["ctcampaign"].ToString() == "6198" || Request.QueryString["eccmp"].ToString() == "6198")

                {
                    RBANnSublink = ConfigurationManager.AppSettings["RbaUnsublink2"];
                }
            }
            catch { }


            //Update unsublink with paramaters
            if ((Request.QueryString["ctkwd"] != null) && (Request.QueryString["ecadid"] != null))
            {
                RBANnSublink = RBANnSublink + "&ctkwd=" + Request.QueryString["ctkwd"].ToString() + "&ecadid=" + Request.QueryString["ecadid"].ToString();

            }
            else if ((Request.QueryString["ctkwd"] != null))
            {
                RBANnSublink = RBANnSublink + "&ctkwd=" + Request.QueryString["ctkwd"].ToString();

            }
            else if (Request.QueryString["ecadid"] != null)
            {
                RBANnSublink = RBANnSublink + "&ecadid=" + Request.QueryString["ecadid"].ToString();

            }
            //  A1.HRef = RBANnSublink;
            //UnsubLink2.HRef = RBANnSublink;
            //UnsubLink3.HRef = RBANnSublink;


            //Session["strAppPath"] = Request.PhysicalApplicationPath;
            //Session["strCtSource"] = "0";

            //if (Request.QueryString["PH"] != null)
            //{
            //    Session["strPhone"] = Request.QueryString["PH"];
            //}
            //else
            //{
            Session["strPhone"] = "0";

            //}
            //if (!Page.IsPostBack)
            //{
            //    f.populatePhone(phoneNumber, Request, Request.PhysicalApplicationPath, Session["strPhone"].ToString());
            //    return;
            //}

        }
    }
}

