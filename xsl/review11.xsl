<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  version="2.0">
  
  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:variable name="notes" select="/TEI/text/back/div[@type='notes']/note"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:apply-templates select="TEI/teiHeader/fileDesc/titleStmt/title"/>
        </title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <header>
          <xsl:apply-templates select="TEI/teiHeader/fileDesc/titleStmt/title" mode="zone-titre"/>
          <div>
            <h3>Mentions de responsabilités</h3>
            <p>
              <xsl:for-each select="TEI/teiHeader/fileDesc/titleStmt/(principal|respStmt)">
                <xsl:choose>
                  <xsl:when test="./name() = 'principal'">
                    <xsl:apply-templates select="."/>
                    <xsl:text> (éditeur)</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="name"/>
                    <xsl:text> (</xsl:text>
                    <xsl:apply-templates select="resp"/>
                    <xsl:text>)</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="position() != last()">
                  <xsl:text> ; </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </p>
          </div>
        </header>
        
        <main>
          <section class="commentaires">
            <xsl:apply-templates select="TEI/text/body/div[@type='commentaires']"/>
          </section>
          <section class="transcription">
            <xsl:apply-templates select="TEI/text/body/div[@type='transcription']"/>
          </section>
          <section class="notes">
            <xsl:apply-templates select="TEI/text/back/div[@type='notes']/node()"/>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="principal" mode="zone-titre">
    <li>Éditeur : <xsl:apply-templates/></li>
  </xsl:template>
  
  <xsl:template match="respStmt" mode="zone-titre">
    <li>
      <xsl:apply-templates select="resp"/>
      <xsl:text> : </xsl:text>
      <xsl:apply-templates select="name"/>
    </li>
  </xsl:template>
  
  <xsl:template match="titleStmt/title[@type='main']" mode="zone-titre">
    <h1><xsl:apply-templates/></h1>
  </xsl:template>
  
  <xsl:template match="titleStmt/title[@type='sub']" mode="zone-titre">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>
  
  
  <xsl:template match="note">
    <div id="{@xml:id}">
      <sup class="note-call">
        <a href="{concat('#r', @xml:id)}">
          <xsl:value-of select="position()"/>
        </a>
        <xsl:text>. </xsl:text>
      </sup>
      <xsl:choose>
        <xsl:when test="p">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
          <p><xsl:apply-templates/></p>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  
  <xsl:template match="ref">
    <xsl:variable name="note-id" select="substring-after(@target, '#')"/>
    <sup class="note-call" id="{concat('r', $note-id)}">
      <a href="{@target}" 
        title="{$notes[@xml:id=$note-id]}">
        <xsl:value-of select="count(preceding::ref) + 1"/>
      </a>
    </sup>
  </xsl:template>
  
  
  <xsl:template match="div[@type='transcription'] | div[@type='commentaires']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="div">
    <div>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="p">
    <p>
      <xsl:apply-templates select="@ana"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="@ana">
    <xsl:attribute name="class" select="substring-after(., '#')"/>
  </xsl:template>
  
  <xsl:template match="titleStmt/title[@type='main']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="titleStmt/title[@type='sub']">
    <xsl:text> : </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="div/@*">
    <xsl:attribute name="class" select="."/>
  </xsl:template>
  
</xsl:stylesheet>








