<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Titre      : Programme XSLT pour la génération d'un fichier CSV à partir d'un fichier XML/TEI, donnant des informations sur les noms de lieux indexés dans ce fichier
    Auteur     : Florence Clavaud (Ecole nationale des chartes)
    Audience     : participants à la formation sur TEI donnée en mars 2011 à l'Ecole des chartes
    Conditions d'utilisation : licence Creative Commons paternité-pas d'utilisation commerciale-modification autorisée dans les mêmes conditions etc.
    Date      : 13 avril 2011
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output encoding="utf-8" method="text" omit-xml-declaration="yes" indent="no"/>
    <!-- des variables utiles, fin de ligne et tab -->
    <xsl:variable name="lf" select="'&#10;'"/>
    <xsl:variable name="tab" select="'&#9;'"/>
    <xsl:variable name="apos">&apos;</xsl:variable>
    <!--  <xsl:param name="index">placeName</xsl:param>-->
    <xsl:template match="/">
        <!--  <xsl:choose>
            <xsl:when test="$index='persName'">
                <xsl:value-of select="concat('Nom de personne',  $tab)"/>
            </xsl:when>
            <xsl:when test="$index='placeName'">
                <xsl:value-of select="concat('Nom de lieu',  $tab)"/>
            </xsl:when>
            </xsl:choose>-->
        <xsl:value-of select="concat('Nom de lieu',  $tab)"/>
        <xsl:value-of select="concat('Chemin XPath', $tab)"/>
        <xsl:value-of select="concat('Identifiant de la notice d', $apos, 'autorité', $tab)"/>
        <xsl:text>Forme normalisée du nom selon cette notice</xsl:text>
        <xsl:apply-templates select="descendant::tei:placeName[not(ancestor::tei:listPlace)]"/>
    </xsl:template>
    <xsl:template match="tei:placeName">
        <xsl:for-each select=".">
            <xsl:value-of select="$lf"/>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:value-of select="$tab"/>
            <xsl:apply-templates select="parent::*" mode="get-full-path"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="1+count(preceding-sibling::*[local-name()=local-name(current())])"/>
            <xsl:text>]</xsl:text>
            <xsl:value-of select="$tab"/>
            <xsl:choose>
                <xsl:when test="@ref and starts-with(@ref, '#')">
                    <xsl:variable name="not" select="normalize-space(substring-after(@ref, '#'))"/>
                    <xsl:value-of select="$not"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>pas de notice d'autorité liée</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$tab"/>
            <xsl:choose>
                <xsl:when test="@ref and starts-with(@ref, '#')">
                    <xsl:variable name="not" select="normalize-space(substring-after(@ref, '#'))"/>
                    <xsl:value-of
                        select="ancestor::tei:TEI//tei:back//tei:listPlace/tei:place[@xml:id=$not]/tei:placeName[1]"
                    />
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="*" mode="get-full-path">
        <xsl:apply-templates select="parent::*" mode="get-full-path"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="1+count(preceding-sibling::*[local-name()=local-name(current())])"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
</xsl:stylesheet>
