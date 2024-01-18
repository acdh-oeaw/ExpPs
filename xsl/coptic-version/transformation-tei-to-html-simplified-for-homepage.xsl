<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" version="5"/>
    
    <xsl:template match="tei:TEI">
        <html>
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
                                        <li class="nav-item"><a title="Edition" href="../edition.html" class="nav-link">Edition</a></li>
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
                                                        <xsl:attribute name="src" select="'../fundament/images/picture_13.png'"/>
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
                                <!-- .footer-widget -->
                                <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                                    <div class="textwidget custom-html-widget">
                                        <a href="https://www.fwf.ac.at/"><img src="../fundament/images/fwf-logo.png" class="image" alt="FWF Logo" style="max-width: 250%; height: auto;" title="FWF Logo"/></a>
                                    </div>
                                </div>
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
                <script type="text/javascript" src="../fundament/vendor/jquery/jquery.min.js"></script>
                <script type="text/javascript" src="../fundament/js/fundament.min.js"></script>
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
        <xsl:for-each select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier">
            <p class="title">
                <xsl:value-of select="concat(./tei:settlement/text(),', ',./tei:repository/text(),', ',./tei:idno/text())"/>
            </p>
            <p class="link-to-facsimiles">
                <xsl:if test="exists(./tei:idno/@facs)">
                    <xsl:text>The facsimiles of the manuscript are available: </xsl:text>
                    <a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="./tei:idno/@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="./tei:idno"/>
                    </a>
                </xsl:if>
                <xsl:if test="not(exists(./tei:idno/@facs))">
                    <xsl:text>Facsimiles of the manuscript are not available online.</xsl:text>
                </xsl:if>
            </p>
            <xsl:if test="exists(./tei:altIdentifier/tei:idno[@type='diktyon'])">
                <p class="link-to-facsimiles">
                    <xsl:text>The diktyon identifier of the manuscript is: </xsl:text>
                    <xsl:value-of select="./tei:altIdentifier/tei:idno[@type='diktyon']/text()"/>
                </p>
            </xsl:if>
        </xsl:for-each>
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
    
    <xsl:template match="tei:editorialDecl">
        <p class="editorial-declaration-punctuation">
            <xsl:value-of select="tei:punctuation/tei:p"/>
        </p>
        <div class="editorial-declaration-normalization">
            <p class="editorial-declaration-normalization-paragraph">
                <xsl:value-of select="tei:normalization/tei:p/text()"/>
            </p>
        </div>
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
    
    <xsl:template match="tei:body">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'manuscript']">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'heading-manuscript-name'"/>
            <xsl:value-of select="@n"/>
        </xsl:element>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:div[(@type = 'page-of-manuscript') and ancestor::tei:div[@type = 'transcription']]">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:p[parent::tei:div[@type = 'page-of-manuscript'] and ancestor::tei:div[@type = 'transcription']]">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'paragraph-of-coptic-text'"/>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'fragment']">
        <xsl:element name="a">
            <xsl:attribute name="id" select="@xml:id"/>
        </xsl:element>
        <xsl:apply-templates select="child::node()"/>
        <xsl:if test="exists(@n)">
            <span class="number-of-expositio">
                <xsl:text> (Expositio </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:if test="exists(@prev)">
                    <xsl:text> [cont.]</xsl:text>
                </xsl:if>
                <xsl:if test="exists(@copyOf)">
                    <xsl:text> → </xsl:text>
                    <xsl:element name="a">
                        <xsl:attribute name="href" select="concat('../edition.html#',substring-after(@copyOf,'#edition:'))"/>
                        <xsl:text>Edition</xsl:text>
                    </xsl:element>
                </xsl:if>
                <xsl:text>)</xsl:text>
            </span>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'psalmverse']">
        <xsl:element name="span">
            <xsl:attribute name="class" select="'coptic-bibletext'"/>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class" select="'coptic-versnumber'"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:if test="exists(@prev)"><xsl:text> [cont.]</xsl:text></xsl:if>
            <xsl:text>)</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'translation'][@xml:lang = 'de']">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'heading-manuscript-name-sub'"/>
            <xsl:text>Deutsche Übersetzung</xsl:text>
        </xsl:element>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'translation'][@xml:lang = 'la']">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'heading-manuscript-name-sub'"/>
            <xsl:text>Lateinische Übersetzung</xsl:text>
        </xsl:element>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>

    <xsl:template match="tei:p[ancestor::tei:div[@type = 'translation'] and exists(@rend) and (@rend = 'italic')]">
        <p class="paragraph-of-german-text-italic">
            <xsl:apply-templates select="child::node()"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:p[ancestor::tei:div[@type = 'translation'] and not(exists(@rend))]">
        <p class="paragraph-of-german-text">
            <xsl:apply-templates select="child::node()"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'bibliography-inline'"/>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'grc']">
        <xsl:value-of select="text()"/>
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
                    <xsl:value-of select="concat('ambr_B_106_sup.html#',substring-after(@target,'#ambr-b-106-sup:'))"/>
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
                    <i class="fas fa-image" style="transform: translate(0%,10%);"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="exists(following-sibling::tei:div[@type = 'page-of-manuscript'][@xml:lang = 'cop'])">
                <xsl:text> </xsl:text>
                <span class="overline">
                    <xsl:value-of select="following-sibling::tei:div[@type = 'page-of-manuscript'][1]/@n"/>
                </span>
            </xsl:if>
            <xsl:if test="exists(following-sibling::tei:div[@type = 'page-of-manuscript'][@xml:lang = 'de'])">
                <xsl:text> </xsl:text>
                <xsl:value-of select="following-sibling::tei:div[@type = 'page-of-manuscript'][1]/@n"/>
            </xsl:if>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <span class="line-number-coptic-text">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)</xsl:text>
        </span>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'overline']">
        <span class="overline">
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>
      
</xsl:stylesheet>