<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="LifeNavigator.Web.Test" Title="Life Navigator - Test" Trace="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1>Cookie</h1>
	<asp:Literal ID="litCookie" runat="server" />
	
	<h1>Email</h1>
	<asp:Literal ID="litEmailBody" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
</asp:Content>

