<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="LifeNavigator.Web.Landing" Title="Life Navigator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Lending a caring and trained ear to those in need</h1>
	<div style="float:left; width:100%">
		<div style="float:left; width:34%;">
			<div style="padding:2px;">
				<p style="font-size:93%;"><em>Providing life support in areas of</em></p>
				<ul type="disc" style="margin:1em; padding-left:1em;">
					<li>Relationships</li>
					<li>Career</li>
					<li>Loss/Bereavement</li>
					<li>Identity</li>
					<li>Sexual Orientation</li>
					<li>Life Purpose</li>
					<li>Anxiety</li>
					<li>Depression</li>
					<li>Spirituality</li>
					<li>Addictions</li>
					<li>Traumas/PTSD</li>
					<li>Weight issues</li>
				</ul>
			</div>
		</div>
		<div style="float:left; width:24%;">
			<div style="padding:2px;">
				<p style="font-size:93%;"><em>Provide support for</em></p>
				<ul type="disc" style="margin:1em; padding-left:1em;">
					<li>Individuals</li>
					<li>Couples</li>
					<li>Families</li>
					<li>Teens</li>
					<li>Children</li>
				</ul>
			</div>
		</div>
		<div style="float:left; width:40%;">
			<div style="padding:2px;">
				<p style="font-size:93%;"><em>Who will benefit</em></p>
				<p><i>I assist people from diverse backgrounds including ethnic, socio-economic, gender, sexual orientation and ages with navigating through the challenges of life in the privacy of their own homes.</i></p>
				<p>All of the sessions are confidential with no judgment.  You will receive assistance with the challenges of life experiences, issues and its meaning.</p>
			</div>
		</div>
	</div>
	<div style="clear:both; height:80px;"></div>
	<div style="text-align:center; font-size:85%;">PRIVATE FACE TO FACE 45 MINUTES WEB MEETINGS WITH YOUR ISSUES, CONCERNS OR INQUIRIES AS THE PRIMARY FOCUS</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<script type="text/javascript">
//		YAHOO.LifeNavigator.Landing = function () {
//			var cookie = YAHOO.LifeNavigator.Cookie;
//			return {
//				init: function() {
//					try {
//						// retain ClientId (if set) and clear other values
//						var clientId = cookie.value.ClientId;
//						cookie.setSubs( { ClientId : (clientId ? clientId : ""), Date : "", Time : "", Type : "", GroupSize : "" } );
//					} catch (ex) {
//						YAHOO.LifeNavigator.Util.logError("Landing.init", ex);
//					}
//				}
//			};
//		}();
//		YEVENT.onDOMReady(YAHOO.LifeNavigator.Landing.init);
	</script>
</asp:Content>

