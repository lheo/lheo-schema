<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gml="http://www.gelaba.org/gml/1.1"
    version="1.0">

    <!-- TODO: support des exemples pour attributs -->
    <!-- TODO: fusionner libgmlexample.xsl et gml2example.xsl -->

    <xsl:template name="print_lt">
        <xsl:text>&lt;</xsl:text>
    </xsl:template>

    <xsl:template name="print_gt">
        <xsl:text>&gt;</xsl:text>
    </xsl:template>

    <xsl:template name="print_minmax">
        <xsl:param name="min" select="1"/>
        <xsl:param name="max" select="1"/>

        <xsl:variable name="cmin">
            <xsl:choose>
                <xsl:when test="$min">
                    <xsl:value-of select="$min"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>1</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="cmax">
            <xsl:choose>
                <xsl:when test="$max='0'">
                    <xsl:text>N</xsl:text>
                </xsl:when>
                <xsl:when test="$max">
                    <xsl:value-of select="$max"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>1</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:if test="$cmin != '1' or $cmax != '1'">
            <xsl:text> </xsl:text>
            <xsl:call-template name="print_lt"/>
            <xsl:text>!--[</xsl:text>
            <xsl:value-of select="$cmin" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$cmax" />    
            <xsl:text>]--</xsl:text>
            <xsl:call-template name="print_gt"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="print_name_begin">
        <xsl:param name="name"/>    
        <xsl:value-of select="$name"/>
    </xsl:template>

    <xsl:template name="print_name_end">
        <xsl:param name="name"/>    
        <xsl:value-of select="$name"/>
    </xsl:template>

    <xsl:template name="nl">
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template name="print_begin">
        <xsl:call-template name="print_lt"/>
        <xsl:text>?xml version="1.0" encoding="utf-8"?</xsl:text>
        <xsl:call-template name="print_gt"/>
        <xsl:call-template name="nl"/>
    </xsl:template>

    <xsl:template name="print_stylesheet">
        <xsl:param name="xml-stylesheet"/>
        <xsl:if test="string-length($xml-stylesheet)&gt;0">
            <xsl:call-template name="print_lt"/>
            <xsl:text>?xml-stylesheet type="text/xsl" href="</xsl:text>
            <xsl:value-of select="$xml-stylesheet"/>
            <xsl:text>" ?</xsl:text>
            <xsl:call-template name="print_gt"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="print_doctype">
        <xsl:param name="doctype-public"/>    
        <xsl:param name="doctype-system"/>
        <xsl:param name="doctypecontent" />
        <xsl:param name="root"/>

        <xsl:if test="string-length($root)&gt;0">
            <xsl:choose>
                <xsl:when test="string-length($doctype-public) &gt; 0 and string-length($doctype-system) &gt; 0">
                    <xsl:value-of select="$lt"/>
                    <xsl:text>!DOCTYPE </xsl:text>
                    <xsl:value-of select="$root"/>
                    <xsl:text> PUBLIC "</xsl:text>
                    <xsl:value-of select="$doctype-public"/>    
                    <xsl:text>" "</xsl:text>
                    <xsl:value-of select="$doctype-system"/>    
                    <xsl:text>"</xsl:text>
                    <xsl:if test="string-length($doctypecontent)&gt;0">
                        <xsl:text> [</xsl:text>
                        <xsl:call-template name="nl"/>
                        <xsl:value-of select="$doctypecontent"/>
                        <xsl:call-template name="nl"/>
                        <xsl:text>]</xsl:text>
                    </xsl:if>
                    <xsl:call-template name="print_gt"/>
                    <xsl:call-template name="nl"/>
                </xsl:when>
                <xsl:when test="string-length($doctype-system) &gt; 0">
                    <xsl:call-template name="print_lt"/>
                    <xsl:text>!DOCTYPE </xsl:text>
                    <xsl:value-of select="$root"/>
                    <xsl:text> SYSTEM "</xsl:text>
                    <xsl:value-of select="$doctype-system"/>    
                    <xsl:text>"</xsl:text>
                    <xsl:if test="string-length($doctypecontent)&gt;0">
                        <xsl:text> [</xsl:text>
                        <xsl:call-template name="nl"/>
                        <xsl:value-of select="$doctypecontent"/>
                        <xsl:call-template name="nl"/>
                        <xsl:text>]</xsl:text>
                    </xsl:if>
                    <xsl:call-template name="print_gt"/>
                    <xsl:call-template name="nl"/>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="print_attribute">
        <xsl:param name="name"/>
        <xsl:param name="value"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>="</xsl:text>
        <xsl:value-of select="$value"/>
        <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template name="def">
        <xsl:param name="spaces" />
        <xsl:param name="indent" />
        <xsl:param name="path" />
        <xsl:param name="outputfixed" select="'no'" />
        <xsl:param name="outputnamespace" select="'no'" />
        <xsl:param name="prefix" select="''" />
        <xsl:param name="complete" select="'no'" />
        <xsl:param name="lt" select="'&lt;'" />    
        <xsl:param name="gt" select="'&gt;'" />
        <xsl:param name="examplefile" select="''" />
        <xsl:param name="exampledoc" />
        <xsl:param name="exampleposition" select="'1'"/>    
        <xsl:param name="depth" select="'1'"/>
        <xsl:param name="maxdepth" select="'0'"/>
        <xsl:param name="stophere" select="'false'" />

        <xsl:variable name="namespace_name">
            <xsl:text>xmlns</xsl:text>
            <xsl:if test="string-length($prefix)&gt;0">
                <xsl:text>:</xsl:text>
                <xsl:value-of select="$prefix"/>
            </xsl:if>
        </xsl:variable>

        <xsl:variable name="namespace_value">
            <xsl:choose>
                <xsl:when test="gml:attribute[@name = $namespace_name]">
                    <xsl:value-of select="gml:attribute[@name = $namespace_name]/@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//gml:definitions/gml:namespace/@href"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="current_name">
            <xsl:if test="string-length($prefix)&gt;0">
                <xsl:value-of select="$prefix"/>
                <xsl:text>:</xsl:text>
            </xsl:if>
            <xsl:value-of select="@name"/>
        </xsl:variable>

        <xsl:variable name="short_name" select="@name" />

        <xsl:variable name="toprint">
            <xsl:choose>
                <xsl:when test="number($maxdepth) = number(0) or number($depth) &lt; number($maxdepth)">
                    <xsl:text>yes</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>no</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- OPENING MARK -->
        <xsl:value-of select="$spaces"/>
        <xsl:call-template name="print_lt"/>
        <xsl:call-template name="print_name_begin">
            <xsl:with-param name="name" select="$current_name"/>
        </xsl:call-template>

        <xsl:if test="$outputnamespace = 'yes'">
            <xsl:call-template name="print_attribute">  
                <xsl:with-param name="name" select="$namespace_name"/>
                <xsl:with-param name="value" select="$namespace_value"/>
            </xsl:call-template>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="$allattributes='yes'">
                <xsl:for-each select="gml:attribute">
                    <xsl:if test="@name != $namespace_name">
                        <xsl:call-template name="print_attribute">          
                            <xsl:with-param name="name" select="@name"/>
                            <xsl:with-param name="value" select="@value"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="gml:attribute[@type='required']">
                    <xsl:if test="@name != $namespace_name">
                        <xsl:call-template name="print_attribute">          
                            <xsl:with-param name="name" select="@name"/>
                            <xsl:with-param name="value" select="@value"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="$outputfixed='yes'">
                    <xsl:for-each select="gml:attribute[@type='fixed']">
                        <xsl:if test="@name != $namespace_name">
                            <xsl:call-template name="print_attribute">  
                                <xsl:with-param name="name" select="@name"/>
                                <xsl:with-param name="value" select="@value"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>


        <xsl:call-template name="print_gt"/>

        <!-- CONTENT -->
        <xsl:choose>
            <xsl:when test="$stophere = 'true' and (gml:element_type/gml:sequence or gml:element_type/gml:choice)">
                <xsl:text>...</xsl:text>
            </xsl:when>
            <xsl:when test="gml:element_type/gml:sequence[$complete='no']">
                <xsl:choose>
                    <xsl:when test="$toprint='yes'">
                        <xsl:for-each select="gml:element_type/gml:sequence/gml:element[not(@min) or @min='1']">
                            <xsl:variable name="element" select="@name"/>
                            <xsl:variable name="path_suffix">
                                <xsl:value-of select="$element"/>
                                <xsl:text>/</xsl:text>
                            </xsl:variable>
                            <xsl:variable name="path_comparator">
                                <xsl:text>/</xsl:text>
                                <xsl:value-of select="$path_suffix"/>
                            </xsl:variable>
                            <xsl:if test="not(contains($path, $path_comparator))">      
                                <xsl:for-each select="//gml:definition[@name=$element]">
                                    <xsl:call-template name="nl" />     
                                    <xsl:call-template name="def">
                                        <xsl:with-param name="path" select="concat($path, $path_suffix)"/>
                                        <xsl:with-param name="outputfixed" select="$outputfixed"/>
                                        <xsl:with-param name="prefix" select="$prefix"/>
                                        <xsl:with-param name="complete" select="$complete"/>
                                        <xsl:with-param name="spaces" select="concat($spaces,$indent)"/>
                                        <xsl:with-param name="indent" select="$indent"/>          
                                        <xsl:with-param name="examplefile" select="$examplefile"/>    
                                        <xsl:with-param name="exampledoc" select="$exampledoc"/>    
                                        <xsl:with-param name="exampleposition" select="$exampleposition"/>
                                        <xsl:with-param name="depth" select="number($depth)+1"/>
                                        <xsl:with-param name="maxdepth" select="$maxdepth"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:call-template name="nl" /> 
                        <xsl:value-of select="$spaces"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>...</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="gml:element_type/gml:sequence[$complete='yes']">
                <xsl:choose>
                    <xsl:when test="$toprint='yes'">
                        <xsl:for-each select="gml:element_type/gml:sequence/gml:element">
                            <xsl:variable name="element" select="@name"/>
                            <xsl:variable name="path_suffix">
                                <xsl:value-of select="$element"/>
                                <xsl:text>/</xsl:text>
                            </xsl:variable>
                            <xsl:variable name="path_comparator">
                                <xsl:text>/</xsl:text>
                                <xsl:value-of select="$path_suffix"/>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="not(contains($path, $path_comparator))">        
                                    <xsl:for-each select="//gml:definition[@name=$element]">

                                        <xsl:variable name="occurrences"
                                            select="//gml:element[@name=$element]|//gml:choice_element[@name=$element]" />
                                            <xsl:choose>
                                                <xsl:when test="count($occurrences)&gt;1">
                                                    <xsl:call-template name="nl" />
                                                    <xsl:call-template name="def">
                                                        <xsl:with-param name="path" select="concat($path, $path_suffix)"/>
                                                        <xsl:with-param name="outputfixed" select="$outputfixed"/>
                                                        <xsl:with-param name="prefix" select="$prefix"/>
                                                        <xsl:with-param name="complete" select="$complete"/>
                                                        <xsl:with-param name="spaces" select="concat($spaces,$indent)"/>
                                                        <xsl:with-param name="indent" select="$indent"/>
                                                        <xsl:with-param name="examplefile" select="$examplefile"/>            
                                                        <xsl:with-param name="exampledoc" select="$exampledoc"/>    
                                                        <xsl:with-param name="exampleposition" select="$exampleposition"/>    
                                                        <xsl:with-param name="depth" select="number($depth)+1"/>
                                                        <xsl:with-param name="maxdepth" select="$maxdepth"/>
                                                        <xsl:with-param name="stophere" select="'false'" />
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="nl" />     
                                                    <xsl:call-template name="def">
                                                        <xsl:with-param name="path" select="concat($path, $path_suffix)"/>
                                                        <xsl:with-param name="outputfixed" select="$outputfixed"/>
                                                        <xsl:with-param name="prefix" select="$prefix"/>
                                                        <xsl:with-param name="complete" select="$complete"/>
                                                        <xsl:with-param name="spaces" select="concat($spaces,$indent)"/>
                                                        <xsl:with-param name="indent" select="$indent"/>          
                                                        <xsl:with-param name="examplefile" select="$examplefile"/>
                                                        <xsl:with-param name="exampledoc" select="$exampledoc"/>    
                                                        <xsl:with-param name="exampleposition" select="$exampleposition"/>    
                                                        <xsl:with-param name="depth" select="number($depth)+1"/>
                                                        <xsl:with-param name="maxdepth" select="$maxdepth"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>...</xsl:otherwise>      
                                </xsl:choose>
                                <xsl:call-template name="print_minmax">
                                    <xsl:with-param name="min" select="@min"/>
                                    <xsl:with-param name="max" select="@max"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:call-template name="nl" />
                            <xsl:value-of select="$spaces"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>...</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="gml:element_type/gml:choice">
                    <xsl:choose>
                        <xsl:when test="$toprint='yes'">
                            <xsl:for-each select="gml:element_type/gml:choice/gml:choice_element[position()=1]">
                                <xsl:variable name="element" select="@name"/>
                                <xsl:variable name="path_suffix">
                                    <xsl:value-of select="$element"/>
                                    <xsl:text>/</xsl:text>
                                </xsl:variable>
                                <xsl:variable name="path_comparator">
                                    <xsl:text>/</xsl:text>
                                    <xsl:value-of select="$path_suffix"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="not(contains($path, $path_comparator))">
                                        <xsl:for-each select="//gml:definition[@name=$element]">
                                            <xsl:call-template name="nl" />
                                            <xsl:call-template name="def">
                                                <xsl:with-param name="path" select="concat($path, $path_suffix)"/>
                                                <xsl:with-param name="outputfixed" select="$outputfixed"/>
                                                <xsl:with-param name="prefix" select="$prefix"/>
                                                <xsl:with-param name="complete" select="$complete"/>
                                                <xsl:with-param name="spaces" select="concat($spaces,$indent)"/>
                                                <xsl:with-param name="indent" select="$indent"/>
                                                <xsl:with-param name="examplefile" select="$examplefile"/>
                                                <xsl:with-param name="exampledoc" select="$exampledoc"/>    
                                                <xsl:with-param name="exampleposition" select="$exampleposition"/>    
                                                <xsl:with-param name="depth" select="number($depth)+1"/>
                                                <xsl:with-param name="maxdepth" select="$maxdepth"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <xsl:call-template name="nl" />     
                                        <xsl:value-of select="$spaces"/>                  
                                    </xsl:when>
                                    <xsl:otherwise></xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>...</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="gml:element_type/gml:empty"/>
                <xsl:otherwise>
                    <!-- This is a basic content. Search for an example. -->
                    <xsl:choose>
                        <xsl:when test="string-length($examplefile) &gt; 0">
                            <xsl:variable name="examples"
                                select="$exampledoc/gml:examples/gml:example[@name=$short_name]/gml:example_content"/>
                                <xsl:variable name="example"
                                    select="$examples[position()=number($exampleposition)]"/>
                                    <xsl:if test="string-length(normalize-space($example)) &gt; 0">
                                        <xsl:value-of select="normalize-space($example)"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="print_lt"/>
                                    <xsl:text>!--</xsl:text>
                                    <xsl:choose>
                                        <xsl:when test="gml:element_type/gml:basic_text">
                                            <xsl:text>TEXT</xsl:text>
                                            <xsl:text>(</xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="gml:element_type/gml:basic_text/@lgmin">
                                                    <xsl:value-of select="gml:element_type/gml:basic_text/@lgmin" />
                                                </xsl:when>
                                                <xsl:otherwise>0</xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:text>,</xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="gml:element_type/gml:basic_text/@lgmax">
                                                    <xsl:value-of select="gml:element_type/gml:basic_text/@lgmax" />
                                                </xsl:when>
                                                <xsl:otherwise>N</xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:text>)</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="gml:element_type/gml:basic_key">
                                            <xsl:text>CODE(</xsl:text>
                                            <xsl:value-of select="gml:element_type/gml:basic_key/@ref" />
                                            <xsl:text>)</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="gml:element_type/gml:basic_date">
                                            <xsl:text>DATE</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="gml:element_type/gml:basic_data">
                                            <xsl:text>DATA</xsl:text>
                                        </xsl:when>
                                        <!-- TODO: autres types... -->
                                    </xsl:choose>      
                                    <xsl:text>--</xsl:text>
                                    <xsl:call-template name="print_gt"/>        
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- CLOSING MARK -->
                    <xsl:call-template name="print_lt"/>
                    <xsl:text>/</xsl:text>
                    <xsl:call-template name="print_name_end">
                        <xsl:with-param name="name" select="$current_name"/>
                    </xsl:call-template>
                    <xsl:call-template name="print_gt"/>
                </xsl:template>

            </xsl:stylesheet>
