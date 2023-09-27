using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Runtime.Remoting.Lifetime;

namespace ReplaceMyWindows.controls
{
    public class ZipValidCheck : IHttpHandler
    {
        public async void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            var zipCode = context.Request.QueryString["Zip"];
            var result = await ValidateZipCode(zipCode);
            context.Response.Write(result);
        }

        public async Task<string> ValidateZipCode(string zipcode)
        {
            var apiKey = "fDULj_voU2JvPzNmw3gs6n**";
            var cid = "118709003";
            var url = "https://personator.melissadata.net/v3/WEB/ContactVerify/doContactVerify" + $"?t={apiKey}&id={cid}&postal={zipcode}&format=json";

            using (var client = new HttpClient())
            {
                var response = await client.GetAsync(url);
                var content = await response.Content.ReadAsStringAsync();

                if (!string.IsNullOrEmpty(content))
                {
                    return content;
                }

                return "";
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}



//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Net.Http;
//using System.Threading.Tasks;
//using Newtonsoft.Json;
//using System.Runtime.Remoting.Lifetime;

//namespace ReplaceMyWindows.controls
//{
//    public class ZipValidCheck
//    {
//        public async Task<bool> ValidateZipCode(string zipCode)
//        {
//            var url = "https://personator.melissadata.net/v3/WEB/ContactVerify/doContactVerify?t=<myapikey>&id=<myid>&postal={zipCode}&format=json";
//            var apiKey = "fDULj_voU2JvPzNmw3gs6n**";
//            var cid = "118709003";

//            using (var client = new HttpClient())
//            {
//                var response = await client.GetAsync($"{url}?t={apiKey}&id={cid}&postal={zipCode}&format=json");
//                var content = await response.Content.ReadAsStringAsync();

//                if (!string.IsNullOrEmpty(content))
//                {
//                    dynamic data = JsonConvert.DeserializeObject(content);

//                    if (data.Records != null && data.Records.Count > 0)
//                    {
//                        dynamic record = data.Records[0];

//                        if (record.Results != null && record.Results.Contains("AE"))
//                        {
//                            return false;
//                        }
//                        return true;
//                    }
//                }

//                return false;
//            }
//        }
//    }
//}