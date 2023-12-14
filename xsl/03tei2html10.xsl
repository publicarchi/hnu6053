<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/TEI">
    <html>
      <head>
        <title> </title>
        <link href="main.css" rel="stylesheet"/>
        <meta name="keywords" content="{keywords}"/>
        <link rel="copyright" href="{copyright}"/>
      </head>
      <body>
        <nav/>
        <header/>
        <main/>
        <footer/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>