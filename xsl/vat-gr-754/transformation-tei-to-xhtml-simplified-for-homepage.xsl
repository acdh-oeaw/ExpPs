<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xhtml" encoding="UTF-8"/>
    
    <xsl:template match="tei:TEI">
        <html lang="en-US">
            <head>
                <meta charset="UTF-8"></meta>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>
                <meta name="mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-title" content="Expositiones in Psalmos - Vat. gr. 754"></meta>
                <link rel="profile" href="http://gmpg.org/xfn/11"/>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" id="fundament-styles"  href="../fundament/css/fundament.min.css" type="text/css"></link>
                <link rel="stylesheet" href="../fundament/css/custom.css" type="text/css"></link>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"></link><script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/js/all.min.js" integrity="sha512-LW9+kKj/cBGHqnI4ok24dUWNR/e8sUD8RLzak1mNw5Ja2JYCmTXJTF5VpgFSw+VoBfpMvPScCo2DnKTIUjrzYw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <link rel="icon" type="image/png" href="../favicon.png"></link>
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
                                        <li class="nav-item">
                                            <a title="Manuscripts" href="../manuscripts.html" class="nav-link">Manuscripts</a>
                                        </li>
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
                                    <!--<form class="form-inline my-2 my-lg-0 navbar-search-form" method="get" action="/" role="search">
                <input class="form-control navbar-search" id="s" name="s" type="text" placeholder="Search" value="" autocomplete="off">
                <button type="submit" class="navbar-search-icon">
                  <i data-feather="search"></i>
                </button>
              </form>-->
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
                                                <div class="entry-top-thumbnail"><img src="../fundament/images/picture_2.png" alt=""/></div>
                                                <!--<h1 class="entry-title">Vat. gr. 754</h1>-->
                                            </header><!-- .entry-header -->
                                            <div class="entry-content">
                <div id="main-content">
                    <div id="main-content-header">
                        <div class="row"><div class="col-8"></div><div class="col-4" style="text-align: center;">→ <a href="vat_gr_754.html">Diplomatic and Normalized Transcription</a></div></div>
                        <div class="row"><div class="col-8"></div><div class="col-4" style="text-align: center;">→ <a href="vat_gr_754_diplomatic.html">Diplomatic Transcription</a></div></div>
                        <xsl:apply-templates select="tei:teiHeader"/>
                    </div>
                    <div id="main-content-body">
                        <xsl:apply-templates select="tei:text/tei:body"/>
                    </div>
                </div>
                                            </div><!-- .entry-content -->
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
        <p class="title">
            <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
        </p>
        <p class="title">
            <xsl:text>Simplified - Commentaryfragments and Hexaplaric Variants</xsl:text>
        </p>
        <xsl:for-each select="tei:fileDesc/tei:titleStmt/tei:respStmt">
            <p class="responsibility">
                <xsl:value-of select="./tei:resp"/>
            </p>
            <p class="author">
                <xsl:value-of select="./tei:persName"/>
            </p>
        </xsl:for-each>
        <p class="publisher">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:publisher"/>
        </p>
        <p class="license">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:availability"/>
        </p>
        <p class="date">
            <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:date"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates select="tei:div[@type = 'transcription']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <div class="manuscript-content">
            <xsl:apply-templates select="tei:div[@type = 'hexaplaric' or @type = 'commentary' or @type = 'hypothesis'] | tei:pb"/>
        </div>
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
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hexaplaric']">
            <xsl:apply-templates select=".//tei:seg"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'hypothesis']">
            <xsl:apply-templates select=".//tei:seg"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'commentary']">
            <xsl:apply-templates select=".//tei:seg"/>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'hexaplaric']">
        <div class="commentaryfragment">
            <p class="commentaryfragment-in-transcription-simplified">
                <xsl:text>Hexaplaric variant - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="@source"/>
                </xsl:element>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates select="child::node()"/>
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:abbr[@type = 'bibleversion']"/>
    
    <xsl:template match="tei:seg[@type = 'commentaryfragment']">
        <div class="commentaryfragment">
            <p class="commentaryfragment-in-transcription-simplified">
                <xsl:text>Commentary fragment - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="child::tei:quote/@source"/>
                </xsl:element>
                <xsl:if test="exists(@prev)">
                    <xsl:text> (continued)</xsl:text>
                </xsl:if>
                <xsl:text>: </xsl:text>
                <xsl:if test="exists(@prev)">
                    <xsl:text>...</xsl:text>
                </xsl:if>
                <xsl:apply-templates select="child::node()[not(self::tei:note[@type = 'textual-commentary'])]"/>
                <xsl:if test="exists(@next)">
                    <xsl:text>...</xsl:text>
                </xsl:if>
            </p>
            <xsl:apply-templates select="child::tei:note[@type = 'textual-commentary']"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'hypothesis']">
        <div class="commentaryfragment">
            <p class="commentaryfragment-in-transcription-simplified">
                <xsl:text>Hypothesis - </xsl:text>
                <xsl:element name="b">
                    <xsl:value-of select="child::tei:quote/@source"/>
                </xsl:element>
                <xsl:if test="exists(@prev)">
                    <xsl:text> (continued)</xsl:text>
                </xsl:if>
                <xsl:text>: </xsl:text>
                <xsl:if test="exists(@prev)">
                    <xsl:text>...</xsl:text>
                </xsl:if>
                <xsl:apply-templates select="child::node()[not(self::tei:note[@type = 'textual-commentary'])]"/>
                <xsl:if test="exists(@next)">
                    <xsl:text>...</xsl:text>
                </xsl:if>
            </p>
            <xsl:apply-templates select="child::tei:note[@type = 'textual-commentary']"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'glosse']"/>
    
    <xsl:template match="tei:note[@type = 'attribution']"/>
    
    <xsl:template match="tei:choice">
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
        <xsl:if test="exists(@quantity) and starts-with(@unit,'char')">
            <xsl:for-each select="1 to @quantity"><xsl:text>.</xsl:text></xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:add"/>   
    
    <xsl:template match="tei:del">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <xsl:value-of select="text()"/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:if test="not(exists(@break))">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:note[@type = 'textual-commentary']">
        <xsl:if test="not(exists(child::tei:p))">
            <xsl:element name="p">
                <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
                <xsl:apply-templates select="child::node()"/>
            </xsl:element>
        </xsl:if>
        <xsl:if test="exists(child::tei:p)">
            <xsl:apply-templates select="child::tei:p"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:p[parent::tei:note[@type = 'textual-commentary']]">
        <xsl:element name="p">
            <xsl:attribute name="class" select="'paragraph-in-commentaryfragment'"/>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:choose>
            <xsl:when test="contains(.,'                     ')">
                <xsl:value-of select="replace(.,'&#10;                     ','')"/>
            </xsl:when>
            <xsl:when test="contains(.,'                  ')">
                <xsl:value-of select="replace(.,'&#10;                  ','')"/>
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