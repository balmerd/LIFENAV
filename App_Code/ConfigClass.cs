using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace LifeNavigator.Data
{
	public static class Config
	{
		public static bool SSLEnabled
		{
			get
			{
				return ConfigurationManager.AppSettings["SSLEnabled"].Equals("true");
			}
		}

		public static bool IsTestMode
		{
			get {
				return ConfigurationManager.AppSettings["TestMode"].Equals("true");
			}
		}

		public static bool IsPayPalTestMode {
			get {
				return ConfigurationManager.AppSettings["PayPalTestMode"].Equals("true");
			}
		}

		public static bool IsPayPalByPassMode {
			get {
				return ConfigurationManager.AppSettings["PayPalByPassMode"].Equals("true");
			}
		}

		public static string Domain {
			get {
				return ConfigurationManager.AppSettings[IsTestMode ? "LocalDomain" : "RemoteDomain"];
			}
		}

		public static string PayPalURI {
			get {
				return ConfigurationManager.AppSettings[(IsTestMode || IsPayPalTestMode) ? "PayPalSandbox" : "PayPalLive"];
			}
		}

		public static string LIFENAVConnectionString {
			get {
				return ConfigurationManager.ConnectionStrings[IsTestMode ? "LocalConnectionString" : "RemoteConnectionString"].ConnectionString;
			}
		}
	}
}
