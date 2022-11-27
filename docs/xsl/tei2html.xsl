<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  version="1.0">
  <xsl:output method="html" version="5.0" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="title" select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/>
  <xsl:template match="comment() | processing-instruction()"/>
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="normalize-space($title)"/></title>
        <meta name="author" content="Emmanuel Chateau-Dutier" />
        <link href="css/normalize.css" rel="stylesheet"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
      </head>
      <body>
        <main>
          <header>
            <nav>
              <ul>
                <li><a href="index.html" aria-current="page">Plan de cours</a></li>
                <li><a href="index.html" >HNU6053 Utilisation avancée de la TEI</a></li>
                <li><a href="a-propos/" >À propos</a></li>
              </ul>
            </nav>
          </header>
          <hr/>
          <section>
            <h1><xsl:apply-templates select="$title"/></h1>
            <p class="description">
              <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"></xsl:apply-templates>
              <xsl:text> | </xsl:text>
              <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p/node()"></xsl:apply-templates>
            </p>
            <div>
              <xsl:apply-templates select="/tei:TEI/tei:text" />
            </div>
          </section>
          <footer>
            <nav>
              <ul>
                <li>CC BY-NC-SA Emmanuel Château-Dutier, 2022</li>
              </ul>
            </nav>
          </footer>
        </main>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="tei:front"/>
  <xsl:template match="tei:graphic">
    <img src="{@url}"/>
  </xsl:template>
  <xsl:template match="tei:div">
    <div><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:head">
    <xsl:variable name="pos" select="position() + 1"/>
    <xsl:element name="{concat('h', $pos)}">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="tei:list">
    <ul><xsl:apply-templates/></ul>
  </xsl:template>
  <xsl:template match="tei:item">
    <li><xsl:apply-templates/></li>
  </xsl:template>
  <xsl:template match="tei:foreign">
    <em class="foreign"><xsl:apply-templates/></em>
  </xsl:template>
  <xsl:template match="tei:soCalled">
    <em class="soCalled"><xsl:apply-templates/></em>
  </xsl:template>
  <xsl:template match="tei:emph">
    <em class="emph"><xsl:apply-templates/></em>
  </xsl:template>
  <xsl:template match="tei:quote">
    <blockquote><xsl:apply-templates/></blockquote>
  </xsl:template>
  <xsl:template match="tei:q">
    <xsl:text>« </xsl:text>
    <em class="quote"><xsl:apply-templates/></em>
    <xsl:text> »</xsl:text>
  </xsl:template>
  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>
  <xsl:template match="tei:code">
    <code><xsl:apply-templates/></code>
  </xsl:template>
  <xsl:template match="tei:ident">
    <strong class="ident"><xsl:apply-templates/></strong>
  </xsl:template>
  <xsl:template match="tei:gi | tei:tag">
    <code class="gi"><xsl:apply-templates/></code>
  </xsl:template>
  <xsl:template match="tei:att">
    <code class="att">
      <xsl:text>@</xsl:text>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  <xsl:template match="tei:ref">
    <a title="Lien" href="{@target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  <xsl:template match="tei:hi[@rend='italic']">
    <em><xsl:apply-templates/></em>
  </xsl:template>
  <xsl:template match="tei:hi[@rend='superscript']">
    <sup><xsl:apply-templates/></sup>
  </xsl:template>
  <xsl:template match="tei:hi[@rend='bold']">
    <strong><xsl:apply-templates/></strong>
  </xsl:template>
</xsl:stylesheet>
