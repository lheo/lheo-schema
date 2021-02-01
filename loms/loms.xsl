<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:loms="http://data.europa.eu/europass/qms-xml/schema/learning-opportunities"
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
    			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
					  rel="stylesheet"
					  integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
					  crossorigin="anonymous"/>
    			<title>LOMS/XML</title>
			</head>
			<body>
				<div class="container-fluid">
					<xsl:apply-templates />
				</div>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
						crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="loms:qmsLearningOpportunities">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="loms:learningOpportunities|loms:learningSpecificationReferences|loms:learningOutcomeReferences|loms:agentReferences">
		<h2>
			<code>
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="name(.)"/>
				<xsl:text>&gt;</xsl:text>
			</code>
		</h2>
		<div style="margin-left: 2rem;">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="loms:learningOpportunity|loms:learningSpecification|loms:learningOutcome|loms:organization">
		<h3>
			<code>
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="name(.)"/>
				<xsl:apply-templates select="@*"/>
				<xsl:text>&gt;</xsl:text>
			</code>
		</h3>
		<dl style="margin-left: 2rem;">
			<xsl:apply-templates/>
		</dl>
	</xsl:template>
	<xsl:template match="@*">
		<code>
			<xsl:text> </xsl:text>
			<xsl:value-of select="name(.)"/>
			<xsl:text>="</xsl:text>
			<xsl:value-of select="."/>
			<xsl:text>"</xsl:text>
		</code>
	</xsl:template>
	<xsl:template match="*">
		<dt>
			<code>
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="name(.)"/>
				<xsl:apply-templates select="@*"/>
				<xsl:text>&gt;</xsl:text>
			</code>
		</dt>
		<dd style="margin-left: 2rem;"><xsl:apply-templates/></dd>
	</xsl:template>
	<xsl:template match="loms:text[@content-type='text/plain']">
		<xsl:value-of select="text()"/>
	</xsl:template>
	<xsl:template match="loms:text[@content-type='text/html']">
		<xsl:value-of select="text()" disable-output-escaping="yes"/>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
