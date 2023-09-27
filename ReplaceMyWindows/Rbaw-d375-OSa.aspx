<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rbaw-d375-OSa.aspx.cs"
Inherits="ReplaceMyWindows.Rbaw_d375_OSa" %> <%@ Register TagPrefix="uc"
TagName="LeadForm" Src="~/controls/LeadFormWiz-OSa.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Renewal By Andersen - Window Replacement</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&family=Montserrat:wght@400;500;700&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- Custom styles -->
    <link href="css/style-OSa.min.css?v=33" rel="stylesheet" />
    <link href="css/recaptcha.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <script src="scripts/lazy_load.min.js" type="text/javascript" defer></script>

    <!-- #include file="LPGlobal.html" -->

    <script
      async
      defer
      src="https://www.google.com/recaptcha/api.js?onload=recaptchaCallback&render=explicit"
    ></script>
    <!-- EC LP Pixel -->
    <script
      type="text/javascript"
      src="https://hits.ecdashboard.com/JS/FP.js"
    ></script>
    <!-- End of EC LP Pixel -->
  </head>
  <body>

    <div class="main">
      <div
        runat="server"
        id="header_disc">
        <h4>
          Renewal by Andersen is not affiliated with any government grant or
          free window programs, all projects come at a cost to the consumer
        </h4>
      </div>
      <div class="logo-div">
        <img
          data-src="images/logo-rba-mob.png"
          alt="Renewal By Andersen"
        />
      </div>

        <div class="hero-div">
          <img data-src="img/wizard-hero-dollars-off.jpg" />
        </div>

        <div class="heading">
            <h1 class="os-title">Get a Free Window Replacement Quote</h1>
        </div>

      <section id="blockForm" class="form-section">
        <!-- START FORM -->
        <form id="leadform" runat="server">
          <uc:LeadForm ID="LeadForm1" runat="server"></uc:LeadForm>
        </form>

        <!-- END FORM -->
        <div class="GrantText" id="Grants" runat="server" style="color: #555">
          Renewal by Andersen is not affiliated with any government grant or
          free window programs, all projects come at a cost to the consumer
        </div>
        <br />

        <div class="CompliLink" style="color: #555">
          If you believe you’ve reached this page in error or would like to opt
          out of future correspondence, please
          <a
            href="http://emailcompliancemanager.com/rba/?1=1"
            id="UnsubLink"
            target="_blank"
            class="lnkunsub"
            runat="server"
            >contact us</a
          >.
        </div>
      </section>
      <!--END FORM-->

      <footer>
        <section id="footer">
          <!-- START FOOTER SECTION -->
          <div class="container">
            <div class="row">
              <div class="col-12 mb-3 mt-5 text-center">
                <img data-src="img/logo-footer.png" alt="logos" />
              </div>
            </div>

            <div class="row">
              <div class="col-12 text-center">
                <p>
                  1DETAILS OF OFFER: Offer expires 9/30/2023. Not valid with
                  other offers or prior purchases Buy one (1) window or
                  entry/patio door, get one (1) window or entry/patio door 40%
                  off, and 12 months $0 money down, $0 monthly payments, no
                  interest when you purchase four (4) or more windows or
                  entry/patio doors between 6/23/2023 and 9/30/2023. 40% off
                  windows and entry/patio doors are less than or equal to lowest
                  cost window or entry/patio door in the order. Additional $200
                  off your order, taken after initial discount(s), when you
                  purchase by 9/30/2023. Subject to credit approval. Interest is
                  billed during the promotional period, but all interest is
                  waived if the purchase amount is paid before the expiration of
                  the promotional period. Financing for GreenSky® consumer loan
                  programs is provided by federally insured, federal and state
                  chartered financial institutions without regard to age, race,
                  color, religion, national origin, gender, or familial status.
                  Savings comparison based on purchase of a single unit at list
                  price. Available at participating locations and offer applies
                  throughout the service area. See your local Renewal by
                  Andersen location for details. MHIC #121441. VA License
                  #2705155684. DC License #420215000125. Los Angeles and Orange
                  County License #990416. License MN:BC130983/WI:266951.
                  Excludes MN insurance work per MSA 325E.66. PA License#170810.
                  License #RCE-50303. CA License CLSB #1050316. Central CA
                  License #1096271. OR License #198571. WA License
                  #RENEWAP877BM. WA License #RENEWAW856K6. All other license
                  numbers are available upon request. Some Renewal by Andersen
                  locations are independently owned and operated. “Energy Star”
                  is a registered trademark of the U.S. Environmental Protection
                  Agency. “Renewal by Andersen” and all other marks where
                  denoted are trademarks of Andersen Corporation. ©2023 Andersen
                  Corporation. All rights reserved. RBA 12222
                  <br /><br />
                </p>

                <p>
                  ©
                  <script type="text/javascript">
                      document.write(new Date().getFullYear())
                  </script>
                  <span id="FooterDomain" runat="server"
                    >ReplaceMyWindows4Less.com</span
                  >
                  All rights reserved. |

                  <a
                    id="PrivacyPolicy"
                    runat="server"
                    href="Privacy-Policy.html"
                    class=""
                    >Privacy Policy</a
                  >
                  |
                  <a id="Terms_Conds" runat="server" href="Terms of Use.html"
                    >Terms of Use</a
                  >
                  |
                  <a id="CaPrivacy" runat="server" href="Ca-Privacy.html"
                    >Privacy Notice for CA Residents</a
                  >
                  |<a
                    id="DoNotSell"
                    runat="server"
                    href="Ca-Privacy.html#DoNotSell"
                    class=""
                    >Do Not Sell My Personal Information</a
                  >
                  |<a
                    id="Unsub"
                    runat="server"
                    href="http://pub.s7.exacttarget.com/hxafk4bhe5c?email=&storeId=&optoutsource=ExactCustomer&ctkwd=&ecadid="
                    >Unsubscribe</a
                  >
                </p>
              </div>
            </div>
          </div>
        </section>
      </footer>
    </div>

    <!-- #include file="GlobalFooter.html" -->

    <script
      type="text/javascript"
      src="scripts/script-wiza.min.js"
      async
      defer
    ></script>
    <script
      type="text/javascript"
      src="scripts/recaptcha.min.js"
      async
      defer
    ></script>
    <script
      src="scripts/Functions.min.js?ver=4987"
      type="text/javascript"
      async
      defer
    ></script>
    <script
      src="scripts/phone.min.js"
      type="text/javascript"
      async
      defer
    ></script>

    <script language="JavaScript">
        var nav = window.Event ? true : false
        if (nav) {
            window.captureEvents(Event.KEYDOWN)
            window.onkeydown = NetscapeEventHandler_KeyDown
        } else {
            document.onkeydown = MicrosoftEventHandler_KeyDown
        }

        function NetscapeEventHandler_KeyDown(e) {
            if (
                e.which == 13 &&
                e.target.type != "textarea" &&
                e.target.type != "submit"
            ) {
                return false
            }
            return true
        }

        function MicrosoftEventHandler_KeyDown() {
            if (
                event.keyCode == 13 &&
                event.srcElement.type != "textarea" &&
                event.srcElement.type != "submit"
            )
                return false
            return true
        }
    </script>
    <script type="text/javascript">
        $(".form-control").keydown(function (event) {
            if (event.keyCode == 13) {
                if (typeof Page_ClientValidate == "function") Page_ClientValidate()
                if (Page_IsValid) {
                    $(this).closest(".form-step").find(".btn-next").click()
                    event.preventDefault()
                    return false
                }
            }
        })
    </script>
    <div id="formsec" runat="server" style="display: none"></div>

    <!-- Hboost click -->
    <script
      type="text/javascript"
      src="https://www.ne1trk.com/scripts/sdk/everflow.js"
    ></script>

    <script type="text/javascript">
        EF.click({
            offer_id: EF.urlParameter("oid"),
            affiliate_id: EF.urlParameter("affid"),
            sub1: EF.urlParameter("sub1"),
            sub2: EF.urlParameter("sub2"),
            sub3: EF.urlParameter("sub3"),
            sub4: EF.urlParameter("sub4"),
            sub5: EF.urlParameter("sub5"),
            uid: EF.urlParameter("uid"),
            source_id: EF.urlParameter("source_id"),
            transaction_id: EF.urlParameter("_ef_transaction_id")
        })
    </script>
  </body>
</html>
