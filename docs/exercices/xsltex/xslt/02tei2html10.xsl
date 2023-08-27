<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Titre      : Programme XSLT pour la transformation en XHTML simple de fichier TEI réalisé à partir de manuscrits
Auteur     : Florence Clavaud (Ecole nationale des chartes), Augmenté par Emmanuel Chateau
Audience     : participants à la formation sur TEI donnée an mars 2011 à l'Ecole des chartes
Conditions d'utilisation : licence Creative Commons paternité-pas d'utilisation commerciale-modification autorisée dans les mêmes conditions etc.
Date      : 10 mars 2011, relecture 12 avril 2011, adaptation xslt2 mai 2015
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output omit-xml-declaration="no" indent="yes" method="html" version="5.0" encoding="UTF-8"/>
  <!--<xsl:output omit-xml-declaration="no" indent="yes" method="xml" encoding="UTF-8"/>-->
  <!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />-->

  <xsl:strip-space elements="*"/>

  <xsl:param name="commentaires"/>
  <xsl:template match="comment() | processing-instruction()"/>
  <xsl:template match="/TEI">
    <!-- on génère le squelette de la page HTML -->
    <html>
      <!-- métadonnées simples. Pourraient être complétées pour générer des balises meta en établissant une correspondance avec le modèle Dublin Core -->
      <head>
        <title>
          <xsl:value-of select="normalize-space(//titleStmt/title[1])"/>
          <xsl:if test="//titleStmt/title[@type = 'complement']">
            <xsl:value-of select="concat(' : ', //titleStmt/title[@type = 'complement'])"/>
          </xsl:if>
        </title>
        <link rel="stylesheet" type="text/css" href="acteRoyal.css"/>
        <meta name="keywords" content="{keywords}"/>
        <link rel="copyright" href="{copyright}"/>
        <link href="css/main.css" rel="stylesheet"/>
        <script src="//code.jquery.com/jquery-2.1.4.min.js"/>
        <!-- ajouter js pour lt IE 9 -->
      </head>
      <!-- le corps de la page -->
      <body>
        <!-- une colonne à gauche, pour l'en-tête et l'image -->
        <div id="gauche">
          <div id="header">
            <!-- cette colonne ne contiendra que les informations bibliographiques -->
            <xsl:apply-templates select="teiHeader/fileDesc/titleStmt"/>
            <xsl:apply-templates select="teiHeader/fileDesc/publicationStmt"/>
          </div>
          <!-- on va placer les images numériques ici, ce n'est pt-être pas l'idéal, mais il y a de la place à cet endroit et on veut rester simple -->
          <div id="images">
            <img src="{descendant::div[@type='transcription']/@facs}" alt="O/1/284 n° 525, page 1" width="90%"/>
          </div>
        </div>
        <!-- une autre colonne, elle-même scindée en plusieurs parties, pour la table des matières, les métas du document, la transcription, etc. -->
        <div id="droite">
          <div id="tdm">
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
              <xsl:if test="$commentaires = 'oui'">
                <li>
                  <a href="#commentaires">Commentaires</a>
                </li>
              </xsl:if>
              <!--<li>
        <a href="#index-personnes">Index des personnes</a>
       </li>
       <li>
        <a href="#index-lieux">Index des lieux</a>
        </li>-->
              <li>
                <a href="#index">Index</a>
              </li>
            </ul>
          </div>
          <div id="body">
            <!-- cette colonne présente toute la substance composant l'édition du manuscrit, notes incluses -->
            <div id="metadonnees">
              <hr/>
              <xsl:apply-templates select="teiHeader/fileDesc/sourceDesc"/>
              <xsl:apply-templates select="teiHeader/encodingDesc/classDecl"/>
            </div>
            <div id="transcription">
              <hr/>
              <h2>Transcription</h2>
              <xsl:apply-templates select="text/body/div[@type = 'transcription']"/>
              <p>
                <a href="#tdm">Retour au début</a>
              </p>
            </div>
            <div id="notes">
              <hr/>
              <xsl:apply-templates select="text/back/div[@type = 'notes']"/>
              <p>
                <a href="#tdm">Retour au début</a>
              </p>
            </div>
            <xsl:if test="$commentaires = 'oui'">
              <div id="commentaires">
                <hr/>
                <h2>Commentaires</h2>
                <xsl:apply-templates select="text/body/div[@type = 'commentaires']"/>
                <p>
                  <a href="#tdm">Retour au début</a>
                </p>
              </div>
            </xsl:if>
          </div>
          <div id="index">
            <hr/>
            <h2>Index</h2>
            <!-- les index ou plutôt fichiers d'autorité -->
            <xsl:apply-templates select="text/back/div[@type = 'indexes']"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- LES INFOS D'EN-TETE -->
  <xsl:template match="titleStmt">
    <div class="titleStmt">
      <p class="docTitle">
        <xsl:apply-templates select="title[1]"/>
      </p>
      <!-- A REVOIR -->
      <xsl:if test="author">
        <p class="author">
          <xsl:apply-templates select="author"/>
        </p>
      </xsl:if>
      <xsl:if test="principal">
        <p class="principal">
          <xsl:apply-templates select="principal"/>
        </p>
      </xsl:if>
      <xsl:if test="respStmt">
        <p class="respStmt">
          <span class="libelle">Contributeurs : </span>
          <xsl:for-each select="respStmt">
            <span class="respStmt">
              <xsl:apply-templates select="name"/>
              <xsl:apply-templates select="resp"/>
            </span>
            <xsl:if test="position() != last()">
              <xsl:text> ; </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </p>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- dans le div spécifié ci-dessus, un paragraphe pour le titre, un autre pour l'auteur principal, un autre pour les responsabilités secondaires -->
  <xsl:template match="title[1]">
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::title[@type = 'complement']">
      <xsl:value-of select="concat(' : ', normalize-space(following-sibling::title[@type = 'complement']))"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="principal | titleStmt/author">
    <xsl:text>Par </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="respStmt/name">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="resp">
    <xsl:value-of select="concat(' (', ., ')')"/>
  </xsl:template>
  <xsl:template match="publicationStmt">
    <div class="publicationStmt">
      <p>
        <xsl:apply-templates select="publisher"/>
        <xsl:apply-templates select="address"/>
        <xsl:apply-templates select="date"/>
      </p>
    </div>
  </xsl:template>
  <xsl:template match="publisher">
    <span class="publisher">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="address">
    <!-- si on ne veut pas que l'adresse de l'organisme responsable de la publication figure dans la sortie, il suffit de mettre le contenu de cette règle en commentaire, pour qu'elle soit vide -->
    <xsl:text> (</xsl:text>
    <xsl:apply-templates select="addrLine"/>
    <xsl:text>). </xsl:text>
  </xsl:template>
  <xsl:template match="publicationStmt/date">
    <span class="libelle">Date de publication : </span>
    <span class="date">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="addrLine">
    <xsl:apply-templates/>
    <xsl:if test="position() != last()">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>
  <!-- LES METAS DU DOCUMENT -->
  <xsl:template match="sourceDesc">
    <div class="sourceDesc">
      <xsl:apply-templates select="msDesc/msIdentifier"/>
      <xsl:apply-templates select="msDesc/msContents"/>

      <xsl:apply-templates select="msDesc/physDesc"/>
      <!-- à compléter éventuellement -->
    </div>
  </xsl:template>
  <xsl:template match="msIdentifier">
    <p class="msIdentifier">
      <!-- les instructions ne sont pas génériques, mais ça ira pour les 2 documents TEI -->
      <xsl:value-of select="concat(institution, ' - ', repository, ' (', country, ') : ', collection, ', ', idno)"/>
    </p>
  </xsl:template>
  <xsl:template match="msContents">
    <div class="msContents">
      <!-- <p class="msContents">-->
      <xsl:apply-templates/>
      <!-- </p>-->
    </div>
  </xsl:template>
  <xsl:template match="physDesc">
    <div class="physDesc">
      <!-- <p class="msContents">-->
      <xsl:apply-templates/>
      <!-- </p>-->
    </div>
  </xsl:template>

  <xsl:template match="summary">
    <p class="summary">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="textLang">
    <p class="textLang">
      <xsl:text>Langue du document : </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="objectDesc">
    <p class="objectDesc">
      <xsl:apply-templates select="descendant::material"/>
      <xsl:text>, </xsl:text>
      <xsl:apply-templates select="descendant::dimensions"/>
      <xsl:text> ; </xsl:text>
      <xsl:apply-templates select="descendant::condition"/>
    </p>
  </xsl:template>
  <xsl:template match="dimensions">
    <xsl:value-of select="concat('larg. ', width, ' x haut. ', height, ' ', @unit)"/>
  </xsl:template>
  <xsl:template match="handDesc">
    <p class="label">Description des mains :</p>
    <ul>
      <xsl:for-each select="handNote">
        <li>
          <xsl:apply-templates/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="additions">
    <p class="additions">
      <!-- <span class="label">Additions : </span>-->
      <xsl:for-each select="p">
        <xsl:apply-templates/>
        <xsl:if test="position() != last()">
          <xsl:text> </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </p>
  </xsl:template>

  <xsl:template match="classDecl">
    <!-- todo -->
  </xsl:template>
  <!-- TRANSCRIPTION -->
  <xsl:template match="div[@type = 'transcription']">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="div[@type = 'transcription']/div">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="div[@type = 'transcription']/div/p">
    <p>
      <xsl:if test="@ana">
        <xsl:attribute name="class">
          <xsl:value-of select="substring-after(@ana, '#')"/>
        </xsl:attribute>
        <!-- pour afficher une étiquette devant chacune des réponses du roi :<xsl:choose>
     <xsl:when test="@ana='#ord'">
      <span class="label">Réponse : </span>
     </xsl:when>
     <xsl:otherwise/>
    </xsl:choose>-->
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="subst">
    <span class="subst">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="del">
    <!--  <span class="del">
   <xsl:apply-templates/>
   </span>-->
    <xsl:element name="span">
      <xsl:attribute name="class">
        <!-- ici on utilise la fonction XPath local-name qui renvoie le nom de l'élément courant sans son préfixe -->
        <xsl:value-of select="local-name()"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="add">
    <span>
      <xsl:attribute name="class">
        <xsl:text>add</xsl:text>
        <xsl:if test="@hand">
          <xsl:value-of select="concat('-hand', substring-after(@hand, '#'))"/>
        </xsl:if>
        <xsl:if test="@place">
          <xsl:value-of select="concat(' ', normalize-space(@place))"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="lb">
    <!-- retours à la ligne dans la page Web, chaque fois qu'il y a un changement de ligne dans le manuscrit <br/>-->
    <br/>
  </xsl:template>
  <xsl:template match="ex">
    <xsl:value-of select="concat('(', normalize-space(.), ')')"/>
  </xsl:template>
  <xsl:template match="expan">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="abbr | am | reg"/>
  <xsl:template match="hi">
    <xsl:choose>
      <xsl:when test="@rend = 'super'">
        <sup>
          <xsl:apply-templates/>
        </sup>
      </xsl:when>
      <xsl:when test="@rend = 'bigger'">
        <xsl:apply-templates/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="quote">
    <xsl:text>« </xsl:text>
    <xsl:apply-templates/>
    <xsl:text> »</xsl:text>
  </xsl:template>
  <xsl:template match="seg">
    <span>
      <xsl:attribute name="class">
        <xsl:text>seg</xsl:text>
        <xsl:if test="@type">
          <xsl:value-of select="concat(' ', @type)"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="g">
    <xsl:if test="@ref = '#paraphe'">
      <xsl:text> (paraphe)</xsl:text>
      <!-- <xsl:value-of select="@rend"/> -->
    </xsl:if>
  </xsl:template>
  <xsl:template match="div[@type = 'transcription']//persName">
    <span class="persName">
      <xsl:choose>
        <xsl:when test="@ref[starts-with(., '#')]">
          <xsl:variable name="monRef">
            <xsl:value-of select="substring-after(@ref, '#')"/>
          </xsl:variable>
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="normalize-space(@ref)"/>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of
                select="normalize-space(ancestor::text/back//listPerson/person[@xml:id = $monRef]/persName[@type = 'complete'])"/>
            </xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>
  <xsl:template match="div[@type = 'transcription']//placeName | summary//placeName">
    <span class="placeName">
      <xsl:choose>
        <xsl:when test="@ref[starts-with(., '#')]">
          <xsl:variable name="monRef">
            <xsl:value-of select="substring-after(@ref, '#')"/>
          </xsl:variable>
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="normalize-space(@ref)"/>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of
                select="normalize-space(ancestor::TEI//back//listPlace/place[@xml:id = $monRef]/placeName[@type = 'complete'])"/>
            </xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>
  <xsl:template match="ref">
    <xsl:choose>
      <xsl:when test="@type = 'note'">
        <xsl:variable name="monRef" select="substring-after(@target, '#')"/>
        <sup>
          <a href="{@target}">
            <xsl:attribute name="title">
              <xsl:value-of select="normalize-space(ancestor::text/back//div[@type = 'notes']/note[@xml:id = $monRef])"/>
            </xsl:attribute>
            <xsl:value-of select="count(preceding::ref[@type = 'note']) + 1"/>
          </a>
        </sup>
      </xsl:when>
      <xsl:otherwise>
        <a href="{@target}">
          <xsl:apply-templates/>
        </a>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  <!-- NOTES -->
  <xsl:template match="div[@type = 'notes']">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="note">
    <p class="note">
      <xsl:attribute name="id">
        <xsl:value-of select="normalize-space(@xml:id)"/>
      </xsl:attribute>
      <span class="numero">
        <!--<xsl:value-of select="format-number(substring-after(@xml:id, '-'), '#')"/>-->
        <xsl:value-of select="substring-after(@xml:id, '-')"/>
        <!-- <xsl:value-of select="count(preceding-sibling::note) + 1"/> -->
        <xsl:text>. </xsl:text>
      </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <!-- FICHES D'AUTORITE -->
  <xsl:template match="div[@type = 'indexes']">
    <div class="index-list" id="index-personnes">
      <xsl:apply-templates select="listPerson"/>
      <p>
        <a href="#tdm">Retour au début</a>
      </p>
    </div>
    <div class="index-list" id="index-lieux">
      <xsl:apply-templates select="listPlace"/>
      <p>
        <a href="#tdm">Retour au début</a>
      </p>
    </div>
  </xsl:template>
  <xsl:template match="listPerson">
    <h3>Index des personnes</h3>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="listPlace">
    <h3>Index des lieux</h3>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="person">
    <p class="person">
      <xsl:attribute name="id">
        <xsl:value-of select="@xml:id"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="place">
    <p class="place">
      <xsl:attribute name="id">
        <xsl:value-of select="@xml:id"/>
      </xsl:attribute>
      <xsl:apply-templates select="placeName"/>
      <br/>
      <xsl:apply-templates select="desc"/>
      <br/>
      <xsl:apply-templates select="note | bibl"/>
    </p>
  </xsl:template>
  <xsl:template match="person/persName[@type = 'complete']">
    <span class="entree">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
    </span>
    <br/>
  </xsl:template>
  <xsl:template match="person/persName[not(@type)]"/>
  <xsl:template match="place/placeName[not(@type)]"/>
  <xsl:template match="birth | death | sex"/>
  <xsl:template match="occupation">
    <span class="occupation">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="person/note">
    <br/>
    <span class="note">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="place/placeName[@type = 'complete']">
    <span class="entree">
      <xsl:apply-templates/>
      <xsl:apply-templates select="following-sibling::location"/>
      <xsl:text>. </xsl:text>
    </span>

  </xsl:template>
  <xsl:template match="location">
    <xsl:text> (</xsl:text>
    <xsl:if test="settlement[@type = 'commune']">
      <xsl:apply-templates select="settlement[@type = 'commune']"/>
      <xsl:if test="following-sibling::*">
        <xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:if test="district[@type = 'departement']">
      <xsl:apply-templates select="district[@type = 'departement']"/>
      <xsl:if test="following-sibling::*">
        <xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:if test="region">
      <xsl:apply-templates select="region"/>
      <xsl:if test="following-sibling::*">
        <xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:if test="country">
      <xsl:apply-templates select="country"/>
    </xsl:if>
    <xsl:text>).</xsl:text>
    <xsl:if test="geo">
      <br/>
      <span class="geo">
        <xsl:text>Coordonnées géographiques : </xsl:text>
        <xsl:value-of select="concat('lat. ', substring-before(geo, ' '), ', long. ', substring-after(geo, ' '))"/>
      </span>
    </xsl:if>
  </xsl:template>
  <xsl:template match="desc">

    <span class="desc">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <!-- COMMENTAIRES -->
  <xsl:template match="div[@type = 'commentaires']">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="div[@type = 'commentaires']/div">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="head">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>
  <xsl:template match="div[@type = 'commentaires']//p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="div[@type = 'commentaires']//listBibl">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="listBibl/bibl">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <xsl:template match="bibl//title">
    <span class="title">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="bibl//surname">
    <span class="surname">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
</xsl:stylesheet>
