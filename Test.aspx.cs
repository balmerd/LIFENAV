using System;
using System.Collections;
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
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;
using System.Xml.XPath;

using LinqClasses;
using LifeNavigator.Data;
using LifeNavigator.Util;

namespace LifeNavigator.Web
{
	public partial class Test : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LifeNavCookie myCookie = MyCookie;
			myCookie.Domain = Config.Domain;
			myCookie.Expires = DateTime.Today.AddDays(90);
			litCookie.Text = myCookie.Content.ToString();
			litCookie.Text += String.Format("<br/><br/><b>Domain : </b>{0}", myCookie.Domain);
			litCookie.Text += String.Format("<br/><b>Path : </b>{0}", myCookie.Path);
			litCookie.Text += String.Format("<br/><b>Expires : </b>{0}", myCookie.Expires);
			litCookie.Text += String.Format("<br/><br/><b>HasClientId : </b>{0}", myCookie.HasClientId);
			litCookie.Text += String.Format("<br/><br/><b>ClientId : </b>{0}", myCookie.ClientId);
			litCookie.Text += String.Format("<br/><b>EmailAddress : </b>{0}", myCookie.EmailAddress);
			litCookie.Text += String.Format("<br/><b>AppointmentDate : </b>{0}", myCookie.AppointmentDate);
			litCookie.Text += String.Format("<br/><b>AppointmentTime : </b>{0}", myCookie.AppointmentTime);
			litCookie.Text += String.Format("<br/><b>AppointmentType : </b>{0}", myCookie.AppointmentType);
			litCookie.Text += String.Format("<br/><b>GroupSize : </b>{0}", myCookie.GroupSize);

			//using (ClientDataContext db = new ClientDataContext(Constants.LIFENAVConnectionString))
			//{
			//    int clientId = 1;
			//    var data = db.LIFENAV_GetMembershipXML(clientId);
			//    var result = data.FirstOrDefault<LIFENAV_GetMembershipXMLResult>();
			//    if (result == null) {
			//        litEmailBody.Text = "";
			//    } else {
			//        XElement xelement = result.Column1;

			//        XmlWriterSettings settings = new XmlWriterSettings();
			//        settings.ConformanceLevel = ConformanceLevel.Auto;
			//        StringBuilder sb = new StringBuilder(8192);
			//        XmlWriter results = XmlWriter.Create(sb, settings);

			//        XslCompiledTransform xslt = new XslCompiledTransform();
			//        xslt.Load(Server.MapPath("~/App_Data/MembershipEmail.xsl"));
			//        xslt.Transform(xelement.CreateNavigator(), results);
			//        litEmailBody.Text = sb.ToString();
			//    }
			//}
		}
	}
}