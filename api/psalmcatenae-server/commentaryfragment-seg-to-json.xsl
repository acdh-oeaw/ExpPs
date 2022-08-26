<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:template match="tei:seg">
    <xsl:text>{ "commentaryfragment" : {</xsl:text>
    <xsl:text>"id" : "</xsl:text>
    <xsl:value-of select="@xml:id"/>
    <xsl:text>", "attribution" : "</xsl:text>
    <xsl:value-of select="@source"/>
    <xsl:text>", "source" : "</xsl:text>
    <xsl:value-of select="child::tei:quote/@source"/>
    <xsl:text>", "text" : "</xsl:text>
    <xsl:apply-templates select="child::tei:quote"/>
    <xsl:text>"</xsl:text>
    <xsl:text>}}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote">
      <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:choice">
      <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:orig"/>
    
    <xsl:template match="tei:reg[@type = 'correction']">
      <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'nomSac']"/>
    
    <xsl:template match="tei:expan">
      <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
      <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:lb[@break and @break = 'no']"/>
    
    <xsl:template match="tei:lb[not(@break)]">
      <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
      <xsl:text>[</xsl:text>
      <xsl:value-of select="text()"/>
      <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:supplied">
      <xsl:text>〈</xsl:text>
      <xsl:value-of select="text()"/>
      <xsl:text>〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote[@type = 'biblical']">
      <xsl:apply-templates select="child::node()"/>
      <xsl:text> [</xsl:text>
      <xsl:value-of select="@source"/>
      <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()">
      <xsl:choose>
        <xsl:when test="contains(.,'&#xA;')">
          <xsl:value-of select="normalize-space(translate(.,'&#xA;',''))"/>
        </xsl:when>
        <xsl:when test="not(contains(.,'&#xA;'))">
          <xsl:value-of select="."/>
        </xsl:when>
      </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>