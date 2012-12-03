<%@ Page Language="C#" AutoEventWireup="true" Inherits="LifeNavigator.Web.CodeBehindBase" Title="Life Navigator - Coming Soon!" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head id="Head1" runat="server">
	<title>Life Navigator -- Coming Soon</title>
	<meta name="description" content="Assisting people with navigating through the challenges of life in the privacy of their own home. Private face to face web meetings with your issues, concerns or inquiries as the primary focus." />
	<meta name="keywords" content="counseling,life skills coach,confidential,web meeting" />
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/yui/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css" />
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/yui/2.7.0/build/base/base-min.css" />
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/yui/2.7.0/build/assets/skins/sam/skin.css" />
	<link rel="stylesheet" type="text/css" href="/Styles/lifenav.css" />
</head>
<body class="yui-skin-sam">
<div id="doc3" class="custom">
	<div id="hd">
		<div id="shadow">
			<div class="center-width">
				<a id="life-navigator" href="/ComingSoon.aspx"><img src="/Images/life-navigator.gif" width="256" height="50" alt="Life Navigator" /></a>
			</div>
		</div>
		<div id="banner">
			<div class="center-width">
				<div id="nav-logo-container">
					<div id="navigation">
						<ul>
							<li><asp:HyperLink ID="lnkBio" runat="server" NavigateUrl="/ComingSoon.aspx">Biography</asp:HyperLink></li>
							<li><asp:HyperLink ID="lnkGetStarted" runat="server" NavigateUrl="/ComingSoon.aspx">How to Get Started</asp:HyperLink></li>
							<li><asp:HyperLink ID="lnkPricing" runat="server" NavigateUrl="/ComingSoon.aspx">Pricing</asp:HyperLink></li>
							<li><asp:HyperLink ID="lnkAgreement" runat="server" NavigateUrl="/ComingSoon.aspx">Registration</asp:HyperLink></li>
							<li><asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="/ComingSoon.aspx">Contact Me</asp:HyperLink></li>
							<li><asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="/ComingSoon.aspx">Your Account</asp:HyperLink></li>
						</ul>
					</div>
					<div id="logo">
						<div style="position:relative; top:-20px;">
							<img id="sailboat" src="/Images/sailboat.jpg" width="480" height="140" alt="" />
							<img src="/Images/tagline.gif" width="480" height="25" alt="You are the Captain and I am your Navigator" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div id="bd">
		<div class="yui-g">
			<div class="center-width">
				<div id="main-content">
					<form id="form1" runat="server">
						<h1 class="first">Lending a caring and trained ear to those in need ... Coming Soon!</h1>
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
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="ft">&copy; <%=DateTime.Now.Year%> Life Navigator, all rights reserved.</div>
</div>
<asp:Literal ID="litExternalJS" runat="server" />
</body>
</html>
