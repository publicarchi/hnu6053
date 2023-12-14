<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="title[@type='main']">
    <title>
      <xsl:value-of select="."/>
      <xsl:if test="following-sibling::title">
        <xsl:text> : </xsl:text>
        <xsl:value-of select="following-sibling::title"/>
      </xsl:if>
    </title>
  </xsl:template>
  
  <xsl:template match="title[@type='sub']"/>

  <xsl:template match="/TEI">
    <html>
      <head>
        
          <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/title[@type='main']"/>
          <!--<xsl:value-of select="teiHeader/fileDesc/titleStmt/title[@type='main']"/>          
          <xsl:if test="teiHeader/fileDesc/titleStmt/title[@type='sub']">
            <xsl:v
          </xsl:if>-->
          
        <link href="css/normalize.css" rel="stylesheet"/>
        <link href="css/main.css" rel="stylesheet"/>
      </head>
      <body>
        <nav id="navigation">
          <ul>
            <li><a href="#meta">Informations</a></li>
            <li><a href="#commentaires">Commentaire</a></li>
            <li><a href="#transcription">Transcription</a></li>
            <li><a href="#notes">Notes</a></li>
            <li><a href="#index">Index</a></li>
            <li><a href="#about">?</a></li>
          </ul>
        </nav>
        <header>
          <xsl:apply-templates select="teiHeader/fileDesc/titleStmt"/>
        </header>
        <main>
          <section id="commentaires">
            <xsl:apply-templates select="text/body/div[@type='commentaires']"/>
          </section>
          <section id="transcription">
            <xsl:apply-templates select="text/body/div[@type='transcription']"/>
          </section>
          <section id="notes">
            <xsl:apply-templates select="text/back/div[@type='notes']"/>
          </section>
          <section id="index">
            <xsl:apply-templates select="text/back/div[@type='indexes']"/>
          </section>
        </main>
        <footer/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="respStmt">
    <xsl:for-each select="respStmt">
      
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>