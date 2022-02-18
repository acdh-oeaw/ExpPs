<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output encoding="UTF-8" media-type="text/json" indent="yes" method="text"/>
    
    <xsl:template match="/">
        <xsl:text>{</xsl:text>
            <xsl:variable name="manuscript-identifier" select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()"/>
            <xsl:text>&quot;manuscriptIdentifier&quot;:</xsl:text>
            <xsl:if test="$manuscript-identifier = 'Vat. gr. 754'">
                <xsl:text>&quot;Rahlfs 1175&quot;</xsl:text>
            </xsl:if>
            <xsl:text>,</xsl:text>
            <xsl:text>&quot;manuscriptAltIdentifier&quot;:&quot;</xsl:text>
            <xsl:value-of select="$manuscript-identifier"/>
            <xsl:text>&quot;,</xsl:text>
            <xsl:text>&quot;type&quot;:&quot;psalmtext&quot;,</xsl:text>
            <xsl:text>&quot;numberOfEntries&quot;:</xsl:text>
            <xsl:value-of select="count(//tei:quote[@type = 'bibletext' and not(exists(@prev))])"/>
            <xsl:text>,</xsl:text>
            <xsl:text>&quot;psalmtexts&quot;:[</xsl:text>
                <xsl:apply-templates select="//tei:quote[@type = 'bibletext' and not(exists(@prev))]"/>
            <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote[@type = 'bibletext' and not(exists(@prev))]">
        <xsl:variable name="psalm-identifier" select="@n"/>
        <xsl:variable name="psalm-identifier-without-LXX" select="replace($psalm-identifier,'\(LXX\) ','')"/>
        <xsl:text>{</xsl:text>
            <xsl:text>&quot;id&quot;:&quot;</xsl:text>
            <xsl:value-of select="translate(translate($psalm-identifier-without-LXX,',','.'),' ','.')"/>
            <xsl:text>&quot;,</xsl:text>
            <xsl:text>&quot;values&quot;:{</xsl:text>
                <xsl:text>&quot;name&quot;:&quot;</xsl:text>
                <xsl:value-of select="$psalm-identifier-without-LXX"/>
                <xsl:text>&quot;,</xsl:text>
                <xsl:text>&quot;identifier&quot;:&quot;</xsl:text>
                <xsl:value-of select="@xml:id"/>
                <xsl:text>&quot;,</xsl:text>
                <xsl:text>&quot;page&quot;:&quot;</xsl:text>
                <xsl:if test="exists(parent::tei:ab)">
                    <xsl:value-of select="self::tei:quote/parent::tei:ab/parent::tei:div/preceding-sibling::tei:pb[1]/@n"/>
                </xsl:if>
                <xsl:if test="not(exists(parent::tei:ab))">
                    <xsl:value-of select="self::tei:quote/parent::tei:div/preceding-sibling::tei:pb[1]/@n"/>
                </xsl:if>
                <xsl:text>&quot;,</xsl:text>
                <xsl:text>&quot;text&quot;:&quot;</xsl:text>
                    <xsl:variable name="psalmtext">
                        <xsl:apply-templates select="child::node()"/>
                    </xsl:variable>
                    <xsl:if test="exists(@next)">
                        <xsl:variable name="second-part-of-psalm">
                            <xsl:apply-templates select="//tei:quote[@xml:id = current()/substring-after(@next,'#')]"/>
                        </xsl:variable>
                        <xsl:value-of select="concat(normalize-space($psalmtext),' ',normalize-space($second-part-of-psalm))"/>
                    </xsl:if>
                    <xsl:if test="not(exists(@next))">
                        <xsl:value-of select="normalize-space($psalmtext)"/>
                    </xsl:if>
                <xsl:text>&quot;</xsl:text>
            <xsl:text>}</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
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
    
    <xsl:template match="tei:abbr[@type = 'bibleversion']"/>
    
    <xsl:template match="text()">
        <xsl:choose>
            <xsl:when test="contains(.,'                     ')">
                <xsl:value-of select="replace(.,'&#10;                     ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'                  ')">
                <xsl:value-of select="replace(.,'&#10;                  ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'&#10;               ')">
                <xsl:value-of select="replace(.,'&#10;               ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'&#10;                     ')">
                <xsl:value-of select="replace(.,'&#10;                     ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'&#10;                        ')">
                <xsl:value-of select="replace(.,'&#10;                        ','')"/>
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