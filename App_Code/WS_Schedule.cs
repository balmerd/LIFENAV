using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;

using LinqClasses;
using LifeNavigator.Data;
using Newtonsoft.Json; // http://james.newtonking.com/projects/json-net.aspx (Copyright (c) 2007 James Newton-King)

namespace LifeNavigator.WebServices
{
	[WebService(Name="Schedule", Namespace = "http://lifenavigator.dbalmer.net/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	// To allow this Web Service to be called from script, using ASP.NET AJAX (or YUI), uncomment the following line.
	// returns "Content-Type: application/json; charset=utf-8;"
	[System.Web.Script.Services.ScriptService]
	public class Schedule : System.Web.Services.WebService
	{
		public Schedule ()
		{
			//Uncomment the following line if using designed components 
			//InitializeComponent(); 
		}

		[WebMethod (Description="Returns the appointments for a selected date", EnableSession=false, BufferResponse=false)]
		public string GetDailyAppointments(int year, int month, int day)
		{
			using (ScheduleDataContext db = new ScheduleDataContext(Config.LIFENAVConnectionString))
			{
				List<DailyAppointment> appointments = new List<DailyAppointment>();
				DateTime startDate = new DateTime(year, month, day);
				var query = db.LIFENAV_GetDailyAppointments(startDate, 1, null);
				foreach (LIFENAV_GetDailyAppointmentsResult data in query) {
				    appointments.Add(new DailyAppointment(data.ClientId, data.ShortName, data.ReservedDateTime));
				}
				string JSONAppointments = JavaScriptConvert.SerializeObject(appointments);
				return JSONAppointments;
			}
		}

		[WebMethod (Description="Returns the number of appointments for a selected month", EnableSession=false, BufferResponse=false)]
		public string GetMonthlySchedule(int year, int month)
		{
			using (ScheduleDataContext db = new ScheduleDataContext(Config.LIFENAVConnectionString))
			{
				List<MonthlySchedule> schedules = new List<MonthlySchedule>();
				DateTime startDate = new DateTime(year, month, 1);
				var query = db.LIFENAV_GetMonthlySchedule(startDate);
				foreach (LIFENAV_GetMonthlyScheduleResult data in query) {
				    schedules.Add(new MonthlySchedule(data.Year, data.Month, data.Day, data.Appointments));
				}
				string JSONSchedules = JavaScriptConvert.SerializeObject(schedules);
				return JSONSchedules;
			}
		}
	}
}