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
        <p class="title">
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
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
        <p class="link-to-facsimiles">
            <xsl:text>The facsimiles of the manuscript are available: </xsl:text>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/@facs"/>
                </xsl:attribute>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/>
            </a>
        </p>
        <p class="link-to-facsimiles">
            <xsl:text>The pinakes identifier of the manuscript is: </xsl:text>
            <a>
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
        <p class="manuscript-physical-description">
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
            <ul class="manuscript-physical-description-content">
                <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:layoutDesc/tei:layout"/>
            </ul>
            <p class="manuscript-physical-description-content">
                <xsl:text>Decoration: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:decoDesc/tei:p/text()"/>
            </p>
            <p class="manuscript-physical-description-content">
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history/tei:p/text()"/>
            </p>
        </p>
        <div class="used-glyphs">
            <xsl:text>The following glyphs are marked in the transcription:</xsl:text>
            <xsl:apply-templates select="tei:encodingDesc/tei:charDecl/tei:glyph"/>
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
    
    <xsl:template match="tei:layout">
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
                <!--<xsl:value-of select="tei:normalization/tei:p[@n = 'abbreviations']/text()"/>-->
                <xsl:apply-templates select="tei:normalization/tei:p/tei:list/tei:item"/>
                <xsl:apply-templates select="tei:normalization/tei:p[@n = 'auszeichnungsmajuskeln']"/>
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
    
    <xsl:template match="tei:p[@n = 'auszeichnungsmajuskeln']">
        <p class="editorial-declaration-normalization-paragraph">
            <xsl:value-of select="text()"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates select="tei:div[@type = 'transcription']"/>
        <xsl:apply-templates select="tei:div[@type = 'bibletext']"/>
        <xsl:apply-templates select="tei:div[@type = 'hypothesis']"/>
        <xsl:apply-templates select="tei:div[@type = 'commentary']"/>
        <div class="authors-of-commentaries">
            <p class="table-of-contents">Occuring authors:</p>
            <ul>
                <xsl:apply-templates select="//tei:seg[@type = 'commentaryfragment']" mode="toc"/>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:apply-templates/>
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
                <xsl:value-of select="parent::tei:div/@rendition"/>
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
                <xsl:value-of select="@rendition"/>
                <xsl:text>] [</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates select="tei:quote"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hypothesis']">
        <div class="manuscript-content">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="@rendition"/>
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
            <xsl:value-of select="@rendition"/>
            <xsl:text>]</xsl:text>
        </p>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'note']">
        <div class="manuscript-content">
            <span class="text-main-normal">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="@rendition"/>
                <xsl:text>]</xsl:text>
            </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:ab/tei:seg[@type != 'commentaryfragment']">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>]</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'commentary']">
        <div class="main-text-commentary">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@rendition"/>
            <xsl:text>] [</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>]</xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:note[parent::tei:div[@type = 'commentary']]">
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
    
    <xsl:template match="tei:quote/tei:lb">
        <span class="line-number">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>) </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br></br>
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
    
    <xsl:template match="tei:choice[exists(tei:corr) and not(exists(tei:orig/@style))]">
        <xsl:text> </xsl:text>
        <xsl:value-of select="tei:orig"/>
        <xsl:text> 〈</xsl:text>
        <xsl:value-of select="tei:corr"/>
        <xsl:text>〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:reg) and not(exists(@style))]">
        <xsl:text> </xsl:text>
        <xsl:value-of select="tei:orig"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="tei:reg"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(tei:abbr) and not(exists(@style))]">
        <xsl:choose>
            <xsl:when test="tei:abbr/@type = 'nomSac'">
                <span class="overline">
                    <xsl:value-of select="tei:abbr"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:abbr"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="tei:expan"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
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
            <xsl:when test="tei:orig[@style = 'ending']">
                <xsl:apply-templates select="tei:orig[@style = 'ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-sup-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-sup-ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'ending-common']">
                <xsl:apply-templates select="tei:orig[@style = 'ending-common']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-sup-ending-classical']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-sup-ending-classical']"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:choice[exists(@style) and @style = 'with-abbreviation' and (tei:orig/@style = 'abbreviation' or tei:orig/@style ='ending' or tei:orig/@style = 'abbreviation-ending' or tei:orig/@style = 'abbreviation-sup-ending' or tei:orig/@style = 'ending-common')]">
        <xsl:choose>
            <xsl:when test="tei:orig[@style = 'abbreviation']">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="tei:orig/text()"/>
                <xsl:text>)</xsl:text>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'ending']">
                <xsl:apply-templates select="tei:orig[@style = 'ending']"/>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-ending']"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="tei:reg/text()"/>
                <xsl:text>)</xsl:text>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'abbreviation-sup-ending']">
                <xsl:apply-templates select="tei:orig[@style = 'abbreviation-sup-ending']"/>
                <xsl:if test="exists(tei:corr)">
                    <xsl:text> 〈</xsl:text>
                    <xsl:value-of select="tei:corr/text()"/>
                    <xsl:text>〉</xsl:text>
                </xsl:if>
                <xsl:if test="exists(tei:reg)">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="tei:reg/text()"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:when test="tei:orig[@style = 'ending-common']">
                <xsl:apply-templates select="tei:orig[@style = 'ending-common']"/>
                <xsl:text> (</xsl:text>
                <xsl:if test="exists(tei:expan)">
                    <xsl:value-of select="tei:expan/text()"/>
                </xsl:if>
                <xsl:if test="exists(tei:reg)">
                    <xsl:value-of select="tei:reg/text()"/>
                </xsl:if>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:orig[@style = 'ending']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[parent::tei:orig[@style = 'ending']]">
        <xsl:text>〈〈</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>〉〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orig[@style = 'ending-common']">
        <xsl:apply-templates/>
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
    
    <xsl:template match="tei:orig[@style = 'abbreviation-sup-ending-classical']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:orig[@style = 'abbreviation-ending']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor::tei:orig[@style = 'abbreviation-sup-ending-classical']]">
        <xsl:text>〈〈</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>〉〉</xsl:text>
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
    
    <xsl:template match="tei:hi[parent::tei:orig[@style = 'abbreviation-sup-ending'] or parent::tei:orig[@style = 'abbreviation-sup-ending-classical']]">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:am[ancestor-or-self::tei:orig[@style = 'abbreviation-sup-ending']]">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>)</xsl:text>
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
        <!--<xsl:text>[</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>]</xsl:text>-->
    </xsl:template>
    
    <xsl:template match="tei:g[not(@type = 'reference')]">
        <span class="glyph-in-text">
            <xsl:text> |</xsl:text>
            <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph[@xml:id = substring-after(current()/@ref,'#')]/tei:glyphName/text()"/>
            <xsl:text>| </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:g[@type = 'reference']">
        <sup>
            <span class="reference">
                <xsl:value-of select="text()"/>
            </span>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:anchor[@type = 'psalmtext']">
        <p class="psalmnumber">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'commentaryfragment']">
        <a>
            <xsl:attribute name="id" >
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </a>
        <xsl:apply-templates/>
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
                <xsl:when test="exists(root()//tei:div[@type = 'bibletext']/tei:quote/tei:anchor[@xml:id = substring-after(current()/@corresp,'#')])">
                    <xsl:value-of select="root()//tei:div//tei:anchor[@xml:id = substring-after(current()/@corresp,'#')]/@n"/>
                    <xsl:if test="exists(@prev)">
                        <xsl:text> (continued)</xsl:text>
                    </xsl:if>
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
    
    <xsl:template match="tei:hi[@rend = 'overline']">
        <span class="overline">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>