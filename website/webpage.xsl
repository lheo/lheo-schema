<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">

  <xsl:output method="xml" encoding="utf-8"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:param name="css" select="'layout.css'" />
  <xsl:param name="content" select="''" />
  <xsl:param name="extra-content" select="''" />
  <xsl:param name="extra-content2" select="''" />
  <xsl:param name="content-left" select="''" />
  <xsl:param name="menu" select="''" />
  <xsl:param name="menu-item" select="''" />
  <xsl:param name="submenu" select="''" />
  <xsl:param name="version" select="''" />
  <xsl:param name="longversion" select="''" />

  <xsl:template match="/">
    <xsl:call-template name="html" />
  </xsl:template>

  <xsl:template name="html">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
      <xsl:call-template name="head"/>
      <body>
	<xsl:call-template name="header"/>
	<div id="nav"></div>
	<xsl:call-template name="menu"/>	
	<div id="middle-two">
	  <div id="content">
	    <xsl:if test="string-length($content) &gt; 0">
	      <xsl:copy-of select="document($content)"/>
	    </xsl:if>
	    <xsl:if test="string-length($extra-content) &gt; 0">
	      <xsl:copy-of select="document($extra-content)"/>
	    </xsl:if>
	    <xsl:if test="string-length($extra-content2) &gt; 0">
	      <xsl:copy-of select="document($extra-content2)"/>
	    </xsl:if>
	  </div>
	</div>
	<xsl:call-template name="footer"/>
    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-37202293-1']);
      _gaq.push(['_setDomainName', 'lheo.org']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>
    </body>
    </html>
  </xsl:template>
  
  <xsl:template name="head">
    <head>
      <title><xsl:call-template name="title"/></title>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <style type="text/css" media="all">
	@import url("/<xsl:value-of select="$css"/>");
      </style>
    </head>
  </xsl:template>

  <xsl:template name="header">
    <div id="header">
      <div id="header-logo">
	<a href="/"><img src="/logo.gif" alt="LHEO"/></a>
      </div>
      <div id="header-items">
	<span class="header-icon">
	  <a href="{$version}/lheo.pdf"><img src="/manuel.png" alt=" "/>Manuel <xsl:value-of select="$longversion"/></a>
	</span>	
      </div>
    </div>
  </xsl:template>

  <xsl:template name="menu">
    <div id="side-left">
      <xsl:apply-templates select="document($menu)/ul[@id='side-nav']" mode="menu" />
      <xsl:if test="string-length($content-left) &gt; 0">
	<xsl:copy-of select="document($content-left)"/>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="footer">
    <div id="footer">
      <p>
	LHEO et ce site sont sous contrat 
	<a href="http://creativecommons.org/licenses/by-sa/2.0/fr/deed.fr">creative commons</a>.
	<br/>
	<a href="http://creativecommons.org/licenses/by-sa/2.0/fr/deed.fr"><img src="/cdr_bouton.gif" alt="CC"/></a>
	<br/>
	LHEO est une marque déposée à l'INPI.
      </p>
    </div>
  </xsl:template>

  <xsl:template name="title">
    <xsl:apply-templates select="document($menu)/ul[@id='side-nav']" mode="title" />
  </xsl:template>

  <xsl:template match="ul" mode="menu">
    <xsl:element name="{name(.)}">
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="li" mode="menu"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="a" mode="menu">
    <xsl:element name="{name(.)}">
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates mode="menu"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="a" mode="menu-highlight">
    <strong>
      <xsl:element name="{name(.)}">
	<xsl:for-each select="@*">
	  <xsl:attribute name="{name(.)}">
	    <xsl:value-of select="."/>
	  </xsl:attribute>
	</xsl:for-each>
	<xsl:apply-templates mode="menu"/>
      </xsl:element>
    </strong>
  </xsl:template>

  <xsl:template match="a" mode="menu-bold">
<!--    <b>-->
      <xsl:element name="{name(.)}">
	<xsl:for-each select="@*">
	  <xsl:attribute name="{name(.)}">
	    <xsl:value-of select="."/>
	  </xsl:attribute>
	</xsl:for-each>
	<xsl:apply-templates mode="menu"/>
      </xsl:element>
<!--    </b>-->
  </xsl:template>


  <xsl:template match="li" mode="menu">
    <xsl:element name="{name(.)}">
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:choose>
	<xsl:when test="@id=$submenu and @id=$menu-item">
	  <xsl:apply-templates select="a" mode="menu-highlight"/>
	  <xsl:apply-templates select="ul" mode="menu"/>
	</xsl:when>
	<xsl:when test="@id=$submenu">
	  <xsl:apply-templates select="a" mode="menu-bold"/>
	  <xsl:apply-templates select="ul" mode="menu"/>
	</xsl:when>
	<xsl:when test="@id=$menu-item">
	  <xsl:apply-templates select="a" mode="menu-highlight"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="a" mode="menu"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*" mode="menu">
    <xsl:element name="{name(.)}">
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates mode="menu"/>
    </xsl:element>
  </xsl:template>

  <!--
  <xsl:template match="*" mode="menu">
    <xsl:element name="{name(.)}">
      <xsl:for-each select="@*">
	<xsl:attribute name="{name(.)}">
	  <xsl:value-of select="."/>
	</xsl:attribute>
      </xsl:for-each>
      <xsl:choose>
	<xsl:when test="@id=$menu-item">	      
	  <strong>
	    <xsl:apply-templates mode="menu"/>
	  </strong>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates mode="menu"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  -->
  <xsl:template match="*" mode="title">
    <xsl:choose>
      <xsl:when test="@id=$menu-item">	      
	<xsl:value-of select="a/text()"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates mode="title"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="text()" mode="title"/>
</xsl:stylesheet>
