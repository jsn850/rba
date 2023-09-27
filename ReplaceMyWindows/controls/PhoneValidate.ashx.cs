using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace ReplaceMyWindows.controls
{
    /// <summary>
    /// Summary description for PhoneValidate
    /// </summary>
    public class PhoneValidate : IHttpHandler
    {
        string Phone = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if (context.Request["Phone"] != null)
            {
                try
                {
                    Phone = context.Request["Phone"].ToString();
                }
                catch
                {
                    Phone = "";
                }
            }
            try
            {
                if (Phone.Length > 8) // Dont validate short phone numbers
                {
                    string ValidateResponse;
                    ValidateResponse = "";

                    FormClass f = new FormClass();
                    // FormProperties fp = new FormProperties();


                    ValidateResponse = f.ValidateLead_melissadata("", "", "", "", "", Phone, "118709003");
                    //  context.Session["ValidateResponse"] = ValidateResponse;

                    if (ValidateResponse.Contains("PE"))
                    {
                        saveValidationLog("Phone Validation Error:" + ValidateResponse + " Phone: " + Phone);

                        context.Response.Write(false);
                    }
                    else
                    {
                        context.Response.Write(true);
                    }
                }
                else
                {
                    context.Response.Write(true);
                }
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #region saveResponseLog
        /// <summary>
        /// Saves the response log.
        /// </summary>
        /// <param name="error">The error.</param>
        public void saveValidationLog(string response)
        {
            string filePath = string.Empty;
            string postingInformation = string.Empty;
            string applicationPath = string.Empty;

            applicationPath = AppDomain.CurrentDomain.BaseDirectory;
            postingInformation = "Begin Report: " + DateTime.Now + "\n " + response + " \nEnd Report\n";
            filePath = applicationPath + "/logs/ValidationLog_" + DateTime.Today.ToString("MM-dd-yyyy") + ".txt";
            StreamWriter w = null;
            try
            {
                if (!File.Exists(filePath))
                {
                    using (w = File.CreateText(filePath))
                    {
                        w.Write(postingInformation);
                    }
                }
                else
                {
                    using (w = File.AppendText(filePath))
                    {
                        w.Write(postingInformation);
                    }
                }
            }
            catch (Exception ex)
            {
                //SendError(ex, "RMW Leads: Error Saving Log", "");
            }
            finally
            {
                w.Dispose();
            }
        }
        #endregion
    }

}