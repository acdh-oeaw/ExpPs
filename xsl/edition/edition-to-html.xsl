<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:tei="http://www.tei-c.org/ns/1.0"
exclude-result-prefixes="xs tei"
version="2.0">

<xsl:output encoding="UTF-8" method="html" indent="no"/>

<xsl:template match="/">
    <html>
        <xsl:apply-templates select="child::node()"/>
    </html>
</xsl:template>

<xsl:template match="tei:TEI">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:teiHeader">
    <head>
        <title>
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title/text()"/>
        </title>
        <link rel="stylesheet" href="./css/formats.css" type="text/css"></link>
        <link rel="stylesheet" id="fundament-styles"  href="../fundament/css/fundament.min.css" type="text/css"/>
    </head>
</xsl:template>

<xsl:template match="tei:text">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:body">
    <body>
        <div id="main-content">
            <div id="main-content-header">
                <p class="author">
                    <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author/text()"/>
                </p>
                <p class="title">
                    <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title/text()"/>
                </p>
                <p class="publisher">FWF Project 32988</p>
                <p class="license">Available under the Creative Commons Attribution 4.0 International (CC BY 4.0)</p>
                <p class="date">2022-03-03</p>
            </div>
            <div id="main-content-body">
                <div class="header-centered">Text, Übersetzung, Kommentar</div>
                <xsl:apply-templates select="child::node()"/>
            </div>
        </div>
    </body>
</xsl:template>

<xsl:template match="tei:div[@type = 'psalm']">
    <div class="manuscript-content">
        <div class="quotation">
            <xsl:text>Psalm </xsl:text><xsl:value-of select="@n"/>
        </div>
        <xsl:apply-templates select="tei:div[@type = 'psalmverse']"/>
    </div>
</xsl:template>

<xsl:template match="tei:div[@type = 'psalmverse']">
    <xsl:apply-templates select="tei:div[@type = 'text']"/>
</xsl:template>

<xsl:template match="tei:div[@type = 'text']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@xml:lang = 'grc']]">
    <xsl:for-each select=".">
        <div class="row">
            <div class="col-md-2">
                <xsl:if test="exists(@n)">
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text>) </xsl:text>
                </xsl:if>
            </div>
            <div class="col-md-5"><xsl:value-of select="text()"/></div>
            <div class="col-md-5">
                <xsl:apply-templates select="parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:quote[current()/@xml:id = substring-after(@corresp,'#')]"/>
            </div>
        </div>
    </xsl:for-each>
</xsl:template>

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@xml:lang = 'de']]">
    <xsl:if test="exists(@n)">
        <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
        <xsl:text>) </xsl:text>
    </xsl:if>
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'grc']]">
    <div class="row">
        <div class="col-md-2">
            <b>
                <xsl:text>Expositio </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>: </xsl:text>
            </b>
            <xsl:if test="exists(@ana) and @ana = 'hypothesis'">
                <xsl:text>Hypothesis</xsl:text>
            </xsl:if>
        </div>
        <div class="col-md-5 large-greek-text">
            <xsl:value-of select="text()"/>
        </div>
        <div class="col-md-5 large-latin-text">
            <xsl:apply-templates select="parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
        </div>
    </div>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'de']]">
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="tei:app[@type = 'fragment']">
    <p>
        <xsl:text>– </xsl:text>
        <xsl:value-of select="tei:rdg/text()"/>
        <xsl:text> </xsl:text>
        <xsl:for-each select="tei:wit">
            <xsl:value-of select="./text()"/>
            <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
        </xsl:for-each>
    </p>
</xsl:template>

<xsl:template match="tei:app[@type = 'text']">
    <xsl:text>– </xsl:text>
    <xsl:apply-templates select="tei:lem"/>
    <xsl:text>] </xsl:text>
    <xsl:for-each select="tei:rdg">
        <xsl:apply-templates select="tei:foreign | text()"/>
        <xsl:text> </xsl:text>
        <xsl:for-each select="following-sibling::tei:wit">
            <xsl:value-of select="text()"/>
            <xsl:if test="position() != last()">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:for-each>
</xsl:template>

<xsl:template match="tei:lem">
<xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:foreign[@xml:lang = 'grc']">
    <xsl:value-of select="./text()"/>
</xsl:template>

</xsl:stylesheet>