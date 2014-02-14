<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
			<br/>
			<br/>
			<xsl:apply-templates select="preparation"/>
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
				<xsl:text>  </xsl:text>
				<xsl:value-of select="description/node()"/> 
			</li>
	</xsl:template>
	
	<xsl:template match="preparation">
		<h3> Préparation </h3>
		<em>Durée totale : <xsl:value-of select="@duree"/>mn</em>
		<xsl:apply-templates select="etapes"/>
	</xsl:template>
	
	<xsl:template match="etapes">
		<h4> Etapes </h4>
		<p>
			<xsl:apply-templates select="etape"/>
		</p>
	</xsl:template>
	
	<xsl:template match="etape">
		<br/>
		<em>
			<xsl:value-of select="@type"/>
			<xsl:text> - durée : </xsl:text> <xsl:value-of select="@duree"/> <xsl:text>mn</xsl:text>
		</em>
		<br/>
		<xsl:value-of select="consigne"/>
		<br/>
	</xsl:template>
	
</xsl:stylesheet>
