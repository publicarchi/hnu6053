<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/TEI">
    <html>
      <head>
        <title>
          <!-- traiter le titre -->
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
        <header/>
        <main>
          <!-- traiter le contenu de la page -->
        </main>
        <footer/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>