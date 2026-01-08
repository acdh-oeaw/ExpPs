<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" version="5"/>
    
    <xsl:template match="tei:TEI">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <meta name="mobile-web-app-capable" content="yes"/>
                <meta name="apple-mobile-web-app-capable" content="yes"/>
                <meta name="apple-mobile-web-app-title" content="Expositiones in Psalmos"/>
                <link rel="profile" href="http://gmpg.org/xfn/11"/>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" id="fundament-styles"  href="../fundament/css/fundament.min.css" type="text/css"/>
                <link rel="stylesheet" href="../fundament/css/custom.css" type="text/css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/js/all.min.js" integrity="sha512-LW9+kKj/cBGHqnI4ok24dUWNR/e8sUD8RLzak1mNw5Ja2JYCmTXJTF5VpgFSw+VoBfpMvPScCo2DnKTIUjrzYw==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
                <link rel="icon" type="image/png" href="../favicon.png"/>
            </head>
            <body class="home">
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="itemscope" itemtype="http://schema.org/WebSite">
                        <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container" >
                                <!-- Your site title as branding in the menu -->
                                <a href="../index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="../fundament/images/exp_ps_logo.png" class="img-fluid logo-round" alt="Expositiones in Psalmos Logo" itemprop="logo" /></a><!-- end custom logo -->
                                <a class="navbar-brand site-title-with-logo" rel="home" href="../index.html" title="Expositiones in Psalmos" itemprop="url">Expositiones in Psalmos</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                    <!-- Your menu goes here -->
                                    <ul id="main-menu" class="navbar-nav">
                                        <li class="nav-item active"><a title="Home" href="../index.html" class="nav-link">Home</a></li>
                                        <li class="nav-item dropdown">
											<a title="Edition" href="edition.html" data-toggle="dropdown" class="nav-link dropdown-toggle">Edition <span class="caret"></span></a>
											<ul class="dropdown-menu" role="menu">
												<li class="nav-item dropdown-submenu">
													<a title="Edition - First Part" href="./edition.html" class="nav-link">Edition: Ps 1-25</a>
													<a title="Edition - Second Part" href="./edition-part-two.html" class="nav-link">Edition: Ps 26-50</a>
												</li>
											</ul>
										</li>
                                        <li class="nav-item"><a title="Manuscripts" href="../manuscripts.html" class="nav-link">Manuscripts</a></li>
                                        <li class="nav-item"><a title="Search" href="../search.html" class="nav-link">Search</a></li>
                                        <li class="nav-item"><a title="New-Findings" href="../new_findings.html" class="nav-link">New Findings</a></li>
                                        <li class="nav-item dropdown">
                                            <a title="About" href="../about.html" data-toggle="dropdown" class="nav-link dropdown-toggle">About <span class="caret"></span></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="About Transcriptions" href="../about-transcription.html" class="nav-link">About the Transcriptions</a>
                                                    <a title="About Links" href="../about-links.html" class="nav-link">Links to TEI-Sources</a>
                                                    <a title="Technical Documentation" href="../encoding.html" class="nav-link">Technical Documentation</a>
                                                    <a title="Access" href="../access.html" class="nav-link">Access</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item"><a title="News" href="../news.html" class="nav-link">News</a></li>
                                        <li class="nav-item"><a title="Team" href="../team.html" class="nav-link">Team</a></li>
                                    </ul>
                                </div>
                                <!-- .collapse navbar-collapse -->
                            </div>
                            <!-- .container -->
                        </nav>
                        <!-- .site-navigation -->
                    </div>
                    <!-- .wrapper-navbar end -->
                    <div class="wrapper" id="single-wrapper">
                        <div class="container" id="content" tabindex="-1">
                            <div class="row">
                                <div class="col-md-12 content-area" id="primary">
                                    <main class="site-main" id="main">
                                        <article>
                                            <header class="entry-header">
                                                <div class="entry-top-thumbnail">
                                                    <xsl:element name="img">
                                                        <xsl:attribute name="alt" select="'header-image'"/>
                                                        <xsl:attribute name="title" select="'Picture of manuscript'"/>
                                                        <xsl:attribute name="src">
                                                            <xsl:choose>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'bodl-auct-d-4-1'">
                                                                    <xsl:text>../fundament/images/picture_1.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'ambr-m-47-sup'">
                                                                    <xsl:text>../fundament/images/picture_6.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'ambr-b-106-sup'">
                                                                    <xsl:text>../fundament/images/picture_7.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'coislin-10'">
                                                                    <xsl:text>../fundament/images/picture_1.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'coislin-12'">
                                                                    <xsl:text>../fundament/images/picture_8.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'franzon-3'">
                                                                    <xsl:text>../fundament/images/picture_2.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'mosq-synod-194'">
                                                                    <xsl:text>../fundament/images/picture_3.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'oxon-s-trin-78'">
                                                                    <xsl:text>../fundament/images/picture_9.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'plut-5-30'">
                                                                    <xsl:text>../fundament/images/picture_12.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'plut-6-3'">
                                                                    <xsl:text>../fundament/images/picture_11.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'par-gr-139'">
                                                                    <xsl:text>../fundament/images/picture_10.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'par-gr-164'">
                                                                    <xsl:text>../fundament/images/picture_2.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:when test="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/@xml:id eq 'par-gr-166'">
                                                                    <xsl:text>../fundament/images/picture_1.png</xsl:text>
                                                                </xsl:when>
                                                                <xsl:otherwise><xsl:text>../fundament/images/picture_1.png</xsl:text></xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:attribute>
                                                    </xsl:element>
                                                </div>
                                            </header><!-- .entry-header -->
                                            <div class="entry-content">
                <!-- content of the page - inserted automatically - start --></div>
                <div id="main-content">
                    <div id="main-content-header">
                        <xsl:apply-templates select="tei:teiHeader"/>
                    </div>
                    <div id="main-content-body">
                        <xsl:apply-templates select="tei:text/tei:body"/>
                    </div>
                </div>
                <!-- content of the page - end -->
                                </article>
                                </main><!-- #main -->
                            </div><!-- #primary -->
                        </div><!-- .row -->
                    </div><!-- Container end -->
                        <button onclick="goToTop()" id="go-to-top-button" title="Go to top">Go to top</button> 
                </div>
                    <!-- footer and imprint -->
                    <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                        <div class="container" id="footer-full-content" tabindex="-1">
                            <div class="footer-separator">
                                <i data-feather="message-circle"></i> CONTACT
                            </div>
                            <div class="row">
                                <div class="footer-widget col-md-1 col-lg-1">
                                    <div class="textwidget custom-html-widget">
                                        <a href="https://acdh.oeaw.ac.at"><img src="../fundament/images/acdh_logo.png" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"></img></a>
                                    </div>
                                </div>
                                <!-- .footer-widget -->
                                <div class="footer-widget col-md-4 col-lg-4">
                                    <div class="textwidget custom-html-widget">
                                        <p>
                                            ACDH
                                            <br/>
                                            Austrian Centre for Digital Humanities
                                            <br/>
                                            Austrian Academy of Sciences
                                        </p>
                                        <p>
                                            Bäckerstraße 13,
                                            <br/>
                                            1010 Vienna
                                        </p>
                                        <p>
                                            T: +43 1 51581-2200
                                            <br/>
                                            E: <a href="mailto:acdh@oeaw.ac.at">acdh@oeaw.ac.at</a>
                                        </p>
                                    </div>
                                </div>
                                <div class="footer-widget col-md-3 col-lg-3">
                                    <p><a href="https://www.fwf.ac.at/"><img src="../fundament/images/fwf-logo.png" class="image" alt="FWF Logo" style="max-width: 100%; height: auto;" title="FWF Logo"></img></a></p>
                                    <p>Funded by the Austrian Science Fund (FWF) under the project number <a href="https://www.fwf.ac.at/forschungsradar/10.55776/P32988" target="_blank">P 32988</a></p>
                                    <div class="textwidget custom-html-widget">
                                        <a href="https://www.univie.ac.at"><img src="../fundament/images/logo-uni-wien.png" class="image" alt="Logo Universität Wien" style="max-width: 100%; height:auto;" title="Logo Universität Wien"></img></a>
                                    </div>
                                </div>
                                <div class="footer-widget col-md-1 col-lg-1"></div>
                                <!-- .footer-widget -->
                                <div class="footer-widget col-md-3 col-lg-3">
                                    <div class="textwidget custom-html-widget">
                                        <p>HELPDESK</p>
                                        <p>ACDH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                                        <p>
                                            <a class="helpdesk-button" href="mailto:acdh-helpdesk@oeaw.ac.at">ASK US!</a>
                                        </p>
                                    </div>
                                </div>
                                <!-- .footer-widget -->
                            </div>
                        </div>
                    </div>
                    <!-- #wrapper-footer-full -->
                    <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;">
                        <a href="../imprint.html">Impressum/Imprint</a>
                    </div>
                    <!-- footer and imprint - end -->
                </div>
                <!-- #page we need this extra closing tag here -->
                <script type="text/javascript" src="../fundament/vendor/jquery/jquery.min.js"></script>
                <script type="text/javascript" src="../fundament/js/fundament.min.js"></script>
                <script type="text/javascript" src="../fundament/js/scroll-to-top.js"></script>
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
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence/text()"/>
        </p>
        <p class="date">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:date/text()"/>
        </p>
        <p class="title">
            <xsl:value-of select="concat(tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement/text(),', ',tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository/text(),', ',tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text())"/>
        </p>
        <p class="link-to-facsimiles">
            <xsl:if test="exists(tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/@facs)">
                <xsl:text>The facsimiles of the manuscript are available: </xsl:text>
                <a target="_blank">
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/>
                </a>
            </xsl:if>
            <xsl:if test="not(exists(tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/@facs))">
                <xsl:text>Facsimiles of the manuscript are not available online.</xsl:text>
            </xsl:if>
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
        <xsl:if test="exists(tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno[@type='diktyon'])">
            <p class="link-to-facsimiles">
                <xsl:text>The diktyon identifier of the manuscript is: </xsl:text>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno[@type='diktyon']/text()"/>
            </p>
        </xsl:if>
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
        <xsl:apply-templates select="//tei:seg[@type = 'commentaryfragment' or 'glosse' or 'hexaplaric' or 'hypothesis' or 'perioche'] | //tei:pb | //tei:ab/tei:note[@type = 'textual-commentary']"/>
    </xsl:template>

    <xsl:template match="tei:note[parent::ab and (@type = 'textual-commentary')]">
        <xsl:element name="div">
            <xsl:attribute name="class" select="'commentaryfragment'"/>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:apply-templates select="child::node()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'commentaryfragment' or @type = 'hypothesis' or @type = 'perioche']">
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
                    <xsl:text>Commentary fragment: </xsl:text>
                </xsl:if>
                <xsl:if test="@type = 'hypothesis'">
                    <xsl:text>Hypothesis: </xsl:text>
                </xsl:if>
                <xsl:if test="@type = 'perioche'">
                    <xsl:text>Perioche: </xsl:text>
                </xsl:if>
                <!-- treatment of optional rendition attribute - start -->
                <xsl:if test="exists(@rendition)">
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
                    <xsl:if test="@rendition = '#middle-of-the-page'">
                        <xsl:text>middle of the page</xsl:text>
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
                    <xsl:if test="@rendition = '#psalm-column'">
                        <xsl:text>psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-of-psalm-column'">
                        <xsl:text>top of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-of-psalm-column'">
                        <xsl:text>bottom of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#right-margin-of-right-column'">
                        <xsl:text>right margin of right column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-top'">
                        <xsl:text>top / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-middle'">
                        <xsl:text>top / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-bottom'">
                        <xsl:text>top / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-top'">
                        <xsl:text>middle / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-middle'">
                        <xsl:text>middle / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-bottom'">
                        <xsl:text>middle / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-top'">
                        <xsl:text>bottom / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-middle'">
                        <xsl:text>bottom / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-bottom'">
                        <xsl:text>bottom / bottom</xsl:text>
                    </xsl:if>
                    <xsl:text> - </xsl:text>
                </xsl:if>
                <!-- treatment of optional rendition attribute - end -->
                <xsl:if test="exists(child::tei:quote[@type = 'patristic']/@subtype)">
                    <xsl:element name="i">
                        <xsl:value-of select="child::tei:quote[@type = 'patristic']/@subtype"/>
                    </xsl:element>
                    <xsl:text> - </xsl:text>
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
                <xsl:apply-templates select="preceding-sibling::tei:note[@type = 'lemma'][1]"/>
            </xsl:element>
            <xsl:if test="exists(child::tei:num)">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:text>Count: </xsl:text>
                    <xsl:apply-templates select="child::tei:num[@xml:lang = 'grc']"/>
                </xsl:element>
            </xsl:if>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:apply-templates select="child::tei:quote[@type = 'patristic']/child::node()"/>
                <xsl:if test="exists(@copyOf)">
                    <xsl:text> (</xsl:text>
                    <xsl:element name="a">
                        <xsl:choose>
                            <xsl:when test="starts-with(@copyOf,'#edition-part-two:')">
                                <xsl:attribute name="href" select="concat('../edition-part-two.html#',substring-after(@copyOf,'#edition-part-two:'))"/>
                                <xsl:attribute name="target" select="'_blank'"/>
                                <xsl:text>→ Edition</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="href" select="concat('../edition.html#',substring-after(@copyOf,'#edition:'))"/>
                                <xsl:attribute name="target" select="'_blank'"/>
                                <xsl:text>→ Edition</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </xsl:element>
            <xsl:if test="exists(child::tei:note[@type = 'attribution'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:text>Attribution: </xsl:text>
                    <xsl:apply-templates select="child::tei:note[@type = 'attribution']/child::node()"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(child::tei:note[@type = 'parallels'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:apply-templates select="child::tei:note[@type = 'parallels']/child::node()"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(child::tei:note[@type = 'textual-commentary'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:apply-templates select="child::tei:note[@type = 'textual-commentary']/child::node()"/>
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
                <!-- treatment of optional rendition attribute - start -->
                <xsl:if test="exists(@rendition)">
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
                    <xsl:if test="@rendition = '#middle-of-the-page'">
                        <xsl:text>middle of the page</xsl:text>
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
                    <xsl:if test="@rendition = '#psalm-column'">
                        <xsl:text>psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-of-psalm-column'">
                        <xsl:text>top of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-of-psalm-column'">
                        <xsl:text>bottom of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#right-margin-of-right-column'">
                        <xsl:text>right margin of right column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-top'">
                        <xsl:text>top / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-middle'">
                        <xsl:text>top / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-bottom'">
                        <xsl:text>top / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-top'">
                        <xsl:text>middle / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-middle'">
                        <xsl:text>middle / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-bottom'">
                        <xsl:text>middle / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-top'">
                        <xsl:text>bottom / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-middle'">
                        <xsl:text>bottom / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-bottom'">
                        <xsl:text>bottom / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#right-margin'">
                        <xsl:text>right margin</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#main-text'">
                        <xsl:text>main text</xsl:text>
                    </xsl:if>
                    <xsl:text> - </xsl:text>
                </xsl:if>
                <!-- treatment of optional rendition attribute - end -->
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
                <xsl:text> - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="child::tei:quote[@type = 'patristic']/@source"/>
                </xsl:element>
            </xsl:element>
            <xsl:if test="exists(preceding-sibling::tei:note[@type = 'lemma'][1])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:text>Lemma: </xsl:text>
                    <xsl:apply-templates select="preceding-sibling::tei:note[@type = 'lemma'][1]"/>
                </xsl:element>
            </xsl:if>
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
            <xsl:if test="exists(child::tei:note[@type = 'parallels'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:apply-templates select="child::tei:note[@type = 'parallels']/child::node()"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(child::tei:note[@type = 'textual-commentary'])">
                <xsl:element name="p">
                    <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                    <xsl:apply-templates select="child::tei:note[@type = 'textual-commentary']/child::node()"/>
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
                <!-- treatment of optional rendition attribute - start -->
                <xsl:if test="exists(@rendition)">
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
                    <xsl:if test="@rendition = '#middle-of-the-page'">
                        <xsl:text>middle of the page</xsl:text>
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
                    <xsl:if test="@rendition = '#psalm-column'">
                        <xsl:text>psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-of-psalm-column'">
                        <xsl:text>top of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-of-psalm-column'">
                        <xsl:text>bottom of psalm column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#right-margin-of-right-column'">
                        <xsl:text>right margin of right column</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-top'">
                        <xsl:text>top / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-middle'">
                        <xsl:text>top / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#top-bottom'">
                        <xsl:text>top / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-top'">
                        <xsl:text>middle / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-middle'">
                        <xsl:text>middle / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#middle-bottom'">
                        <xsl:text>middle / bottom</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-top'">
                        <xsl:text>bottom / top</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-middle'">
                        <xsl:text>bottom / middle</xsl:text>
                    </xsl:if>
                    <xsl:if test="@rendition = '#bottom-bottom'">
                        <xsl:text>bottom / bottom</xsl:text>
                    </xsl:if>
                    <xsl:text> - </xsl:text>
                </xsl:if>
                <!-- treatment of optional rendition attribute - end -->
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-hexaplaric-variant'"/>
                <xsl:apply-templates select="child::node()[not(self::tei:ref)]"/>
            </xsl:element>
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-hexaplaric-variant'"/>
                <xsl:text>Lemma: </xsl:text>
                <xsl:apply-templates select="preceding-sibling::tei:note[@type = 'lemma'][1]"/>
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
                <xsl:if test="starts-with(@target,'#vat-gr-754:')">
                    <xsl:value-of select="concat('vat_gr_754.html#',substring-after(@target,'#vat-gr-754:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#vat-gr-1422:')">
                    <xsl:value-of select="concat('vat_gr_1422.html#',substring-after(@target,'#vat-gr-1422:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#ambr-m-47-sup')">
                    <xsl:value-of select="concat('ambr_m_47_sup.html#',substring-after(@target,'#ambr-m-47-sup:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#ambr-b-106-sup:')">
                    <xsl:value-of select="concat('ambros_B_106_sup.html#',substring-after(@target,'#ambr-b-106-sup:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#bodl-auct-d-4-1:')">
                    <xsl:value-of select="concat('bodl_auct_d_4_1.html#',substring-after(@target,'#bodl-auct-d-4-1:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#coislin-10:')">
                    <xsl:value-of select="concat('coislin_10.html#',substring-after(@target,'#coislin-10:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#coislin-12:')">
                    <xsl:value-of select="concat('coislin_12.html#',substring-after(@target,'#coislin-12:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#franzon-3:')">
                    <xsl:value-of select="concat('franzon_3.html#',substring-after(@target,'#franzon-3:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#mosq-synod-194:')">
                    <xsl:value-of select="concat('mosq_synod_194.html#',substring-after(@target,'#mosq-synod-194:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#mosq-syn-194:')">
                    <xsl:value-of select="concat('mosq_synod_194.html#',substring-after(@target,'#mosq-syn-194:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#oxon-s-trin-78:')">
                    <xsl:value-of select="concat('oxon_s_trin_78.html#',substring-after(@target,'#oxon-s-trin-78:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#par-gr-139:')">
                    <xsl:value-of select="concat('par_gr_139.html#',substring-after(@target,'#par-gr-139:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#par-gr-164:')">
                    <xsl:value-of select="concat('par_gr_164.html#',substring-after(@target,'#par-gr-164:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#par-gr-166:')">
                    <xsl:value-of select="concat('par_gr_166.html#',substring-after(@target,'#par-gr-166:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#plut-5-30:')">
                    <xsl:value-of select="concat('plut_5_30.html#',substring-after(@target,'#plut-5-30:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#plut-6-3:')">
                    <xsl:value-of select="concat('plut_6_3.html#',substring-after(@target,'#plut-6-3:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#coislin-187:')">
                    <xsl:value-of select="concat('coislin-187.html#',substring-after(@target,'#coislin-187:'))"/>
                </xsl:if>
                <xsl:if test="starts-with(@target,'#laudon-gr-42:')">
                    <xsl:value-of select="concat('laudon_gr_42.html#',substring-after(@target,'#laudon-gr-42:'))"/>
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
            <xsl:text>) </xsl:text>
            <xsl:if test="exists(@facs)">
                <xsl:element name="a">
                    <xsl:attribute name="href" select="@facs"/>
                    <xsl:attribute name="target" select="'_blank'"/>
                    <xsl:attribute name="title" select="'Link to facsimile'"/>
                    <i class="fas fa-image" style="transform: translate(0%,10%);"/>
                </xsl:element>
            </xsl:if>
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
        <xsl:if test="@quantity = 1">
            <xsl:text>[.]</xsl:text>
        </xsl:if>
        <xsl:if test="@quantity != 1">
            <xsl:text>[... (</xsl:text>
            <xsl:value-of select="@quantity"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@unit"/>
            <xsl:text>s </xsl:text>
            <xsl:value-of select="@reason"/>
            <xsl:text>)]</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:supplied[@reason != 'om.']">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:if test="exists(@cert) and (@cert = 'low')">
            <xsl:text>(?)</xsl:text>
        </xsl:if>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:supplied[not(exists(@reason))]">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:if test="exists(@cert) and (@cert = 'low')">
            <xsl:text>(?)</xsl:text>
        </xsl:if>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:supplied[@reason = 'om.']">
        <xsl:text>〈</xsl:text>
        <xsl:apply-templates/>
        <xsl:if test="exists(@cert) and (@cert = 'low')">
            <xsl:text>(?)</xsl:text>
        </xsl:if>
        <xsl:text>〉</xsl:text>
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
        <xsl:text>(sic!) </xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text> (sic!)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <xsl:if test="exists(@resp)">
            <xsl:text>{</xsl:text>
            <xsl:value-of select="text()"/>
            <xsl:text>}</xsl:text>
        </xsl:if>
        <xsl:if test="not(exists(@resp))">
            <xsl:if test="exists(child::tei:gap)">
                <xsl:variable name="number-of-dots" select="child::tei:gap/@quantity"/>
                <xsl:text>⟦</xsl:text>
                <xsl:for-each select="1 to $number-of-dots">
                    <xsl:text>.</xsl:text>
                </xsl:for-each>
                <xsl:text>⟧</xsl:text>
            </xsl:if>
            <xsl:if test="not(exists(child::tei:gap))">
                <xsl:if test="exists(child::tei:unclear)">
                    <xsl:text>⟦</xsl:text>
                    <xsl:element name="span">
                        <xsl:attribute name="class" select="'unclear'"/>
                        <xsl:value-of select="child::tei:unclear/text()"/>
                    </xsl:element>
                    <xsl:text>⟧</xsl:text>
                </xsl:if>
                <xsl:if test="not(exists(child::tei:unclear))">
                    <xsl:text>⟦</xsl:text>
                    <xsl:value-of select="text()"/>
                    <xsl:text>⟧</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:if>
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
    
    <xsl:template match="tei:add[@type = 'correction']">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="text()"/>        
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:add[((@type != 'second-hand') and (@type != 'correction')) or not(exists(@type))]">
        <xsl:if test="@place = 'above'">
            <xsl:text>\</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>/</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'below'">
            <xsl:text>/</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>\</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'overstrike'">
            <xsl:text>《</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>》</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'left margin'">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:add[@type = 'second-hand']">
        <xsl:if test="@place = 'above'">
            <xsl:text>\</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>/</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'below'">
            <xsl:text>/</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>\</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'overstrike'">
            <xsl:text>《</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>》</xsl:text>
        </xsl:if>
        <xsl:if test="@place = 'left margin'">
            <xsl:apply-templates/>
        </xsl:if>
        <xsl:text>(</xsl:text>
            <xsl:value-of select="@hand"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
      
    <xsl:template match="tei:subst">
        <xsl:variable name="text-before">
            <xsl:if test="contains(preceding-sibling::text()[1],' ')">
                <xsl:value-of select="tokenize(normalize-space(preceding-sibling::text()[1]),' ')[last()]"/>
            </xsl:if>
            <xsl:if test="not(contains(preceding-sibling::text()[1],' '))">
                <xsl:value-of select="preceding-sibling::text()[1]"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="tei:add/text()"/>
        <xsl:text> [* </xsl:text>
            <xsl:value-of select="concat($text-before,tei:del/text())"/>
        <xsl:text> </xsl:text>
        <xsl:if test="exists(tei:add/@hand)">
            <xsl:value-of select="tei:add/@hand"/>
        </xsl:if>
        <xsl:if test="not(exists(tei:add/@hand))">
            <xsl:text>S </xsl:text>
        </xsl:if>
        <xsl:value-of select="concat($text-before,tei:add/text())"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:foreign">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:num[@xml:lang = 'grc']">
        <xsl:value-of select="text()"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote[parent::tei:note[(@type = 'lemma') or (@type = 'textual-commentary')]]">
        <xsl:element name="i">
            <xsl:choose>
               <xsl:when test="exists(@source)">
                    <xsl:value-of select="@source"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="child::node()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
      
</xsl:stylesheet>