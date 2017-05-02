<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:param name="bootstrap" select="'css/bootstrap/css/bootstrap.min.css'"/>

	<xsl:template name="gen-user-styles">
		<link href="{concat($PATH2PROJ,$bootstrap)}" rel="stylesheet" type="text/css"/>
		<link href="{concat($PATH2PROJ,'css/api-custom.css')}" type="text/css" rel="stylesheet"/>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' topic/title ')]">
		<div class="page-header">
			<h1>
				<xsl:apply-templates/>
			</h1>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' topic/shortdesc ')]" mode="outofline">
		<div class="well well-sm">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@outputclass, 'smtp-stage')]">
		<kbd class="smtp-stage">
			<xsl:apply-templates/>
		</kbd>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' vs/parameters ')]|
						 *[contains(@class, ' vs/return ')]|
						 *[contains(@class, ' vs/stages ')]|
						 *[contains(@class, ' vs/usage ')]">
		<xsl:variable name="token">
			<xsl:choose>
				<xsl:when test="contains(@class, ' vs/parameters ')">Input</xsl:when>
				<xsl:when test="contains(@class, ' vs/return ')">Output</xsl:when>
				<xsl:when test="contains(@class, ' vs/stages ')">Stages</xsl:when>
				<xsl:otherwise>Usage</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="svg">
			<xsl:call-template name="getVariable">
				<xsl:with-param name="id" select="concat($token,'-svg')"/>
			</xsl:call-template>
		</xsl:variable>
		<section class="vs_params">
			<div class="panel panel-default">
				<h2 class="panel-heading">
					<img src="{concat($PATH2PROJ,'images/',$svg)}"/>
					<xsl:text> </xsl:text>
					<xsl:call-template name="getVariable">
						<xsl:with-param name="id" select="$token"/>
					</xsl:call-template>
				</h2>
				<div class="panel-body">
					<xsl:apply-templates select="*[not(contains(@class, ' topic/title '))]"/>
				</div>
			</div>
		</section>
	</xsl:template>

</xsl:stylesheet>
