<?xml version="1.0" encoding="UTF-8"?>
<!-- http://www.techrepublic.com/article/create-a-graphic-representation-of-any-xml-document-using-svg/ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"
        doctype-public="text/svg"/>
    <xsl:param name="offsetY" select="10"/>
    <xsl:param name="rectX" select="7"/>
    <xsl:param name="rectY" select="5"/>
    <xsl:param name="rectStroke" select="'black'"/>
    <xsl:param name="rectStrokeWidth" select="1"/>
    <xsl:param name="lineStroke" select="'black'"/>
    <xsl:param name="lineStrokeWidth" select="1"/>
    <xsl:param name="textY" select="16"/>
    <xsl:param name="fontFamily" select="'tahoma'"/>
    <xsl:param name="fontSize" select="10"/>
    <xsl:param name="fontWeight" select="'bold'"/>
    <xsl:template match="/">
        <svg xmlns:svg="http://www.w3.org/2000/svg">
            <xsl:comment>SVG tree generated from XML using tree.xslt</xsl:comment>
            <xsl:attribute name="width">100%</xsl:attribute>
            <xsl:attribute name="height">100%</xsl:attribute>
            <xsl:element name="defs">
                <xsl:comment>Shape definition(s)</xsl:comment>
                <xsl:call-template name="rect"/>
                <xsl:comment>Text definition(s)</xsl:comment>
                <xsl:apply-templates mode="text"/>
                <xsl:comment>Graphic definition(s)</xsl:comment>
                <xsl:apply-templates mode="rect"/>
            </xsl:element>
            <xsl:element name="g">
                <xsl:comment>Graphic reference(s)</xsl:comment>
                <xsl:apply-templates select="*" mode="g">
                    <xsl:with-param name="offsetLeft" select="0"/>
                    <xsl:with-param name="offsetRight" select="100"/>
                    <xsl:with-param name="parentX" select="0"/>
                    <xsl:with-param name="parentY" select="0"/>
                </xsl:apply-templates>
            </xsl:element>
        </svg>
    </xsl:template>
    <xsl:template match="*" mode="text">
        <xsl:apply-templates select="." mode="def_text"/>
        <xsl:if test="count(./child::*) != 0">
            <xsl:apply-templates mode="text"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*" mode="rect">
        <xsl:apply-templates select="." mode="def_g"/>
        <xsl:if test="count(./child::*) != 0">
            <xsl:apply-templates mode="rect"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="rect">
        <xsl:element name="rect">
            <xsl:attribute name="x">0</xsl:attribute>
            <xsl:attribute name="y">0</xsl:attribute>
            <xsl:attribute name="width">
                <xsl:value-of select="concat(string($rectX),'%')"/>
            </xsl:attribute>
            <xsl:attribute name="height">
                <xsl:value-of select="concat(string($rectY),'%')"/>
            </xsl:attribute>
            <xsl:attribute name="rx">5</xsl:attribute>
            <xsl:attribute name="ry">5</xsl:attribute>
            <xsl:attribute name="fill">white</xsl:attribute>
            <xsl:attribute name="stroke">
                <xsl:value-of select="$rectStroke"/>
            </xsl:attribute>
            <xsl:attribute name="stroke-width">
                <xsl:value-of select="$rectStrokeWidth"/>
            </xsl:attribute>
            <xsl:attribute name="id">rect</xsl:attribute>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*" mode="def_text">
        <xsl:element name="text">
            <xsl:attribute name="font-family">
                <xsl:value-of select="$fontFamily"/>
            </xsl:attribute>
            <xsl:attribute name="font-size">
                <xsl:value-of select="$fontSize"/>
            </xsl:attribute>
            <xsl:attribute name="font-weight">
                <xsl:value-of select="$fontWeight"/>
            </xsl:attribute>
            <xsl:attribute name="style">text-anchor: middle</xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="concat('t',string(generate-id(.)))"/>
            </xsl:attribute>
            <xsl:value-of select="name(.)"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*" mode="def_g">
        <xsl:element name="g">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('g',string(generate-id(.)))"/>
            </xsl:attribute>
            <xsl:element name="use">
                <xsl:attribute name="xlink:href">#rect</xsl:attribute>
                <xsl:attribute name="x">0</xsl:attribute>
                <xsl:attribute name="y">0</xsl:attribute>
            </xsl:element>
            <xsl:element name="use">
                <xsl:attribute name="xlink:href">
                    <xsl:value-of select="concat('#t',string(generate-id(.)))"/>
                </xsl:attribute>
                <xsl:attribute name="x">
                    <xsl:value-of select="concat(string($rectX div 2),'%')"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="$textY"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*" mode="g">
        <xsl:param name="offsetLeft"/>
        <xsl:param name="offsetRight"/>
        <xsl:param name="parentX"/>
        <xsl:param name="parentY"/>
        <xsl:variable name="width" select="$offsetRight - $offsetLeft"/>
        <xsl:variable name="center" select="$width div 2"/>
        <xsl:variable name="ancestors" select="count(./ancestor::*)"/>
        <xsl:variable name="preceding" select="count(./preceding-sibling::*)"/>
        <xsl:variable name="following" select="count(./following-sibling::*)"/>
        <xsl:variable name="siblings" select="$preceding + $following + 1"/>
        <xsl:variable name="area" select="$width div $siblings"/>
        <xsl:variable name="x">
            <xsl:choose>
                <xsl:when test="$preceding = $following">
                    <xsl:choose>
                        <xsl:when test="$parentX = 0">
                            <xsl:value-of select="$center - $rectX div 2"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$parentX"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$area * ($preceding + 0.5) + $offsetLeft"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="y" select="($ancestors + 1) * $offsetY"/>
        <xsl:element name="use">
            <xsl:attribute name="xlink:href">
                <xsl:value-of select="concat('#g',string(generate-id(.)))"/>
            </xsl:attribute>
            <xsl:attribute name="x">
                <xsl:value-of select="concat(string($x),'%')"/>
            </xsl:attribute>
            <xsl:attribute name="y">
                <xsl:value-of select="concat(string($y),'%')"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:call-template name="line">
            <xsl:with-param name="x" select="$x"/>
            <xsl:with-param name="y" select="$y"/>
            <xsl:with-param name="parentX" select="$parentX"/>
            <xsl:with-param name="parentY" select="$parentY"/>
        </xsl:call-template>
        <xsl:if test="count(./child::*) != 0">
            <xsl:apply-templates mode="g">
                <xsl:with-param name="offsetLeft" select="$x - $area div 2"/>
                <xsl:with-param name="offsetRight" select="$x + $area div 2"/>
                <xsl:with-param name="parentX" select="$x"/>
                <xsl:with-param name="parentY" select="$y"/>
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>
    <xsl:template name="line">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <xsl:param name="parentX"/>
        <xsl:param name="parentY"/>
        <xsl:if test="($parentX + $parentY) != 0">
            <xsl:comment>
                          <xsl:value-of select="concat('Line from (',string($parentX),'%,',string($parentY),'%) to (',string($x),'%,',string($y),'%).')"/>
                   </xsl:comment>
            <xsl:element name="line">
                <xsl:attribute name="x1">
                    <xsl:value-of select="concat(string($parentX + $rectX div 2),'%')"
                    />
                </xsl:attribute>
                <xsl:attribute name="y1">
                    <xsl:value-of select="concat(string($parentY + $rectY),'%')"/>
                </xsl:attribute>
                <xsl:attribute name="x2">
                    <xsl:value-of select="concat(string($x + $rectX div 2),'%')"/>
                </xsl:attribute>
                <xsl:attribute name="y2">
                    <xsl:value-of select="concat(string($y),'%')"/>
                </xsl:attribute>
                <xsl:attribute name="stroke">
                    <xsl:value-of select="$lineStroke"/>
                </xsl:attribute>
                <xsl:attribute name="stroke-width">
                    <xsl:value-of select="$lineStrokeWidth"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
