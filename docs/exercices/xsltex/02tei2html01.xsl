<?xml version="1.0" encoding="UTF-8"?>
<!-- tei2html01.xsl -->
<!-- une feuille de style simpliste -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output omit-xml-declaration="no" indent="yes" method="html" version="5.0"
    encoding="UTF-8"/>
  <!--<xsl:output omit-xml-declaration="no" indent="yes" method="xml" encoding="UTF-8"/>-->
  <!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />-->

  <xsl:param name="commentaires"/>

  <xsl:strip-space elements="*"/>

  <!-- création de la structure de la page html (ex001) -->
  <xsl:template match="/TEI">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="fr" xml:lang="fr">
      <head>
        <meta charset="utf-8"/>
        <title>
          <!-- TODO écrire une règle (de type pull) pour créer titre de la page (ex002) -->
          <!-- TODO écrire une règle avec une instruction conditionnelle (xsl:if) pour le sous-titre (ex004) -->
        </title>
        <meta name="keywords" content="{keywords}"/>
        <link rel="copyright" href="{copyright}"/>
        <link href="css/main.css" rel="stylesheet"/>
        <script src="//code.jquery.com/jquery-2.1.4.min.js"/>
        <!-- ajouter js pour lt IE 9 -->
      </head>
      <!-- corps de la page -->
      <body id="feed">
        <!-- menu -->
        <nav>
          <!-- TODO créer les items du menu (ex005) -->
          <!-- utilisation d'un mode pour traiter deux fois cette partie du document -->
          <ul>
            <li>
              <a href="#metadonnees-textuelles">Informations sur le document</a>
            </li>
            <li>
              <a href="#transcription">Transcription</a>
            </li>
            <li>
              <a href="#notes">Notes historiques</a>
            </li>
            <!-- TODO afficher une entrée commentaire si le paramètre est transmis -->
            <xsl:if test="$commentaires = 'oui'">
              <li>
                <a href="#commentaires">Commentaires</a>
              </li>
            </xsl:if>
            <!--
              <li>
                <a href="#index-personnes">Index des personnes</a>
              </li>
              <li>
                <a href="#index-lieux">Index des lieux</a>
              </li> 
              -->
            <li>
              <a href="#index">Index</a>
            </li>
          </ul>
        </nav>
        <section>
          <header>
            <h1>
              <!-- ... -->
            </h1>
            <div>
              <!-- ... -->
            </div>
            <div>
              <!-- ... -->
            </div>
          </header>
          <!-- ... -->
        </section>
      </body>
    </html>
  </xsl:template>

  <!-- section pour chaque txt -->

  <section id="">
    <!-- ... -->
  </section>


  <section>
    <h1>Notes de commentaire</h1>
  </section>
  <section>
    <h1>Notes d'édition critique</h1>
  </section>


  <!-- règle par défaut d'interception des éléments non pris en charge -->
  <!-- cette règle s'applique à un élément si aucune autre instruction spécifique ne le concerne ; elle permet donc de voir ce qui reste à traiter ; pratique !! -->
  <!-- code Florence Clavaud -->
  <xsl:template match="*">
    <span>
      <code style="color:red">
        <!-- Attention ! l'utilisation de css dans l'attribut style n'est pas une bonne pratique -->
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:for-each select="@*">
          <xsl:text> </xsl:text>
          <xsl:value-of select="name()"/>
          <xsl:text>="</xsl:text>
          <xsl:value-of select="."/>
          <xsl:text>"</xsl:text>
        </xsl:for-each>
        <xsl:text>&gt;</xsl:text>
      </code>
      <xsl:apply-templates/>
      <code style="color:red">&lt;/<xsl:value-of select="name()"/>&gt;</code>
    </span>
  </xsl:template>

</xsl:stylesheet>
