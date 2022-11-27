<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fct="factoton"
    xmlns:file="http://expath.org/ns/file" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" expand-text="yes"
    version="3.0">
    <xsl:output indent="yes" method="xml" encoding="UTF-8" omit-xml-declaration="yes" />
    <xsl:strip-space elements="*" />
    <xsl:mode on-no-match="shallow-copy" />

    <xsl:template match="/">
        <xsl:variable name="dir" select="doc('../index.xml')" />
        <xsl:result-document href="./test.xml">
            <xsl:variable name="result" select="transform(map{
                'stylesheet-location' : './tei2html.xsl', 
                'source-node' : $dir }
                )"/>
            <xsl:sequence select="$result?*"/>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:function name="fct:getPaths" as="item()*">
        <xsl:sequence select="unparsed-text('index.xml')" />
    </xsl:function>
</xsl:stylesheet>
