<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Schedule_YUI.aspx.cs" Inherits="LifeNavigator.Web.Schedule_YUI" Title="Life Navigator - YUI Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<!-- Individual YUI CSS files -->  
	<!--
	<link rel="stylesheet nofollow" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/calendar/assets/skins/sam/calendar.css" />
	<link rel="stylesheet nofollow" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/container/assets/skins/sam/container.css" />
	-->
	<link href="/Styles/calendar.css" rel="stylesheet" type="text/css" />
	<link href="/Styles/container.css" rel="stylesheet" type="text/css" />
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
			font-weight: bold;
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
			background: #3F6AD1 url(http://yui.yahooapis.com/2.7.0/build/assets/skins/sam/sprite.png) repeat-x 0 -1400px;
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
		}
		#appointment .reserved {
			color: Red;
			font-weight: bold;
		}

		/* YUI MODS */
		.yui-skin-sam .yui-calendar td.calcell.selected a {
			background-color: #b3d4ff;
		}
		.yui-skin-sam .yui-calendar td.calcell.calcellhover, 
		.yui-skin-sam .yui-calendar td.calcell.calcellhover a, 
		.yui-skin-sam .yui-calendar td.calcell.calcellhover a:hover {
			background-color: #fff;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
<h1 class="first" style="margin-bottom:1em;">Appointment Schedule</h1>
	<div id="legend" style="margin-bottom:1em; line-height:1.5em;">
		<b>Legend:</b>&nbsp;
		<span class="open">&nbsp;&nbsp;</span>&nbsp;open&nbsp;
		<span class="reserved">&nbsp;&nbsp;</span>&nbsp;reserved&nbsp;
		<span class="open-reserved">&nbsp;&nbsp;</span>&nbsp;open, but some times are already reserved
	</div>
	<div style="float:left; width:100%;">
		<div id="calContainer" style="width:auto;"></div>
		<div id="appointment-module">
			<div id="today" class="hd" runat="server"></div>
			<div id="appointment" class="bd">
				<table width="100%" cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td style="width:3em;"><b>9<sup>AM</sup></b></td>
						<td>
							<span id="9AM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="9AM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
					<tr>
						<td><b>10<sup>AM</sup></b></td>
						<td>
							<span id="10AM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="10AM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
					<tr>
						<td><b>11<sup>AM</sup></b></td>
						<td>
							<span id="11AM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="11AM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
					<tr>
						<td><b>1<sup>PM</sup></b></td>
						<td>
							<span id="1PM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="1PM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
					<tr>
						<td><b>2<sup>PM</sup></b></td>
						<td class="reserved">RESERVED</td>
					</tr>
					<tr>
						<td><b>3<sup>PM</sup></b></td>
						<td>
							<span id="3PM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="3PM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
					<tr>
						<td><b>4<sup>PM</sup></b></td>
						<td>
							<span id="4PM" class="yui-button yui-push-button"> 
								<span class="first-child"> 
									<input type="button" name="4PM" value="reserve" />
								</span> 
							</span> 
						</td>
					</tr>
				</table>
			</div> 
		</div>
	</div>
	<div class="clear"></div>
	<div style="height:1em;"></div>
	<button id="btnTest">test</button>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<!-- Individual YUI JS files -->  
	<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/calendar/calendar-min.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/container/container-min.js"></script>
	<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/stylesheet/stylesheet-min.js"></script>  
	<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/json/json-min.js"></script>
	<script type="text/javascript">
		YAHOO.LifeNavigator.Schedule = function () {
			var calendar;
			var cookie = YAHOO.LifeNavigator.Cookie;
			
			/*
			var jsonData = {
				reservations: [
				  { date: "2009-03-18", clientId: "1", typeId: "1" },
				  { date: "2009-03-20", clientId: "2", typeId: "2" }
				]
			};
			var jsonStr = YAHOO.lang.JSON.stringify(jsonData);
			alert(jsonStr);
			*/
			
			var styleSheet = new YAHOO.util.StyleSheet();
			var selectedDate;
			
			var setReservedDate = function(month, day, year) {
				var cssSelector = '.yui-skin-sam .y'+year+' .m'+month+' .d'+day;
				styleSheet.set(cssSelector, { backgroundColor : 'red' });
			};
			var testClick = function() {
				setReservedDate(3, 15, 2009);
				//styleSheet.set('.yui-skin-sam .y2009 .m3 .d6', { backgroundColor : '#426fd9' });
				//styleSheet.unset('.yui-skin-sam .y2009 .m3 .d9', 'backgroundColor');
			};
			var setSelectedDate = function(month, day, year) {
				selectedDate = month + "/" + day + "/" + year;
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
				alert("onMonthChanged(curMonth:"+curMonth+", curYear:"+curYear+")");
			};
			var onButtonClick = function(evt) {
				var tm = this.get("id");
				var dt = selectedDate;
				cookie.setSubs( { Date : dt, Time : tm } );
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
			return {
				init: function() {
					try {
						calendar = new YAHOO.widget.Calendar("calContainer", { mindate: new Date() });
						calendar.render();
						setInitialDate(calendar.today);
						calendar.selectEvent.subscribe(onDateSelected);
						calendar.changePageEvent.subscribe(onMonthChanged);
						// notify of any appointments that exist for this date
						// ...TBD
						var arrButtons = ["9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM"];
						var iMax = arrButtons.length;
						for (var i=0; i<iMax; i++) {
							addButton(arrButtons[i]);
						}
						YEVENT.on('btnTest', 'click', testClick);
					} catch (ex) {
						YAHOO.LifeNavigator.Util.logError("Schedule.init", ex);
					}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Schedule.init);
	</script>
</asp:Content>

