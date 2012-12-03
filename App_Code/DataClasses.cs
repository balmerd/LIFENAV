using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace LifeNavigator.Data
{
	public class MonthlySchedule
	{
		public int? Year { get; set; }
		public int? Month { get; set; }
		public int? Day { get; set; }
		public int? Appointments { get; set; }

		public MonthlySchedule(int? year, int? month, int? day, int? appointments) {
			Year = year;
			Month = month;
			Day = day;
			Appointments = appointments;
		}
	}
	public class DailyAppointment
	{
		public int ClientId { get; set; }
		public string ShortName { get; set; }
		public int Hour { get; set; }
		public string HourStr { get; set; }

		public DailyAppointment(int clientId, string shortName, DateTime reservedDateTime) {
			ClientId = clientId;
			ShortName = shortName;
			Hour = reservedDateTime.Hour;
			HourStr = reservedDateTime.ToString("htt");
		}
	}
}
