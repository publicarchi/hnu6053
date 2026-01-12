<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
  
  <xsl:output method="html" version="5" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:apply-templates select="TEI/teiHeader/fileDesc/titleStmt/title"/>
        </title>
      </head>
      <body>
        <main>
          <section>
            <xsl:apply-templates select="/TEI/text/body/div[@type='commentaires']"/>
            <xsl:apply-templates select="/TEI/text/body/div[@type='transcription']"/>
          </section>
          <section>
            <xsl:apply-templates select="/TEI/text/back"/>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>
 
  
  <xsl:template match="div[@type='commentaires']">
    <article class="{@type}">
      <xsl:apply-templates/>
    </article>
  </xsl:template>
  
  <xsl:template match="div[@type='transcription']">
    <article>
      <xsl:attribute name="class" select="@type"/>
      <xsl:apply-templates/>
    </article>
  </xsl:template>
  
  <xsl:template match="p">
    <p><xsl:apply-templates/></p>
  </xsl:template>
  
  <xsl:template match="div">
    <div>
      <xsl:if test="@type">
        <xsl:attribute name="class" select="@type"/>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="choice">
    <xsl:choose>
      <xsl:when test="reg">
        <xsl:apply-templates select="reg"/>
      </xsl:when>
      <xsl:when test="expan">
        <xsl:apply-templates select="expan"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="*[1]"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="subst">
    <del><xsl:apply-templates select="del"/></del>
    <xsl:if test="add">
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="add"/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="abbr"/>
  
  <xsl:template match="orig"/>
  
  
  <xsl:template match="title[@type='main']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="title[@type='sub']">
    <xsl:text> - </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="div[@type='notes']">
    <article class="notes">
      <xsl:apply-templates/>
    </article>
  </xsl:template>
  
  <xsl:template match="note">
    <p id="{@xml:id}">
      <span class="call-note">
        <xsl:value-of select="format-number(number(substring-after(@xml:id, 'n-')), '#')"/>.
      </span>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  
</xsl:stylesheet>