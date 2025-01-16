<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" version="5.0" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="title[@type = 'main']">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::title">
      <xsl:text> : </xsl:text>
      <xsl:value-of select="following-sibling::title"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="title[@type = 'sub']" mode="#all"/>

  <xsl:template match="/TEI">
    <html>
      <head>
        <title>
          <xsl:apply-templates select="teiHeader/fileDesc/titleStmt/title[@type = 'main']"/>
          <!--<xsl:value-of select="teiHeader/fileDesc/titleStmt/title[@type='main']"/>          
          <xsl:if test="teiHeader/fileDesc/titleStmt/title[@type='sub']">
            <xsl:v
          </xsl:if>-->
        </title>

        <link href="css/normalize.css" rel="stylesheet"/>
        <link href="css/main.css" rel="stylesheet"/>
      </head>

      <body>
        <nav id="navigation">
          <ul>
            <li>
              <a href="#meta">Informations</a>
            </li>
            <li>
              <a href="#commentaires">Commentaire</a>
            </li>
            <li>
              <a href="#transcription">Transcription</a>
            </li>
            <li>
              <a href="#notes">Notes</a>
            </li>
            <li>
              <a href="#index">Index</a>
            </li>
            <li>
              <a href="#about">?</a>
            </li>
          </ul>
        </nav>

        <header>
          <xsl:apply-templates select="teiHeader/fileDesc" mode="header"/>
        </header>

        <main>
          <section id="commentaires">
            <h2>Commentaires</h2>
            <xsl:apply-templates select="text/body/div[@type = 'commentaires']"/>
          </section>
          <section id="transcription">
            <h2>Transcription</h2>
            <xsl:apply-templates select="text/body/div[@type = 'transcription']"/>
          </section>
          <section id="notes">
            <h2>Notes</h2>
            <xsl:apply-templates select="text/back/div[@type = 'notes']"/>
          </section>
          <section id="index">
            <h2>Index</h2>
            <xsl:apply-templates select="text/back/div[@type = 'indexes']"/>
          </section>
        </main>

        <footer/>
      </body>
    </html>
  </xsl:template>

  <!-- HEAD -->
  <xsl:template match="titleStmt" mode="header">
    <h1>
      <xsl:apply-templates select="title"/>
    </h1>
    <p>
      <xsl:apply-templates select="principal"/>
    </p>
    <p>
      <xsl:for-each select="respStmt">
        <xsl:sort select="name"/>
        <xsl:apply-templates select="name"/>
        <xsl:text> (</xsl:text>
        <xsl:apply-templates select="resp"/>
        <xsl:text>)</xsl:text>
        <xsl:if test="position() != last()">
          <xsl:text>; </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </p>
  </xsl:template>

  <xsl:template match="title[@type = 'main']">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::title"/>
    <xsl:text> : </xsl:text>
    <xsl:value-of select="following-sibling::title"/>
  </xsl:template>

  <xsl:template match="principal">
    <xsl:text>Par : </xsl:text>
    <xsl:apply-templates/>
    <!-- mieux que value-of select pcq prend les règles par défaut pour récupérer le texte -->
  </xsl:template>

  <!-- à faire plus tard -->
  <xsl:template
    match="publicationStmt/* | sourceDesc/msDesc/msIdentifier | sourceDesc/msDesc/physDesc | sourceDesc/msDesc/additional"
    mode="header"/>

  <xsl:template match="sourceDesc/msDesc/msContents" mode="header">
    <p>
      <xsl:text>Résumé : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="*[@ref]">
    <a href="{@ref}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <!-- CORPS -->
  <!-- <xsl:template match="body/div">
    si deux règles s'appliquent à un même élément, la plus spécifique aura priorité
    <article>
      <xsl:apply-templates/>
    </article>
  </xsl:template> -->

  <xsl:template match="body/div/div">
    <div>
      <xsl:if test="@type">
        <xsl:attribute name="class" select="@type"/>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="head">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>

  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="placeName | persName | orgName">
    <span class="{local-name()}">
      <!-- {local-name()} prend le nom de l'attribut, pas sa valeur -->
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="choice/abbr | choice/orig"/>

  <xsl:template match="del">
    <del>
      <xsl:apply-templates/>
    </del>
  </xsl:template>

  <xsl:template match="subst/add">
    <ins>
      <xsl:apply-templates/>
      <xsl:text> </xsl:text>
    </ins>
  </xsl:template>

  <xsl:template match="add">
    <mark>
      <xsl:apply-templates/>
    </mark>
  </xsl:template>

  <xsl:template match="g[@ref = '#paraphe']">
    <xsl:text> </xsl:text>
    <img src="paraphe.jpg" alt="paraphe"/>
  </xsl:template>

  <xsl:template match="hi[@rend = 'super']">
    <sup>
      <xsl:apply-templates/>
    </sup>
  </xsl:template>

  <!-- NOTES -->

  <xsl:template match="note">
    <a href="#note{count(preceding-sibling::note) + 1}">
      <div class="note" id="{@xml:id}">
        <sup>
          <xsl:value-of select="count(preceding-sibling::note) + 1"/>
        </sup>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
      </div>
    </a>
  </xsl:template>


  <xsl:template match="ref">
    <a href="{@target}">
      <xsl:if test="@type = 'note'">
        <sup id="note{count(preceding::ref[@type = 'note']) + 1}">
          <xsl:value-of select="count(preceding::ref[@type = 'note']) + 1"/>
        </sup>
      </xsl:if>
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <!-- INDEX -->

  <!-- index personne -->

  <xsl:template match="listPerson">
    <article class="persons">
      <xsl:apply-templates/>
    </article>
  </xsl:template>

  <xsl:template match="person">
    <div id="{@xml:id}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="persName[@type = 'complete']">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>

  <xsl:template match="persName">
    <p>
      <xsl:text>Nom : </xsl:text>
      <xsl:value-of select="forename"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="nameLink"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="surname"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="roleName"/>
    </p>
  </xsl:template>
  <xsl:template match="sex">
    <p>
      <xsl:text>Genre : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="birth">
    <p>
      <xsl:text>Naissance : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="death">
    <p>
      <xsl:text>Décès : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="occupation">
    <p>
      <xsl:text>Occupation : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="person/note">
    <p>
      <xsl:text>Note : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- index place -->

  <xsl:template match="listPlace">
    <article class="places">
      <xsl:apply-templates/>
    </article>
  </xsl:template>

  <xsl:template match="place">
    <div id="{@xml:id}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="placeName[@type = 'complete']">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>

  <xsl:template match="location/district[@type = 'commune']">
    <p>
      <xsl:text>Commune : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="location/district[@type = 'departement']">
    <p>
      <xsl:text>Département : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="location/region">
    <p>
      <xsl:text>Région : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="location/country">
    <p>
      <xsl:text>Pays : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="location/geo">
    <p>
      <xsl:text>Coordonnées : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="desc">
    <p>
      <xsl:text>Description : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="place/bibl">
    <p>
      <xsl:text>Note : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>



  <!-- BIBLIO -->

  <xsl:template match="listBibl">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="listBibl/bibl">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>




</xsl:stylesheet>
