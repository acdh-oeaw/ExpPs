<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:tei="http://www.tei-c.org/ns/1.0"
exclude-result-prefixes="xs"
version="2.0">

<xsl:output encoding="UTF-8" method="text" indent="no" use-character-maps="remove-spaces"/>
<xsl:character-map name="remove-spaces">
<!--<xsl:output-character character="&#10;" string=""/>-->
</xsl:character-map>

<xsl:template match="/">
\documentclass[12pt]{book}
\usepackage{polyglossia}
\usepackage{fontspec}
\defaultfontfeatures{Mapping=tex-text}
\usepackage{xunicode}
\usepackage{xltxtra}
\usepackage{reledmac}
\usepackage{reledpar}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RO,LE]{\leftmark}
\fancyhead[LO,RE]{(Ps.)-Athanasius, Expositiones in Psalmos}
\fancyfoot{}
\fancyfoot[C]{\thepage}
\setmainlanguage{german}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\greekfont[ExternalLocation="./"]{SBL_BLit.ttf}
\parindent0pt
\begin{document}
<xsl:apply-templates select="child::node()"/>
\end{document}
</xsl:template>

<xsl:template match="tei:TEI">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:teiHeader">
\Large
\begin{center}
\textsc{<xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:author/text()"/>}\par
\vspace{20mm}
\textbf{<xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title/text()"/>}\par
\vspace{100mm}
Wien, 20.01.2021
\end{center}
\normalsize
\newpage
</xsl:template>

<xsl:template match="tei:text">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:body">
\tableofcontents
\part{Einleitung}
\part{Text, Übersetzung, Kommentar}
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:div[@type = 'psalm']">
\chapter{<xsl:text>Psalm </xsl:text><xsl:value-of select="@n"/>}
<xsl:apply-templates select="tei:div[@type = 'psalmverse']"/>
</xsl:template>

<xsl:template match="tei:div[@type = 'psalmverse']">
<xsl:apply-templates select="tei:div[@type = 'text']"/>
</xsl:template>

<xsl:template match="tei:div[@type = 'text']">
<xsl:apply-templates select="child::node()"/>
\vspace{7mm}
</xsl:template>

<!--<xsl:template match="tei:div[@type = 'translation']">
<xsl:apply-templates select="child::node()"/>
</xsl:template>-->

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@xml:lang = 'grc']]" xml:space="default">
\begin{pairs}\begin{Leftside}\beginnumbering\numberlinefalse\pstart{<xsl:for-each select=".">
<xsl:if test="exists(@n)">
<xsl:text>(</xsl:text>
<xsl:value-of select="@n"/>
<xsl:text>) </xsl:text>
</xsl:if>
\foreignlanguage{greek}{
<xsl:value-of select="text()"/>
}</xsl:for-each>}\pend\endnumbering\end{Leftside}
\begin{Rightside}\beginnumbering\numberlinefalse\pstart{
<xsl:for-each select=".">
<xsl:apply-templates select="parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:quote[current()/@xml:id = substring-after(@corresp,'#')]"/>
</xsl:for-each>}\pend\endnumbering\end{Rightside}\end{pairs}\Columns
</xsl:template>

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@xml:lang = 'de']]" xml:space="default">
<xsl:if test="exists(@n)">
<xsl:text>(</xsl:text>
<xsl:value-of select="@n"/>
<xsl:text>) </xsl:text>
</xsl:if>
<xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'grc']]" xml:space="default">
\par\vspace{3mm}\begin{german}
<xsl:text>Expositio </xsl:text>
<xsl:value-of select="@n"/>
<xsl:text>: </xsl:text>
<xsl:if test="exists(@ana) and @ana = 'hypothesis'">Hypothesis</xsl:if>
<xsl:text>\end{german}\par</xsl:text>
\begin{pairs}\begin{Leftside}\beginnumbering\pstart\firstlinenum{1}\linenumincrement{2}
\large\foreignlanguage{greek}{
<xsl:value-of select="text()"/>
}\normalsize\pend\endnumbering\end{Leftside}
<xsl:apply-templates select="parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'de']]" xml:space="default">
\begin{Rightside}\beginnumbering\numberlinefalse\pstart{
<xsl:value-of select="text()"/>
}\pend\endnumbering\end{Rightside}\end{pairs}\Columns
</xsl:template>

<xsl:template match="tei:app[@type = 'fragment']" xml:space="default">
\begin{german}
<xsl:text>-- </xsl:text>
\textit{<xsl:value-of select="tei:rdg/text()"/>}
<xsl:text> </xsl:text>
<xsl:for-each select="tei:wit">
<xsl:value-of select="./text()"/>
    <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
</xsl:for-each>
\end{german}\par\vspace{3mm}
</xsl:template>

<xsl:template match="tei:app[@type = 'text']" xml:space="default">
<xsl:text>--- </xsl:text>
<xsl:apply-templates select="tei:lem"/><xsl:text>\hspace{-0.75mm}] </xsl:text>
<xsl:for-each select="tei:rdg">
<xsl:apply-templates select="tei:foreign | text()"/>
<xsl:for-each select="following-sibling::tei:wit">
<xsl:value-of select="text()"/>
    <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
</xsl:for-each>
</xsl:for-each>
</xsl:template>

<xsl:template match="tei:lem">
<xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:foreign[@xml:lang = 'grc']">
\foreignlanguage{greek}{<xsl:value-of select="./text()"/>}
</xsl:template>

<xsl:template match="text()">
<xsl:choose>
    <xsl:when test="text() = '                  '"/>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>