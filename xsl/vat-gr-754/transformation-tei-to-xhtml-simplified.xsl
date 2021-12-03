<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xhtml" encoding="UTF-8"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" href="./css/formats.css"/>
            </head>
            <body>
                <div id="main-content">
                    <div id="main-content-header">
                        <xsl:apply-templates select="tei:teiHeader"/>
                    </div>
                    <div id="main-content-body">
                        <xsl:apply-templates select="tei:text/tei:body"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
        <p class="title">
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
        </p>
        <p class="title">
            <xsl:text>Simplified - Commentaryfragments and Hexaplaric Variants</xsl:text>
        </p>
        <p class="responsibility">
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/>
        </p>
        <p class="author">
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName"/>
        </p>
        <p class="publisher">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:publisher"/>
        </p>
        <p class="license">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:availability"/>
        </p>
        <p class="date">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:date"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates select="tei:div[@type = 'transcription']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:apply-templates select="tei:div[@type = 'hexaplaric' or @type = 'commentary' or @type = 'hypothesis'] | tei:pb"/>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <p class="page-number">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)</xsl:text>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hexaplaric']">
        <xsl:apply-templates select=".//tei:seg"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hypothesis']">
        <xsl:apply-templates select=".//tei:seg"/>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'commentary']">
        <xsl:apply-templates select=".//tei:seg"/>        
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'hexaplaric']">
        <div class="manuscript-content">
            <xsl:text>Hexaplaric variant - </xsl:text>
            <xsl:value-of select="@source"/>
            <xsl:text>: </xsl:text>
            <xsl:apply-templates select="child::node()"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'bibleversion']"/>
    
    <xsl:template match="tei:seg[@type = 'commentaryfragment']">
        <div class="manuscript-content">
            <xsl:text>Commentaryfragment - </xsl:text>
            <xsl:value-of select="child::tei:quote/@source"/>
            <xsl:if test="exists(@prev)">
                <xsl:text> (continued)</xsl:text>
            </xsl:if>
            <xsl:text>: </xsl:text>
            <xsl:if test="exists(@prev)">
                <xsl:text>...</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="child::node()"/>
            <xsl:if test="exists(@next)">
                <xsl:text>...</xsl:text>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'hypothesis']">
        <div class="manuscript-content">
            <xsl:text>Hypothesis - </xsl:text>
            <xsl:value-of select="child::tei:quote/@source"/>
            <xsl:if test="exists(@prev)">
                <xsl:text> (continued)</xsl:text>
            </xsl:if>
            <xsl:text>: </xsl:text>
            <xsl:if test="exists(@prev)">
                <xsl:text>...</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="child::node()"/>
            <xsl:if test="exists(@next)">
                <xsl:text>...</xsl:text>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'glosse']"/>
    
    <xsl:template match="tei:choice">
        <xsl:if test="exists(tei:abbr[@type = 'nomSac'])">
            <xsl:value-of select="tei:expan/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:abbr[@type = 'common'])">
            <xsl:value-of select="tei:expan/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:orig/tei:abbr) and exists(tei:reg)">
            <xsl:value-of select="tei:reg/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:orig/tei:abbr) and exists(tei:corr)">
            <xsl:value-of select="tei:corr/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:orig/tei:abbr) and exists(tei:expan)">
            <xsl:value-of select="tei:expan/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:orig) and not(exists(tei:orig/tei:abbr)) and exists(tei:reg)">
            <xsl:value-of select="tei:reg/text()"/>
        </xsl:if>
        <xsl:if test="exists(tei:orig) and not(exists(tei:orig/tei:abbr)) and exists(tei:corr)">
            <xsl:value-of select="tei:corr/text()"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:gap">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:add"/>    
    
    <xsl:template match="tei:unclear">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:if test="not(exists(@break))">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:choose>
            <xsl:when test="contains(.,'                     ')">
                <xsl:value-of select="replace(.,'&#10;                     ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'                  ')">
                <xsl:value-of select="replace(.,'&#10;                  ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,' ')">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>