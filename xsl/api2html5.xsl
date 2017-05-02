<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="gen-user-styles">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css"/>
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet" type="text/css"/>
		<link href="{concat($PATH2PROJ,$bootstrap)}" rel="stylesheet" type="text/css"/>
		<link href="{concat($PATH2PROJ,'css/api-custom.css')}" type="text/css" rel="stylesheet"/>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/apiref ')]/*[contains(@class, ' topic/title ')]">
		<div class="page-header">
			<h1>
				<!-- Combine HTTP Verb and resource for title -->
				<xsl:apply-templates select="//*[contains(@class, ' rest-api/verb ')]" mode="title"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="//*[contains(@class, ' rest-api/resource ')]" mode="title"/>
			</h1>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/request ')]">
		<section role="section" class="request container-fluid">
			<xsl:apply-templates/>
		</section>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/response ')]">
		<section role="section" class="response container-fluid">
			<h2>Response</h2>
			<xsl:apply-templates/>
		</section>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/verb ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/resource ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/resource ')]" mode="title">
		<span class="ph code codeph"><xsl:apply-templates/></span>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/verb ')]" mode="title">
		<button>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test=". = 'GET'">btn btn-success</xsl:when>
					<xsl:when test=". = 'POST'">btn btn-primary</xsl:when>
					<xsl:when test=". = 'PUT'">btn btn-info</xsl:when>
					<xsl:when test=". = 'DELETE'">btn btn-banger</xsl:when>
					<xsl:when test=". = 'DEL'">btn btn-danger</xsl:when>
					<xsl:otherwise>btn btn-default</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates/>
		</button>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/headers ')]">
		<div class="row">
			<div class="col-md-2">
				<h4>Headers</h4>
			</div>
			<div class="col-md-10">
				<xsl:apply-templates/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/apiref ')]//*[contains(@class, ' topic/example ')]" priority="10">
		<div class="row">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' topic/example ')]/*[contains(@class, ' topic/title ')]">
		<div class="col-md-2">
			<h4>
				<xsl:apply-templates/>
			</h4>
		</div>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/reqbody ')]">
		<div class="row">
			<div class="col-md-2">
				<h4>Parameters</h4>
			</div>
			<div class="col-md-10">
				<xsl:apply-templates/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/fields ')]">
		<table class="table container-fluid">
			<thead>
				<tr class="row">
					<th class="col-md-1">Name</th>
					<th class="col-md-1 importance">Req.</th>
					<th class="col-md-10">Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/field ')]">
		<tr class="row">
			<th class="field">
				<span class="fieldname">
					<xsl:apply-templates select="child::*[contains(@class, ' pr-d/parmname ')]"/>
				</span>
				<span class="fieldtype">
					<xsl:apply-templates select="child::*[contains(@class, ' rest-api/type ')]"/>
				</span>
			</th>
			<td class="importance">
				<xsl:if test="@importance = 'required'">
					<span class="required">&#x2022;</span>
				</xsl:if>
			</td>
			<td class="descr">
				<xsl:apply-templates select="child::*[contains(@class, ' rest-api/descr ')]"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/descr ')]">
		<div><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/type ')]">
		<code>
			<xsl:choose>
				<xsl:when test="@format = 'array'">Array</xsl:when>
				<xsl:when test="@format = 'bool'">Boolean</xsl:when>
				<xsl:when test="@format = 'float'">Float</xsl:when>
				<xsl:when test="@format = 'int'">Integer</xsl:when>
				<xsl:when test="@format = 'object'">Object</xsl:when>
				<xsl:when test="@format = 'str'">String</xsl:when>
				<xsl:otherwise>String</xsl:otherwise>
			</xsl:choose>
		</code>
	</xsl:template>

	<!-- Response elements -->
	<xsl:template match="*[contains(@class, ' rest-api/return ')]">
		<div class="row">
			<div class="col-md-2">
				<h4>Responses</h4>
			</div>
			<div class="col-md-10">
				<table class="table container-fluid">
					<thead>
						<tr class="row">
							<th class="col-md-1">Code</th>
							<th class="col-md-1">Message</th>
							<th class="col-md-1">Type</th>
							<th class="col-md-9">Description</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates/>
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/status ')]">
		<tr class="row">
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	
	<xsl:template match="*[contains(@class, ' rest-api/code ')]">
		<td class="col-md-1">
			<code><xsl:apply-templates/></code>
		</td>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/msg ')]">
		<td class="col-md-1">
			<samp><xsl:apply-templates/></samp>
		</td>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/format ')]">
		<td class="col-md-1">
			<code><xsl:apply-templates/></code>
		</td>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/status ')]/*[contains(@class, ' rest-api/descr ')]" priority="10">
		<td class="col-md-9">
			<xsl:apply-templates/>
		</td>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/resbody ')]">
		<div class="row">
			<div class="col-md-2">
				<h4>Fields</h4>
			</div>
			<div class="col-md-10">
				<xsl:apply-templates/>
			</div>
		</div>
	</xsl:template>


	
</xsl:stylesheet>
