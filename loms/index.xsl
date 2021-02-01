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
    			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
					  rel="stylesheet"
					  integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
					  crossorigin="anonymous"/>
    			<title>LHÉO/XML</title>
			</head>
			<body>
				<div class="container-fluid">
					<h1>
						<xsl:value-of select="lheo:lheo-leger/@info"/>
						<xsl:text> (</xsl:text>
						<xsl:value-of select="lheo:lheo-leger/@numero"/>
						<xsl:text>)</xsl:text>
					</h1>
					<xsl:apply-templates select="lheo:lheo-leger/lheo:resume-formation"/>
				</div>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
						crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="lheo:resume-formation">
		<div class="card">
			<div class="card-body">
    		<h5 class="card-title" id="{@index}">
				<xsl:value-of select="@index"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="lheo:intitule-formation"/>
			</h5>
    		<p class="card-text">
				<xsl:text>Certifiante: </xsl:text><xsl:value-of select="lheo:certifiante"/>
			</p>
    		<a href="{lheo:url}" class="btn btn-primary">LHÉO/XML</a>
    		<a href="{lheo:url-loms}" class="btn btn-primary">LOMS/XML</a>
			</div>
  		</div>
	</xsl:template>
</xsl:stylesheet>
