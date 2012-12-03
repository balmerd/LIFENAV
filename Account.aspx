<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="LifeNavigator.Web.Account" Title="Life Navigator - Your Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		table.myaccount {
			border: 1px solid #ccc;
			border-collapse: collapse;
			width: 100%;
		}
		table.myaccount td {
			border: 1px solid #ccc;
		}
		.myaccount .tbl-reserved-date {
			width: 18em;
		}
		.myaccount .tbl-reserved-time {
			width: 5em;
			text-align: right;
		}
		.myaccount .tbl-service-name {
		}
		.yui-button#btnSchedule button, .yui-button#btnLogout button {
			color: #008;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Upcoming Appointments</h1>
	<table class="myaccount">
		<asp:Repeater ID="Repeater1" runat="server" EnableViewState="false">
			<ItemTemplate>
				<tr>
					<td class="tbl-reserved-date"><asp:Label runat="server" Text='<%# String.Format("{0:D}", Eval("ReservedDateTime")) %>' /></td>
					<td class="tbl-reserved-time"><asp:Label runat="server" Text='<%# String.Format("{0:h  tt}", Eval("ReservedDateTime")) %>' /></td>
					<td><asp:Label runat="server" Text='<%# Eval("ServiceName") %>' /></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
	<div style="float:left; width:100%;">
		<div style="float:left; width:50%;">
			<span id="btnSchedule" class="yui-button yui-push-button">
				<span class="first-child"> 
					<input type="button" name="btnSchedule" value="Schedule an Apppointment" />
				</span> 
			</span> 
		</div>
		<div style="float:right; width:50%; text-align:right;">
			<span id="btnLogout" class="yui-button yui-push-button">
				<span class="first-child"> 
					<input type="button" name="btnLogout" value="Logout" />
				</span> 
			</span> 
		</div>
	</div>
	<div class="clear"></div>
	<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="10" Columns="80" Visible="false" />
	<br />
	<asp:Literal ID="Literal1" runat="server" Visible="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<script type="text/javascript">
		YAHOO.LifeNavigator.MyAccount = function () {
			var cookie = YAHOO.LifeNavigator.Cookie;
			var onSchedule = function(evt) {
				window.location.href = "Schedule.aspx";
			};
			var onLogout = function(evt) {
				cookie.setSub("ClientId", "");
				window.location.href = "/Login.aspx";
			};
			return {
				init: function() {
					new YAHOO.widget.Button("btnSchedule", { onclick: { fn: onSchedule } });
					new YAHOO.widget.Button("btnLogout", { onclick: { fn: onLogout } });
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.MyAccount.init);
	</script>
</asp:Content>

