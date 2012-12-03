using System;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using LifeNavigator.Data;
using LifeNavigator.Util;

namespace LifeNavigator.Web
{
	public class BasePage : Page
	{
		public BaseMasterPage MyMaster {
			get {
				return Master as BaseMasterPage;
			}
		}

		public LifeNavCookie MyCookie {
			get {
				return MyMaster.ClientCookie;
			}
		}

		protected override void OnError(EventArgs e)
		{
		    Server.Transfer("/Errors/SystemError.aspx");
		}
		
		protected override void Render(HtmlTextWriter writer)
		{
	        HtmlTextWriter htw = null;
	        StringBuilder sb = new StringBuilder();
	        using (StringWriter sw = new StringWriter(sb))
	        using (htw = new HtmlTextWriter(sw)) {
	            base.Render(htw);
	        }

			if (Request.IsSecureConnection) {
			    sb.Replace("http://yourlifenavigator.com/", "https://yourlifenavigator.com/");
			    sb.Replace("http://www.yourlifenavigator.com/", "https://yourlifenavigator.com/");

				sb.Replace("https://yourlifenavigator.com/Bio.aspx", "http://yourlifenavigator.com/Bio.aspx");
				sb.Replace("https://yourlifenavigator.com/GetStarted.aspx", "http://yourlifenavigator.com/GetStarted.aspx");
				sb.Replace("https://yourlifenavigator.com/Pricing.aspx", "http://yourlifenavigator.com/Pricing.aspx");
				sb.Replace("https://yourlifenavigator.com/Agreement.aspx", "http://yourlifenavigator.com/Agreement.aspx");
				sb.Replace("https://yourlifenavigator.com/Contact.aspx", "http://yourlifenavigator.com/Contact.aspx");
			}

			if (Config.SSLEnabled) {
				sb.Replace("http://yourlifenavigator.com/Login.aspx", "https://yourlifenavigator.com/Login.aspx");
				sb.Replace("http://www.yourlifenavigator.com/Login.aspx", "https://yourlifenavigator.com/Login.aspx");

				sb.Replace("http://yourlifenavigator.com/Registration.aspx", "https://yourlifenavigator.com/Registration.aspx");
				sb.Replace("http://www.yourlifenavigator.com/Registration.aspx", "https://yourlifenavigator.com/Registration.aspx");
			}

			writer.Write(sb.ToString());
			sb.Length = 0;
		}
	}
}