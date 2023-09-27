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
    /// Summary description for ZipLocation
    /// </summary>
    public class ZipLocation : IHttpHandler
    {
        string Zip = string.Empty;
        int ReturnedLocation = 0;

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
                                SqlDataAdapter da = new SqlDataAdapter("Home_GeLocationIdByZip", connection);
                                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                                da.SelectCommand.Parameters.Add("@ZipCode", SqlDbType.VarChar).Value = Zip;
                                da.SelectCommand.Parameters.Add("@Customerid", SqlDbType.Int).Value = 125;

                                DataSet dsCampDetails = new DataSet();
                                da.Fill(dsCampDetails);
                                da.Dispose();

                                if (dsCampDetails.Tables[0].Rows.Count >= 0)
                                {
                                    foreach (DataRow drCmp in dsCampDetails.Tables[0].Rows)
                                    {
                                        if (Convert.ToString(drCmp["locationid"]) != "")
                                        {
                                            ReturnedLocation = Convert.ToInt32(drCmp["locationid"]);

                                            if (ReturnedLocation == 50 || ReturnedLocation == 51 || ReturnedLocation == 132)
                                            {
                                                context.Response.Write(true);
                                            }
                                            else
                                            {
                                                context.Response.Write(false);
                                            }
                                        }
                                        else //No Location Returtned
                                        {
                                            context.Response.Write(false);
                                        }
                                    }
                                }
                                else //No Location Returtned
                                {
                                    context.Response.Write(false);
                                }

                            }
                        }
                        else
                        {
                            context.Response.Write(false);
                        }
                    }
                    catch (Exception ex)
                    {
                        context.Response.Write(false);
                        saveResponseLog("Zipcode Location Errro:" + ex.ToString());
                    }


                }
                catch
                {
                    //ZIP Emprty Return true,  other checks should validate
                    Zip = "";
                    context.Response.Write(false);
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