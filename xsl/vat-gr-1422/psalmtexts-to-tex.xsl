<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <xsl:text>\documentclass[11pt,a4paper]{article}
\usepackage{polyglossia}
\usepackage{fontspec,xltxtra}
\usepackage{hyperref}
\hypersetup{pdftex,colorlinks=true}
\usepackage{hypcap}
\setmainlanguage{english}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\greekfont[ExternalLocation="./"]{SBL_BLit.ttf}
\usepackage{paralist}
\parindent0pt
\begin{document}</xsl:text>
        <xsl:apply-templates select="tei:teiHeader"/>
        <xsl:apply-templates select="tei:text"/>
        <xsl:text>\end{document}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
        <xsl:text>\begin{center}</xsl:text>
        <xsl:text>\Large Psalmtexts \normalsize\par\vspace{10mm}</xsl:text>
        <xsl:text> from Manuscript\par\vspace{5mm}</xsl:text>
        <xsl:text>\textbf{</xsl:text>
        <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\end{center}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:text">
        <xsl:apply-templates select="tei:body/tei:div[@type = 'transcription']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='transcription']">
        <xsl:apply-templates select="tei:div[@type = 'bibletext']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'bibletext']">
        <xsl:apply-templates select="tei:quote[@type = 'bibletext']"/>
    </xsl:template>

    <xsl:template match="tei:quote[@type = 'bibletext']">
        <xsl:text>\pdfbookmark[0]{</xsl:text>
            <xsl:value-of select="@n"/>
        <xsl:text>}{</xsl:text>
            <xsl:value-of select="@xml:id"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\textbf{</xsl:text>
            <xsl:value-of select="@n"/>
        <xsl:text>:} </xsl:text>
        <xsl:if test="exists(@prev)">
            <xsl:text>... </xsl:text>
        </xsl:if>
        <xsl:text>\foreignlanguage{greek}{</xsl:text>
            <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="exists(@next)">
            <xsl:text> ...</xsl:text>
        </xsl:if>
        <xsl:text>\par\vspace{3mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:note"/>
    
    <xsl:template match="tei:g"/>
    
    <xsl:template match="tei:anchor"/>
    
    <xsl:template match="tei:choice">
        <xsl:if test="preceding-sibling::tei:choice">
            <xsl:text> </xsl:text>
        </xsl:if>
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
        <xsl:choose>
            <xsl:when test="exists(@break)"/>
            <xsl:when test="preceding-sibling::name = 'tei:anchor'"/>
            <xsl:when test="preceding-sibling::text()">
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:choose>
            <xsl:when test="contains(.,'                     ')">
                <xsl:value-of select="replace(.,'&#10;                     ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'                  ')">
                <xsl:value-of select="replace(.,'&#10;                  ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'               ')">
                <xsl:value-of select="replace(.,'&#10;               ','')"/>
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