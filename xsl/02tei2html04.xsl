<?xml version="1.0" encoding="UTF-8"?>
<!-- tei2html01.xsl -->
<!-- une feuille de style simpliste -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output omit-xml-declaration="no" indent="yes" method="html" version="5.0"
        encoding="UTF-8" />
    <!--<xsl:output omit-xml-declaration="no" indent="yes" method="xml" encoding="UTF-8"/>-->
    <!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />-->

    <xsl:strip-space elements="*" />

    <!-- création de la structure de la page html (ex001) -->
    <xsl:template match="/">
        <html lang="fr">
            <!-- en-tête html -->
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
                <meta name="viewport"
                    content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
                <title>
                    <!-- TODO écrire une règle (de type pull) pour créer titre de la page (ex002) -->
                    <xsl:value-of
                        select="normalize-space( /TEI/teiHeader/*/titleStmt/title )" />
                    <!-- TODO écrire une règle avec une instruction conditionnelle (xsl:if) pour le sous-titre (ex004) -->
                </title>
                <!-- framework de prototypage semantic -->
                <link
                    href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700|Open+Sans:300italic,400,300,700"
                    rel="stylesheet" type="text/css" />
                <link rel="stylesheet" type="text/css"
                    href="../semantic/packaged/css/semantic.css" />
                <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.js" />
                <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.address/1.6/jquery.address.js" />
                <script src="../semantic/packaged/javascript/semantic.js" />
                <link rel="stylesheet" type="text/css" href="feed.css" />
                <script src="../semantic/examples/feed.js" />
            </head>
            <!-- corps de la page -->
            <body id="feed">
                <!-- menu escamotable -->
                <nav class="ui inverted vertical sidebar menu">
                    
                    <!-- TODO créer les items du menu (ex005) -->
                    <!-- instanciation de la règle pour la table des matières (tdm) -->
                    <!-- utilisation d'un mode pour traiter deux fois cette partie du document -->
                    <a class="item" href="#ancre1">Item 1</a>
                    <a class="item" href="#ancre2">Item 2</a>

                </nav>
                <!-- bouton du menu -->
                <header class="ui inverted menu">
                    <div class="ui left floated black launch button">
                        <i class="list layout icon" /> Menu </div>
                </header>
                <section class="nine wide right column">
                    <header>
                        <h1 class="ui red header">
                            <xsl:value-of
                                select="normalize-space( /TEI/teiHeader/*/titleStmt/title[1] )"
                             />
                        </h1>
                        <xsl:if
                            test="/TEI/teiHeader/*/titleStmt/title[@type='subtitle']">
                            <div class="sub header">
                                <xsl:apply-templates
                                    select="/TEI/teiHeader/*/titleStmt/title[@type='subtitle']"
                                 />
                            </div>
                        </xsl:if>
                        <div class="sub header">
                            <xsl:text> par </xsl:text>
                            <xsl:apply-templates
                                select="/TEI/teiHeader/*/titleStmt/principal" />
                        </div>
                    </header>
                    <xsl:apply-templates select="TEI/text" />
                    <!-- sélectionner TEI/text et appliquer les règles.. -->
                </section>
            </body>
        </html>
    </xsl:template>

    <!-- section pour chaque txt -->
    <xsl:template match="group/text">
        <!-- créer les ids pour le menu 004 -->
        <section id="{@xml:id}">
            <!-- utilisation d'un élément littéral, la partie entre accolades est évaluée -->
            <xsl:apply-templates />
            <!-- application des règles dans l'ordre de parcours -->
        </section>
    </xsl:template>
    
<!-- TODO traiter le front (ex003) -->
    <xsl:template match="front">
        <header id="front">
            <div class="ui horizontal segment" />
            <hgroup class="ui teal inverted segment">
                <h1 class="ui header">
                    <!-- ... -->
                </h1>
                <h2 class="ui header">
                    <!-- ... -->
                </h2>
            </hgroup>
            <div class="ui horizontal segment">
                <!-- ... -->
            </div>
        </header>
        <div class="ui divider" />
        <!-- (pour la décoration) -->
    </xsl:template>
    
    <!-- section pour l'ensemble du document -->
    <xsl:template match="body">
        <section class="text">
            <xsl:apply-templates />
        </section>
        <div class="ui section divider" />
        <!-- (pour la décoration) -->
    </xsl:template>

    <xsl:template match="back">
        <section>
            <h1>Notes de commentaire</h1>
            <xsl:apply-templates select="div[@type='notes']" />
        </section>
        <section>
            <h1>Notes d'édition critique</h1>
            <!-- instanciation du traitement de l'apparat critique  -->
        </section>
    </xsl:template>

    <xsl:template match="listWit/head">
        <h3>
            <xsl:apply-templates />
        </h3>
    </xsl:template>

    <xsl:template match="listWit">
        <ul>
            <xsl:for-each select="witness">
                <li id="{@xml:id}">
                    <xsl:apply-templates select="@xml:id" />
                    <xsl:text> : </xsl:text>
                    <xsl:apply-templates />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="opener/salute">
        <h2>
            <xsl:apply-templates />
        </h2>
    </xsl:template>

    <xsl:template match="p">
        <p id="{@xml:id}">
            <xsl:apply-templates />
        </p>
    </xsl:template>



    <!-- traitement de la table des matières (tdm) -->
    <xsl:template match="group/text" mode="tdm">
        <!-- TODO écrire ici le traitement des items de la table des matière (ex005) -->
        
    </xsl:template>



    <!-- traitement des mots ajoutés -->
    <xsl:template match="supplied">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates />
        <xsl:text>]</xsl:text>
    </xsl:template>

    <!-- traitement des substitution -->
    <xsl:template match="subst">
        <xsl:if test="del">
            <span class="ui blue">
                <xsl:apply-templates select="del" />
            </span>
        </xsl:if>
        <span class="ui red">
            <xsl:apply-templates select="add" />
        </span>
    </xsl:template>

    <!-- TODO traitement des notes de commentaire (ex006) -->
    

    <!-- TODO traitement de l'apparat critique (ex007) -->



    <!-- règle par défaut d'interception des éléments non pris en charge -->
    <!-- cette règle s'applique à un élément si aucune autre instruction spécifique ne le concerne ; elle permet donc de voir ce qui reste à traiter ; pratique !! -->
    <!-- code Florence Clavaud -->
    <xsl:template match="*">
        <span>
            <code style="color:red">
                <!-- Attention ! l'utilisation de css dans l'attribut style n'est pas une bonne pratique -->
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="name()" />
                <xsl:for-each select="@*">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="name()" />
                    <xsl:text>="</xsl:text>
                    <xsl:value-of select="." />
                    <xsl:text>"</xsl:text>
                </xsl:for-each>
                <xsl:text>&gt;</xsl:text>
            </code>
            <xsl:apply-templates />
            <code style="color:red">&lt;/<xsl:value-of select="name()" />&gt;</code>
        </span>
    </xsl:template>

</xsl:stylesheet>
