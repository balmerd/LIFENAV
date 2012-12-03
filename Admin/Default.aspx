<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="LifeNavigator.Web.Admin" Title="Life Navigator - Admin" %>

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
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Life Navigator Accounts</h1>
	<table class="myaccount">
		<asp:Repeater ID="rptClients" runat="server" EnableViewState="false">
			<ItemTemplate>
				<tr>
					<td><asp:Label runat="server" Text='<%# Eval("Id") %>' /></td>
					<td><asp:Label runat="server" Text='<%# String.Format("{0} {1}", Eval("FirstName"), Eval("LastName")) %>' /></td>
					<td><asp:Label runat="server" Text='<%# Eval("Email") %>' /></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
</asp:Content>

