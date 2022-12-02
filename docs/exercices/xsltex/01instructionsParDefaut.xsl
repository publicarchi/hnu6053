<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- les instructions par défaut appliquées par un processeur XSLT lorsqu'il ne rencontre pas de règle applicable ; elles sont écrites ici pour mémoire,il est totalement inutile de les inclure dans
une XSLT -->    
    <xsl:template match="* | /">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="text() | @*">
        <xsl:value-of select="." />
    </xsl:template>
    <xsl:template match="comment() | processing-instruction()" />
 </xsl:stylesheet>
<!--
Question 
1. que se passe-t-il si on ajoute ici : `<xsl:template match="p" />`
2. pourquoi cette XSLT ne traite-t-elle aucun attribut XSLT ?
-->