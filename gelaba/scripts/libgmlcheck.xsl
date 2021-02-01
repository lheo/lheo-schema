<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <!-- TODO: faire que GMLCheck renvoie le nombre d'erreurs sous
       forme d'une chaine GMLERROR| contatenee. 
       Faire en sorte que GMLCheck appelle le check structurel et le SAT.
       Pas de parametres, du bien bourrin sur tout. Il faut que ca passe
       si on veut que les outils fonctionnent correctement.

       Verifier que l'attribut "prefix" en tete est bien present
       parmi les "namespace" declares pour ce langage.
       Verifier que tous les "prefix" de namespaces sont bien differents.
       Verifier que tous les "href" de namespaces sont differents.
       Verifier qu'il n'y a pas le prefix "xml" ou "xmlns" parmi les prefixes.

       Verifier que pour les attributs avec un prefixe, le namespace
       existe.  Dans le meme ordre d'idee, il faut faire attention aux
       doublons d'attributs.
       
       Verifier que si il y a un default prefix il faut qu'il existe en tant
       que namespace.
       
       Verifier les property dans les entry
  -->

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template name="GMLCheckErrorMessage">
    <xsl:text>GML ERROR</xsl:text>
  </xsl:template>

  <xsl:template name="GMLCheckFatalError">
    <xsl:param name="msg" />
    <xsl:message terminate="yes">	       
      <xsl:call-template name="GMLCheckErrorMessage"/>
      <xsl:apply-templates select="." mode="GMLCheck" />      
      <xsl:value-of select="$msg" />
    </xsl:message>
  </xsl:template>

  <xsl:template name="GMLCheckError">
    <xsl:param name="msg" />
    <xsl:message terminate="no">	             
      <xsl:call-template name="GMLCheckErrorMessage"/>
      <xsl:apply-templates select="." mode="GMLCheck" />
      <xsl:value-of select="$msg" />
    </xsl:message>
  </xsl:template>

  <xsl:template match="node()[parent::gml:element_type]" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="ancestor::gml:definition/@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="node()[parent::gml:attribute_type]" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="ancestor::gml:definition/@name" />
    <xsl:text>", attribute "</xsl:text>
    <xsl:value-of select="ancestor::gml:attribute/@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:attribute" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="ancestor::gml:definition/@name" />
    <xsl:text>", attribute "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>


  <xsl:template match="gml:choice_element" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="ancestor::gml:definition/@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:element" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="ancestor::gml:definition/@name" />
    <xsl:text>", sequence element "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:entry | gml:key" mode="GMLCheck">
    <xsl:text> (dictionary "</xsl:text>
    <xsl:value-of select="ancestor::gml:dict/@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:doc|gml:fullname|gml:property[ancestor::gml:definition]" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:doc|gml:fullname|gml:property|gml:value[ancestor::gml:dictionary]" mode="GMLCheck">
    <xsl:text> (definition "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template match="gml:property[parent::gml:definitions]" mode="GMLCheck">
    <xsl:text> (Global property "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>


  <xsl:template match="gml:dict" mode="GMLCheck">
    <xsl:text> (dictionary "</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>") </xsl:text>
  </xsl:template>

  <xsl:template name="GMLCheckIsANumber">    
    <xsl:param name="val" />
    <xsl:choose>
      <xsl:when test="string(number($val))='NaN'">
	<xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="GMLCheckIsAnInteger">    
    <xsl:param name="val" />
    <xsl:variable name="numCheck">
      <xsl:call-template name="GMLCheckIsANumber">
	<xsl:with-param name="val" select="$val" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$numCheck='false'">
	<xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:when test="contains(string($val), '.')">
	<xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="GMLCheckIsAFloat">
    <xsl:param name="val" />
    <xsl:variable name="numCheck">
      <xsl:call-template name="GMLCheckIsANumber">
	<xsl:with-param name="val" select="$val" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$numCheck='false'">
	<xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- A date is something like "[+|-]YYYYMMDD" -->
  <xsl:template name="GMLCheckIsADate">
    <xsl:param name="val" />    
    <xsl:variable name="intCheck">
      <xsl:call-template name="GMLCheckIsAnInteger">
	<xsl:with-param name="val" select="$val" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$intCheck='false'">
	<xsl:text>false</xsl:text>
      </xsl:when>
      <xsl:when test="substring(normalize-space($val),1,1)='+' or substring(normalize-space($val),1,1)='-'">
	<xsl:choose>
	  <xsl:when test="string-length(normalize-space($val)) != 9">
	    <xsl:text>false</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>true</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:when test="string-length(normalize-space($val)) != 8">
	<xsl:text>false</xsl:text>	
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="GMLCheck">

    <!--
	Structural constraints
    -->
    <xsl:for-each select="//gml:definition">
      <xsl:variable name="an" select="@name"/>
      <xsl:if test="count(../gml:definition[@name=$an])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text> duplicate definition.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>	  
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:dict">
      <xsl:variable name="an" select="@name"/>
      <xsl:if test="count(../gml:dict[@name=$an])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text> duplicate dictionary.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>	  
      </xsl:if>
    </xsl:for-each>

    <!-- Choice definitions -->
    <xsl:for-each select="//gml:choice_element">
      <xsl:variable name="el_name" select="@name"/>
      <xsl:if test="not(//gml:definition[@name=$el_name])">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">
	    <xsl:text>definition of choice element "</xsl:text>
	    <xsl:value-of select="$el_name" />
	    <xsl:text>" not found.</xsl:text>	      
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="count(../gml:choice_element[@name=$el_name])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">
	    <xsl:text>choice element "</xsl:text>
	    <xsl:value-of select="$el_name" />
	    <xsl:text>" duplicated in choice.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>    

    <!-- Element definition -->
    <xsl:for-each select="//gml:element">
      <xsl:variable name="el_name" select="@name"/>
      <xsl:if test="not(//gml:definition[@name=$el_name])">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">
	    <xsl:text>definition of sequence element "</xsl:text>
	    <xsl:value-of select="$el_name" />
	    <xsl:text>" not found.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="count(../gml:element[@name=$el_name])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>sequence element "</xsl:text>
	    <xsl:value-of select="$el_name" />
	    <xsl:text>" duplicated in sequence.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Checks on definitions -->
    <xsl:for-each select="//gml:definition">
      <xsl:variable name="dname" select="@name" />
      <xsl:if test="count(//gml:definition[@name=$dname])&gt;1">	
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>definition is not unique.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Checks on dictionaries -->
    <xsl:for-each select="//gml:dict">
      <xsl:variable name="dname" select="@name" />
      <xsl:if test="count(//gml:dict[@name=$dname])&gt;1">	
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>dictionary is not unique.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>

      <!-- Test whether each key is unique or not. -->
      <xsl:for-each select="gml:entry/gml:key">
	<xsl:variable name="kv" select="@val"/>
	<xsl:if test="count(//gml:dict[@name=$dname]/gml:entry/gml:key[@val=$kv])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>key "</xsl:text>
	      <xsl:value-of select="$kv" />
	      <xsl:text>" is duplicated in dictionary.</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
      </xsl:for-each>
    </xsl:for-each>

    <!-- Referenced dictionaries must exist -->
    <xsl:for-each  select="//gml:basic_key | //gml:attribute_key | //gml:attribute_embedded_key">
      <xsl:variable name="dref" select="@ref"/>
      <xsl:if test="not(//gml:dict[@name=$dref])">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>dictionary "</xsl:text>
	    <xsl:value-of select="$dref" />
	    <xsl:text>" does not exist.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!--
	Content checks
    -->
    
    <!-- Check values of 'min' attributes -->
    <xsl:for-each select="//node()[@min]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@min" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>min attribute "</xsl:text>
	    <xsl:value-of select="@min" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="@min &lt; 0">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>min attribute "</xsl:text>
	    <xsl:value-of select="@min" />
	    <xsl:text>" is negative.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of 'max' attributes -->
    <xsl:for-each select="//gml:element[@max] | //gml:choice[@max]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@max" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>max attribute "</xsl:text>
	    <xsl:value-of select="@max" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="@max &lt; 0">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>max attribute "</xsl:text>
	    <xsl:value-of select="@max" />
	    <xsl:text>" is negative.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of combined 'min' and 'max' attributes -->
    <xsl:for-each select="//gml:element[@min and @max] | //gml:choice[@min and @max]">
      <xsl:if test="@min &gt; 0 and @max &gt; 0">
	<xsl:if test="@min &gt; @max">
	  <xsl:call-template name="GMLCheckError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>max attribute "</xsl:text>
	      <xsl:value-of select="@max" />
	      <xsl:text>" is lower than min attribute "</xsl:text> 
	      <xsl:value-of select="@min" />
	      <xsl:text>".</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of 'lgmin' -->
    <xsl:for-each select="//node()[@lgmin]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@lgmin" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>lgmin attribute "</xsl:text>
	    <xsl:value-of select="@lgmin" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="number(@lgmin) &lt; 0">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>lgmin attribute "</xsl:text>
	    <xsl:value-of select="@lgmin" />
	    <xsl:text>" is negative.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of 'lgmax' -->
    <xsl:for-each select="//node()[@lgmax]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@lgmax" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>lgmax attribute "</xsl:text>
	    <xsl:value-of select="@lgmax" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
      <xsl:if test="number(@lgmax) &lt; 0">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>lgmax attribute "</xsl:text>
	    <xsl:value-of select="@lgmax" />
	    <xsl:text>" is negative.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of combined 'lgmin' and 'lgmax' attributes -->
    <xsl:for-each select="//node()[@lgmin and @lgmax]">
      <xsl:if test="@lgmin &gt; 0 and @lgmax &gt; 0">
	<xsl:if test="@lgmin &gt; @lgmax">
	  <xsl:call-template name="GMLCheckError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>lgmax attribute "</xsl:text>
	      <xsl:value-of select="@lgmax" />
	      <xsl:text>" is lower than lgmin attribute "</xsl:text> 
	      <xsl:value-of select="@lgmin" />
	      <xsl:text>".</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of 'vmin' and 'vmax' for basic -->
    <xsl:for-each select="//gml:basic_int[@vmin] | //gml:attribute_int[@vmin]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@vmin" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmin attribute "</xsl:text>
	    <xsl:value-of select="@vmin" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:basic_date[@vmin] | //gml:attribute_date[@vmin]">
      <xsl:variable name="dateCheck">
	<xsl:call-template name="GMLCheckIsADate">
	  <xsl:with-param name="val" select="@vmin" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$dateCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmin attribute "</xsl:text>
	    <xsl:value-of select="@vmin" />
	    <xsl:text>" is not a date.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:basic_float[@vmin] | //gml:attribute_float[@vmin]">
      <xsl:variable name="floatCheck">
	<xsl:call-template name="GMLCheckIsAFloat">
	  <xsl:with-param name="val" select="@vmin" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$floatCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmin attribute "</xsl:text>
	    <xsl:value-of select="@vmin" />
	    <xsl:text>" is not an floating point number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:basic_int[@vmax] | //gml:attribute_int[@vmax]">
      <xsl:variable name="intCheck">
	<xsl:call-template name="GMLCheckIsAnInteger">
	  <xsl:with-param name="val" select="@vmax" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$intCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmax attribute "</xsl:text>
	    <xsl:value-of select="@vmax" />
	    <xsl:text>" is not an integer number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:basic_date[@vmax] | //gml:attribute_date[@vmax]">
      <xsl:variable name="dateCheck">
	<xsl:call-template name="GMLCheckIsADate">
	  <xsl:with-param name="val" select="@vmax" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$dateCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmax attribute "</xsl:text>
	    <xsl:value-of select="@vmax" />
	    <xsl:text>" is not a date.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:basic_float[@vmax] | //gml:attribute_float[@vmax]">
      <xsl:variable name="floatCheck">
	<xsl:call-template name="GMLCheckIsAFloat">
	  <xsl:with-param name="val" select="@vmax" />
	</xsl:call-template>
      </xsl:variable>
      <xsl:if test="$floatCheck='false'">
	<xsl:call-template name="GMLCheckError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>vmax attribute "</xsl:text>
	    <xsl:value-of select="@vmax" />
	    <xsl:text>" is not an floating point number.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>

    <!-- Check values of combined 'vmin' and 'vmax' attributes -->
    <xsl:for-each select="//node()[@vmin and @vmax]">
      <xsl:if test="@vmin &gt; 0 and @vmax &gt; 0">
	<xsl:if test="@vmin &gt; @vmax">
	  <xsl:call-template name="GMLCheckError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>vmax attribute "</xsl:text>
	      <xsl:value-of select="@vmax" />
	      <xsl:text>" is lower than vmin attribute "</xsl:text> 
	      <xsl:value-of select="@vmin" />
	      <xsl:text>".</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>

    <!-- Cannot use regexp with lgmin and/or lgmax -->
    <xsl:for-each select="//node()[@regexp and (@lgmin or @lgmax)]">
      <xsl:call-template name="GMLCheckError">
	<xsl:with-param name="msg">	    
	  <xsl:text>regexp attribute is not allowed </xsl:text>
	  <xsl:text>with lgmin and/or lgmax attributes.</xsl:text>
	</xsl:with-param>
      </xsl:call-template>	  
    </xsl:for-each>

    <!-- NO UNIT TEST BELOW -->

    <!--
	Attributes
    -->

    <xsl:for-each select="//gml:attribute">
      <xsl:variable name="an" select="@name"/>
      <xsl:if test="count(../gml:attribute[@name=$an])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text> duplicate attribute.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>	  
      </xsl:if>
    </xsl:for-each>

    <!-- Some checks on attributes with default or fixed values -->
    <xsl:for-each select="//gml:attribute[@value and not(@type='default' or @type='fixed')]">
      <xsl:call-template name="GMLCheckFatalError">
	<xsl:with-param name="msg">	    
	  <xsl:text>attribute cannot have a value.</xsl:text>
	</xsl:with-param>
      </xsl:call-template>	  
    </xsl:for-each>

    <xsl:for-each select="//gml:attribute[not(@value) and (@type='default' or @type='fixed')]">
      <xsl:call-template name="GMLCheckFatalError">
	<xsl:with-param name="msg">	    
	  <xsl:text>attribute cannot have a value.</xsl:text>
	</xsl:with-param>
      </xsl:call-template>	  
    </xsl:for-each>

    <xsl:for-each 
	select="//gml:attribute[@type='default' or @type='fixed'][not(gml:attribute_type/gml:attribute_data)]">
      <xsl:call-template name="GMLCheckFatalError">
	<xsl:with-param name="msg">	    
	  <xsl:text>attribute with a default/fixed value must be attribute_data.</xsl:text>
	</xsl:with-param>
      </xsl:call-template>	
    </xsl:for-each>

    <!--
	Properties
    -->

    <xsl:for-each select="//gml:property">
      <xsl:variable name="pn" select="@name"/>
      <xsl:if test="count(../gml:property[@name=$pn])&gt;1">
	<xsl:call-template name="GMLCheckFatalError">
	  <xsl:with-param name="msg">	    
	    <xsl:text>duplicate property.</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>	
      </xsl:if>
    </xsl:for-each>

    <!--
	xml:lang duplicates
    -->

    <xsl:for-each select="//gml:doc">
      <xsl:variable name="dl" select="//gml:definitions/@xml:lang"/>
      <xsl:variable name="cl">
	<xsl:choose>
	  <xsl:when test="@xml:lang">
	    <xsl:value-of select="@xml:lang"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$dl"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:if test="$cl = $dl">
	<xsl:if test="count(../gml:doc[@xml:lang=$cl or not(@xml:lang)])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate doc with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
      <xsl:if test="$cl != $dl">
	<xsl:if test="count(../gml:doc[@xml:lang=$cl])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate doc with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:fullname">
      <xsl:variable name="dl" select="//gml:definitions/@xml:lang"/>
      <xsl:variable name="cl">
	<xsl:choose>
	  <xsl:when test="@xml:lang">
	    <xsl:value-of select="@xml:lang"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$dl"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:if test="$cl = $dl">
	<xsl:if test="count(../gml:fullname[@xml:lang=$cl or not(@xml:lang)])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate fullname with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
      <xsl:if test="$cl != $dl">
	<xsl:if test="count(../gml:fullname[@xml:lang=$cl])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate fullname with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//gml:value">
      <xsl:variable name="dl" select="//gml:definitions/@xml:lang"/>
      <xsl:variable name="cl">
	<xsl:choose>
	  <xsl:when test="@xml:lang">
	    <xsl:value-of select="@xml:lang"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$dl"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:if test="$cl = $dl">
	<xsl:if test="count(../gml:value[@xml:lang=$cl or not(@xml:lang)])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate value with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
      <xsl:if test="$cl != $dl">
	<xsl:if test="count(../gml:value[@xml:lang=$cl])&gt;1">
	  <xsl:call-template name="GMLCheckFatalError">
	    <xsl:with-param name="msg">	    
	      <xsl:text>duplicate value with the same xml:lang</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>	  
	</xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!--
      Schema Satisfiability.
      
      Prints out 'LOOP' if the schema is not satisfiable.
      
      Where are the recursions?
      Sequence, Choice.       
      
      We want also to remove languages where one element is a loop,
      because loops break our tools.  So, we need to apply 'sat' on
      each definition of the langage and stops assas one of these
      elements is a loop.
  -->

  <xsl:template name="GMLSat">
    <xsl:param name="current" />
    <xsl:param name="parents" select="'/'" />
    
    <xsl:variable name="cname" select="$current/@name" />

    <xsl:variable name="addpath">
      <xsl:call-template name="GMLCheckpath">
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
	    <xsl:call-template name="GMLSatSequence">
	      <xsl:with-param name="current" select="$current" />
	      <xsl:with-param name="parents" select="concat($parents,$addpath)" />	  
	    </xsl:call-template>
	  </xsl:when>
	  <xsl:when test="$current//gml:choice">
	    <xsl:call-template name="GMLSatChoice">
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
  <xsl:template name="GMLCheckpath">
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

  <xsl:template name="GMLSatSequence">
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
	<xsl:call-template name="GMLSat">
	  <xsl:with-param name="parents" select="$parents" />
	  <xsl:with-param name="current" select="$element" />
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="GMLSatChoice">
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
	  <xsl:call-template name="GMLSat">
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

  <xsl:template match="/" mode="GMLCheck">
    <xsl:apply-templates select="gml:definitions/gml:definition" mode="GMLSat"/>
    <xsl:call-template name="GMLCheck" />
  </xsl:template>
  
  <xsl:template match="gml:definition" mode="GMLSat">
    <xsl:variable name="loop">
      <xsl:call-template name="GMLSat">
	<xsl:with-param name="current" select="." />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$loop='LOOP'">
      <xsl:call-template name="GMLCheckError">
	<xsl:with-param name="msg">
	  <xsl:text>schema is infinite (and maybe not satisfiable)</xsl:text>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
