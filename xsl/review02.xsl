<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  version="2.0">
  
  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:for-each select="TEI/teiHeader/fileDesc/titleStmt/title">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()">
              <xsl:text> : </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </title>
      </head>
      <body>
        <main>
          
          <xsl:apply-templates select="TEI/text/body"/>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>