<?xml version="1.0" encoding="utf-8"?>
<!--
TODO: scripts pas du tout fini.  
  
GML2PY

Genere une liste de classes permettant de manipuler les donnees en Python.

Copyright 2008 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/">
    <xsl:text>&#10;</xsl:text>
    <xsl:call-template name="preamble" />
    <xsl:apply-templates select=".//gml:definition" />
  </xsl:template>
  
  <xsl:template match="gml:definition[gml:element_type/gml:sequence]">
    <xsl:text>class Element</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> (element):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  """"Sequence"""&#10;</xsl:text>
    <xsl:text>  def __init__(self, attributes={}):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    element.__init__(self, "</xsl:text>
    <xsl:value-of select="@name" />    
    <xsl:text>")</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    self.model=[</xsl:text>
    <xsl:for-each select="gml:element_type/gml:sequence/gml:element">
      <xsl:text>"</xsl:text>
      <xsl:value-of select="@name" />
      <xsl:text>"</xsl:text>
      <xsl:if test="position()!=last()">, </xsl:if>
    </xsl:for-each>
    <xsl:text>]&#10;</xsl:text>
    <xsl:text>    self.content={}&#10;</xsl:text>
    <xsl:text>    for m in self.model:&#10;</xsl:text>
    <xsl:text>      self.content[m]=[]&#10;</xsl:text>
    <xsl:text>    self.attributes=attributes&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>    
  </xsl:template>
  
  <xsl:template match="gml:definition[gml:element_type/gml:choice]">    
    <xsl:text>class Element</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> (element):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  """"Choice"""&#10;</xsl:text>
    <xsl:text>  def __init__(self, attributes={}):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    element.__init__(self, "</xsl:text>
    <xsl:value-of select="@name" />    
    <xsl:text>")</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    self.model={</xsl:text>
    <xsl:for-each select="gml:element_type/gml:choice/gml:choice_element">
      <xsl:text>"</xsl:text>
      <xsl:value-of select="@name" />
      <xsl:text>":True</xsl:text>
      <xsl:if test="position()!=last()">, </xsl:if>
    </xsl:for-each>
    <xsl:text>}&#10;</xsl:text>
    <xsl:text>    self.content=[]&#10;</xsl:text>
    <xsl:text>    self.attributes=attributes&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>    
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:empty]">
    <xsl:text>class Element</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> (element):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  """"empty"""&#10;</xsl:text>
    <xsl:text>  def __init__(self, attributes={}):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    element.__init__(self, "</xsl:text>
    <xsl:value-of select="@name" />    
    <xsl:text>")</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    self.content=None&#10;</xsl:text>
    <xsl:text>    self.attributes=attributes&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>        
  </xsl:template>

  <xsl:template match="gml:definition">
    <xsl:text>class Element</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> (element):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  """"Basic"""&#10;</xsl:text>
    <xsl:text>  def __init__(self, content="", attributes={}):</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    element.__init__(self, "</xsl:text>
    <xsl:value-of select="@name" />    
    <xsl:text>")</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>    self.content=content&#10;</xsl:text>
    <xsl:text>    self.attributes=attributes&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="preamble">
    <xsl:text>
#!/usr/bin/env python
# encoding: utf-8

import sys
import os
import csv
import codecs
import xml.dom.minidom as minidom
from xml.dom import Node
ELEMENT_NODE = Node.ELEMENT_NODE
from cStringIO import StringIO

class element:
  def __init__ (self, balise):
    self.balise = balise

  def printxml (self, indent=""):
    begin=[indent]
    begin.append("&lt;"+self.balise)
    for a,v in self.attributes.iteritems():
      begin.append(" "+a+"=\""+v+"\"")
    end=[indent]
    end.append("&lt;/"+self.balise+"&gt;")
    if self.content:
      if type(self.content)==type([]):
        # choice
        begin.append("&gt;")
        print ''.join(begin).encode('utf-8')
        for c in self.content:
          c.printxml(indent+"  ")
        print ''.join(end).encode('utf-8')
      elif type(self.content)==type({}):
        # sequence
        begin.append("&gt;")
        print ''.join(begin).encode('utf-8')
        for c in self.model:
          if self.content.has_key(c):
            for e in self.content[c]:
              e.printxml(indent+"  ")
        print ''.join(end).encode('utf-8')
      else:
        begin.append("&gt;")
        begin.append(self.content)
        begin.append("&lt;/"+self.balise+"&gt;")
        print ''.join(begin).encode('utf-8')        
    else:
      begin.append("/&gt;")
      print ''.join(begin).encode('utf-8')
      
</xsl:text>
  </xsl:template>
</xsl:stylesheet>