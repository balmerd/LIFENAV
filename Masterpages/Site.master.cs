using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

using LifeNavigator.Data;

namespace LifeNavigator.Web
{
	public partial class SiteMaster : BaseMasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string protocol = (Request.IsSecureConnection ? "https" : "http");
			string httpPrefix = String.Format("http://{0}/", Config.Domain);

			lnkBio.NavigateUrl = String.Format("{0}Bio.aspx", httpPrefix);
			lnkGetStarted.NavigateUrl = String.Format("{0}GetStarted.aspx", httpPrefix);
			lnkPricing.NavigateUrl = String.Format("{0}Pricing.aspx", httpPrefix);
			lnkAgreement.NavigateUrl = String.Format("{0}Agreement.aspx", httpPrefix);
			lnkAccount.NavigateUrl = String.Format("{0}Login.aspx", httpPrefix);

			// Google CDN supports SSL, but doesn't combine files
			string YUILib = String.Format("{0}://ajax.googleapis.com/ajax/libs/yui/2.7.0/build", protocol);

			StringBuilder sbCSS = new StringBuilder(1024);
			sbCSS.AppendFormat("<link rel=\"stylesheet\" type=\"text/css\" href=\"{0}/reset-fonts-grids/reset-fonts-grids.css\" />", YUILib);
			sbCSS.AppendFormat("<link rel=\"stylesheet\" type=\"text/css\" href=\"{0}/base/base-min.css\" />", YUILib);
			sbCSS.AppendFormat("<link rel=\"stylesheet\" type=\"text/css\" href=\"{0}/assets/skins/sam/skin.css\" />", YUILib);
			litExternalCSS.Text = sbCSS.ToString();

			StringBuilder sbJS = new StringBuilder(1024);
			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/yahoo-dom-event/yahoo-dom-event.js\"></script>", YUILib);
			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/element/element-min.js\"></script>", YUILib);
			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/button/button-min.js\"></script>", YUILib);
			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/cookie/cookie-min.js\"></script>", YUILib);
			litExternalJS.Text = sbJS.ToString();
		}
	}
}
