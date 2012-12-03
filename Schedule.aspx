<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="LifeNavigator.Web.Schedule" Title="Life Navigator - Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		/* COLORS */
		/* #426fd9	dark	*/
		/* #b3d4ff	light	*/
		
		#legend {
			line-height: 1.5em;
			margin-bottom: 1em;
 		}
		#legend span {
			border: 1px solid #555;
 		}
		#legend .open {
			background-color: #fff;
		}
		#legend .reserved {
			background-color: Red;
		}
		#legend .open-reserved {
			background-color: #426fd9;
		}
		#appointment-module {
			float: right;
			width: 500px; 
			border: 1px solid #999;
			background-color: #F0F8FF;
		}
		#appointment-module .hd {
			color: #EEE;
			font-weight: bold;
			text-align: center;
			padding: 2px 5px 5px 5px;
			background: #3F6AD1 repeat-x 0 -1400px;
		}
		#appointment-module .bd {
			font-size: 92%;
			padding: 0.75em;
		}
		#appointment {
		}
		#appointment table {
			width: 100%;
			border: 1px solid #ccc;
			border-collapse: collapse;
		}
		#appointment table td {
			padding: 5px;
			border: 1px solid #ddd;
			height: 24px;
		}
		#appointment span.reserved {
			color: Red;
			font-weight: bold;
			font-size: 85%;
		}
		.yui-skin-sam .yui-calendar td.calcell.calcellhover a {
			background-color: #B3D4FF !important;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first" style="margin-bottom:1em;">Appointment Schedule</h1>
	<div id="legend" style="margin-bottom:1em;">
		<b>Legend:</b>&nbsp;
		<span class="open">&nbsp;&nbsp;</span>&nbsp;open&nbsp;
		<span class="reserved">&nbsp;&nbsp;</span>&nbsp;reserved&nbsp;
		<span class="open-reserved">&nbsp;&nbsp;</span>&nbsp;open, but some times are already reserved
		<img id="calendar-loading" src="Images/ajax-loader.gif" width="13" height="13" alt="" />
	</div>
	<div style="float:left; width:100%;">
		<div id="calContainer" style="width:auto;"></div>
		<div id="appointment-module" class="hidden">
            <div id="selectedDate" class="hd" runat="server"></div>
			<div id="appointment" class="bd">
				<table width="100%" cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td style="width:3em;"><b>9<sup>AM</sup></b></td>
						<td>
							<span id="9AM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="9AM" value="reserve" />
								</span> 
							</span> 
							<span id="9AM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>10<sup>AM</sup></b></td>
						<td>
							<span id="10AM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="10AM" value="reserve" />
								</span> 
							</span> 
							<span id="10AM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>11<sup>AM</sup></b></td>
						<td>
							<span id="11AM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="11AM" value="reserve" />
								</span> 
							</span> 
							<span id="11AM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>1<sup>PM</sup></b></td>
						<td>
							<span id="1PM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="1PM" value="reserve" />
								</span> 
							</span> 
							<span id="1PM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>2<sup>PM</sup></b></td>
						<td>
							<span id="2PM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="2PM" value="reserve" />
								</span> 
							</span> 
							<span id="2PM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>3<sup>PM</sup></b></td>
						<td>
							<span id="3PM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="3PM" value="reserve" />
								</span> 
							</span> 
							<span id="3PM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
					<tr>
						<td><b>4<sup>PM</sup></b></td>
						<td>
							<span id="4PM" class="yui-button yui-push-button hidden"> 
								<span class="first-child"> 
									<input type="button" name="4PM" value="reserve" />
								</span> 
							</span> 
							<span id="4PM-reserved" class="reserved hidden"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<asp:Literal ID="litExternalJS" runat="server" />
	<script type="text/javascript">
		var selectedDateEl = '<%=selectedDate.ClientID%>';
		
		YAHOO.LifeNavigator.Schedule = function () {
			var calendar;
			var selectedDate;
			var selectedDateStr;

			var cookie = YAHOO.LifeNavigator.Cookie;
			var styleSheet = new YAHOO.util.StyleSheet();

			var resetDailyReservations = function() {
				var arrButtons = ["9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM"];
				for (var i=0; i<arrButtons.length; i++) {
					hourEl = arrButtons[i];
					hourReservedEl = hourEl + "-reserved";
					YDOM.removeClass(hourEl, "hidden");
					YDOM.addClass(hourReservedEl, "hidden");
				}
			};
			
			var setReservedDate = function(month, day, year, appointments) {
				var cssSelector = '.yui-skin-sam .y'+year+' .m'+month+' .d'+day;
				if (appointments >= 6) {
					styleSheet.set(cssSelector, { backgroundColor : 'red' });
				} else {
					styleSheet.set(cssSelector, { backgroundColor : '#426fd9' });
				}
			};
			var setSelectedDate = function(month, day, year) {
				selectedDateStr = month + "/" + day + "/" + year;
				selectedDate = new Date();
				selectedDate.setTime(Date.parse(selectedDateStr));
				(YDOM.get(selectedDateEl)).innerHTML = selectedDate.toLocaleDateString();
				getGetDailyAppointments(year, month, day);
			};
			var setInitialDate = function(d) {
				setSelectedDate((d.getMonth()+1), d.getDate(), d.getFullYear());
			};
			var onDateSelected = function(type, args) {
				var dates = args[0];
				var date = dates[0];
				setSelectedDate(date[1], date[2], date[0]);
			};
			var onMonthChanged = function(type, args) { // type = "changepage"
				var curMonth, curYear;
				var cDates = calendar.cellDates;
				var iMax = cDates.length;
				for (var i=0; i<iMax; i++) {
					if (cDates[i][2] == 1) {
						curMonth = cDates[i][1];
						curYear = cDates[i][0];
						break;
					}
				}
				getMonthlySchedule(curYear, curMonth);
			};
			var onButtonClick = function(evt) {
				var tm = this.get("id");
				cookie.setSubs( { Date : selectedDateStr, Time : tm } );
				// look for persistent cookie with their ClientID
				if (cookie.value && cookie.value.ClientId == "") {
					alert("ClientId not found, redirecting to Login page (TBD)");
					//window.location.href = "Login.aspx";
				} else {
					window.location.href = "Confirm.aspx";
				}
			};
			var addButton = function(id) {
				new YAHOO.widget.Button(id, { onclick: { fn: onButtonClick } });
			};
			var callbackMonthlySchedule = { 
				cache: false, 
				success: function(o) {
					if (YAHOO.lang.JSON.isValid(o.responseText)) {
						var responseData = YAHOO.lang.JSON.parse(o.responseText);
						if (YAHOO.lang.JSON.isValid(responseData.d)) {
							var bRender = false;
							monthData = YAHOO.lang.JSON.parse(responseData.d);
							for (var i=0; i<monthData.length; i++) {
								if (monthData[i].Month > (calendar.today.getMonth()+1)) { // future month
									bRender = true;
								} else if (monthData[i].Day >= calendar.today.getDate()) { // or greater than current (selectable) date
									bRender = true;
								}
								if (bRender) {
									setReservedDate(monthData[i].Month, monthData[i].Day, monthData[i].Year, monthData[i].Appointments);
								}
							}
						}
					}
					//alert('success: o.status:'+o.status+', o.statusText:'+o.statusText+', o.responseText:'+o.responseText);
				},
				failure: function(o) {
					alert('failure: o.status:'+o.status+', o.statusText:'+o.statusText);
				}
			};
			function getMonthlySchedule(year, month) { // http://stackoverflow.com/questions/325081/json-webservice-in-asp-net
				var postData = { "clientId" : cookie.getSub("ClientId"), "year" : year, "month" : month  };
				var jsonData  = YAHOO.lang.JSON.stringify(postData);
				YAHOO.util.Connect.setDefaultPostHeader(false); // required for JSON
				YAHOO.util.Connect.initHeader("Content-Type","application/json; charset=utf-8"); // required for JSON
				YAHOO.util.Connect.asyncRequest('POST', '<%=WebServicePath%>/Schedule.asmx/GetMonthlySchedule', callbackMonthlySchedule, jsonData);
			};
			var callbackGetDailyAppointments = { 
				cache: false, 
				success: function(o) {
					resetDailyReservations();
					var hourEl, hourReservedEl;
					if (YAHOO.lang.JSON.isValid(o.responseText)) {
						var responseData = YAHOO.lang.JSON.parse(o.responseText);
						if (YAHOO.lang.JSON.isValid(responseData.d)) {
							dailyData = YAHOO.lang.JSON.parse(responseData.d);
							for (var i=0; i<dailyData.length; i++) {
								hourEl = dailyData[i].HourStr;
								hourReservedEl = hourEl + "-reserved";
								(YDOM.get(hourReservedEl)).innerHTML = 'Reserved for your ' + dailyData[i].ShortName + ' appointment';
								YDOM.addClass(hourEl, "hidden");
								YDOM.removeClass(hourReservedEl, "hidden");
							}
						}
					}
					//alert('success: o.status:'+o.status+', o.statusText:'+o.statusText+', o.responseText:'+o.responseText);
				},
				failure: function(o) {
					alert('failure: o.status:'+o.status+', o.statusText:'+o.statusText);
				}
			};
			function getGetDailyAppointments(year, month, day) {
				var postData = { "clientId" : cookie.getSub("ClientId"), "year" : year, "month" : month, "day" : day };
				var jsonData  = YAHOO.lang.JSON.stringify(postData);
				YAHOO.util.Connect.setDefaultPostHeader(false); // required for JSON
				YAHOO.util.Connect.initHeader("Content-Type","application/json; charset=utf-8"); // required for JSON
				YAHOO.util.Connect.asyncRequest('POST', '<%=WebServicePath%>/Schedule.asmx/GetDailyAppointments', callbackGetDailyAppointments, jsonData);
			};
			return {
				init: function() {
					//try {
						calendar = new YAHOO.widget.Calendar("calContainer", { mindate: new Date()<%=CalendarConfig %> });
						calendar.render();
						var selectedDates = calendar.getSelectedDates();
						var selectedDate = (selectedDates.length > 0 ? selectedDates[0] : calendar.today);
						setInitialDate(selectedDate);
						getMonthlySchedule(selectedDate.getFullYear(), selectedDate.getMonth()+1);
						calendar.selectEvent.subscribe(onDateSelected);
						calendar.changePageEvent.subscribe(onMonthChanged);
						var arrButtons = ["9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM"];
						var iMax = arrButtons.length;
						for (var i=0; i<iMax; i++) {
							addButton(arrButtons[i]);
						}
						YDOM.removeClass('appointment-module', 'hidden');
						YDOM.addClass('calendar-loading', 'hidden');
					//} catch (ex) {
					//	YAHOO.LifeNavigator.Util.logError("Schedule.init", ex);
					//}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Schedule.init);
	</script>
</asp:Content>

