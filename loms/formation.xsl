<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns="http://www.w3.org/1999/xhtml"
		xmlns:lheo="http://www.lheo.org/2.2"
		version="1.0">
	<xsl:output
		indent="yes"
		method="xml"
		omit-xml-declaration="no"
		encoding="utf-8" />
	<xsl:template match="/">
		<html lang="fr">
			<head>
				<meta charset="utf-8"/>
    			<meta name="viewport" content="width=device-width, initial-scale=1"/>
    			<!-- Bootstrap CSS -->
    			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    			<title>LHÉO/XML</title>
			</head>
			<body>
				<div class="container-fluid">
					<div class="row">
					<xsl:apply-templates select="lheo:lheo/lheo:offres/lheo:formation"/>
					<xsl:apply-templates select="lheo:formation"/>
					</div>
				</div>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="lheo:formation">
		<div class="navigation">
			<xsl:if test="lheo:extras[@info='navigation']/lheo:extra[@info='previous']">
				<a class="btn btn-outline-primary" role="button" href="{lheo:extras[@info='navigation']/lheo:extra[@info='previous']/text()}.xml">précédent</a>
			</xsl:if>
			<xsl:if test="lheo:extras[@info='navigation']/lheo:extra[@info='index']">
				<a class="btn btn-outline-secondary" role="button" href="index.xml#{lheo:extras[@info='navigation']/lheo:extra[@info='index']/text()}">liste</a>
			</xsl:if>
			<xsl:if test="lheo:extras[@info='navigation']/lheo:extra[@info='next']">
				<a class="btn btn-outline-primary" role="button" href="{lheo:extras[@info='navigation']/lheo:extra[@info='next']/text()}.xml">suivant</a>
			</xsl:if>
			<xsl:if test="lheo:extras[@info='navigation']/lheo:extra[@info='loms']">
				<a class="btn btn-outline-success" role="button" href="{lheo:extras[@info='navigation']/lheo:extra[@info='loms']/text()}">loms</a>
			</xsl:if>
		</div>
		<h1><xsl:value-of select="//lheo:extras[@info='navigation']/lheo:extra[@info='current']"/></h1>
		<h3><code>&lt;<xsl:value-of select="name(.)"/>&gt;</code></h3>
		<dl style="margin-left: 2rem;">
			<xsl:apply-templates/>
		</dl>
	</xsl:template>
	<xsl:template match="lheo:action|lheo:session|lheo:organisme-formation-responsable">
		<dt>
			<h3><code>&lt;<xsl:value-of select="name(.)"/>&gt;</code></h3>
		</dt>
		<dd>
			<dl style="margin-left: 2rem;">
				<xsl:apply-templates/>
			</dl>
		</dd>
	</xsl:template>
	<xsl:template match="lheo:organisme-formateur">
		<dt>
			<h4><code>&lt;<xsl:value-of select="name(.)"/>&gt;</code></h4>
		</dt>
		<dd>
			<dl style="margin-left: 2rem;">
				<xsl:apply-templates/>
			</dl>
		</dd>
	</xsl:template>
	<xsl:template match="lheo:domaine-formation|lheo:certification|lheo:SIRET-organisme-formation|lheo:SIRET-formateur">
		<xsl:apply-templates select="." mode="straight"/>
	</xsl:template>
	<xsl:template match="lheo:contact-formateur|lheo:contact-formation|lheo:coordonnees-organisme|lheo:contact-organisme">
		<xsl:apply-templates select="." mode="straight"/>
	</xsl:template>
	<xsl:template match="lheo:adresse-information|lheo:adresse-inscription|lheo:lieu-de-formation">
		<xsl:apply-templates select="." mode="straight"/>
	</xsl:template>
	<xsl:template match="lheo:date-information|lheo:periode|lheo:periode-inscription">
		<xsl:apply-templates select="." mode="straight"/>
	</xsl:template>
	<xsl:template match="lheo:url-formation|lheo:url-action">
		<xsl:apply-templates select="." mode="straight"/>
	</xsl:template>
	<xsl:template match="lheo:coordonnees">
		<address>
			<xsl:for-each select="lheo:ligne">
				<xsl:choose>
					<xsl:when test="position() = 1">
						<strong><xsl:value-of select="text()"/></strong>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="text()"/>
					</xsl:otherwise>
				</xsl:choose>
				<br/>
			</xsl:for-each>
			<xsl:apply-templates select="lheo:adresse" mode="nostrong"/>
			<xsl:apply-templates select="*[name(.) != 'adresse' and name(.) != 'ligne']"/>
		</address>
	</xsl:template>
	<xsl:template match="lheo:adresse" mode="nostrong">
		<xsl:for-each select="lheo:ligne">
			<xsl:value-of select="text()"/>
			<br/>
		</xsl:for-each>
		<xsl:value-of select="lheo:codepostal"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="lheo:ville"/>
		<br/>
		<xsl:apply-templates select="*[name(.)!='ligne' and name(.)!='codepostal' and name(.)!='ville']"/>
	</xsl:template>
	<xsl:template match="lheo:adresse">
		<xsl:for-each select="lheo:ligne">
			<xsl:choose>
				<xsl:when test="position() = 1">
					<strong><xsl:value-of select="text()"/></strong>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="text()"/>
				</xsl:otherwise>
			</xsl:choose>
			<br/>
		</xsl:for-each>
		<xsl:value-of select="lheo:codepostal"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="lheo:ville"/>
		<br/>
		<xsl:apply-templates select="*[name(.)!='ligne' and name(.)!='codepostal' and name(.)!='ville']"/>
	</xsl:template>
	<xsl:template match="lheo:portable">
		<xsl:for-each select="lheo:numtel">
			<span>Mob: </span>
			<span><xsl:value-of select="text()"/></span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="lheo:telfixe">
		<xsl:for-each select="lheo:numtel">
			<span>Tél: </span>
			<span><xsl:value-of select="text()"/></span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="lheo:fax">
		<xsl:for-each select="lheo:numtel">
			<span>Fax: </span>
			<span><xsl:value-of select="text()"/></span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="lheo:web">
		<xsl:for-each select="lheo:urlweb">
			<span>Web: </span>
			<a  href="{text()}"><xsl:value-of select="text()"/></a>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="lheo:departement|lheo:code-INSEE-commune|lheo:region|lheo:pays">
		<span><xsl:value-of select="text()"/></span>
		<br/>
	</xsl:template>
	<xsl:template match="lheo:geolocalisation">
		<span class="{local-name(.)}">
		<span>lat: </span>
		<span class="lheo:latitude"><xsl:value-of select="lheo:latitude"/></span>
		<span> lon: </span>
		<span class="lheo:latitude"><xsl:value-of select="lheo:longitude"/></span>
		</span>
		<br/>
	</xsl:template>
	<xsl:template match="lheo:urlweb">
		<a class="lheo:urlweb" href="{text()}"><xsl:value-of select="text()"/></a>
	</xsl:template>
	<xsl:template match="lheo:periode">
		<dt>
			<code>&lt;<xsl:value-of select="name(.)"/>&gt;</code>
		</dt>
		<dd class="lheo:periode">
			<span class="lheo:debut"><xsl:value-of select="lheo:debut"/></span>
			<span> - </span>
			<span class="lheo:fin"><xsl:value-of select="lheo:fin"/></span>
		</dd>
	</xsl:template>
	<xsl:template match="*" mode="straight">
		<dt>
			<code>&lt;<xsl:value-of select="name(.)"/>&gt;</code>
		</dt>
		<dd>
			<dl style="margin-left: 2rem;">
				<xsl:apply-templates/>
			</dl>
		</dd>
	</xsl:template>
	<xsl:template match="lheo:extras"/>
	<xsl:template match="*[not(text())]"/>
	<xsl:template match="*">
		<dt>
			<code>&lt;<xsl:value-of select="name(.)"/>&gt;</code>
		</dt>
		<dd><xsl:value-of select="text()"/></dd>
	</xsl:template>

</xsl:stylesheet>
