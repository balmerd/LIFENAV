<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" Inherits="LifeNavigator.Web.CodeBehindBase" Title="Life Navigator - Get Started" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		p.step {
			color: #0066CC;
			font-size: 108%;
			font-weight: bold;
			padding-top: 0;
			text-decoration: underline;
		}
		ul.step {
			list-style-type: disc;
			list-style-image: url(Images/swirl.jpg);
			padding: 0;
		}
		ul.step li {
			margin-top: 1em;
			line-height: 1.25em;
			vertical-align: middle;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">How to Get Started</h1>
	
	<h2>Session Description</h2>
	<p>Sessions take place from 2:00pm to 12:00 am standard pacific time, Monday through Thursday and 12:00pm to 5pm on Fridays.  Clients must be registered before 12:00 pm in order to receive a web appointment later the same day or the next day and individual sessions last for 45 minutes.  Sessions may be possible at other times by contacting the Life Navigator to make special arrangements.</p>

	<h2>Requirements</h2>
	<p>Make sure you have a webcam (<a href="http://www.skype.com/" target="_blank">skype</a> is ok too)</p>
	<p>Phone conferences are sometimes possible but limited.  Please <%=LifeNavigator.Util.MailUtil.ObfuscateEmail("lee@yourlifenavigator.com", "contact")%> Life Navigator for details.</p>

	<p class="step" style="margin-top:1em;">STEP ONE:</p>
	<ul class="step">
		<li>&nbsp;<a href="Pricing.aspx">Review pricing guide</a></li>
		<li>&nbsp;Read and accept <a href="Agreement.aspx">Registration Agreement</a></li>
		<li>&nbsp;<a href="Registration.aspx">Register on-line</a></li>
	</ul>
	<p class="step" style="margin-top:1em;">STEP TWO:</p>
	<ul class="step">
		<li>&nbsp;Select time from the <a href="Schedule.aspx">schedule</a>, and enter payment information when reserving appointment</li>
	</ul>
	<p class="step" style="margin-top:1em;">STEP THREE:</p>
	<ul class="step">
		<li>&nbsp;Life Navigator will contact you via e-mail or phone to confirm the time of the session</li>
		<li>&nbsp;Log – on to Life Navigator to begin the session at the agreed upon time</li>
	</ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
</asp:Content>

