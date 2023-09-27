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
    /// Summary description for ZipValidate
    /// </summary>
    public class ZipValidate : IHttpHandler
    {
        string Zip = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if ((context.Request["Zip"] != null) && (context.Request["Zip"] != ""))
            {
                try
                {
                    Zip = context.Request["Zip"].ToString();

                    try
                    {
                        if (Zip.Length == 5)
                        {

                            string connectionInfo = ConfigurationManager.AppSettings["ConnectionInfo"];

                            using (SqlConnection connection = new SqlConnection(connectionInfo))
                            {
                                SqlCommand cmd = new SqlCommand("ZIP_Validate", connection);
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@Zip", SqlDbType.NVarChar, 5).Value = Zip;
                                connection.Open();
                                if ((int)cmd.ExecuteScalar() >= 1)
                                {
                                    context.Response.Write(true);
                                }
                                else
                                {
                                    context.Response.Write(false);
                                    saveValidationLog("Invalid Zipcode:" + Zip);
                                }
                                connection.Close();
                            }
                        }
                        else
                        {
                            context.Response.Write(false);
                        }
                    }
                    catch (Exception ex)
                    {
                        context.Response.Write(true);
                        saveValidationLog("Zipcode Validation Errro:" + ex.ToString());
                    }


                }
                catch
                {
                    //ZIP Emprty Return true,  other checks should validate
                    Zip = "";
                    context.Response.Write(true);
                }


            }
            else 
            {
                //ZIP Emprty Return true,  other checks shoudl validate
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