<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:tei="http://www.tei-c.org/ns/1.0"
exclude-result-prefixes="xs tei"
version="2.0">

<xsl:output encoding="UTF-8" method="html" indent="no"/>

<xsl:template match="/">
    <html lang="de">
        <xsl:apply-templates select="child::node()"/>
    </html>
</xsl:template>

<xsl:template match="tei:TEI">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:teiHeader">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-title" content="Expositiones in Psalmos - Edition"/>
        <link rel="profile" href="http://gmpg.org/xfn/11"/>
        <title>
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title/text()"/>
        </title>
        <link rel="stylesheet" id="fundament-styles"  href="./fundament/css/fundament.min.css" type="text/css"/>
        <link rel="stylesheet" href="./fundament/css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" type="text/css"></link>
        <link rel="icon" type="image/png" href="./favicon.png"/>
    </head>
</xsl:template>

<xsl:template match="tei:text">
<xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:body">
    <body class="home">
        <div class="hfeed site" id="page">
            <!-- ******************* The Navbar Area ******************* -->
            <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="itemscope" itemtype="http://schema.org/WebSite">
                <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- button for toggling sidebar - start -->
                    <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-fluid"> -->
                        <button type="button" id="sidebarCollapse" class="btn btn-light" title="Button for toggling sidebar">
                            <i class="fas fa-align-left"></i>
                        </button>
                    <!--    </div>
                    </nav> -->
                    <!-- button for toggling sidebar - end -->
                    <div class="container" >
                        <!-- Your site title as branding in the menu -->
                        <a href="index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="./fundament/images/exp_ps_logo.png" class="img-fluid logo-round" alt="Expositiones in Psalmos Logo" itemprop="logo" /></a><!-- end custom logo -->
                        <a class="navbar-brand site-title-with-logo" rel="home" href="index.html" title="Expositiones in Psalmos" itemprop="url">Expositiones in Psalmos</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <!-- Your menu goes here -->
                            <ul id="main-menu" class="navbar-nav">
                                <li class="nav-item active"><a title="Home" href="index.html" class="nav-link">Home</a></li>
                                <li class="nav-item dropdown">
											<a title="Edition" href="edition.html" data-toggle="dropdown" class="nav-link dropdown-toggle">Edition <span class="caret"></span></a>
											<ul class="dropdown-menu" role="menu">
												<li class="nav-item dropdown-submenu">
													<a title="Edition - First Part" href="./edition.html" class="nav-link">Edition: Ps 1-25</a>
													<a title="Edition - Second Part" href="./edition-part-two.html" class="nav-link">Edition: Ps 26-50</a>
												</li>
											</ul>
										</li>
                                <li class="nav-item"><a title="Manuscripts" href="manuscripts.html" class="nav-link">Manuscripts</a></li>
                                <li class="nav-item"><a title="Search" href="search.html" class="nav-link">Search</a></li>
                                <li class="nav-item"><a title="New-Findings" href="new_findings.html" class="nav-link">New Findings</a></li>
                                <li class="nav-item dropdown">
                                    <a title="About" href="about.html" data-toggle="dropdown" class="nav-link dropdown-toggle">About <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="nav-item dropdown-submenu">
                                            <a title="About Transcriptions" href="./about-transcription.html" class="nav-link">About the Transcriptions</a>
                                            <a title="About Links" href="./about-links.html" class="nav-link">Links to TEI-Sources</a>
                                            <a title="Technical Documentation" href="./encoding.html" class="nav-link">Technical Documentation</a>
                                            <a title="Access" href="access.html" class="nav-link">Access</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a title="News" href="news.html" class="nav-link">News</a></li>
                                <li class="nav-item"><a title="Team" href="team.html" class="nav-link">Team</a></li>
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
                <div class="container-fluid" id="content" tabindex="-1">
                    <div class="row">
                        <div class="col-md-12 content-area" id="primary">
                            <main class="site-main" id="main">
                                <article>
                                    <header class="entry-header">
                                        <div class="entry-top-thumbnail"><img src="./fundament/images/picture_5.png" alt="Picture of manuscript" title="Picture of manuscript"/></div>
                                    </header><!-- .entry-header -->
                                    <div class="entry-content" id="div-around-navigation-and-content">
                                        <!-- sidebar navigation start -->
                                        <nav id="sidebar" class="active">
                                            <div class="sidebar-header">
                                                <p class="navigation-sidebar-header">Navigation</p>
                                            </div>
                                            <ul class="list-unstyled components" title="navigation">
                                                <xsl:for-each select="child::tei:div[@type = 'psalm']">
                                                    <li>
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href" select="concat('#psalm-',@n)"/>
                                                            <xsl:attribute name="data-toggle" select="'collapse'"/>
                                                            <xsl:attribute name="aria-expanded" select="'false'"/>
                                                            <xsl:attribute name="class" select="'dropdown-toggle navigation-list-first-level'"/>
                                                            <xsl:attribute name="title" select="concat('Psalm ',@n)"/>
                                                            <xsl:value-of select="concat('Psalm ',@n)"/>
                                                        </xsl:element>
                                                        <xsl:element name="ul">
                                                            <xsl:attribute name="class" select="'collapse list-unstyled'"/>
                                                            <xsl:attribute name="id" select="concat('psalm-',@n)"/>
                                                            <xsl:for-each select="./child::tei:div[@type = 'psalmverse']/child::tei:div[@type = 'text']/tei:div[(@type = 'commentary') and (not(exists(@rend)) or (@rend != 'hide'))]/tei:p">
                                                                <li>
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href" select="concat('#',@xml:id)"/>
                                                                        <xsl:attribute name="class" select="'navigation-list-second-level'"/>
                                                                        <xsl:attribute name="title" select="concat('Exposition ',@n)"/>
                                                                        <xsl:value-of select="concat('Expositio ',@n)"/>
                                                                    </xsl:element>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:element>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </nav>
                                        <!-- sidebar navigation end -->
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
                <p class="date">2025-10-02</p>
                <p class="date">In Bearbeitung.</p>
            </div>
            <div id="main-content-body">
                <div class="header-centered">Text, Übersetzung, Kommentar</div>
                <div class="list-of-witnesses">
                    <p>Liste der Textzeugen:</p>
                    <xsl:apply-templates select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listWit"/>
                </div>
                <xsl:apply-templates select="child::node()"/>
                <div class="around-biblical-index">
                    <xsl:apply-templates select="//tei:anchor[@type = 'biblical-quotation']" mode="biblical-index"/>
                </div>
            </div>
            <div id="div-around-witnesses" class="fixed-bottom">
                <div class="for-witness-hidden" id="window-for-witnesses-1">
                    <p id="paragraph-for-witness-1-header">Header 1</p>
                    <p id="paragraph-for-witness-1">Text 1</p>
                    <button type="button" class="btn btn-light" id="close-button-1" title="Close">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-2">
                    <p id="paragraph-for-witness-2-header">Header 2</p>
                    <p id="paragraph-for-witness-2">Text 2</p>
                    <button type="button" class="btn btn-light" id="close-button-2" title="Close">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-3">
                    <p id="paragraph-for-witness-3-header">Header 3</p>
                    <p id="paragraph-for-witness-3">Text 3</p>
                    <button type="button" class="btn btn-light" id="close-button-3" title="Close">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-4">
                    <p id="paragraph-for-witness-4-header">Header 4</p>
                    <p id="paragraph-for-witness-4">Text 4</p>
                    <button type="button" class="btn btn-light" id="close-button-4" title="Close">Close</button>
                </div>
                <div class="for-links-of-witnesses-hidden" id="window-for-links-of-witnesses"/>
            </div>
        </div>
                                        
                                    </div>
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
                                <a href="https://acdh.oeaw.ac.at"><img src="./fundament/images/acdh_logo.png" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"></img></a>
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
                            <p><a href="https://www.fwf.ac.at/"><img src="./fundament/images/fwf-logo.png" class="image" alt="FWF Logo" style="max-width: 100%; height: auto;" title="FWF Logo"></img></a></p>
                            <p>Funded by the Austrian Science Fund (FWF) under the project number P 32988</p>
                            <div class="textwidget custom-html-widget">
                                <a href="https://www.univie.ac.at"><img src="./fundament/images/logo-uni-wien.png" class="image" alt="Logo Universität Wien" style="max-width: 100%; height:auto;" title="Logo Universität Wien"></img></a>
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
                © Copyright OEAW | <a href="./imprint.html">Impressum/Imprint</a>
            </div>
            <!-- footer and imprint - end -->
        </div>
        <!-- #page we need this extra closing tag here -->
        <script type="text/javascript" src="./fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="./fundament/js/fundament.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/js/all.min.js" integrity="sha512-LW9+kKj/cBGHqnI4ok24dUWNR/e8sUD8RLzak1mNw5Ja2JYCmTXJTF5VpgFSw+VoBfpMvPScCo2DnKTIUjrzYw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="./fundament/js/edition.js"></script>
        <script type="text/javascript" src="./fundament/js/scroll-to-top.js"></script>
    </body>
</xsl:template>

<xsl:template match="tei:listWit">
    <table style="table-layout: fixed;">
        <thead>
            <tr>
                <th style="padding-top: 5pt; padding-bottom: 5pt; width: 10em;" scope="col">Abkürzung</th>
                <th style="padding-top: 5pt; padding-bottom: 5pt; width: 40em;" scope="col">Handschrift</th>
            </tr>
        </thead>
        <tbody>
            <xsl:apply-templates select="tei:witness"/>
        </tbody>
    </table>
</xsl:template>

<xsl:template match="tei:witness">
    <tr>
        <td><i><xsl:value-of select="@xml:id"/></i></td>
        <td><xsl:value-of select="./text()"/></td>
    </tr>
</xsl:template>

<xsl:template match="tei:div[@type = 'psalm']">
    <div class="manuscript-content">
        <div class="quotation">
            <xsl:element name="a">
                <xsl:attribute name="id" select="concat('psalm-',@n)"/>
            </xsl:element>
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
    <xsl:apply-templates select="tei:div[@type = 'psalmtext'] | tei:div[@type = 'commentary'] | tei:div[@type = 'textcritic']"/>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'psalmtext']">
    <div class="body-psalmtext">
        <xsl:apply-templates select="child::node()"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'commentary' and not(exists(@rend))]">
    <div class="body-commentary">
        <xsl:apply-templates select="tei:p"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'links']" mode="list-of-links">
    <div class="body-links">
        <xsl:apply-templates select="child::tei:p/child::tei:listRef/child::tei:ref" mode="list-of-references"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'links-oriental-tradition']" mode="list-of-oriental-links">
    <div class="body-links">
        <xsl:apply-templates select="child::tei:p/child::tei:listRef/child::tei:ref" mode="list-of-oriental-references"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:ref" mode="list-of-oriental-references">
    <xsl:text>→ </xsl:text>
    <a>
        <xsl:attribute name="target" select="'tab-for-syriac-longer-version'"/>
        <xsl:attribute name="href">
            <xsl:if test="starts-with(./@target,'#coptic-version:')">
                <xsl:text>./manuscripts/coptic-version.html#</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#coptic-version:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#syriac-longer-version:')">
                <xsl:text>./manuscripts/syriac-longer-version.html#</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#syriac-longer-version:')"/>
            </xsl:if>
        </xsl:attribute>
        <xsl:if test="starts-with(./@target,'#coptic-version:')">
            <xsl:text>Coptic version</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#syriac-longer-version:')">
            <xsl:text>Syriac longer version</xsl:text>
        </xsl:if>
    </a>
    <xsl:if test="exists(following-sibling::tei:ref)">
        <xsl:text> </xsl:text>
    </xsl:if>
</xsl:template>
    
<xsl:template match="tei:ref" mode="list-of-references">
    <xsl:text>→ </xsl:text>
    <a class="link-to-witness">
        <xsl:attribute name="href">
            <xsl:if test="starts-with(./@target,'#vat-gr-754')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/vat-gr-754/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#vat-gr-754:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#ambr-b-106-sup')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/ambr-b-106-sup/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#ambr-b-106-sup:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#ambr-m-47-sup')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/ambr-m-47-sup/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#ambr-m-47-sup:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#athen-b-n-8')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/athen-b-n-8/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#athen-b-n-8:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#bodl-auct-d-4-1')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/bodl-auct-d-4-1/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#bodl-auct-d-4-1:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#coislin-10')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/coislin-10/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#coislin-10:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#coislin-12')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/coislin-12/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#coislin-12:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#coislin-187')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/coislin-187/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#coislin-187:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#franzon-3')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/franzon-3/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#franzon-3:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#mosq-syn-194')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/mosq-syn-194/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#mosq-syn-194:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#oxon-s-trin-78')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/oxon-s-trin-78/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#oxon-s-trin-78:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#par-gr-139')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/par-gr-139/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#par-gr-139:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#par-gr-164')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/par-gr-164/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#par-gr-164:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#par-gr-166')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/par-gr-166/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#par-gr-166:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#plut-5-30')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/plut-5-30/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#plut-5-30:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#plut-6-3')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/plut-6-3/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#plut-6-3:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#vat-gr-1422')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/vat-gr-1422/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#vat-gr-1422:')"/>
            </xsl:if>
            <xsl:if test="starts-with(./@target,'#laudon-gr-42')">
                <xsl:text>https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts/laudon-gr-42/commentaryfragments/</xsl:text>
                <xsl:value-of select="substring-after(./@target,'#laudon-gr-42:')"/>
            </xsl:if>
        </xsl:attribute>
        <xsl:if test="starts-with(./@target,'#vat-gr-754')">
            <xsl:text>V1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#ambr-b-106-sup')">
            <xsl:text>A2</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#ambr-m-47-sup')">
            <xsl:text>A1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#athen-b-n-8')">
            <xsl:text>N1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#bodl-auct-d-4-1')">
            <xsl:text>B1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#coislin-10')">
            <xsl:text>C</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#coislin-12')">
            <xsl:text>P5</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#coislin-187')">
            <xsl:text>P2</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#franzon-3')">
            <xsl:text>G</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#mosq-syn-194')">
            <xsl:text>M</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#oxon-s-trin-78')">
            <xsl:text>B2</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#par-gr-139')">
            <xsl:text>P6</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#par-gr-164')">
            <xsl:text>P3</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#par-gr-166')">
            <xsl:text>P1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#plut-5-30')">
            <xsl:text>L1</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#plut-6-3')">
            <xsl:text>L2</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#vat-gr-1422')">
            <xsl:text>V5</xsl:text>
        </xsl:if>
        <xsl:if test="starts-with(./@target,'#laudon-gr-42')">
            <xsl:text>B3</xsl:text>
        </xsl:if>
    </a>
    <xsl:text> </xsl:text>
</xsl:template>
    
<xsl:template match="tei:div[(@type = 'commentary') and (@rend = 'hide')]"/>

<xsl:template match="tei:div[(@type = 'textcritic') and not(exists(@rend))]">
    <div class="body-textcritic">
        <xsl:apply-templates select="tei:app[@type = 'fragment']"/>
        <!-- <xsl:apply-templates select="preceding-sibling::tei:div[@type = 'commentary'][1]/child::tei:div[@type = 'links']"/> -->
        <xsl:for-each select="tei:app[@type = 'text']">
            <xsl:element name="span">
                <xsl:attribute name="class" select="'apparatus-entry'"/>
                <xsl:attribute name="id" select="generate-id(.)"/>
                <xsl:variable name="reference" select="substring-after(@corresp,'#')"/>
                <xsl:apply-templates select=".">
                    <xsl:with-param name="reference" select="$reference"/>
                </xsl:apply-templates>
            </xsl:element>
            <xsl:if test="position() != last()"><xsl:text> || </xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="tei:note[@type = 'textual-commentary']"/>
        <xsl:if test="not(exists(child::tei:note[@type = 'textual-commentary']))">
            <p style="font-family: monospace; margin-top: 10pt;">
                <xsl:text>urn:cts:etf:psath.expps.grc:</xsl:text>
                <xsl:choose>
                    <xsl:when test="./preceding-sibling::tei:div[@type = 'commentary'][1]/@rend = 'hide'">
                        <xsl:value-of select="concat(./preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n,'par')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="./preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n"/>
                    </xsl:otherwise>
                </xsl:choose>
            </p>
        </xsl:if>
    </div>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'textcritic' and @rend = 'hide']"/>
    
    <xsl:template match="tei:div[@type = 'textcritic']" mode="apparatus-of-parallel-entry">
        <div class="body-textcritic">
            <xsl:apply-templates select="tei:app[@type = 'fragment']"/>
            <xsl:for-each select="tei:app[@type = 'text']">
                <xsl:element name="span">
                    <xsl:attribute name="class" select="'apparatus-entry'"/>
                    <xsl:attribute name="id" select="generate-id(.)"/>
                    <xsl:variable name="reference" select="substring-after(@corresp,'#')"/>
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="reference" select="$reference"/>
                    </xsl:apply-templates>
                </xsl:element>
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
            <xsl:element name="a">
                <xsl:attribute name="id" select="@xml:id"/>
            </xsl:element>
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
                <xsl:apply-templates select="text() | tei:span[@type = 'text-critical'] | tei:anchor[@type = 'biblical-quotation']"/>
            </div>
            <div class="col-md-5 large-greek-text">
                <xsl:element name="a">
                    <xsl:attribute name="id" select="parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/@xml:id"/>
                </xsl:element>
                <xsl:apply-templates select="parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/text()
                    | parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/tei:span[@type = 'text-critical']
                    | parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p[@xml:id = substring-after(current()/@next,'#')]/tei:anchor[@type = 'biblical-quotation']"/>
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
                <xsl:apply-templates select="text() | tei:span[@type = 'text-critical'] | tei:anchor[@type = 'biblical-quotation']"/>
            </div>
            <div class="col-md-5 large-latin-text">
                <xsl:apply-templates select="parent::tei:div/parent::tei:div/parent::tei:div/tei:div[@type = 'translation']/tei:p[current()/@xml:id = substring-after(@corresp,'#')]"/>
            </div>
        </xsl:if>
    </div>
</xsl:template>
    
<xsl:template match="tei:span[(@type = 'text-critical') and parent::tei:p]">
    <xsl:variable name="current-node" select="."/>
    <xsl:element name="span">
        <xsl:attribute name="id" select="@xml:id"/>
        <xsl:attribute name="class" select="'textcritical'"/>
        <xsl:attribute name="data-id" select="generate-id(//tei:app[@type = 'text'][@corresp = concat('#',$current-node/@xml:id)])"/>
        <xsl:apply-templates select="text() | tei:span | tei:anchor"/>
    </xsl:element>
</xsl:template>
    
<xsl:template match="tei:span[(@type = 'text-critical') and parent::tei:span and not(parent::tei:span[parent::tei:span])]">
    <xsl:variable name="current-node" select="."/>
    <xsl:element name="span">
        <xsl:attribute name="id" select="@xml:id"/>
        <xsl:attribute name="class" select="'textcritical-embedded'"/>
        <xsl:attribute name="data-id" select="generate-id(//tei:app[@type = 'text'][@corresp = concat('#',$current-node/@xml:id)])"/>
        <xsl:apply-templates select="text() | tei:span | tei:anchor"/>
    </xsl:element>
</xsl:template>
    
<xsl:template match="tei:span[(@type = 'text-critical') and parent::tei:span and parent::tei:span[parent::tei:span] and not(parent::tei:span[parent::tei:span[parent::tei:span]])]">
    <xsl:variable name="current-node" select="."/>
    <xsl:element name="span">
        <xsl:attribute name="id" select="@xml:id"/>
        <xsl:attribute name="class" select="'textcritical-embedded-embedded'"/>
        <xsl:attribute name="data-id" select="generate-id(//tei:app[@type = 'text'][@corresp = concat('#',$current-node/@xml:id)])"/>
        <xsl:apply-templates select="text() | tei:span | tei:anchor"/>
    </xsl:element>
</xsl:template>
    
<xsl:template match="tei:span[(@type = 'text-critical') and parent::tei:span and parent::tei:span[parent::tei:span] and parent::tei:span[parent::tei:span[parent::tei:span]]]">
    <xsl:apply-templates select="text() | tei:anchor"/>
</xsl:template>
    
<xsl:template match="tei:anchor[@type = 'biblical-quotation']">
    <xsl:variable name="quotation">
        <xsl:if test="@subtype = 'indirect-quotation'">
            <xsl:value-of select="concat('cf. ',@n)"/>
        </xsl:if>
        <xsl:if test="@subtype = 'direct-quotation'">
            <xsl:value-of select="@n"/>
        </xsl:if>
    </xsl:variable>
        <xsl:element name="i">
            <xsl:attribute name="class" select="'fas fa-book'"/>
            <xsl:attribute name="style" select="'transform: translate(20%,10%); font-size: 12pt;'"/>
            <xsl:attribute name="title" select="$quotation"/>
        </xsl:element>
    <!-- <xsl:element name="a">
        <xsl:attribute name="id" select="generate-id(.)"/>
    </xsl:element> -->
</xsl:template>

<xsl:template match="tei:p[parent::tei:div[@xml:lang = 'de']]">
    <xsl:apply-templates select="child::node()"/>
</xsl:template>

<xsl:template match="tei:app[@type = 'fragment']">
    <p>
        <xsl:text>– </xsl:text>
        <xsl:for-each select="tokenize(tei:rdg/@wit,' ')">
            <i>
                <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|B3|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
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
    <xsl:apply-templates select="parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/child::tei:div[@type = 'links']" mode="list-of-links"/>
    <xsl:apply-templates select="parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/child::tei:div[@type = 'links-oriental-tradition']" mode="list-of-oriental-links"/>
</xsl:template>

<xsl:template match="tei:app[@type = 'text']">
    <xsl:param name="reference"/>
    <xsl:element name="span">
        <xsl:attribute name="class" select="'apparatus-entry-lemma'"/>
        <xsl:attribute name="data-id" select="$reference"/>
        <xsl:apply-templates select="tei:lem"/>
    </xsl:element>
    <xsl:if test="exists(tei:lem/@wit)">
        <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="tokenize(tei:lem/@wit,' ')">
        <i>
            <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|B3|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
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
                <xsl:analyze-string select="substring-after(.,'#')" regex="(V1|C|P1|G|O|M|B1|P2|B2|B3|N1|P3|A1|P4|P5|P6|P7|P8|L1|Z|V2|V3|V4|V5|A2|A3|N2|L2)(.*)">
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
            <xsl:apply-templates select="./tei:note[@type = 'in-readings']"/>
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
    <p style="font-family: monospace;">
        <xsl:text>urn:cts:etf:psath.expps.grc:</xsl:text>
        <xsl:choose>
            <xsl:when test="./parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/@rend = 'hide'">
                <xsl:value-of select="concat(./parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n,'par')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="./parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n"/>
            </xsl:otherwise>
        </xsl:choose>
    </p>
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
    
<xsl:template match="tei:anchor[@type = 'biblical-quotation']" mode="biblical-index">
    <xsl:element name="p">
        <xsl:attribute name="class" select="'around-link-biblical-quotation'"/>
        <xsl:element name="a">
            <xsl:attribute name="href" select="concat('#',parent::tei:p/@xml:id)"/>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:element>
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