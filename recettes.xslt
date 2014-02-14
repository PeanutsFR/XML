<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
		<html>
			<body>
				<h1>Recettes</h1>
				<div>
				<xsl:apply-templates/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="recette">
		<div>
			<h2>
				<xsl:value-of select="titre/@id"/>
			</h2>
			<em>
				<xsl:value-of select="auteur"/>
			</em>
			<br/>
			<br/>
			<xsl:element name="img">
              <xsl:attribute name="src">
                <xsl:value-of select="photo"/>
              </xsl:attribute>
              <xsl:attribute name="align">center</xsl:attribute>
            </xsl:element>
            <br/>
			<br/>
			<xsl:apply-templates select="ingredients"/>
		</div>
	</xsl:template>
	
	<xsl:template match="ingredients">
		<h3> Ingrédients </h3>
			<ul>
				<xsl:apply-templates select="ingredient"/>
			</ul>
	</xsl:template>
	
	<xsl:template match="ingredient">
			<li> 
				<xsl:value-of select="qt/node()"/>
				<xsl:value-of select="description/node()"/> 
			</li>
	</xsl:template>
	
	<xsl:template match="/recette/etapes">
		<h3> Etapes </h3>
	</xsl:template>
	
</xsl:stylesheet>
