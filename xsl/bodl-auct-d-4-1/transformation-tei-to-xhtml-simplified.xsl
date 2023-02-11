<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xhtml"/>
    
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
        <xsl:for-each select="tei:fileDesc/tei:titleStmt/tei:title">
            <p class="title">
                <xsl:value-of select="./text()"/>
            </p>
        </xsl:for-each>
        <xsl:for-each select="tei:fileDesc/tei:titleStmt/tei:respStmt">
            <p class="responsibility">
                <xsl:value-of select="./tei:resp/text()"/>
            </p>
            <p class="author">
                <xsl:value-of select="./tei:persName/text()"/>
            </p>
        </xsl:for-each>
        <p class="publisher">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:publisher/text()"/>
        </p>
        <p class="license">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:availability/text()"/>
        </p>
        <p class="date">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:date/text()"/>
        </p>
        <p class="title">
            <xsl:value-of select="concat(tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement/text(),', ',tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository/text(),', ',tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text())"/>
        </p>
        <p class="link-to-facsimiles">
            <xsl:text>Facsimiles of the manuscript are not available online.</xsl:text>
        </p>
        <p class="link-to-facsimiles">
            <xsl:text>The pinakes identifier of the manuscript is: </xsl:text>
            <a target="_blank">
                <xsl:attribute name="href">
                    <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno[@type='pinakes']/@corresp"/>
                </xsl:attribute>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno[@type='pinakes']/text()"/>
            </a>
        </p>
        <p class="manuscript-content">
            <xsl:text>The content of the manuscript is: </xsl:text>
            <ul class="text-header">
                <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents"/>
            </ul>
        </p>
        <div class="manuscript-physical-description">
            <xsl:text>Physical description of the manuscript: </xsl:text>
            <p class="manuscript-physical-description-content">
                <xsl:text>Form: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/@form"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:text>Material: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/text()"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:text>Extent: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent/tei:dimensions/tei:height/text()"/>
                <xsl:text> x </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent/tei:dimensions/tei:width/text()"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent/tei:dimensions/@unit"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:text>Layout of the pages: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:layoutDesc/tei:layout/tei:p/text()"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:text>Scripts:</xsl:text>
            </p>
            <ul class="manuscript-physical-description-content">
                <xsl:for-each select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:scriptDesc/tei:p">
                    <li>
                        <xsl:value-of select="text()"/>
                    </li>
                </xsl:for-each>
            </ul>
            <xsl:for-each select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:additions/tei:p">
                <p class="manuscript-physical-description-content">
                    <xsl:value-of select="text()"/>
                </p>
            </xsl:for-each>
            <p class="manuscript-physical-description-content">
                <xsl:text>Decoration: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:decoDesc/tei:p/text()"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history/tei:p/text()"/>
            </p>
        </div>
        <div class="bibliography">
            <p>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:listBibl/tei:head"/>
            </p>
            <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:listBibl/tei:biblStruct"/>
        </div>
        <div class="editorial-declaration">
            <xsl:apply-templates select="tei:encodingDesc/tei:editorialDecl"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:msItem">
        <li>
            <xsl:value-of select="tei:locus"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="tei:title"/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:layout/tei:p[not(exists(@xml:id))]">
        <li>
            <xsl:value-of select="text()"/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:glyph">
        <p class="glyphs">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                </xsl:attribute>
            </img>
            <span class="name-of-glyph">
                <xsl:value-of select="tei:glyphName/text()"/>
            </span>
        </p>
    </xsl:template>
    <xsl:template match="tei:editorialDecl">
        <p class="editorial-declaration-punctuation">
            <xsl:value-of select="tei:punctuation/tei:p"/>
        </p>
        <div class="editorial-declaration-normalization">
            <p class="editorial-declaration-normalization-paragraph">
                <xsl:value-of select="tei:normalization/tei:p/text()"/>
                <!--<xsl:apply-templates select="tei:normalization/tei:p/tei:list/tei:item"/>
                <xsl:apply-templates select="tei:normalization/tei:p[@n = 'auszeichnungsmajuskeln']"/>-->
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tei:item">
        <!--<p class="abbreviations">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute>
            </img>
            <span class="abbreviations-text">
                <xsl:apply-templates/>
            </span>
        </p>-->
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'bold']">
        <!--<span class="text-main-bold">
            <xsl:value-of select="text()"/>
        </span>-->
    </xsl:template>
    
    <xsl:template match="tei:biblStruct">
        <p class="bibliographic-item">
            <xsl:if test="exists(tei:analytic)">
                <span class="smallCaps">
                    <xsl:value-of select="tei:analytic/tei:editor/tei:surname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:analytic/tei:editor/tei:forename"/>
                </span>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:analytic/tei:title"/>
                <xsl:text>, in: </xsl:text>
            </xsl:if>
            <xsl:for-each select="tei:monogr/tei:editor">
                <span class="smallCaps">
                    <xsl:value-of select="tei:surname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:forename"/>
                </span>
                <xsl:if test="number() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:value-of select="tei:monogr/tei:title"/>
            <xsl:if test="exists(tei:monogr/tei:imprint/tei:biblScope[@unit = 'volume'])">
                <xsl:text>. </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit = 'volume']"/>
            </xsl:if>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
            <xsl:if test="exists(tei:monogr/tei:imprint/tei:biblScope[@unit = 'page'])">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit = 'page']"/>
            </xsl:if>
            <xsl:if test="empty(tei:series)">
                <xsl:text>.</xsl:text>
            </xsl:if>
            <xsl:if test="exists(tei:series)">
                <xsl:text> (= </xsl:text>
                <xsl:value-of select="tei:series"/>
                <xsl:text>).</xsl:text>
            </xsl:if>
            <xsl:if test="exists(tei:note[@type = 'reprint'])">
                <xsl:text> Reprint in: </xsl:text>
                <xsl:value-of select="tei:note[@type = 'reprint']"/>
            </xsl:if>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:p[@n = 'auszeichnungsmajuskeln']">
        <p class="editorial-declaration-normalization-paragraph">
            <xsl:value-of select="text()"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates select="//tei:seg[@type = 'commentaryfragment' or 'glosse' or 'hexaplaric' or 'hypothesis'] | //tei:pb"/>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'commentaryfragment' or @type = 'hypothesis']">
        <xsl:element name="div">
            <xsl:attribute name="class" select="'commentaryfragment'"/>
            <a>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </a>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment-header'"/>
                <xsl:if test="@type = 'commentaryfragment'">
                    <xsl:text>Commentaryfragment: </xsl:text>
                </xsl:if>
                <xsl:if test="@type = 'hypothesis'">
                    <xsl:text>Hypothesis: </xsl:text>
                </xsl:if>
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
                <xsl:text> - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="child::tei:quote[@type = 'patristic']/@source"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:text>Lemma: </xsl:text>
                <xsl:value-of select="preceding-sibling::tei:note[@type = 'lemma'][1]/text()"/>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:apply-templates select="child::tei:quote[@type = 'patristic']/child::node()"/>
            </xsl:element>
            <xsl:if test="exists(child::tei:note[@type = 'attribution'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:text>Attribution: </xsl:text>
                    <xsl:apply-templates select="child::tei:note[@type = 'attribution']/child::node()"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(child::tei:ref)">
                <p class="paragraph-in-commentaryfragment">
                    <xsl:apply-templates select="child::tei:ref"/>
                </p>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'glosse']">
        <xsl:element name="div">
            <xsl:attribute name="class" select="'glosse-commentaryfragments-only'"/>
            <a>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </a>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-glosse'"/>
                <xsl:text>Glosse: </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
                <xsl:text> - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="child::tei:quote[@type = 'patristic']/@source"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:text>Lemma: </xsl:text>
                <xsl:value-of select="preceding-sibling::tei:note[@type = 'lemma'][1]/text()"/>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:apply-templates select="child::tei:quote/child::node()"/>
            </xsl:element>
            <xsl:if test="exists(child::tei:note[@type = 'attribution'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:text>Attribution: </xsl:text>
                    <xsl:apply-templates select="child::tei:note[@type = 'attribution']/child::node()"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(child::tei:ref)">
                <p class="paragraph-in-commentaryfragment">
                    <xsl:apply-templates select="child::tei:ref"/>
                </p>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'hexaplaric']">
        <xsl:element name="div">
            <xsl:attribute name="class" select="'hexaplaric-variant'"/>
            <a>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </a>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-hexaplaric-variant-header'"/>
                <xsl:text>Hexaplaric variant: </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-hexaplaric-variant'"/>
                <xsl:apply-templates select="child::node()"/>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-hexaplaric-variant'"/>
                <xsl:text>Lemma: </xsl:text>
                <xsl:value-of select="preceding-sibling::tei:note[@type = 'lemma'][1]/text()"/>
            </xsl:element>
            <xsl:if test="exists(child::tei:ref)">
                <p class="paragraph-in-hexaplaric-variant">
                    <xsl:apply-templates select="child::tei:ref"/>
                </p>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:text>→ </xsl:text>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:if test="starts-with(@target,'vat-gr-754:')">
                    <xsl:value-of select="concat('vat_gr_754.html#',substring-after(@target,'vat-gr-754:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'vat-gr-1422:')">
                    <xsl:value-of select="concat('vat_gr_1422.html#',substring-after(@target,'vat-gr-1422:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'ambr-m-47-sup')">
                    <xsl:value-of select="concat('ambr_m_47_sup.html#',substring-after(@target,'ambr-m-47-sup:'))"/>
                </xsl:if>
            </xsl:attribute>
            <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
            <xsl:value-of select="text()"/>
        </xsl:element>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <p class="page-number">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)</xsl:text>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'header']/tei:head">
        <div class="header">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:if test="parent::tei:div/@rendition = '#middle-column'">
                    <xsl:text>middle column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#left-column'">
                    <xsl:text>left column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#right-column'">
                    <xsl:text>right column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#top-of-the-page'">
                    <xsl:text>top of the page</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#bottom-of-the-page'">
                    <xsl:text>bottom of the page</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#left-margin-of-left-column'">
                    <xsl:text>left margin of left column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#left-margin-of-middle-column'">
                    <xsl:text>left margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#left-margin-of-right-column'">
                    <xsl:text>left margin of right column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#bottom-of-right-column'">
                    <xsl:text>bottom of right column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#bottom-of-middle-column'">
                    <xsl:text>bottom of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#right-margin-of-middle-column'">
                    <xsl:text>right margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#left-margin'">
                    <xsl:text>left margin</xsl:text>
                </xsl:if>
                <xsl:if test="parent::tei:div/@rendition = '#top-margin'">
                    <xsl:text>top margin</xsl:text>
                </xsl:if>
                <xsl:text>] [</xsl:text>
                <xsl:value-of select="parent::tei:div/@type"/>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'bibletext']">
        <div class="quotation">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:if test="@rendition = '#middle-column'">
                    <xsl:text>middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-column'">
                    <xsl:text>left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-column'">
                    <xsl:text>right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-of-the-page'">
                    <xsl:text>top of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-the-page'">
                    <xsl:text>bottom of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-left-column'">
                    <xsl:text>left margin of left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                    <xsl:text>left margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-right-column'">
                    <xsl:text>left margin of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-right-column'">
                    <xsl:text>bottom of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-middle-column'">
                    <xsl:text>bottom of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                    <xsl:text>right margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin'">
                    <xsl:text>left margin</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-margin'">
                    <xsl:text>top margin</xsl:text>
                </xsl:if>
                <xsl:text>] [</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:ab[@type = 'hexaplaric']">
        <div class="bibleverse">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hypothesis']">
        <div class="manuscript-content">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:if test="@rendition = '#middle-column'">
                    <xsl:text>middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-column'">
                    <xsl:text>left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-column'">
                    <xsl:text>right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-of-the-page'">
                    <xsl:text>top of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-the-page'">
                    <xsl:text>bottom of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-left-column'">
                    <xsl:text>left margin of left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                    <xsl:text>left margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-right-column'">
                    <xsl:text>left margin of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-right-column'">
                    <xsl:text>bottom of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-middle-column'">
                    <xsl:text>bottom of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                    <xsl:text>right margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin'">
                    <xsl:text>left margin</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-margin'">
                    <xsl:text>top margin</xsl:text>
                </xsl:if>
                <xsl:text>] [</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:head[parent::tei:div[@type = 'hypothesis']]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ab[parent::tei:div[@type = 'hypothesis']]">
        <p class="manuscript-content-rendition">
            <xsl:text>[</xsl:text>
            <xsl:if test="@rendition = '#middle-column'">
                <xsl:text>middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-column'">
                <xsl:text>left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-column'">
                <xsl:text>right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-of-the-page'">
                <xsl:text>top of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-the-page'">
                <xsl:text>bottom of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-left-column'">
                <xsl:text>left margin of left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                <xsl:text>left margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-right-column'">
                <xsl:text>left margin of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-right-column'">
                <xsl:text>bottom of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-middle-column'">
                <xsl:text>bottom of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                <xsl:text>right margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin'">
                <xsl:text>left margin</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-margin'">
                <xsl:text>top margin</xsl:text>
            </xsl:if>
            <xsl:text>] [</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>]</xsl:text>
        </p>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'note']">
        <div class="manuscript-content">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:if test="@rendition = '#middle-column'">
                    <xsl:text>middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-column'">
                    <xsl:text>left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-column'">
                    <xsl:text>right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-of-the-page'">
                    <xsl:text>top of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-the-page'">
                    <xsl:text>bottom of the page</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-left-column'">
                    <xsl:text>left margin of left column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                    <xsl:text>left margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin-of-right-column'">
                    <xsl:text>left margin of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-right-column'">
                    <xsl:text>bottom of right column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#bottom-of-middle-column'">
                    <xsl:text>bottom of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                    <xsl:text>right margin of middle column</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#left-margin'">
                    <xsl:text>left margin</xsl:text>
                </xsl:if>
                <xsl:if test="@rendition = '#top-margin'">
                    <xsl:text>top margin</xsl:text>
                </xsl:if>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'commentary']">
        <div class="main-text-commentary">
            <xsl:text>[</xsl:text>
            <xsl:if test="@rendition = '#middle-column'">
                <xsl:text>middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-column'">
                <xsl:text>left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-column'">
                <xsl:text>right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-of-the-page'">
                <xsl:text>top of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-the-page'">
                <xsl:text>bottom of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-left-column'">
                <xsl:text>left margin of left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                <xsl:text>left margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-right-column'">
                <xsl:text>left margin of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-right-column'">
                <xsl:text>bottom of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-middle-column'">
                <xsl:text>bottom of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                <xsl:text>right margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin'">
                <xsl:text>left margin</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-margin'">
                <xsl:text>top margin</xsl:text>
            </xsl:if>
            <xsl:text>] [</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>]</xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:note[parent::tei:div[@type = 'commentary'] and @type != 'inline']">
        <div class="note-in-commentary">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@place"/>
            <xsl:text>]</xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:note[@type = 'inline']">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="@place"/>
        <xsl:text>] </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:quote[@type = 'bibletext']">
        <div class="bibleverse">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <div class="linebreak"/>
        <span class="line-number">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>) </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:quote[@rend = 'red ink bold']">
        <span class="red-ink-bold">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:hi[ancestor::tei:div[@type='commentary'] and @rend = 'red ink bold']">
        <span class="red-ink-bold">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:corr) and not(exists(tei:orig/@style)) and not(exists(tei:orig/tei:abbr))]">
        <xsl:text></xsl:text>
        <xsl:value-of select="tei:orig"/>
        <xsl:text> 〈</xsl:text>
        <xsl:value-of select="tei:corr"/>
        <xsl:text>〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:reg[@type = 'correction']) and not(exists(tei:orig/tei:abbr)) and not(exists(tei:reg/tei:hi/tei:g))]">
        <xsl:apply-templates select="tei:orig"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="tei:reg"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orig">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:surplus">
        <xsl:text>{</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:orig/tei:abbr) and tei:orig/tei:abbr/@type = 'ligature']">
        <xsl:apply-templates select="tei:orig/tei:abbr[@type = 'ligature']"/>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'ligature']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:abbr[@type = 'ligature']]">
        <xsl:text>〈〈</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>〉〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:orig/tei:abbr) and tei:orig/tei:abbr/@type = 'tachygraphic']">
        <xsl:apply-templates select="tei:orig/tei:abbr[@type = 'tachygraphic']"/>
        <xsl:if test="exists(tei:corr)">
            <xsl:text> 〈</xsl:text>
            <xsl:value-of select="tei:corr/text()"/>
            <xsl:text>〉</xsl:text>
        </xsl:if>
        <xsl:if test="exists(tei:reg[@type = 'correction'])">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:reg[@type = 'correction']/text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'tachygraphic']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:abbr[@type = 'tachygraphic']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:orig/tei:abbr) and tei:orig/tei:abbr/@type = 'compression-tachygraphic']">
        <xsl:apply-templates select="tei:orig/tei:abbr[@type = 'compression-tachygraphic']"/>
        <xsl:if test="exists(tei:corr)">
            <xsl:text> 〈</xsl:text>
            <xsl:value-of select="tei:corr/text()"/>
            <xsl:text>〉</xsl:text>
        </xsl:if>
        <xsl:if test="exists(tei:reg[@type = 'correction'])">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:reg[@type = 'correction']/text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'compression-tachygraphic']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:abbr[@type = 'compression-tachygraphic']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:orig/tei:abbr) and (tei:orig/tei:abbr/@type = 'suspension')]">
        <xsl:apply-templates select="tei:orig/tei:abbr[@type = 'suspension']"/>
        <xsl:if test="exists(tei:corr)">
            <xsl:text> 〈</xsl:text>
            <xsl:value-of select="tei:corr/text()"/>
            <xsl:text>〉</xsl:text>
        </xsl:if>
        <xsl:if test="exists(tei:reg[@type = 'correction'])">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:reg[@type = 'correction']/text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:orig) and exists(tei:reg[@type = 'correction']) and exists(tei:reg/tei:hi/tei:g)]">
        <xsl:apply-templates select="tei:orig/tei:hi"/>
        <xsl:text> (</xsl:text>
            <xsl:apply-templates select="tei:reg/tei:hi"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'suspension']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:abbr[@type = 'suspension']]">
        <xsl:if test="not(exists(parent::tei:hi))">
            <sup>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="text()"/>
                <xsl:text>)</xsl:text>
            </sup>
        </xsl:if>
        <xsl:if test="exists(parent::tei:hi)">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!--<xsl:template match="tei:hi[parent::tei:abbr[@type = 'suspension']]">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>-->
    
    <xsl:template match="tei:choice[exists(tei:orig/tei:abbr) and (tei:orig/tei:abbr/@type = 'compression-suspension')]">
        <xsl:apply-templates select="tei:orig/tei:abbr[@type = 'compression-suspension']"/>
        <xsl:if test="exists(tei:corr)">
            <xsl:text> 〈</xsl:text>
            <xsl:value-of select="tei:corr/text()"/>
            <xsl:text>〉</xsl:text>
        </xsl:if>
        <xsl:if test="exists(tei:reg[@type = 'correction'])">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:reg[@type = 'correction']/text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'compression-suspension']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:abbr[@type = 'compression-suspension']]">
        <xsl:if test="not(exists(parent::tei:hi))">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="text()"/>
                <xsl:text>)</xsl:text>
        </xsl:if>
        <xsl:if test="exists(parent::tei:hi)">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="text()"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!--<xsl:template match="tei:hi[parent::tei:abbr[@type = 'compression-suspension']]">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>-->
    
    <xsl:template match="tei:choice[exists(tei:abbr) and not(exists(@style))]">
        <xsl:choose>
            <xsl:when test="tei:abbr/@type = 'nomSac'">
                <span class="overline">
                    <xsl:value-of select="tei:abbr"/>
                </span>
            </xsl:when>
            <xsl:when test="tei:abbr/@type = 'compression'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:abbr"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="not(tei:abbr/@type = 'compression')">
            <xsl:text> (</xsl:text>
            <xsl:if test="exists(tei:expan/tei:unclear)">
                <span class="unclear">
                    <xsl:value-of select="tei:expan/tei:unclear/text()"/>
                </span>
            </xsl:if>
            <xsl:if test="not(exists(tei:expan/tei:unclear))">
                <xsl:value-of select="tei:expan"/>
            </xsl:if>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:am[parent::tei:abbr[@type = 'compression']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:expan[preceding-sibling::tei:abbr[@type = 'compression']]"/>    
    
    <xsl:template match="tei:choice[exists(tei:abbr) and exists(@style) and @style = 'nomina-sacra-with-abbreviation']">
        <span class="overline">
              <xsl:apply-templates/>
        </span>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="tei:expan"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:choice[@style = 'nomina-sacra-with-abbreviation']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[not(@style = 'with-abbreviation') and (tei:orig/@style = 'abbreviation' or tei:orig/@style ='ending' or tei:orig/@style = 'abbreviation-ending' or tei:orig/@style = 'abbreviation-sup-ending') or tei:orig/@style = 'abbreviation-sup-ending-classical']">
        <xsl:choose>
            <xsl:when test="tei:orig[@style = 'abbreviation']">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="tei:orig/text()"/>
                <xsl:text>)</xsl:text>
            </xsl:when>
            <!--<xsl:when test="tei:orig[@style = 'ending']">
                <xsl:apply-templates select="tei:orig[@style = 'ending']"/>
            </xsl:when>-->
            <xsl:when test="tei:orig[@style = 'abbreviation-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-sup-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-sup-ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'ending-common']">
                <xsl:apply-templates select="tei:orig[@style = 'ending-common']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'commpression-ending-common']">
                <xsl:apply-templates select="tei:orig[@style = 'commpression-ending-common']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-sup-ending-classical']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-sup-ending-classical']"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:am[parent::tei:orig[@style = 'ending-common']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()[ancestor::tei:corr and ancestor::tei:choice[@style = 'with-abbreviation']]">
        <xsl:value-of select="."/>
    </xsl:template>    
    
    <xsl:template match="text()[ancestor::tei:expan and not(ancestor::tei:choice[@style = 'with-abbreviation'])]"/>
    
    <xsl:template match="tei:orig[@style = 'abbreviation-ending']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[parent::tei:orig[@style = 'abbreviation-ending']]">
        <sup>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="text()"/>
            <xsl:text>)</xsl:text>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:orig[@style = 'abbreviation-sup-ending']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:gap">
        <xsl:text>[... (</xsl:text>
        <xsl:value-of select="@quantity"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@unit"/>
        <xsl:text>(s) </xsl:text>
        <xsl:value-of select="@reason"/>
        <xsl:text>)]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:add">
        <xsl:if test="@type = 'correction'">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="text()"/>        
            <xsl:text>]</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:supplied">
        <xsl:text>[</xsl:text>
        <span class="addition-underline">
            <xsl:apply-templates/>
        </span>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:g[not(@type = 'reference') and not(@type = 'linking')]">
        <span class="glyph-in-text">
            <xsl:text> |</xsl:text>
            <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph[@xml:id = substring-after(current()/@ref,'#')]/tei:glyphName/text()"/>
            <xsl:text>| </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:g[@type = 'reference']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <xsl:if test="not(exists(@rend)) and @rend != 'on the line'">
        <sup>
            <span class="reference">
                <xsl:value-of select="text()"/>
            </span>
        </sup>
        </xsl:if>
        <xsl:if test="exists(@rend) and @rend = 'on the line'">
            <xsl:value-of select="text()"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:g[@type = 'linking' and @subtype = 'destination']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <span class="glyph-in-text">
            <xsl:text> |</xsl:text>
            <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph[@xml:id = substring-after(current()/@ref,'#')]/tei:glyphName/text()"/>
            <xsl:text>| </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:g[@type = 'linking' and @subtype = 'source']">
            <span class="glyph-in-text">
                <xsl:text> |</xsl:text>
                <xsl:if test="exists(@corresp)">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@corresp"/>
                    </xsl:attribute>
                    <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph[@xml:id = substring-after(current()/@ref,'#')]/tei:glyphName/text()"/>
                </a>
                </xsl:if>
                <xsl:if test="not(exists(@corresp))">
                    <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph[@xml:id = substring-after(current()/@ref,'#')]/tei:glyphName/text()"/>
                </xsl:if>
                <xsl:text>| </xsl:text>
            </span>
    </xsl:template>
    
    <xsl:template match="tei:anchor[@type = 'psalmtext']">
        <div class="psalmnumber">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </div>
    </xsl:template>
    
    <!--<xsl:template match="tei:seg[@type = 'commentaryfragment']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <xsl:if test="exists(@rendition) and (local-name(preceding-sibling::*[1]) = 'note')">
            <xsl:text>[</xsl:text>
            <xsl:if test="@rendition = '#middle-column'">
                <xsl:text>middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-column'">
                <xsl:text>left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-column'">
                <xsl:text>right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-of-the-page'">
                <xsl:text>top of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-the-page'">
                <xsl:text>bottom of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-left-column'">
                <xsl:text>left margin of left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                <xsl:text>left margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-right-column'">
                <xsl:text>left margin of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-right-column'">
                <xsl:text>bottom of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-middle-column'">
                <xsl:text>bottom of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                <xsl:text>right margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin'">
                <xsl:text>left margin</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-margin'">
                <xsl:text>top margin</xsl:text>
            </xsl:if>
            <xsl:text>] </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <!--<xsl:template match="tei:seg[@type = 'glosse']">
        <xsl:if test="exists(@rendition) and ((local-name(preceding-sibling::*[1]) = 'note') or ancestor::tei:div[@type = 'glossai'])">
            <xsl:text>[</xsl:text>
            <xsl:if test="@rendition = '#middle-column'">
                <xsl:text>middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-column'">
                <xsl:text>left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-column'">
                <xsl:text>right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-of-the-page'">
                <xsl:text>top of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-the-page'">
                <xsl:text>bottom of the page</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-left-column'">
                <xsl:text>left margin of left column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-middle-column'">
                <xsl:text>left margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin-of-right-column'">
                <xsl:text>left margin of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-right-column'">
                <xsl:text>bottom of right column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#bottom-of-middle-column'">
                <xsl:text>bottom of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#right-margin-of-middle-column'">
                <xsl:text>right margin of middle column</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#left-margin'">
                <xsl:text>left margin</xsl:text>
            </xsl:if>
            <xsl:if test="@rendition = '#top-margin'">
                <xsl:text>top margin</xsl:text>
            </xsl:if>
            <xsl:text>] </xsl:text>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>] </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <!--<xsl:template match="tei:seg[@type = 'hexaplaric']">
        <xsl:if test="exists(@rendition) and (local-name(preceding-sibling::*[1]) = 'note')">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@rendition"/>
            <xsl:text>] </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <!--<xsl:template match="tei:quote[@type = 'patristic']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <span class="quotation-patristic-author">
            <xsl:apply-templates/>
        </span>
        <xsl:text> [= </xsl:text>
        <xsl:value-of select="@source"/>
        <xsl:if test="exists(@subtype)">
            <xsl:text> - </xsl:text>
            <xsl:value-of select="@subtype"/>
        </xsl:if>
        <xsl:if test="exists(@prev)">
            <xsl:text> (continued)</xsl:text>
        </xsl:if>
        <xsl:text>]</xsl:text>
    </xsl:template>-->
    
    <xsl:template match="tei:quote[@type = 'biblical']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <span class="quotation-biblical">
            <xsl:apply-templates/>
        </span>
        <xsl:text> [</xsl:text>
        <xsl:value-of select="@source"/>
        <xsl:if test="exists(@prev)">
            <xsl:text> (continued)</xsl:text>
        </xsl:if>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'commentaryfragment']" mode="toc">
        <li class="list-of-authors">
            <a>
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="@source"/>
            </a>
            <xsl:text> on </xsl:text>
            <xsl:choose>
                <xsl:when test="exists(root()//tei:div[@type = 'bibletext']//tei:quote/tei:anchor[@xml:id = substring-after(current()/@corresp,'#')])">
                    <xsl:value-of select="root()//tei:div//tei:anchor[@xml:id = substring-after(current()/@corresp,'#')]/@n"/>
                    <xsl:if test="exists(@prev)">
                        <xsl:text> (continued)</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="exists(root()//tei:div[@type = 'header']/tei:head[@type = 'title']/tei:anchor[@xml:id = substring-after(current()/@corresp,'#')])">
                    <xsl:value-of select="root()//tei:div//tei:anchor[@xml:id = substring-after(current()/@corresp,'#')]/@n"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="root()//tei:quote[@xml:id = substring-after(current()/@corresp,'#')]"/>
                    <xsl:if test="exists(@prev)">
                        <xsl:text> (continued)</xsl:text>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:quote[@type = 'patristic']" mode="fons">
        <li class="list-of-authors">
            <a>
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="@source"/>
            </a>
            <xsl:if test="exists(@prev)">
                <xsl:text> (continued)</xsl:text>
            </xsl:if>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:quote[@type = 'biblical']" mode="fons-bibl">
        <li class="list-of-authors">
            <a>
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="@source"/>
            </a>
            <xsl:if test="exists(@prev)">
                <xsl:text> (continued)</xsl:text>
            </xsl:if>
        </li>
    </xsl:template>

    
    <xsl:template match="tei:hi[@rend = 'overline' and not(exists(child::tei:g)) and not(exists(child::tei:choice))]">
        <span class="overline">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'overline' and exists(child::tei:choice)]">
        <span class="overline">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'overline' and exists(child::tei:g)]">
        <xsl:if test="tei:g[@type = 'linking']">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="tei:g/@corresp"/>
                </xsl:attribute>
                <span class="overline">
                    <xsl:value-of select="tei:g/text()"/>
                </span>
            </a>
        </xsl:if>
        <xsl:if test="tei:g[@type = 'reference' and @subtype = 'destination']">
            <a>
                <xsl:attribute name="id">
                    <xsl:value-of select="tei:g/@xml:id"/>
                </xsl:attribute>
            </a>
        </xsl:if>
        <xsl:if test="not(tei:g[@type = 'linking'])">
            <span class="overline">
                <xsl:value-of select="tei:g/text()"/>
            </span>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:hi[(@rend = 'ekthesis') or (@rend = 'ekthesis-majuscule')]">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:sic">
        <xsl:value-of select="text()"/>
        <xsl:text> (sic!)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <xsl:text>{</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <span class="unclear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:milestone[@unit = 'innerline']">
        <xsl:text>[</xsl:text>
        <xsl:if test="@rendition = '#middle-column'">
            <xsl:text>middle column</xsl:text>
        </xsl:if>
        <xsl:if test="@rendition = '#left-column'">
            <xsl:text>left column</xsl:text>
        </xsl:if>
        <xsl:if test="@rendition = '#right-column'">
            <xsl:text>right column</xsl:text>
        </xsl:if>
        <xsl:text>] </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'bibleversion']">
        <xsl:apply-templates/>
        <xsl:text> [</xsl:text>
        <xsl:value-of select="@source"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'superscript']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
      
    <xsl:template match="tei:hi[@rend = 'majuscule']">
        <span class="red-ink-bold">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'tall']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:add[@type = 'second-hand']">
        <xsl:if test="@place = 'above'">
            <xsl:text>\</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>/</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'left margin'">
            <xsl:apply-templates/>
        </xsl:if>
        <xsl:text>(</xsl:text>
            <xsl:value-of select="@hand"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
      
    <xsl:template match="tei:subst">
        <xsl:value-of select="tei:del/text()"/>
        <xsl:text> [</xsl:text>
            <xsl:value-of select="tei:add/text()"/>
        <xsl:text> </xsl:text>
            <xsl:value-of select="tei:add/@hand"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
      
</xsl:stylesheet>