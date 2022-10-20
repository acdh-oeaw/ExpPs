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
                <p class="date">2022-07-24</p>
            </div>
            <div id="main-content-body">
                <div class="header-centered">Text, Übersetzung, Kommentar</div>
                <div class="list-of-witnesses">
                    <p>Liste der Textzeugen:</p>
                    <xsl:apply-templates select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listWit"/>
                </div>
                <xsl:apply-templates select="child::node()"/>
            </div>
        </div>
    </body>
</xsl:template>

<xsl:template match="tei:listWit">
    <table>
        <thead>
            <tr>
                <td>Handschrift</td>
                <td>Abkürzung</td>
            </tr>
        </thead>
        <tbody>
            <xsl:apply-templates select="tei:witness"/>
        </tbody>
    </table>
</xsl:template>

<xsl:template match="tei:witness">
    <tr>
        <td><xsl:value-of select="./text()"/></td>
        <td style="text-align:right;"><i><xsl:value-of select="@xml:id"/></i></td>
    </tr>
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
    <div class="psalm">
    <xsl:apply-templates select="tei:div[@type = 'text']"/>
    </div>
</xsl:template>

<xsl:template match="tei:div[@type = 'text']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'psalmtext']">
    <div class="body-psalmtext">
        <xsl:apply-templates select="child::node()"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'commentary' and not(exists(@rend))]">
    <div class="body-commentary">
        <xsl:apply-templates select="child::node()"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'commentary' and @rend = 'hide']"/>

<xsl:template match="tei:div[@type = 'textcritic' and not(exists(@rend))]">
    <div class="body-textcritic">
        <xsl:apply-templates select="tei:app[@type = 'fragment']"/>
        <xsl:for-each select="tei:app[@type = 'text']">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()"><xsl:text> || </xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="tei:note[@type = 'textual-commentary']"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'textcritic' and @rend = 'hide']"/>
    
    <xsl:template match="tei:div[@type = 'textcritic']" mode="apparatus-of-parallel-entry">
        <div class="body-textcritic">
            <xsl:apply-templates select="tei:app[@type = 'fragment']"/>
            <xsl:for-each select="tei:app[@type = 'text']">
                <xsl:apply-templates select="."/>
                <xsl:if test="position() != last()"><xsl:text> || </xsl:text></xsl:if>
            </xsl:for-each>
            <xsl:apply-templates select="tei:note[@type = 'textual-commentary']"/>
        </div>
    </xsl:template>

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@type = 'psalmtext']/parent::tei:div[@xml:lang = 'grc']]">
        <div class="row">
            <div class="col-md-2">
                <xsl:if test="exists(@n)">
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="substring-before(./parent::tei:div[@type = 'psalmtext']/parent::tei:div[@type = 'text']/parent::tei:div[@type = 'psalmverse']/@n,'.')"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text>) </xsl:text>
                </xsl:if>
            </div>
            <div class="col-md-5 greek-psalmtext"><xsl:value-of select="text()"/></div>
            <div class="col-md-5 latin-psalmtext">
                <xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:quote[current()/@xml:id = substring-after(@corresp,'#')]"/>
            </div>
        </div>
</xsl:template>

<xsl:template match="tei:quote[@type = 'psalmtext' and parent::tei:div[@xml:lang = 'de']]">
    <xsl:if test="exists(@n)">
        <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
        <xsl:text>) </xsl:text>
    </xsl:if>
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@type = 'commentary']/parent::tei:div[@xml:lang = 'grc']]">
    <div class="row">
        <div class="col-md-2">
            <b>
                <xsl:text>Expositio </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:if test="exists(parent::tei:div[@type = 'commentary']/@subtype)">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="parent::tei:div[@type = 'commentary']/@subtype"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>:</xsl:text>
            </b>
            <xsl:if test="exists(@ana) and @ana = 'hypothesis'">
                <xsl:text> Hypothesis</xsl:text>
            </xsl:if>
        </div>
        <xsl:if test="exists(parent::tei:div[@type = 'commentary']/@rend) and (parent::tei:div[@type = 'commentary']/@rend = 'parallel')">
            <div class="col-md-5 large-greek-text">
                <xsl:value-of select="text()"/>
            </div>
            <div class="col-md-5 large-greek-text">
                <xsl:value-of select="parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/text()"/>
            </div>
            <div class="col-md-2"/>
            <div class="col-md-5 large-latin-text">
                <xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
            </div>
            <div class="col-md-5 large-latin-text">
                <xsl:variable name="xml-id-of-translation">
                    <xsl:value-of select="parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/@xml:id"/>
                </xsl:variable>
                <xsl:apply-templates select="//tei:p[@corresp = concat('#',$xml-id-of-translation)]"/>
            </div>
            <div class="col-md-2"/>
            <div class="col-md-5">
                <xsl:apply-templates select="parent::tei:div[@type = 'commentary']/following-sibling::tei:div[@type = 'textcritic'][1]" mode="apparatus-of-parallel-entry"/>
            </div>
            <div class="col-md-5">
                <xsl:apply-templates select="parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/parent::tei:div[@type = 'commentary']/following-sibling::tei:div[@type = 'textcritic'][1]" mode="apparatus-of-parallel-entry"/>
            </div>
            <div class="col-md-12" style="border-bottom: 1pt solid black; margin-bottom: 10pt;"/>
        </xsl:if>
        <xsl:if test="not(exists(parent::tei:div[@type = 'commentary']/@rend))">
            <div class="col-md-5 large-greek-text">
                <xsl:value-of select="text()"/>
            </div>
            <div class="col-md-5 large-latin-text">
                <xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
            </div>
        </xsl:if>
    </div>
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'de']]">
    <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="tei:app[@type = 'fragment']">
    <p>
        <xsl:text>– </xsl:text>
        <xsl:for-each select="tokenize(tei:rdg/@wit,' ')">
            <i>
                <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                        <sup>
                            <xsl:value-of select="regex-group(2)"/>
                        </sup>
                    </xsl:matching-substring>
                </xsl:analyze-string>
                <!-- <xsl:value-of select="substring-after(.,'#')"/> -->
            </i>
            <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
        </xsl:for-each>
    </p>
</xsl:template>

<xsl:template match="tei:app[@type = 'text']">
    <b>
    <xsl:apply-templates select="tei:lem"/>
    </b>
    <xsl:if test="exists(tei:lem/@wit)">
        <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="tokenize(tei:lem/@wit,' ')">
        <i>
            <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)"/>
                    <sup>
                        <xsl:value-of select="regex-group(2)"/>
                    </sup>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </i>
        <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
    <xsl:if test="exists(tei:lem)">
        <xsl:text>] </xsl:text>
    </xsl:if>
    <xsl:variable name="number-of-readings" select="count(tei:rdg)"/>
    <xsl:for-each select="tei:rdg">
        <xsl:variable name="outer-loop" select="position()"/>
        <xsl:apply-templates select="tei:foreign | text() | tei:hi"/>
        <xsl:text> </xsl:text>
        <xsl:for-each select="tokenize(./@wit,' ')">
            <i>
                <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                        <sup>
                            <xsl:value-of select="regex-group(2)"/>
                        </sup>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </i>
            <xsl:if test="position() != last()">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="exists(./child::tei:note[@type = 'in-readings'])">
            <xsl:text> </xsl:text>
            <xsl:value-of select="./tei:note[@type = 'in-readings']/text()"/>
        </xsl:if>
        <xsl:if test="$outer-loop != $number-of-readings"><xsl:text> | </xsl:text></xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template match="tei:lem">
<xsl:apply-templates select="child::node()"/>
</xsl:template>
    
<xsl:template match="tei:foreign[@xml:lang = 'grc']">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:note[@type = 'textual-commentary']">
    <p style="margin-top: 10pt;"><xsl:apply-templates select="child::node()"/></p>
</xsl:template>

<xsl:template match="tei:hi[@rend = 'italic']">
    <span style="font-style: italic;">
        <xsl:apply-templates select="child::node()"/>
    </span>
</xsl:template>
    
<xsl:template match="tei:hi[@rend = 'sup']">
    <sup>
        <xsl:value-of select="text()"/>
    </sup>
</xsl:template>

</xsl:stylesheet>