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

using LifeNavigator.Data;

namespace LifeNavigator.Web
{
	public partial class Confirm : BasePage
	{
		public string GetPayPalTestButtonId()
		{
			return "QDZ4K8QDUL3D8";
		}

		public string GetPayPalIndividualButtonId()
		{
			return "2FUBD5QWLQCMN";
		}

		public string GetPayPalCoupleButtonId() {
			return "4Z225TCXSJ9U6";
		}

		public string GetPayPalFamilyButtonId() {
			return "52ZHZQSUZ6HBE";
		}

		public string GetPayPalGroupButtonIds() {
			return "'YCNX6XE6K6AHS','HX8AQU3ADR254','77PJ485TAC5WQ','FDJ69FPBZPNTQ','XQXPVPRWYN2EC'";
		}

		public string PayPalURI {
			get {
				if (Config.IsPayPalByPassMode) {
					return "Scheduled.aspx";
				} else {
					return Config.PayPalURI;
				}
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (MyCookie.HasClientId) {
				if (!Config.IsTestMode) {
					if (Config.SSLEnabled) {
						if (!Request.IsSecureConnection) {
							Response.Redirect("https://www.yourlifenavigator.com/Confirm.aspx", true);
						}
					}
				}
				DateTime reservationDate;
				string hr = "", hrType = "";

				string tm = MyCookie.AppointmentTime;
				string dt = MyCookie.AppointmentDate;

				if (tm.Length == 4) {
					hr = tm.Substring(0,2);
					hrType = tm.Substring(2,2);
				} else if (tm.Length == 3) {
					hr = tm.Substring(0,1);
					hrType = tm.Substring(1,2);
				}

				string datestr = String.Format("{0} {1:D2}:00:00 {2}", dt, hr, hrType);
				bool isValid = DateTime.TryParse(datestr, out reservationDate);

				if (isValid) {
					litDate.Text = reservationDate.ToString("f");
				} else {
					litDate.Text = String.Format("invalid date passed, datestr={0}", datestr);
				}
			} else {
				Response.Redirect("/Login.aspx", true);
			}
		}
	}
}
