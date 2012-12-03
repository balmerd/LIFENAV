using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using LifeNavigator.Util;

namespace LifeNavigator.Web
{
	public partial class PageNotFound : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string path = GetRequestedPath();

			System.Web.HttpContext ctx = System.Web.HttpContext.Current;
			if (ctx != null) { 
				ctx.Response.Status = "404 Not Found"; 
			}

			litRequestedPath.Text = path;

			try
			{
				StringBuilder sb = new StringBuilder();
				sb.AppendFormat("<h2>Not Found:</h2><p>{0}</p>", path);
				sb.AppendFormat("<h2>Referrer:</h2><p>{0}</p>", ctx.Request.UrlReferrer);
				MailUtil.SendNotFoundEmail(sb);
			}
			catch (Exception ) {} //ignore
		}

		private string GetRequestedPath() 
		{ 
			string path = "unknown"; 
			string qstr = HttpUtility.UrlDecode(Request.QueryString.ToString()); 
			if (!string.IsNullOrEmpty(qstr)) { 
				path = Request.QueryString["aspxerrorpath"];	// try to get asp.net error info 
				if (string.IsNullOrEmpty(path)) {				// if none, must be IIS error 
					if (qstr.StartsWith("404")) { 
						int start = qstr.IndexOf(":80"); 
						if (start != -1) { 
							path = qstr.Substring(start + 3); 
						} 
					} 
				} 
			} 
			return path.ToLower(); 
		}
	}
}
