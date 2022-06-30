<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:template match="tei:seg">
    <xsl:text>{ 'commentaryfragment' : {</xsl:text>
    <xsl:text>'id' : '</xsl:text>
    <xsl:value-of select="@xml:id"/>
    <xsl:text>', 'attribution' : '</xsl:text>
    <xsl:value-of select="@source"/>
    <xsl:text>', 'source' : '</xsl:text>
    <xsl:value-of select="child::tei:quote/@source"/>
    <xsl:text>'</xsl:text>
    <xsl:text>}}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>