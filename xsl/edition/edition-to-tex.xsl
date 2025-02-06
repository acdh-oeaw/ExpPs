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
\usepackage{libertine}
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
\begin{titlepage}
\author{\textsc{<xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:author/text()"/>}}
\title{\textbf{<xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title/text()"/>}}
\date{Wien, 13.09.2024}
\end{titlepage}
</xsl:template>

<xsl:template match="tei:text">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:body">
\maketitle
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
    <xsl:apply-templates select="tei:div[@type = 'psalmtext'] | tei:div[@type = 'commentary'] | tei:div[@type = 'textcritic']"/>
\vspace{7mm}
</xsl:template>

<xsl:template match="tei:div[@type = 'psalmtext']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'commentary']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'textcritic']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:quote[(@type = 'psalmtext') and ancestor::tei:div[@xml:lang = 'grc']]" xml:space="default">
\begin{pairs}\begin{Leftside}\beginnumbering\numberlinefalse\pstart{
<xsl:if test="exists(@n)">
<xsl:text>(</xsl:text>
<xsl:value-of select="@n"/>
<xsl:text>) </xsl:text>
</xsl:if>
\foreignlanguage{greek}{
<xsl:value-of select="text()"/>
}}\pend\endnumbering\end{Leftside}
\begin{Rightside}\beginnumbering\numberlinefalse\pstart{
\foreignlanguage{german}{
<xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:quote[current()/@xml:id = substring-after(@corresp,'#')]"/>
}}\pend\endnumbering\end{Rightside}\end{pairs}\Columns
</xsl:template>

<xsl:template match="tei:quote[(@type = 'psalmtext') and ancestor::tei:div[@xml:lang = 'de']]" xml:space="default">
<xsl:if test="exists(@n)">
<xsl:text>(</xsl:text>
<xsl:value-of select="@n"/>
<xsl:text>) </xsl:text>
</xsl:if>
<xsl:value-of select="text()"/>
</xsl:template>

    <xsl:template match="tei:p[ancestor::tei:div[@xml:lang = 'grc']][not(parent::tei:div[@type = 'links'])][not(parent::tei:div[@type = 'links-oriental-tradition'])][not(parent::tei:note[@type = 'textual-commentary'])]" xml:space="default">
\par\vspace{3mm}\begin{german}
<xsl:text>\textbf{Expositio </xsl:text>
<xsl:value-of select="@n"/>
        <xsl:if test="exists(parent::tei:div[@type = 'commentary']/@rend) and (parent::tei:div[@type = 'commentary']/@rend = 'hide')">
            <xsl:text> -- Parallele</xsl:text>
        </xsl:if>
<xsl:text>:} </xsl:text>
<xsl:if test="exists(@ana) and @ana = 'hypothesis'">Hypothesis</xsl:if>
<xsl:if test="exists(parent::tei:div[@type = 'commentary']/@subtype)">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="parent::tei:div[@type = 'commentary']/@subtype"/>
    <xsl:text>)</xsl:text>
</xsl:if>
<xsl:text>\end{german}\par\vspace{3mm}</xsl:text>
\begin{pairs}\begin{Leftside}\beginnumbering\pstart\firstlinenum{1}\linenumincrement{2}
\foreignlanguage{greek}{
<xsl:apply-templates select="child::node()"/>
}\normalsize\pend\endnumbering\end{Leftside}
<xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'de']]" xml:space="default">
\begin{Rightside}\beginnumbering\numberlinefalse\pstart{
\foreignlanguage{german}{
<xsl:value-of select="text()"/>
}}\pend\endnumbering\end{Rightside}\end{pairs}\Columns
</xsl:template>

<xsl:template match="tei:app[@type = 'fragment']" xml:space="default">
\begin{german}
\textit{<xsl:value-of select="tei:rdg/text()"/>}
<xsl:text> </xsl:text>
    <xsl:for-each select="tokenize(tei:rdg/@wit,' ')">
            <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                    <xsl:if test="regex-group(2) != ''">
                        <xsl:text>\textsuperscript{</xsl:text>
                            <xsl:value-of select="regex-group(2)"/>
                        <xsl:text>}</xsl:text>
                    </xsl:if>
                </xsl:matching-substring>
            </xsl:analyze-string>
        <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
\end{german}\par\vspace{3mm}
</xsl:template>

<xsl:template match="tei:app[@type = 'text']" xml:space="default">
    <xsl:if test="(local-name(preceding-sibling::*[1]) = 'app') and (preceding-sibling::tei:app/@type = 'text')">
        <xsl:text>--- </xsl:text>
    </xsl:if>
<xsl:apply-templates select="tei:lem"/><xsl:text>\hspace{-0.75mm}] </xsl:text>
<xsl:for-each select="tei:rdg">
    <xsl:apply-templates select="tei:foreign | text()"/>
    <xsl:text> </xsl:text>
    <xsl:for-each select="tokenize(./@wit,' ')">
            <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                    <xsl:if test="regex-group(2) != ''">
                        <xsl:text>\textsuperscript{</xsl:text>
                        <xsl:value-of select="regex-group(2)"/>
                        <xsl:text>}</xsl:text>
                    </xsl:if>
                </xsl:matching-substring>
            </xsl:analyze-string>
        <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
</xsl:for-each>
</xsl:template>
    
<xsl:template match="tei:note[@type = 'textual-commentary']">
    <xsl:text>\par\vspace{5mm}</xsl:text>
    <xsl:apply-templates select="child::node()"/>
    <xsl:text>\par\vspace{3mm}</xsl:text>
</xsl:template>
    
<xsl:template match="tei:p[parent::tei:note[@type = 'textual-commentary']]">
\begin{german}{
<xsl:apply-templates select="child::node()"/>
}\end{german}
</xsl:template>

<xsl:template match="tei:lem">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:span[@type = 'text-critical']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:foreign[@xml:lang = 'grc']">
\foreignlanguage{greek}{<xsl:value-of select="./text()"/>}
</xsl:template>

    <xsl:template match="tei:anchor[@type = 'biblical-quotation']">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'sup']">
        <xsl:text>\textsuperscript{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'italic']">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

<xsl:template match="text()">
<xsl:choose>
    <xsl:when test=". = '                  '"/>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>