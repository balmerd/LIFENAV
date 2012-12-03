using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using LifeNavigator.Util;

namespace LifeNavigator.Web
{
	public class BaseMasterPage : MasterPage
	{
		private LifeNavCookie _clientCookie = null;
        public LifeNavCookie ClientCookie
        {
            get {
				if (_clientCookie == null) {
					_clientCookie = new LifeNavCookie(HttpContext.Current.Request.Cookies);
				}
				return _clientCookie;
			}
        }

		protected override void OnUnload(EventArgs e)
		{
			ClientCookie.Persist(HttpContext.Current.Response);
			base.OnUnload(e);
		}

		protected override void OnError(EventArgs e)
		{
		    Server.Transfer("/Errors/SystemError.aspx");
		}
	}
}