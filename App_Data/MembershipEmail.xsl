<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="Client">
		<style type="text/css">
			.label { width: 10em; }
		</style>
		<p>Dear <xsl:value-of select="@FirstName"/>,</p>
		<p>Thank you for joining the Life Navigator network!</p>
		<p>When returning to our website to schedule appointments, use your email address and password to login.</p>
		<p>
			<b class="label">Email Address : </b><xsl:value-of select="@Email"/><br/>
			<b class="label">Password : </b><xsl:value-of select="@Password"/>
		</p>
    </xsl:template>
</xsl:stylesheet>
