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
	public partial class Schedule_YUI : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			DateTime scheduleDate;
			var myCookie = Request.Cookies["LifeNavigator"];
			string dt = HttpUtility.UrlDecode(myCookie["Date"]);
			bool isValid = DateTime.TryParse(dt, out scheduleDate);

			if (isValid) {
				today.InnerHtml = scheduleDate.ToString("D");
			} else {
				today.InnerHtml = DateTime.Today.ToString("D");
			    //today.InnerHtml = String.Format("invalid date passed, dt={0}", dt);
			}
		}
	}
}