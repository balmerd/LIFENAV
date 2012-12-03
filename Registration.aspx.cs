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
using LifeNavigator.Util;

namespace LifeNavigator.Web
{
	public partial class Registration : BasePage
	{
		private int clientId;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Config.IsTestMode) {
				if (Config.SSLEnabled) {
					if (!Request.IsSecureConnection) {
						Response.Redirect("https://www.yourlifenavigator.com/Registration.aspx", true);
					}
				}
			}

			if (IsPostBack) {
				if (IsEmailAvailable()) {
					CreateClient();
					if (!Config.IsTestMode) {
						MailUtil.SendMembershipEmail(clientId, txtEmail.Text);
					}
					Response.Redirect("/Schedule.aspx", true);
				} else {
					lblEmailError.Text = "<p><b>Sorry, an account is already registered with that email address.</b></p><p>If you have already registered for LifeNavigator, <a href=\"\\Login.aspx\">click here</a> to login.</p>";
					lblEmailError.Visible = true;
				}
			}
		}

		public bool IsEmailAvailable()
		{
			bool result = false;
		    using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
		    {
				result = (db.LIFENAV_Clients.Count(c => c.Email.Equals(txtEmail.Text)) == 0);
			}
			return result;
		}

		private void CreateClient()
		{
		    using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
		    {
		        var client = new LIFENAV_Client();
		        client.FirstName = txtFirstName.Text;
		        client.LastName = txtLastName.Text;
		        client.Address1 = txtAddress1.Text;
		        client.Address2 = txtAddress2.Text;
		        client.City = txtCity.Text;
		        client.StateCode = ddlState.SelectedValue;
		        client.ZipCode = txtZipCode.Text;
		        client.Email = txtEmail.Text;
				client.Password = txtPassword.Text;
		        client.HomePhone = txtHomePhone.Text;
		        client.WorkPhone = txtWorkPhone.Text;
		        db.LIFENAV_Clients.InsertOnSubmit(client);
		        db.SubmitChanges();

		        // update cookie with Client.Id
				clientId = client.Id;
				MyCookie.ClientId = clientId.ToString();
				MyCookie.EmailAddress = txtEmail.Text;
			}
		}
	}
}