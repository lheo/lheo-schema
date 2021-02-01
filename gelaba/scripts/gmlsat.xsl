<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">  
  <xsl:output method="text"/>
  <!--
      Schema Satisfiability.
      
      Prints out 'LOOP' if the schema is not satisfiable.
      
      Where are the recursions?
      Sequence, Choice.       
      
      Maybe we want also remove languages where one element is a loop,
      because loops break our tools.  So, we need to apply 'sat' on
      each definition of the langage and stops assas one of these
      elements is a loop.
  -->
  <xsl:param name="root" />

  <xsl:template match="/gml:definitions">
    <xsl:call-template name="sat">
      <xsl:with-param name="current" 
		      select="gml:definition[@name=$root]" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="sat">
    <xsl:param name="current" />
    <xsl:param name="parents" select="'/'" />
    
    <xsl:variable name="cname" select="$current/@name" />

    <xsl:variable name="addpath">
      <xsl:call-template name="checkpath">
	<xsl:with-param name="cname" select="$cname" />
	<xsl:with-param name="path" select="$parents" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$addpath='//'">
	<xsl:text>LOOP</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:choose>
	  <xsl:when test="$current//gml:sequence">
	    <xsl:call-template name="sat_sequence">
	      <xsl:with-param name="current" select="$current" />
	      <xsl:with-param name="parents" select="concat($parents,$addpath)" />	  
	    </xsl:call-template>
	  </xsl:when>
	  <xsl:when test="$current//gml:choice">
	    <xsl:call-template name="sat_choice">
	      <xsl:with-param name="current" select="$current" />
	      <xsl:with-param name="parents" select="concat($parents,$addpath)" />	  
	    </xsl:call-template>
	  </xsl:when>
	</xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Prints '//' if the path already contains
       this element -->
  <xsl:template name="checkpath">
    <xsl:param name="cname" />
    <xsl:param name="path" />
    <xsl:variable name="path_element">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="$cname" />
      <xsl:text>/</xsl:text>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains($path, $path_element)">
	<xsl:text>//</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$cname" />
	<xsl:text>/</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="sat_sequence">
    <xsl:param name="current" />
    <xsl:param name="parents" />
    <xsl:for-each select="$current//gml:sequence/gml:element">
      <xsl:if test="not(@min) or @min &gt;=1">
	<xsl:variable name="name" select="@name" />
	<xsl:variable name="element"
		      select="//gml:definition[@name=$name]" />
	<xsl:variable name="choice_current">
	  <choice_current name="{name($current)}"/>
	</xsl:variable>
	<xsl:call-template name="sat">
	  <xsl:with-param name="parents" select="$parents" />
	  <xsl:with-param name="current" select="$element" />
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="sat_choice">
    <xsl:param name="current" />
    <xsl:param name="parents" />
    <!-- Ici, il faut que tous les 'choice' soient LOOP
	 avec un min >= 1 pour que l'on affiche LOOP -->
    <xsl:if test="not($current//gml:choice/@min) 
		  or $current//gml:choice/@min&gt;=1">
      <xsl:variable name="badcase">
	<xsl:for-each select="$current//gml:choice/gml:choice_element">
	  <xsl:text>LOOP</xsl:text>
	</xsl:for-each>
      </xsl:variable>
      <xsl:variable name="actual">
	<xsl:for-each select="$current//gml:choice/gml:choice_element">
	  <xsl:variable name="name" select="@name" />
	  <xsl:variable name="element"
			select="//gml:definition[@name=$name]" />
	  <xsl:call-template name="sat">
	    <xsl:with-param name="parents" select="$parents" />
	    <xsl:with-param name="current" select="$element" />
	  </xsl:call-template>
	</xsl:for-each>
      </xsl:variable>
      <xsl:if test="$actual=$badcase">
	<xsl:text>LOOP</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>