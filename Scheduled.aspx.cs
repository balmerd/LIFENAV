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
	public partial class Scheduled : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			int serviceId = 0;
			string timeStr = "";

			LIFENAV_Client client = null;
			int clientId = int.Parse(MyCookie.ClientId);

			using (ClientDataContext db = new ClientDataContext(Config.LIFENAVConnectionString))
			{
				client = (from c in db.LIFENAV_Clients where c.Id.Equals(clientId) select c).SingleOrDefault();
			}

			switch (MyCookie.AppointmentType.ToUpper()) {
			    case "INDIVIDUAL" :
			        serviceId = 1;
			        break;
			    case "COUPLE" :
			        serviceId = 2;
			        break;
			    case "FAMILY" :
			        serviceId = 3;
			        break;
			    case "GROUP" :
			        switch (MyCookie.GroupSize) {
			            case "8" :
			                serviceId = 4;
			                break;
			            case "9" :
			                serviceId = 5;
			                break;
			            case "10" :
			                serviceId = 6;
			                break;
			            case "11" :
			                serviceId = 7;
			                break;
			            case "12" :
			                serviceId = 8;
			                break;
			        }
			        break;
			}


			switch (MyCookie.AppointmentTime.ToUpper()) {
				case "9AM" :
					timeStr = " 09:00:00 AM";
					break;
				case "10AM" :
					timeStr = " 10:00:00 AM";
					break;
				case "11AM" :
					timeStr = " 11:00:00 AM";
					break;
				case "1PM" :
					timeStr = " 01:00:00 PM";
					break;
				case "2PM" :
					timeStr = " 02:00:00 PM";
					break;
				case "3PM" :
					timeStr = " 03:00:00 PM";
					break;
				case "4PM" :
					timeStr = " 04:00:00 PM";
					break;
			}

			string dt = MyCookie.AppointmentDate;
			DateTime reservedDateTime = DateTime.Parse(dt + timeStr);

		    // create our datacontext and wrap it in a using statement
		    using (AppointmentDataContext db = new AppointmentDataContext(Config.LIFENAVConnectionString))
		    {
		        var appointment = new LIFENAV_Client_Appointment();
		        appointment.ClientId = clientId;
		        appointment.ServiceId = serviceId;
		        appointment.ReservedDateTime = reservedDateTime;
		        db.LIFENAV_Client_Appointments.InsertOnSubmit(appointment);
		        db.SubmitChanges();
		    }

			// send appointment email
			MailUtil.SendAppointmentEmail(clientId, client.Email);

	        Response.Redirect("/Schedule.aspx", true);
		}
	}
}