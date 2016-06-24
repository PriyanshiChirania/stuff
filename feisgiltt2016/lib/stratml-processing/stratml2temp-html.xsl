<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="sml xs"
    xmlns:sml="http://www.stratml.net" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>dummy title</title>
            </head>
            <body>
                <div id="xyz1xyz">
                    <xsl:for-each select="//sml:Description">
                        <xsl:variable name="number">n<xsl:number level="any"/></xsl:variable>
                        <p id="{$number}">
                            <xsl:apply-templates mode="renameElem"/>
                        </p>
                        <xsl:text>&#xA0;</xsl:text>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template mode="renameElem" match="*">
        <xsl:variable name="attributeValuePairs">
            <xsl:for-each select="@*">
                <xsl:text>@@@delim@@@name:</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>@@@value:</xsl:text>
                <xsl:value-of select="."/>
                <xsl:if test="position() = last()">
                    <xsl:text>@@@delim@@@</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <span xmlns="http://www.w3.org/1999/xhtml" title="{$attributeValuePairs}"
            class="{concat('convert-',name())}">
            <xsl:apply-templates mode="renameElem"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
