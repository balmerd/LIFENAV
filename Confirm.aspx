<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Confirm.aspx.cs" Inherits="LifeNavigator.Web.Confirm" Title="Life Navigator - Confirm Appointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		.pricing {
			margin-top: 1em;
		}
		.pricing table {
			width: 100%;
			border: 1px solid #ccc;
			border-collapse: collapse;
		}
		.pricing table td {
			padding: 5px;
			text-align: center;
			border: 1px solid #ddd;
		}
		.pricing table td.align-left {
			text-align: left;
		}
		#service-price, #group-total {
			width: 10em;
		}
		#imgPayPal {
			cursor: pointer;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Confirm Appointment</h1>
	<p>
		<asp:Literal ID="litDate" runat="server" />
	</p>
	<p>
		This appointment is for 
		<asp:DropDownList ID="ddlType" runat="server">
			<asp:ListItem Text="-- select one --" Value="NONE" Selected="True" />
			<asp:ListItem Text="an Individual" Value="INDIVIDUAL" />
			<asp:ListItem Text="a Couple" Value="COUPLE" />
			<asp:ListItem Text="a Family" Value="FAMILY" />
			<asp:ListItem Text="a Group" Value="GROUP" />
		</asp:DropDownList>
		<span id="group-size" class="hidden">how many in your Group? 
			<asp:DropDownList ID="ddlGroupSize" runat="server">
				<asp:ListItem Text="8" Value="8" Selected="True" />
				<asp:ListItem Text="9" Value="9" />
				<asp:ListItem Text="10" Value="10" />
				<asp:ListItem Text="11" Value="11" />
				<asp:ListItem Text="12" Value="12" />
			</asp:DropDownList>
		</span>
	</p>
	<div id="group-pricing" class="pricing hidden">
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td></td>
				<td>Group Size</td>
				<td>Each Person</td>
				<td>Total Price</td>
			</tr>
			<tr>
				<td class="align-left">Life Navigator for Groups</td>
				<td id="group-members">8</td>
				<td>$45</td>
				<td id="group-total">$360</td>
			</tr>
		</table>
	</div>
	<div id="other-pricing" class="pricing hidden">
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td></td>
				<td>Price</td>
			</tr>
			<tr>
				<td id="service-desc" class="align-left">Life Navigator for Individuals</td>
				<td id="service-price">$50</td>
			</tr>
		</table>
	</div>
	<div style="margin-top:1em;">
		<div style="float:left; width:100%;">
			<div style="float:left; width:300px;">
				<span id="cancel" class="yui-button yui-push-button"> 
					<span class="first-child"> 
						<input type="button" name="cancel" value="Cancel and return to Appointment Schedule" /> 
					</span> 
				</span> 
			</div>
			<div style="float:right; width:400px; text-align:right;">
				<!-- hide imgPayPal until appointment type selected  -->
				 <img id="imgPayPal" class="hidden" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" alt="PayPal - The safer, easier way to pay online!" />
			</div>
		</div>
		<div class="clear"></div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<form id="frmPayPal" name="frmPayPal" action="<%=PayPalURI%>" method="post">
		<input type="hidden" name="rm" value="2" /><!-- return method = post -->
		<input type="hidden" name="cmd" value="_s-xclick" />
		<input type="hidden" name="hosted_button_id" value="" />
		<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1" />
	</form>

	<script type="text/javascript">
		YAHOO.LifeNavigator.Confirm = function () {
			var payPalButtonId;
			var cookie = YAHOO.LifeNavigator.Cookie;
			var onButtonClick = function(evt) {
				var id = this.get("id");
				if (id == "cancel") {
					window.location.href = "/Schedule.aspx";
				}
			};
			var	onTypeSelected =  function(evt) {
				// inside the function, "this" is the html element, not the YAHOO.LifeNavigator.Confirm object
				var typeSelected = this.value;
				if (typeSelected == "GROUP") {
					cookie.setSubs( { Type : typeSelected, GroupSize : "" } );
					YDOM.addClass("other-pricing", "hidden");			// hide Individual/Couple/Family total
					YDOM.removeClass("group-size", "hidden");			// show group members
					YDOM.removeClass("group-pricing", "hidden");		// show group totals
					YDOM.removeClass("imgPayPal", "hidden");			// show PayPal button (imgPayPal)
					setGroupSizeValues();								// call private function
				} else {
					YDOM.addClass("group-size", "hidden");				// hide Group controls
					YDOM.addClass("group-pricing", "hidden");
					if (typeSelected == "NONE") {
						YDOM.addClass("other-pricing", "hidden");		// hide Payment controls
						YDOM.addClass("imgPayPal", "hidden");
					} else {
						cookie.setSubs( { Type : typeSelected, GroupSize : "" } );
						var serviceDesc, servicePrice, buttonId;
						switch (typeSelected) {
							case "INDIVIDUAL" :
								buttonId = "<%=GetPayPalIndividualButtonId()%>";
								servicePrice = "$50.00";
								serviceDesc = "Life Navigator for Individuals";
								break;
							case "COUPLE" :
								buttonId = "<%=GetPayPalCoupleButtonId()%>";
								servicePrice = "$70.00";
								serviceDesc = "Life Navigator for Couples";
								break;
							case "FAMILY" :
								buttonId = "<%=GetPayPalFamilyButtonId()%>";
								servicePrice = "$90.00";
								serviceDesc = "Life Navigator for Families";
								break;
						}
						PayPalButtonId = buttonId;
						(YDOM.get("service-desc")).innerHTML = serviceDesc;
						(YDOM.get("service-price")).innerHTML = servicePrice;
						YDOM.removeClass("other-pricing", "hidden");	// show Individual/Couple/Family total
						YDOM.removeClass("imgPayPal", "hidden");		// show PayPal button (imgPayPal)
					}
				}
			};
			var onPayPalClicked = function(evt) {
				document.frmPayPal.hosted_button_id.value = PayPalButtonId;
				document.frmPayPal.submit(); 
			};
			var setGroupSizeValues = function() {
				var buttonIds = [<%=GetPayPalGroupButtonIds()%>];
				var groupSize = (YDOM.get("<%=ddlGroupSize.ClientID%>")).value;
				var selectedIndex = (YDOM.get("<%=ddlGroupSize.ClientID%>")).selectedIndex;
				cookie.setSub("GroupSize", groupSize);
				PayPalButtonId = buttonIds[selectedIndex];
				(YDOM.get("group-members")).innerHTML = groupSize;
				(YDOM.get("group-total")).innerHTML = ("$" + (groupSize * 45));
			};
			return {
				init: function() {
					try {
						(YDOM.get("<%=ddlType.ClientID%>")).selectedIndex = 0;
						(YDOM.get("<%=ddlGroupSize.ClientID%>")).selectedIndex = 0;
						
						new YAHOO.widget.Button("cancel", { onclick: { fn: onButtonClick } });
			
						YEVENT.on("<%=ddlType.ClientID%>", "change", onTypeSelected);
						YEVENT.on("<%=ddlGroupSize.ClientID%>", "change", setGroupSizeValues);
						YEVENT.on("imgPayPal", "click", onPayPalClicked);

						cookie.setSubs( { Type : "", GroupSize : "" } );
					} catch (ex) {
						YAHOO.LifeNavigator.Util.logError("Confirm.init", ex);
					}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Confirm.init);
	</script>
</asp:Content>
