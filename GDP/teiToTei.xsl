<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <!-- APPLIQUER LA FEUILLE XSL odttoteiPerso.xsl en premier lieu ! (github/stylesheet...) -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@rend"/>
    
    <xsl:template match="tei:hi">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>