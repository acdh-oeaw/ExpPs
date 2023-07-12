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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" type="text/css"/>
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
                        <button type="button" id="sidebarCollapse" class="btn btn-light">
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
                                <li class="nav-item"><a title="Edition" href="edition_ps_1-10.html" class="nav-link">Edition</a></li>
                                <li class="nav-item dropdown">
                                    <a title="Manuscripts" href="manuscripts.html" data-toggle="dropdown" class="nav-link dropdown-toggle">Manuscripts <span class="caret"></span></a>
                                    <ul class=" dropdown-menu" role="menu">
                                        <li class="nav-item dropdown-submenu">
                                            <a title="Ambr. B. 106 sup." href="./manuscripts/ambros_B_106_sup.html" class="nav-link">Ambr. B. 106 sup.</a>
                                            <a title="Ambr. M. 47 sup." href="./manuscripts/ambr_m_47_sup.html" class="nav-link">Ambr. M. 47 sup.</a>
                                            <a title="Bodl. Auct. D. 4.1" href="./manuscripts/bodl_auct_d_4_1.html" class="nav-link">Bodl. Auct. D. 4.1</a>
                                            <a title="Coislin 10" href="./manuscripts/coislin_10.html" class="nav-link">Coislin 10</a>
                                            <a title="Coislin 12" href="./manuscripts/coislin_12.html" class="nav-link">Coislin 12</a>
                                            <a title="Genua Urbani 3" href="./manuscripts/franzon_3.html" class="nav-link">Genua Urbani 3</a>
                                            <a title="Mosq. Sinod. gr. 194" href="./manuscripts/mosq_synod_194.html" class="nav-link">Mosq. Sinod. gr. 194</a>
                                            <a title="Oxon. S. Trin. 78" href="./manuscripts/oxon_s_trin_78.html" class="nav-link">Oxon. S. Trin. 78</a>
                                            <a title="Par. gr. 139" href="./manuscripts/par_gr_139.html" class="nav-link">Par. gr. 139</a>
                                            <a title="Par. gr. 164" href="./manuscripts/par_gr_164.html" class="nav-link">Par. gr. 164</a>
                                            <a title="Par. gr. 166" href="./manuscripts/par_gr_166.html" class="nav-link">Par. gr. 166</a>
                                            <a title="Plut. 5. 30" href="./manuscripts/plut_5_30.html" class="nav-link">Plut. 5. 30</a>
                                            <a title="Plut. 6. 3" href="./manuscripts/plut_6_3.html" class="nav-link">Plut. 6. 3</a>
                                            <a title="Vat. gr. 754" href="./manuscripts/vat_gr_754.html" class="nav-link">Vat. gr. 754</a>
                                            <a title="Vat. gr. 1422" href="./manuscripts/vat_gr_1422.html" class="nav-link">Vat. gr. 1422</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a title="Search" href="search.html" class="nav-link">Search</a></li>
                                <li class="nav-item"><a title="New-Findings" href="new_findings.html" class="nav-link">New Findings</a></li>
                                <li class="nav-item dropdown">
                                    <a title="About" href="about.html" data-toggle="dropdown" class="nav-link dropdown-toggle">About <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="nav-item dropdown-submenu">
                                            <a title="About Transcriptions" href="./about-transcription.html" class="nav-link">About the Transcriptions</a>
                                            <a title="About Links" href="./about-links.html" class="nav-link">Links to TEI-Sources</a>
                                            <a title="Technical Documentation" href="./encoding.html" class="nav-link">Technical Documentation</a>
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
                                        <div class="entry-top-thumbnail"><img src="./fundament/images/picture_5.png" alt="Manuscript"/></div>
                                    </header><!-- .entry-header -->
                                    <div class="entry-content" id="div-around-navigation-and-content">
                                        <!-- sidebar navigation start -->
                                        <nav id="sidebar" class="active">
                                            <div class="sidebar-header">
                                                <h3 class="navigation-sidebar-header">Navigation</h3>
                                            </div>
                                            <ul class="list-unstyled components">
                                                <xsl:for-each select="child::tei:div[@type = 'psalm']">
                                                    <li>
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href" select="concat('#psalm-',@n)"/>
                                                            <xsl:attribute name="data-toggle" select="'collapse'"/>
                                                            <xsl:attribute name="aria-expanded" select="'false'"/>
                                                            <xsl:attribute name="class" select="'dropdown-toggle navigation-list-first-level'"/>
                                                            <xsl:value-of select="concat('Psalm ',@n)"/>
                                                        </xsl:element>
                                                        <xsl:element name="ul">
                                                            <xsl:attribute name="class" select="'collapse list-unstyled'"/>
                                                            <xsl:attribute name="id" select="concat('psalm-',@n)"/>
                                                            <xsl:for-each select="./child::tei:div[@type = 'psalmverse']/child::tei:div[@type = 'text']/tei:div[@type = 'commentary']/tei:p">
                                                                <li>
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href" select="concat('#',@xml:id)"/>
                                                                        <xsl:attribute name="class" select="'navigation-list-second-level'"/>
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
                <p class="date">2023-06-14</p>
                <p class="date">In Bearbeitung.</p>
            </div>
            <div id="main-content-body">
                <div class="header-centered">Text, Übersetzung, Kommentar</div>
                <div class="list-of-witnesses">
                    <p>Liste der Textzeugen:</p>
                    <xsl:apply-templates select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listWit"/>
                </div>
                <xsl:apply-templates select="child::node()"/>
            </div>
            <div id="div-around-witnesses" class="fixed-bottom">
                <div class="for-witness-hidden" id="window-for-witnesses-1">
                    <p id="paragraph-for-witness-1-header">Header 1</p>
                    <p id="paragraph-for-witness-1">Text 1</p>
                    <button type="button" class="btn btn-light" id="close-button-1">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-2">
                    <p id="paragraph-for-witness-2-header">Header 2</p>
                    <p id="paragraph-for-witness-2">Text 2</p>
                    <button type="button" class="btn btn-light" id="close-button-2">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-3">
                    <p id="paragraph-for-witness-3-header">Header 3</p>
                    <p id="paragraph-for-witness-3">Text 3</p>
                    <button type="button" class="btn btn-light" id="close-button-3">Close</button>
                </div>
                <div class="for-witness-hidden" id="window-for-witnesses-4">
                    <p id="paragraph-for-witness-4-header">Header 4</p>
                    <p id="paragraph-for-witness-4">Text 4</p>
                    <button type="button" class="btn btn-light" id="close-button-4">Close</button>
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
            </div>
            
            <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                <div class="container" id="footer-full-content" tabindex="-1">
                    <div class="footer-separator">
                        <i data-feather="message-circle"></i> CONTACT
                    </div>
                    <div class="row">
                        <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                            <div class="textwidget custom-html-widget">
                                <a href="/"><img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"/></a>
                            </div>
                        </div>
                        <!-- .footer-widget -->
                        <div class="footer-widget col-lg-4 col-md-4 col-sm-6 col-9">
                            <div class="textwidget custom-html-widget">
                                <p>
                                    ACDH-CH
                                    <br/>
                                        Austrian Centre for Digital Humanities <br/> and Cultural Heritage
                                        <br/>
                                            Austrian Academy of Sciences
                                </p>
                                <p>
                                    Sonnenfelsgasse 19,
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
                        <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                            <div class="textwidget custom-html-widget">
                                <a href="https://www.fwf.ac.at/"><img src="./fundament/images/fwf-logo.png" class="image" alt="FWF Logo" style="max-width: 250%; height: auto;" title="FWF Logo"/></a>
                            </div>
                        </div>
                        <!-- .footer-widget -->
                        <div class="footer-widget col-lg-3 col-md-4 col-sm-4 ml-auto">
                            <div class="textwidget custom-html-widget">
                                <h6>HELPDESK</h6>
                                <p>ACDH-CH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
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
                © Copyright OEAW | <a href="https://www.oeaw.ac.at/die-oeaw/impressum/">Impressum/Imprint</a>
            </div>
        </div>
        <!-- #page we need this extra closing tag here -->
        <script type="text/javascript" src="./fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="./fundament/js/fundament.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script type="text/javascript" src="./fundament/js/edition.js"></script>
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
    
<xsl:template match="tei:div[@type = 'links']">
    <div class="body-links">
        <xsl:apply-templates select="child::tei:p/child::tei:listRef/child::tei:ref"/>
    </div>
</xsl:template>
    
<xsl:template match="tei:ref">
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
    </a>
    <xsl:text> </xsl:text>
</xsl:template>
    
<xsl:template match="tei:div[@type = 'commentary' and @rend = 'hide']"/>

<xsl:template match="tei:div[@type = 'textcritic' and not(exists(@rend))]">
    <div class="body-textcritic">
        <xsl:apply-templates select="tei:app[@type = 'fragment']"/>
        <!-- <xsl:apply-templates select="preceding-sibling::tei:div[@type = 'commentary'][1]/child::tei:div[@type = 'links']"/> -->
        <xsl:for-each select="tei:app[@type = 'text']">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()"><xsl:text> || </xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="tei:note[@type = 'textual-commentary']"/>
        <xsl:if test="not(exists(child::tei:note[@type = 'textual-commentary']))">
            <p style="font-family: monospace; margin-top: 10pt;">
                <xsl:text>urn:cts:etf:psath.expps.grc:</xsl:text>
                <xsl:value-of select="./preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n"/>
            </p>
        </xsl:if>
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
    <xsl:apply-templates select="parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/child::tei:div[@type = 'links']"/>
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
        <xsl:value-of select="./parent::tei:div[@type = 'textcritic']/preceding-sibling::tei:div[@type = 'commentary'][1]/tei:p/@n"/>
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

</xsl:stylesheet>