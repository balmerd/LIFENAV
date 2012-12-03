<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" Inherits="LifeNavigator.Web.CodeBehindBase" Title="Life Navigator - Registration Agreement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
	<h1 class="first">Registration/Agreement</h1>
	<p>If you are experiencing an emergency or crisis, please dial 911 or your local emergency phone number, or the police immediately.  The content of all meetings are confidential on behalf of the Life Navigator.  It is the responsibility of the participant to make sure their space is private without interruptions during the sessions.  Although all sessions are confidential, the Life Navigator must report current issues of child abuse, elder abuse, self harm or the intent to harm others to the appropriate authorities.  Children under 18 years of age must have approval from a parent to participate in sessions.  Please contact the Life Navigator directly for parental approval arrangements.</p>
	<p>The Navigator makes no claims to cure individuals of any psychological, emotional, and/or physical disorders or pathologies.  The Life Navigator provides a listening ear, compassion and empathy and utilizes professional training and resources to assist participants with navigating through life’s complex and sometimes challenging circumstances.</p>
	<p>The Navigator is held harmless from claims or warranties regarding providing services and assumes no responsibility for participants’ life. Ultimately each individual is responsible for his or hers own life and by clicking the <em>accept button</em> at the end of this Registration/Agreement, acknowledges that fact. Clicking the accept button also means that the individual will participate fully in the session(s) and give permission to the Life Navigator to assist with your life issues.</p>
	<div style="margin-bottom:2em;">
		<span id="btnAccept" class="yui-button yui-link-button"> 
			<span class="first-child"> 
				<a href="/Registration.aspx"><b>I Accept this Agreement</b></a> 
			</span> 
		</span> 
	</div>
	<p style="font-size:77%">NON DISCLOSURE:  Working with the Life Navigator by no means supersedes working with a psychiatrist, or other mental health professional and is not intended to be used as a diagnosis of any mental health condition or voidance of any diagnosis made by a professional in the mental health field.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpJavaScript" Runat="Server">
	<script type="text/javascript">
		YAHOO.LifeNavigator.Agreement = function () {
			var cookie = YAHOO.LifeNavigator.Cookie;
			var onAccept = function(evt) {
				try {
					if (cookie.value.ClientId !== "") {
						YEVENT.preventDefault(evt);
						window.location.href = "/Schedule.aspx";
					}
				} catch (ex) {
					YAHOO.LifeNavigator.Util.logError("Agreement.onAccept", ex);
				}
			};
			return {
				init: function() {
					try {
						new YAHOO.widget.Button("btnAccept", { onclick: { fn: onAccept } });
					} catch (ex) {
						YAHOO.LifeNavigator.Util.logError("Agreement.init", ex);
					}
				}
			};
		}();
		YEVENT.onDOMReady(YAHOO.LifeNavigator.Agreement.init);
	</script>
</asp:Content>

