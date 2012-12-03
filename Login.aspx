<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LifeNavigator.Web.Login" Title="Life Navigator - Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		#login-module {
			margin: 0 auto;
			width: 400px; 
			border: 1px solid #999;
			background-color: #F0F8FF;
		}
		#login-module .hd {
			color: #EEE;
			font-weight: bold;
			text-align: center;
			padding: 2px 5px 5px 5px;
			background: #3F6AD1 repeat-x 0 -1400px;
		}
		#login-module .bd {
			padding: 0.75em 0.75em 0 0.75em;
		}
		#login-module td {
			border-style: none;
		}
		#login-module input {
			padding: 2px;
		}
		table.login {
			border-style: none;
			width: 100%;
		}
		table.login td {
			border-style: none;
		}
		.error {
			color: Red;
			font-size: 85%;
		}
		.yui-button#btnLogin button {
			color: #008;
			margin-right: 0;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<div id="login-module">
        <div class="hd">Login to your Account</div>
		<div class="bd">
			<table class="login">
				<tr>
					<td>Email:</td>
					<td><asp:TextBox ID="txtEmail" runat="server" Columns="50" MaxLength="50" Width="280px" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td>
						<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Columns="10" MaxLength="10" Width="90px" />
						<span style="font-size:85%;">(between 4 and 10 characters)</span>
					</td>
				</tr>
			</table>
			<table class="login">
				<tr>
					<td style="width:295px;"><asp:Label ID="lblError" runat="server" CssClass="error" /></td>
					<td style="height:35px; text-align:right;">
						<span id="btnLogin" class="yui-button yui-push-button hidden"> 
							<span class="first-child"> 
								<input type="submit" name="login" value="login" style="font-weight:bold;" />
							</span>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<asp:Literal ID="litExternalJS" runat="server" />
	<script type="text/javascript">
		YAHOO.LifeNavigator.Login = function () {
			return {
				init: function() {
					try {
						new YAHOO.widget.Button("btnLogin");
						YDOM.removeClass("btnLogin", "hidden");
						(YDOM.get('<%=txtEmail.ClientID%>')).focus();
					} catch (ex) {
						YAHOO.LifeNavigator.Util.logError("Schedule.init", ex);
					}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Login.init);
	</script>
</asp:Content>

