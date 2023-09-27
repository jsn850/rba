using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ReplaceMyWindows.controls
{
    /// <summary>
    /// Summary description for AddressCheck
    /// </summary>
    public class AddressCheck : IHttpHandler
    {
        string Zip = string.Empty;
        string Address = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if ((context.Request["Zip"] != null) && (context.Request["Zip"] != "") && (context.Request["Address"] != null) && (context.Request["Address"] != ""))
            {
                try
                {
                    Zip = context.Request["Zip"].ToString();
                    Address = context.Request["Address"].ToString();

                    try
                    {
                           if(Address.Contains(Zip))
                            { 
                                    context.Response.Write(false);
                                    saveResponseLog("Invalid Address- zip in address: Address:" + Address +  " Zip: " + Zip);
                            }
                                else
                            {
                                context.Response.Write(true);
                            }                                                  

                    }
                    catch (Exception ex)
                    {
                        context.Response.Write(true);
                        saveResponseLog("address Validation Errro:" + ex.ToString());
                    }


                }
                catch
                {
                    //ZIP Emprty Return true,  other checks should validate
                    Zip = "";
                    Address = "";
                    context.Response.Write(true);
                }


            }
            else
            {
                //ZIP/Address Emprty Return true,  other checks shoudl validate
                context.Response.Write(true);
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
        public void saveResponseLog(string response)
        {
            string filePath = string.Empty;
            string postingInformation = string.Empty;
            string applicationPath = string.Empty;

            string IpAddress = "";
            try
            {
                IpAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

                response = response + " IP:" + IpAddress;
            }
            catch
            {
                IpAddress = "";
            }

            applicationPath = AppDomain.CurrentDomain.BaseDirectory;
            postingInformation = "Begin Report: " + DateTime.Now + "\n " + response + " \nEnd Report\n";
            filePath = applicationPath + "/logs/responselog_" + DateTime.Today.ToString("MM-dd-yyyy") + ".txt";
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