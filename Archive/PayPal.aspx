<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayPal.aspx.cs" Inherits="PayPal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<!--
		registration_form
			- when posted, inserts a Client into the DB
			- creates a persistent cookie with their ClientID
			- need a Login page to show/cancel their appointments?

		reserve button opens new page
			- passes date, time (POST)
				- date format is "mm/dd/yyyy"
				- time format is "11AM" or "1PM"
					- split time into...
						- hour
						- type (AM/PM)
				- create DateTime var from date parts
					- if invalid date...
						- error message with return to Appointment Schedule button
			- has a return to Appointment Schedule button
			- looks for persistent cookie with their ClientID
				- if not found, redirect to login page?
			- notify of any appointments that exist for this date (do this on the Schedule page)
			- contains pre-defined hidden "Buy Now" buttons
				- Life Navigator for Individuals				= $ 50.00
				- Life Navigator for Couples					= $ 70.00
				- Life Navigator for Families					= $ 90.00
				- Life Navigator for Groups of 8 - $45.00 x 8	= $360.00
				- Life Navigator for Groups of 9 - $45.00 x 9	= $405.00
				- Life Navigator for Groups of 10 - $45.00 x 10	= $450.00
				- Life Navigator for Groups of 11 - $45.00 x 11	= $495.00
				- Life Navigator for Groups of 12 - $45.00 x 12	= $540.00
				- add onclick event to payment buttons to...
					- set Appointment Date, Time, and Type in cookie
			- select appointment type: Individual, Couple, Families, Groups (and group size)
				- determines the amount
				- shows appropriate payment button
			- clicking on payment button
				- calls onclick event to set Appointment Date, Time, and Type in cookie
				
			- after payment, redirects to Confirmed.aspx page
				- insert reservation into appointments DB, using cookie ClientID
					- how do we know what was reserved?
						- from Appointment Date, Time, Type in cookie
				- if insert fails on duplicate row, ignore (page refresh)
				
			- if payment is cancelled, redirects to Canceled.aspx page
	-->
	<form id="form1" runat="server">
	</form>
	<form name="frmPayPalAddCart" target="paypal" action="https://sandbox.paypal.com/cgi-bin/webscr" method="post">
		<!-- target="paypal" : The PayPal Shopping cart opens in a separate browser window or tab -->
		
		<!-- Identify your business so that you can collect the payments. -->
		<input type="hidden" name="business" value="me@mybusiness.com" /><!-- sellers PayPal ID or confirmed email address -->

		<!-- Specify a PayPal Shopping Cart Add to Cart button. -->
		<input type="hidden" name="cmd" value="_cart" />
		<input type="hidden" name="add" value="1" />

		<!-- Specify details about the item that buyers will purchase. -->
		<input type="hidden" name="amount" value="50.00" /><!-- Required for Add to Cart buttons -->
		<input type="hidden" name="currency_code" value="USD" /><!-- The currency of the payment. The default is USD -->
		<input type="hidden" name="item_name" value="Life Navigator for Individuals" /><!-- Optional for Add to Cart buttons -->

		<!-- optional settings -->
		<input type="hidden" name="rm" value="2" /><!-- the payer’s browser is redirected to the return URL by the POST method, and all transaction variables are also posted -->
		<input type="hidden" name="cbt" value="Life Navigator" /><!-- Sets the text for the Return to Merchant button -->
		<input type="hidden" name="no_shipping" value="1" /><!-- no shipping address required -->
		<input type="hidden" name="return" value="http://www.dbalmer.net/LifeNavigator/Confirmed.aspx" />
		<input type="hidden" name="shopping_url" value="http://www.dbalmer.net/LifeNavigator/Schedule.aspx" /><!-- Continue shopping after cart -->
		<input type="hidden" name="cancel_return" value="http://www.dbalmer.net/LifeNavigator/Canceled.aspx" />

		<!-- Display the button. -->
		<input type="image" src="http://www.paypal.com/en_US/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" />
	</form>
	
	<form name="frmPayPalViewCart" target="paypal" action="https://sandbox.paypal.com/cgi-bin/webscr" method="post">
		<!-- target="paypal" : The PayPal Shopping cart opens in a separate browser window or tab -->
		
		<!-- Identify your business so that you can collect the payments. -->
		<input type="hidden" name="business" value="me@mybusiness.com" /><!-- sellers PayPal ID or confirmed email address -->

		<!-- Specify a PayPal Shopping Cart View Cart button. -->
		<input type="hidden" name="cmd" value="_cart" />
		<input type="hidden" name="display" value="1" />

		<!-- optional settings -->
		<input type="hidden" name="rm" value="2" /><!-- the payer’s browser is redirected to the return URL by the POST method, and all transaction variables are also posted -->
		<input type="hidden" name="cbt" value="Life Navigator" /><!-- Sets the text for the Return to Merchant button -->
		<input type="hidden" name="no_shipping" value="1" /><!-- no shipping address required -->
		<input type="hidden" name="return" value="http://www.dbalmer.net/LifeNavigator/Schedule.aspx" />
		<input type="hidden" name="shopping_url" value="http://www.dbalmer.net/LifeNavigator/Schedule.aspx" /><!-- Continue shopping after cart -->
		<input type="hidden" name="cancel_return" value="http://www.dbalmer.net/LifeNavigator/Schedule.aspx" />

		<!-- Display the button. -->
		<input type="image" name="submit" border="0" src="https://www.paypal.com/en_US/i/btn/btn_viewcart_LG.gif" alt="PayPal - The safer, easier way to pay online" />
	</form>
</body>
</html>
