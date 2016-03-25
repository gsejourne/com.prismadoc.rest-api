<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs">
	
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/apiref ')]/*[contains(@class, ' topic/title ')]">
		<xsl:param name="headinglevel" as="xs:integer">
			<xsl:choose>
				<xsl:when test="count(ancestor::*[contains(@class, ' topic/topic ')]) > 6">6</xsl:when>
				<xsl:otherwise><xsl:sequence select="count(ancestor::*[contains(@class, ' topic/topic ')])"/></xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<header>	
			<xsl:element name="h{$headinglevel}">
				<xsl:attribute name="class">topictitle<xsl:value-of select="$headinglevel"/></xsl:attribute>
				<xsl:call-template name="commonattributes">
					<xsl:with-param name="default-output-class">topictitle<xsl:value-of select="$headinglevel"/></xsl:with-param>
				</xsl:call-template>
				<xsl:attribute name="id"><xsl:apply-templates select="." mode="return-aria-label-id"/></xsl:attribute>
				<samp class="ph codeph"><xsl:apply-templates/></samp>
			</xsl:element>
			<xsl:value-of select="$newline"/>
			<p><b><samp class="ph codeph">
				<xsl:value-of select="/apiref/apibody/request/http/verb"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="/apiref/apibody/request/http/resource"/>
			</samp></b></p>
			<xsl:apply-templates select="../*[contains(@class, ' com.prismadoc.rest-api/shortdesc ')]"></xsl:apply-templates>
		</header>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/verb ')]"/>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/resource ')]"/>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/request ')]">
		<hr/>
		<section>
			<h2>Request</h2>
			<xsl:apply-templates/>
		</section>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/response ')]">
		<hr/>
		<section>
			<h2>Response</h2>
			<xsl:apply-templates/>
		</section>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/parameters ')]">
		<h3>Request Parameters</h3>
		<table class="parameters">
			<xsl:call-template name="commonattributes"/>
			<thead>
				<tr>
					<th>Parameter</th>
					<th>Optional</th>
					<th>Data Type</th>
					<th rowspan="3">Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/field ')]">
		<tr class="field">
			<td class="parmname"><samp class="ph codeph"><xsl:apply-templates select="parmname"/></samp></td>
			<td class="importance">
				<xsl:if test="@importance = 'optional'">
				<span class="optional">Yes</span>
				</xsl:if>
			</td>
			<td class="type"><xsl:apply-templates select="type" mode="api"/></td>
			<td class="desc"><xsl:apply-templates select="descr"/></td>
		</tr>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/type ')]" mode="api">
		<samp class="ph codeph api">
		<xsl:choose>
			<xsl:when test="@format = 'bool'">boolean</xsl:when>
			<xsl:when test="@format = 'int'">integer</xsl:when>
			<xsl:when test="@format = 'float'">float</xsl:when>
			<xsl:otherwise>string</xsl:otherwise>
		</xsl:choose>
		</samp>
	</xsl:template>
	
	<xsl:template match="//response/http/return">
		<h3>Return Status</h3>
		<table>
			<xsl:call-template name="commonattributes"/>
			<thead>
				<tr>
					<th>Return Code</th>
					<th>Message</th>
					<th>MIME Type</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/status ')]">
		<tr>
			<xsl:apply-templates mode="return_codes"/>
		</tr>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/code ')]" mode="return_codes">
		<td><b><samp class="ph codeph"><xsl:apply-templates/></samp></b></td>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/msg ')]" mode="return_codes">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/format ')]" mode="return_codes">
		<td><samp class="ph codeph"><xsl:apply-templates/></samp></td>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' com.prismadoc.rest-api/descr ')]" mode="return_codes">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	
</xsl:stylesheet>
