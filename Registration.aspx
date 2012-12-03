<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="LifeNavigator.Web.Registration" Title="Life Navigator - Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
	<style type="text/css">
		fieldset {
			margin-top: 1em;
			padding: 0 1em 0.5em 1em;
			border: 1px solid #666;
		}
		fieldset legend {
			margin-bottom: 0.5em;
			padding: 0.2em 0.5em;
			border: 1px solid #666;
			text-align: right;
		}
		fieldset label {
			float: left;
			width: 12.5em;
			font-weight: bold;
			margin-right: 0.5em;
			margin-bottom: 0.5em;
			padding-top: 0.2em;
			padding-right: 0.5em;
			text-align: right;
		}
		input {
			padding: 2px;
		}
		input, select {
			margin-bottom: 0.5em;
		}
		.focus {
			background-color: #F0F8FF; /* AliceBlue */
		}
		.form-error {
			font-size: smaller;
			vertical-align: middle;
		}
		.form-error img {
			padding: 0 4px;
		}
		.yui-button#btnContinue button {
			color: #008;
			font-weight: bold;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Registration Form</h1>
	<fieldset>
		<legend>Personal Information</legend>
		<div>
			<label>First Name:</label>
			<asp:TextBox ID="txtFirstName" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqFirstName" runat="server" ControlToValidate="txtFirstName" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regFirstName" runat="server" ControlToValidate="txtFirstName" ValidationExpression="^[a-zA-Z ]{1,50}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />less than 50 characters' SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>Last Name:</label>
			<asp:TextBox ID="txtLastName" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqLastName" runat="server" ControlToValidate="txtLastName" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regLastName" runat="server" ControlToValidate="txtLastName" ValidationExpression="^[a-zA-Z ]{1,50}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />less than 50 characters' SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>Address:</label>
			<asp:TextBox ID="txtAddress1" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqAddress1" runat="server" ControlToValidate="txtAddress1" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regAddress1" runat="server" ControlToValidate="txtAddress1" ValidationExpression="^[a-zA-Z0-9 \.\-#]{1,50}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />less than 50 characters' SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label></label>
			<asp:TextBox ID="txtAddress2" runat="server" Columns="50" MaxLength="50" /><asp:RegularExpressionValidator ID="regAddress2" runat="server" ControlToValidate="txtAddress2" ValidationExpression="^[a-zA-Z0-9 \.\-#]{1,50}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />less than 50 characters' SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>City:</label>
			<asp:TextBox ID="txtCity" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="txtCity" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regCity" runat="server" ControlToValidate="txtCity" ValidationExpression="^[a-zA-Z \-]{1,50}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />less than 50 characters' SetFocusOnError="true" Display="Dynamic" />
		</div>		
		<div class="clear">
			<label>State:</label>
			<asp:DropDownList ID="ddlState" runat="server">
				<asp:ListItem Value="" Text=""></asp:ListItem>
				<asp:ListItem Value="AL" Text="Alabama"></asp:ListItem>
				<asp:ListItem Value="AK" Text="Alaska"></asp:ListItem>
				<asp:ListItem Value="AR" Text="Arkansas"></asp:ListItem>
				<asp:ListItem Value="AZ" Text="Arizona"></asp:ListItem>
				<asp:ListItem Value="CA" Text="California"></asp:ListItem>
				<asp:ListItem Value="CO" Text="Colorado"></asp:ListItem>
				<asp:ListItem Value="CT" Text="Connecticut"></asp:ListItem>
				<asp:ListItem Value="DC" Text="District of Columbia"></asp:ListItem>
				<asp:ListItem Value="DE" Text="Delaware"></asp:ListItem>
				<asp:ListItem Value="FL" Text="Florida"></asp:ListItem>
				<asp:ListItem Value="GA" Text="Georgia"></asp:ListItem>
				<asp:ListItem Value="HI" Text="Hawaii"></asp:ListItem>
				<asp:ListItem Value="IA" Text="Iowa"></asp:ListItem>
				<asp:ListItem Value="ID" Text="Idaho"></asp:ListItem>
				<asp:ListItem Value="IL" Text="Illinois"></asp:ListItem>
				<asp:ListItem Value="IN" Text="Indiana"></asp:ListItem>
				<asp:ListItem Value="KS" Text="Kansas"></asp:ListItem>
				<asp:ListItem Value="KY" Text="Kentucky"></asp:ListItem>
				<asp:ListItem Value="LA" Text="Louisiana"></asp:ListItem>
				<asp:ListItem Value="MA" Text="Massachusetts"></asp:ListItem>
				<asp:ListItem Value="MD" Text="Maryland"></asp:ListItem>
				<asp:ListItem Value="ME" Text="Maine"></asp:ListItem>
				<asp:ListItem Value="MI" Text="Michigan"></asp:ListItem>
				<asp:ListItem Value="MN" Text="Minnesota"></asp:ListItem>
				<asp:ListItem Value="MO" Text="Missouri"></asp:ListItem>
				<asp:ListItem Value="MS" Text="Mississippi"></asp:ListItem>
				<asp:ListItem Value="MT" Text="Montana"></asp:ListItem>
				<asp:ListItem Value="NC" Text="North Carolina"></asp:ListItem>
				<asp:ListItem Value="ND" Text="North Dakota"></asp:ListItem>
				<asp:ListItem Value="NE" Text="Nebraska"></asp:ListItem>
				<asp:ListItem Value="NH" Text="New Hampshire"></asp:ListItem>
				<asp:ListItem Value="NJ" Text="New Jersey"></asp:ListItem>
				<asp:ListItem Value="NM" Text="New Mexico"></asp:ListItem>
				<asp:ListItem Value="NV" Text="Nevada"></asp:ListItem>
				<asp:ListItem Value="NY" Text="New York"></asp:ListItem>
				<asp:ListItem Value="OH" Text="Ohio"></asp:ListItem>
				<asp:ListItem Value="OK" Text="Oklahoma"></asp:ListItem>
				<asp:ListItem Value="OR" Text="Oregon"></asp:ListItem>
				<asp:ListItem Value="PA" Text="Pennsylvania"></asp:ListItem>
				<asp:ListItem Value="RI" Text="Rhode Island"></asp:ListItem>
				<asp:ListItem Value="SC" Text="South Carolina"></asp:ListItem>
				<asp:ListItem Value="SD" Text="South Dakota"></asp:ListItem>
				<asp:ListItem Value="TN" Text="Tennessee"></asp:ListItem>
				<asp:ListItem Value="TX" Text="Texas"></asp:ListItem>
				<asp:ListItem Value="UT" Text="Utah"></asp:ListItem>
				<asp:ListItem Value="VA" Text="Virginia"></asp:ListItem>
				<asp:ListItem Value="VT" Text="Vermont"></asp:ListItem>
				<asp:ListItem Value="WA" Text="Washington"></asp:ListItem>
				<asp:ListItem Value="WI" Text="Wisconsin"></asp:ListItem>
				<asp:ListItem Value="WV" Text="West Virginia"></asp:ListItem>
				<asp:ListItem Value="WY" Text="Wyoming"></asp:ListItem>
			</asp:DropDownList><asp:RequiredFieldValidator ID="reqState" runat="server" ControlToValidate="ddlState" InitialValue="" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>ZipCode:</label>
			<asp:TextBox ID="txtZipCode" runat="server" Columns="10" MaxLength="10" /><asp:RequiredFieldValidator ID="reqZipCode" runat="server" ControlToValidate="txtZipCode" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regZipCode" runat="server" ControlToValidate="txtZipCode" ValidationExpression="^\d{5}$" CssClass="form-error" Text='<img src="/Images/form-error.jpg" />first 5 digits only' SetFocusOnError="true" Display="Dynamic" />
		</div>
	</fieldset>
	
	<fieldset class="clear">
		<legend>Contact Information</legend>
		<div>
			<label>Email:</label>
			<asp:TextBox ID="txtEmail" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Text='<img src="/Images/form-error.jpg" />not a valid email address' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>Select your Password:</label>
			<asp:TextBox ID="txtPassword" runat="server" Columns="50" MaxLength="50" /><asp:RequiredFieldValidator ID="reqPasswordValidator" runat="server" ControlToValidate="txtPassword" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regPasswordValidator1" runat="server" ControlToValidate="txtPassword" ValidationExpression="^[a-zA-Z0-9]\w{4,10}$" Text='<img src="/Images/form-error.jpg" />between 4 and 10 characters' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>Home Phone:</label>
			<asp:TextBox ID="txtHomePhone" runat="server" Columns="30" MaxLength="30" /><asp:RequiredFieldValidator ID="reqHomePhone" runat="server" ControlToValidate="txtHomePhone" Text='<img src="/Images/form-error.jpg" />required' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" /><asp:RegularExpressionValidator ID="regHomePhone" runat="server" ControlToValidate="txtHomePhone" ValidationExpression="((\(\d{3}\)?)|(\d{3}))([\s-./]?)(\d{3})([\s-./]?)(\d{4})" Text='<img src="/Images/form-error.jpg" />not a valid phone number' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" />
		</div>
		<div class="clear">
			<label>Work Phone:</label>
			<asp:TextBox ID="txtWorkPhone" runat="server" Columns="30" MaxLength="30" /><asp:RegularExpressionValidator ID="regWorkPhone" runat="server" ControlToValidate="txtWorkPhone" ValidationExpression="((\(\d{3}\)?)|(\d{3}))([\s-./]?)(\d{3})([\s-./]?)(\d{4})" Text='<img src="/Images/form-error.jpg" />not a valid phone number' CssClass="form-error" SetFocusOnError="true" Display="Dynamic" />
		</div>
	</fieldset>

	<div class="clear">
		<asp:Label ID="lblEmailError" runat="server" ForeColor="Red" Visible="false" />
	</div>
	
	<div style="margin:0 0 2em 0;">
		<span id="btnCancel" class="yui-button yui-link-button">
			<span class="first-child">
				<a href="/">cancel</a>
			</span>
		</span>
		<span id="btnContinue" class="yui-button yui-push-button"><!-- not using submit-button because it doesn't work in Opera -->
			<span class="first-child"> 
				<input type="button" name="btnContinue" value="Continue" />
			</span> 
		</span> 
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<script type="text/javascript">
		var elFocus = YDOM.get("<%=txtFirstName.ClientID%>");
		var arrFocus = ["<%=txtFirstName.ClientID%>", "<%=txtLastName.ClientID%>", "<%=txtAddress1.ClientID%>", "<%=txtAddress2.ClientID%>", "<%=txtCity.ClientID%>", "<%=txtZipCode.ClientID%>", "<%=txtEmail.ClientID%>", "<%=txtPassword.ClientID%>", "<%=txtHomePhone.ClientID%>", "<%=txtWorkPhone.ClientID%>"];
		YAHOO.LifeNavigator.Registration = function () {
			var setFocus = function(evt) {
				YDOM.addClass(this.id, "focus");
			};
			var onBlur = function(evt) {
				YDOM.removeClass(this.id, "focus");
			};
			var onContinue = function(evt) {
				try {
					Page_ClientValidate(); // asp.net validation
					var errors = 0, max = Page_Validators.length;
					for (i=0; i<max; i++) {
						if (!Page_Validators[i].isvalid) {
							errors++;
						}
					}
					if (errors == 0) document.forms[0].submit();
				} catch (ex) {
					YAHOO.LifeNavigator.Util.logError("Registration.onContinue", ex);
				}
			};
			return {
				init: function() {
					try {
						new YAHOO.widget.Button("btnCancel");
						new YAHOO.widget.Button("btnContinue", { onclick: { fn: onContinue } });
						YEVENT.addFocusListener(arrFocus, setFocus);
						YEVENT.addBlurListener(arrFocus, onBlur);
						// focus on first field
						YDOM.addClass(elFocus, "focus");
						elFocus.focus();
					} catch (ex) {
						YAHOO.LifeNavigator.Util.logError("Registration.init", ex);
					}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Registration.init);
	</script>
</asp:Content>

