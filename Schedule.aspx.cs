using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using LifeNavigator.Data;

namespace LifeNavigator.Web
{
	public partial class Schedule : BasePage
	{
		public string CalendarConfig { get; set; }

		public string WebServicePath {
			get {
				return String.Format("http://{0}/WebServices", Config.Domain);
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack) {
				if (MyCookie.HasClientId) {

					// Google CDN supports SSL, but doesn't combine files
					string YUILib = String.Format("{0}://ajax.googleapis.com/ajax/libs/yui/2.7.0/build", (Request.IsSecureConnection ? "https" : "http"));

					StringBuilder sbJS = new StringBuilder(1024);

					sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/calendar/calendar-min.js\"></script>", YUILib);
					sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/container/container-min.js\"></script>", YUILib);
					sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/stylesheet/stylesheet-min.js\"></script>", YUILib);
					sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/connection/connection-min.js\"></script>", YUILib);
					sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/json/json-min.js\"></script>", YUILib);
					litExternalJS.Text = sbJS.ToString();

					DateTime scheduleDate;
					string dt = MyCookie.AppointmentDate;
					bool isValid = DateTime.TryParse(dt, out scheduleDate);

					if (isValid) {
						CalendarConfig = String.Format(", pagedate: \"{0}/{2}\", selected: \"{0}/{1}/{2}\"", scheduleDate.Month, scheduleDate.Day, scheduleDate.Year);
					} else  {
						scheduleDate = DateTime.Today;
					}

					selectedDate.InnerHtml = scheduleDate.ToString("D");
				} else {
					Response.Redirect("/Login.aspx", true);
				}
			}
		}
	}
}
