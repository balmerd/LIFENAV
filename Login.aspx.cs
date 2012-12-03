using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
	public partial class Login : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Config.IsTestMode) {
				if (Config.SSLEnabled) {
					if (!Request.IsSecureConnection) {
						Response.Redirect("https://www.yourlifenavigator.com/Login.aspx", true);
					}
				}
			}

			// Google CDN supports SSL, but doesn't combine files
			string YUILib = String.Format("{0}://ajax.googleapis.com/ajax/libs/yui/2.7.0/build", (Request.IsSecureConnection ? "https" : "http"));

			StringBuilder sbJS = new StringBuilder(1024);

			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/connection/connection-min.js\"></script>", YUILib);
			sbJS.AppendFormat("<script type=\"text/javascript\" src=\"{0}/json/json-min.js\"></script>", YUILib);
			litExternalJS.Text = sbJS.ToString();

			if (IsPostBack) {
				string clientId = String.Empty;
				bool isEmailMissing = String.IsNullOrEmpty(txtEmail.Text);
				bool isPasswordMissing = String.IsNullOrEmpty(txtPassword.Text);
				if (isEmailMissing && isPasswordMissing) {
					lblError.Text = "please enter your email address and password";
				} else if (isEmailMissing) {
					lblError.Text = "please enter your email address";
				} else if (isPasswordMissing) {
					lblError.Text = "please enter your password";
				} else {
					bool isEmailValid = Regex.IsMatch(txtEmail.Text, @"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");
					bool isPasswordValid = Regex.IsMatch(txtPassword.Text, "^.{4,10}$");
					if (!isEmailValid && !isPasswordValid) {
						lblError.Text = "your email address and password are not valid";
					} else if (!isEmailValid) {
						lblError.Text = "your email address is not valid";
					} else if (!isPasswordValid) {
						lblError.Text = "your password is not valid";
					} else {
						bool isAuthenticated = false;
						using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
						{
							var data = from client in db.LIFENAV_Clients where client.Email.Equals(txtEmail.Text) where client.Password.Equals(txtPassword.Text) select client;
							var myClient = data.FirstOrDefault<LIFENAV_Client>();
							if (myClient != null) {
								isAuthenticated = true;
								clientId = myClient.Id.ToString();
							}
						}
						if (isAuthenticated) {
							MyCookie.ClientId = clientId;
							MyCookie.EmailAddress = txtEmail.Text;
							Response.Redirect("/Account.aspx", true);
						} else {
							lblError.Text = "sorry, we could not find that account";
						}
					}
				}
			} else {
				if (MyCookie.HasClientId) {
					Response.Redirect("/Account.aspx", true);
				} else {
					MyCookie.ClearCookie();
				}
			}
		}
	}
}