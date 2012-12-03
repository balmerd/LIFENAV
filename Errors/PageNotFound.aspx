<%@ Page Language="C#" MasterPageFile="~/masterpages/Site.master" AutoEventWireup="true" CodeFile="PageNotFound.aspx.cs" Inherits="LifeNavigator.Web.PageNotFound" Title="Life Navigator - Page Not Found" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<div style="padding:1em;">
		<h2>We're sorry, the page you requested was not found.</h2>
		<p><asp:Literal ID="litRequestedPath" runat="server" /></p>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
</asp:Content>