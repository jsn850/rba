using System;
using System.Net;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ReplaceMyWindows.controls
{
    public class VerifyRecaptcha : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string token = context.Request.QueryString["token"];

            bool isTokenValid = VerifyRecaptchaToken(token);

            context.Response.ContentType = "text/plain";
            context.Response.Write(isTokenValid ? "true" : "false");
        }

        public bool IsReusable
        {
            get { return false; }
        }

        private bool VerifyRecaptchaToken(string token)
        {
            string secretKey = "6Ldn8yMnAAAAALTvCwoLw5ANXZ8q0LkujRfVI526"; 

            using (var client = new WebClient())
            {
                string verifyUrl = $"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={token}";

                try
                {
                    string response = client.DownloadString(verifyUrl);

                    dynamic jsonResponse = JObject.Parse(response);
                    bool success = jsonResponse.success;

                    return success;
                }
                catch (WebException ex)
                {
                    Console.WriteLine("Error occurred during reCAPTCHA verification: " + ex.Message);
                }
            }

            return false;
        }
    }
}