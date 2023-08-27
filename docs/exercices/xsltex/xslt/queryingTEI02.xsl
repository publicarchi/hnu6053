<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:strip-space elements="*"/>

    <!-- match the whole TEI document (i.e. '/') and process the tags inside-->
    <xsl:template match="/">
        <html>
            <xsl:apply-templates />
            <p>Num paragraphs : <xsl:value-of select="count(//p)"/></p>
            <p>Num notes : <xsl:value-of select="count(//note)"/></p>
        </html>
    </xsl:template>
    
    <!-- but ignore the <teiHeader> (only process the <text> element) -->
    <xsl:template match="TEI">
       <xsl:apply-templates select="text"/>
     </xsl:template>
    
    <!-- and do the <front> and <body> separately -->
    <xsl:template match="text">
        <h1>Front matter</h1>
        <xsl:apply-templates select="front"/>
        <h1>Body matter</h1>
        <xsl:apply-templates select="body"/>
        <h1>Back matter</h1>
        <xsl:apply-templates select="body"/>
    </xsl:template>
    
    <!-- paragraphs 
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    -->
    
    <!-- paragraphs, w count -->
    <xsl:template match="p">
        <p>
            <xsl:number level="any" count="//div/p" /><xsl:text>:</xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="note">
        <p>
            <xsl:text>note n°</xsl:text><xsl:number level="any" count="//div/note" /><xsl:text>:</xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- div's -->
    <xsl:template match="div">
        <div>
           <h2><xsl:value-of select="head"/></h2>
           <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- suppress a <head> inside a <div>  Why? -->
    <xsl:template match="div/head">
    </xsl:template>
    
    <!-- output  lists -->
    <xsl:template match="list">
        <xsl:choose>
            <xsl:when test="@type='ordered'">
                <ol><xsl:apply-templates/></ol>
            </xsl:when>
            <xsl:when test="@type='unordered'"> 
                <ul><xsl:apply-templates/></ul>
            </xsl:when>
            <xsl:when test="@type='gloss'">
                <dl><xsl:apply-templates/></dl>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- list items are simple -->
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>

</xsl:stylesheet>
