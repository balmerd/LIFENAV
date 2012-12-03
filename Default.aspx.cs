using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace LifeNavigator.Web
{
	public partial class Landing : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// retain ClientId and clear other values
			string clientId = MyCookie.ClientId;
			MyCookie.ClearCookie();
			MyCookie.ClientId = clientId;

			//if (Request.QueryString.Count == 0) {
			//    Server.Transfer("ComingSoon.aspx");
			//}
		}
	}
}
