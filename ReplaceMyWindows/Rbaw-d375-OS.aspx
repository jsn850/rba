<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rbaw-d375-OS.aspx.cs"
Inherits="ReplaceMyWindows.Rbaw_d375_OS" %> <%@ Register TagPrefix="uc"
TagName="LeadForm" Src="~/controls/LeadFormWiz-OS.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head id="Head1" runat="server">
    <!-- anti-flicker snippet (recommended)  -->
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

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <!-- Custom styles -->
    <link href="css/stylewiz_new.min.css" rel="stylesheet" />
    <link href="css/recaptcha.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <script src="scripts/lazy_load.min.js" type="text/javascript" defer></script>

    <!-- #include file="LPGlobal.html" -->

    <script
      async
      defer
      src="https://www.google.com/recaptcha/api.js?onload=recaptchaCallback&render=explicit"
    ></script>
  </head>
  <body class="body_new">
    <!-- EC LP Pixel -->
    <script
      type="text/javascript"
      src="https://hits.ecdashboard.com/JS/FP.js"
    ></script>
    <!-- End of EC LP Pixel -->

    <div id="bodyColor" class="bodyMax">
          <div
          runat="server"
          id="header_disc">
          <h4>
            Renewal by Andersen is not affiliated with any government grant or
            free window programs, all projects come at a cost to the consumer
          </h4>
        </div>
      <div class="container">
        <section id="blockLogo" class="divRow topLogo">
          <div class="divCol">
            <img
              data-src="images/logo-rba-mob.png"
              alt="Renewal By Andersen"
              class="logo"
            />
          </div>
        </section>

        <div class="divRow" id="blockHero" style="border-bottom: none">
          <img
            class="lowpay"
            data-src="img/wizard-hero-dollars-off.jpg"
            width="100%"
          />
        </div>

        <section id="blockForm" class="form-section">
          <div class="row">
            <div class="col-12 col-md-12">
              <form id="leadform" runat="server">
                <h1>Get a Free Window Replacement Quote</h1>

                <uc:LeadForm ID="LeadForm1" runat="server"></uc:LeadForm>
              </form>

              <div class="CompliLink">
                If you believe you’ve reached this page in error or would like
                to opt out of future correspondence, please
                <a
                  href="http://emailcompliancemanager.com/rba/?1=1"
                  id="UnsubLink"
                  target="_blank"
                  class="lnkunsub"
                  runat="server"
                  >contact us</a
                >.
              </div>
            </div>
          </div>
        </section>
      </div>

      <footer>
        <section id="footer">
          <div class="">
            <div class="">
              <div class="col-12 mb-3 mt-5 text-center">
                <img src="img/logo-footer.png" alt="logos" />
              </div>
            </div>

            <div class="">
              <div class="col-12">
                <p>
                  1DETAILS OF OFFER: Offer expires 9/30/2023. Not valid with
                  other offers or prior purchases. Get $375 off each window and
                  $775 off each entry/patio door, and 12 months no money down,
                  no monthly payments, no interest when you purchase four (4) or
                  more windows or entry/patio doors between 6/23/2023 and
                  9/30/2023. Subject to credit approval. Interest is billed
                  during the promotional period, but all interest is waived if
                  the purchase amount is paid before the expiration of the
                  promotional period. Financing for GreenSky(r) consumer loan
                  programs is provided by federally insured, federal and state
                  chartered financial institutions without regard to age, race,
                  color, religion, national origin, gender, or familial status.
                  Savings comparison based on purchase of a single unit at list
                  price. Available at participating locations and offer applies
                  throughout the service area. See your local Renewal by
                  Andersen location for details. CA License CLSB #1050316.
                  Central CA License #1096271. License #RCE-50303. OR License
                  #198571. WA License# RENEWAW856K6. WA License
                  #RENEWAP877BM.All other license numbers available upon
                  request. Some Renewal by Andersen locations are independently
                  owned and operated. "Renewal by Andersen" and all other marks
                  where denoted are trademarks of their respective owners. (c)
                  2023 Andersen Corporation. All rights reserved.

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

      <!-- #include file="GlobalFooter.html" -->

      <script
        type="text/javascript"
        src="scripts/scripts5.min.js"
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
      <script
        src="scripts/recaptcha.min.js"
        type="text/javascript"
        async
        defer
      ></script>
            <script async defer type="text/javascript">
                EC_HitsTrack(1547)
            </script>

            <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
    </div>

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
