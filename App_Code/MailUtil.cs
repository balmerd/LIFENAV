using System;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Collections;

using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;
using System.Xml.XPath;

using LinqClasses;
using LifeNavigator.Data;

namespace LifeNavigator.Util
{
	public class MailUtil
	{
		#region constants

		internal static string LIFENAV_EMAIL	= "lee";
		internal static string LIFENAV_ERROR	= "errors";
		internal static string LIFENAV_NOTFOUND	= "notfound";
		internal static string LIFENAV_DOMAIN = "yourlifenavigator.com";

		internal static string PAMELA_EMAIL = "pam@bridgingsf.com";
		internal static string LIFENAV_ADMIN_EMAIL = "david.b.balmer@gmail.com";

		internal static string LIFENAV_MEMBERSHIP_TEMPLATE = "~/App_Data/MembershipEmail.xsl";
		internal static string LIFENAV_APPOINTMENT_TEMPLATE = "~/App_Data/AppointmentEmail.xsl";

		#endregion

		#region public methods

		public static string ObfuscateEmail(string addr)
		{
			return ObfuscateEmail(addr, addr);
		}

		public static string ObfuscateEmail(string addr, string link)
		{
			return String.Format("<a href=\"{0}{1}\">{2}</a>", HtmlEncode("mailto:"), HtmlEncode(addr), link);
		}

		public static void SendMembershipEmail(int clientId, string toEmail)
		{
			StringBuilder sbEmailBody = _getEmailBody(_getMembershipXML(clientId), LIFENAV_MEMBERSHIP_TEMPLATE);
			_sendClientEmail(toEmail, "Welcome to the Life Navigator network!", sbEmailBody);
		}

		public static void SendAppointmentEmail(int clientId, string toEmail)
		{
			StringBuilder sbEmailBody = _getEmailBody(_getAppointmentXML(clientId), LIFENAV_APPOINTMENT_TEMPLATE);
			_sendClientEmail(toEmail, "Your Life Navigator appointment", sbEmailBody);
		}

		public static void SendErrorEmail(StringBuilder sbEmailBody)
		{
			SendErrorEmail("System Error", sbEmailBody);
		}
		public static void SendErrorEmail(string subject, StringBuilder sbEmailBody)
		{
			_sendAdminEmail(LIFENAV_ERROR, subject, sbEmailBody);
		}

		public static void SendNotFoundEmail(StringBuilder sbEmailBody)
		{
			_sendAdminEmail(LIFENAV_NOTFOUND, "Page Not Found", sbEmailBody);
		}

		#endregion

		#region private methods

		private static XElement _getMembershipXML(int clientId)
		{
			using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
			{
				var data = db.LIFENAV_GetMembershipXML(clientId);
				var result = data.FirstOrDefault<LIFENAV_GetMembershipXMLResult>();
				return (result == null ? null : result.Column1);
			}
		}

		private static XElement _getAppointmentXML(int clientId)
		{
			using (AppointmentDataContext db = new AppointmentDataContext(Config.LIFENAVConnectionString))
			{
				var data = db.LIFENAV_GetAppointmentXML(clientId);
				var result = data.FirstOrDefault<LIFENAV_GetAppointmentXMLResult>();
				return (result == null ? null : result.Column1);
			}
		}

		private static StringBuilder _getEmailBody(XElement xelement, string xslTemplate)
		{
			XmlWriterSettings settings = new XmlWriterSettings();
			settings.ConformanceLevel = ConformanceLevel.Auto;
			StringBuilder sb = new StringBuilder(8192);
			XmlWriter results = XmlWriter.Create(sb, settings);

			XslCompiledTransform xslt = new XslCompiledTransform();
			xslt.Load(HttpContext.Current.Server.MapPath(xslTemplate));
			xslt.Transform(xelement.CreateNavigator(), results);
			return sb;
		}

		private static void _sendClientEmail(string toEmail, string subject, StringBuilder sbEmailBody)
		{
			ArrayList emailList = new ArrayList();
			emailList.Add(toEmail);
			MailMessage oMail = _setupMessage(_emailAddress(LIFENAV_EMAIL), emailList, subject);
			oMail.Bcc.Add(PAMELA_EMAIL);
			oMail.Bcc.Add(LIFENAV_ADMIN_EMAIL);
			oMail.Body = sbEmailBody.ToString();
			_sendMessage(ref oMail);
			oMail = null;
		}

		private static void _sendAdminEmail(string toEmailName, string subject, StringBuilder sbEmailBody)
		{
			try {
				ArrayList emailList = new ArrayList();
				emailList.Add(LIFENAV_ADMIN_EMAIL);
				MailMessage oMail = _setupMessage(_emailAddress(toEmailName), emailList, subject);
				oMail.Body = sbEmailBody.ToString();
				_sendMessage(ref oMail);
				oMail = null;
			} catch (Exception ) {} //ignore
		}

		private static MailMessage _setupMessage(string fromEmail, ArrayList emailList, string subject)
		{
			MailMessage oMail = new MailMessage();
			oMail.From = new MailAddress(fromEmail);
			foreach (string toEmail in emailList) {
				oMail.To.Add(toEmail);
			}
			oMail.Subject = subject;
			oMail.IsBodyHtml = true;
			oMail.Priority =  MailPriority.High;
			return oMail;
		}

		private static void _sendMessage(ref MailMessage oMail)
		{
			// TODO: uncomment after debugging
			//SmtpClient oSmtp = new SmtpClient(WebConfigurationManager.AppSettings["SMTP_SERVER"]);
			//oSmtp.Send(oMail);
			//oSmtp = null;
		}

		private static string _emailAddress(string name)
		{
			return String.Format("{0}@{1}", name, LIFENAV_DOMAIN);
		}

		private static string HtmlEncode(string text)
		{ // http://www.eggheadcafe.com/PrintSearchContent.asp?LINKID=1149
		    string repl = ""; 
		    int i = 0, acode = 0; 
		    string tempHTMLEncode = text; 
		    for (i = tempHTMLEncode.Length; i >= 1; i--) { 
		        acode = System.Convert.ToInt32(tempHTMLEncode[i - 1]); 
		        if (acode == 32) { 
		            repl = " "; 
		        } else if (acode == 34) { 
		            repl = "\""; 
		        } else if (acode == 38) { 
		            repl = "&"; 
		        } else if (acode == 60) { 
		            repl = "<"; 
		        } else if (acode == 62) { 
		            repl = ">"; 
		        } else if (acode >= 32 && acode <= 127) { 
		            repl = "&#" + System.Convert.ToString(acode) + ";"; 
		        } else { 
		            repl = "&#" + System.Convert.ToString(acode) + ";"; 
		        } 
		        if (repl.Length > 0) { 
		            tempHTMLEncode = tempHTMLEncode.Substring(0, i - 1) + repl + tempHTMLEncode.Substring(i); 
		            repl = ""; 
		        } 
		    } 
		    return tempHTMLEncode;
		} 

		#endregion
	}
}