<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  
  <!-- ex01 – création d’une structure HTML -->
  <xsl:template match="/TEI">
    <html>
      <head>
        <title>
          <!-- ex02 – règle pull -->
          <xsl:value-of select="normalize-space(teiHeader/fileDesc/titleStmt/title[1])"/>
        </title>
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
          <!-- ex03 – définir l’ordre de traitement du document -->
          <xsl:apply-templates select="teiHeader/fileDesc/titleStmt"/>
          <xsl:apply-templates select="teiHeader/fileDesc/publicationStmt"/>
        </header>
        <main>
          <section id="image">
          </section>
          <section id="commentaires">
            <xsl:apply-templates select="text/body/div[@type='commentaires']"/>
          </section>
          <section id="transcription">
            <xsl:apply-templates select="text/body/div[@type='transcription']"/>
          </section>
          <section id="notes">
            <xsl:apply-templates select="text/back/div[@type='notes']"/>
          </section>
          <section id="indexes">
            <xsl:apply-templates select="text/back/div[@type='indexes']"/>
          </section>
        </main>
        <footer/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>