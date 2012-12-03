<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="Client">
		<style type="text/css">
			li { padding: 4px; }
		</style>
		<p>Dear <xsl:value-of select="@FirstName"/>,</p>
		<p>Thank you for scheduling your appointment with the Life Navigator!</p>
		<p><b>Your upcoming appointment(s) are:</b></p>
		<ul type="disc">
			<xsl:apply-templates />
		</ul>
    </xsl:template>
    <xsl:template match="Appointment">
		<li><xsl:value-of select="@Service"/> on <xsl:value-of select="@Date"/> at <xsl:value-of select="@Time"/></li>
    </xsl:template>
</xsl:stylesheet>
