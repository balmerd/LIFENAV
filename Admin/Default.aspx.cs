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

using LinqClasses;
using LifeNavigator.Data;

namespace LifeNavigator.Web {
	public partial class Admin : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (MyCookie.HasClientId && MyCookie.EmailAddress.Equals("david.b.balmer@gmail.com")) {
				using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
				{
					var data = db.LIFENAV_Clients.ToList<LIFENAV_Client>();
					rptClients.DataSource = data;
					rptClients.DataBind();
				}
			} else {
				Response.Redirect("/Login.aspx", true);
			}
		}
	}
}