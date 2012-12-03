<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" Inherits="LifeNavigator.Web.CodeBehindBase" Title="Life Navigator - Pricing Guide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		ul.pricing
		{
			list-style-type: disc;
			list-style-image: url(Images/swirl.jpg);
			padding:0;
		}
		ul.pricing li
		{
			margin-top: 1em;
			line-height: 1.25em;
			vertical-align: middle;
		}
		ul.pricing li.first
		{
			margin-top: 0;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Pricing</h1>
	<ul class="pricing">
		<li class="first">&nbsp;$50.00 for Individuals - 45 minute session</li>
		<li>&nbsp;$70.00 for Couples – 55 minute sessions</li>
		<li>&nbsp;$90.00 for Families - 60 minute sessions</li>
		<li>&nbsp;$45.00 each for Groups of 8 to 12 – 1 hour & 30 minute sessions<br /><span style="font-size:85%;">(contact <%=LifeNavigator.Util.MailUtil.ObfuscateEmail("lee@yourlifenavigator.com", "Life Navigator")%> for additional information on Groups)</span></li>
	</ul>
	<p style="font-weight:bold; margin-bottom:0;">PAYMENT</p>
	<a href="#" onclick="javascript:window.open('https://www.paypal.com/cgi-bin/webscr?cmd=xpt/Marketing/popup/OLCWhatIsPayPal-outside','olcwhatispaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=400, height=350');"><img src="https://www.paypal.com/en_US/i/bnr/horizontal_solution_PPeCheck.gif" alt="PayPal" /></a>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
</asp:Content>

