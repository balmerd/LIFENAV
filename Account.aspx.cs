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

using LinqClasses;
using LifeNavigator.Data;

namespace LifeNavigator.Web
{
	public partial class Account : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (MyCookie.HasClientId) {
				int clientId = int.Parse(MyCookie.ClientId);
				using (ScheduleDataContext db = new ScheduleDataContext(Config.LIFENAVConnectionString))
				{
					var data = db.LIFENAV_GetDailyAppointments(DateTime.Today, null, clientId);
					Repeater1.DataSource = data;
					Repeater1.DataBind();
				}
			} else {
			    Response.Redirect("/Login.aspx", true);
			}
		}
 	}
}