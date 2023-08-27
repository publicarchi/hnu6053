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
                    <xsl:value-of select="TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/title[1]"/>
                    <xsl:if test="TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/title[2]">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/title[2]"/>
                    </xsl:if>
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
                    <xsl:apply-templates select="//text"/>
                </section>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="div">
        <article>
            <xsl:apply-templates/>
        </article>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    

    <!-- section pour chaque txt -->
    
        <section id="">
            <!-- ... -->
        </section>
    
        
    <!-- section pour l'ensemble du document -->
    
        <section class="text">
            
        </section>
        <div class="ui section divider" />
        <!-- (pour la décoration) -->
    

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
