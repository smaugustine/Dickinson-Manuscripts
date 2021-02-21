<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" indent="no"/>

  <xsl:template match="tei:TEI">
    <html>
      <body>

        <h3 class="title is-3"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></h3>
        <h4 class="subtitle is-5"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h4>
        
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents"/>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:msContents">
    <p>
      <strong>Summary: </strong><xsl:apply-templates select="tei:summary"/>
    </p>
  </xsl:template>
  
  <xsl:template match="tei:foreign">
    <i>
      <xsl:attribute name="lang">
        <xsl:value-of select="@xml:lang"/>
      </xsl:attribute>
      
      <xsl:apply-templates/>
    </i>
  </xsl:template>

</xsl:stylesheet>
