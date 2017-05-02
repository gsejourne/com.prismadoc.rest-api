<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="xs" version="2.0">


	<xsl:attribute-set name="field.thead.row" use-attribute-sets="thead.row">
		<xsl:attribute name="border-top-style">solid</xsl:attribute>
		<xsl:attribute name="border-top-width">1px</xsl:attribute>
		<xsl:attribute name="border-top-color">#ccc</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="field.thead.entry" use-attribute-sets="thead.row.entry"> </xsl:attribute-set>
	<xsl:attribute-set name="field.tbody.row" use-attribute-sets="tbody.row">
		<xsl:attribute name="border-top-style">solid</xsl:attribute>
		<xsl:attribute name="border-top-width">1px</xsl:attribute>
		<xsl:attribute name="border-top-color">#ccc</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="field.parmname" use-attribute-sets="tbody.row.entry">
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="padding">.2cm</xsl:attribute>
		<xsl:attribute name="padding-right">.5cm</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="field.importance" use-attribute-sets="tbody.row.entry">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="padding">.2cm</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size">22pt</xsl:attribute>
		<xsl:attribute name="color">rgb(0,63,119)</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="field.descr" use-attribute-sets="tbody.row.entry">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="padding">.2cm</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="return.format" use-attribute-sets="codeph">
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="parameter">
		<xsl:attribute name="font-family">Courier</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="request.example">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">1px</xsl:attribute>
		<xsl:attribute name="border-color">#888</xsl:attribute>
		<xsl:attribute name="background-color">#ececec</xsl:attribute>
		<xsl:attribute name="space-after.optimum">3mm</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1mm</xsl:attribute>
		<xsl:attribute name="padding">3mm</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="request.example.title" use-attribute-sets="example.title">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
		<xsl:attribute name="color">#3399cc</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="request.example.code" use-attribute-sets="pre">
		<xsl:attribute name="padding">.2cm</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>
	


	<xsl:template match="*[contains(@class, ' rest-api/headers')]">
		<fo:block xsl:use-attribute-sets="topic.topic.topic.title">
			<xsl:call-template name="commonattributes"/> Headers </fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/verb ')]">
		<fo:inline font-weight="bold" font-family="Courier">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/resource ')]">
		<fo:inline font-family="Courier">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/request ')]">
		<fo:block xsl:use-attribute-sets="topic.topic.title">
			<xsl:text>Request</xsl:text>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/response ')]">
		<fo:block xsl:use-attribute-sets="topic.topic.title">
			<xsl:text>Response</xsl:text>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/request ')]/*[contains(@class, ' topic/example ')]|
		*[contains(@class, ' rest-api/response ')]/*[contains(@class, ' topic/example ')]">
		<fo:block xsl:use-attribute-sets="request.example">
			<xsl:if test="title">
				<fo:block xsl:use-attribute-sets="request.example.title">
					<xsl:apply-templates select="*[contains(@class, ' topic/title ')]"/>
				</fo:block>
			</xsl:if>
			<xsl:apply-templates select="codeblock"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/request ')]/*[contains(@class, ' topic/example ')]/*[contains(@class, ' topic/pre ')]">
		<fo:block xsl:use-attribute-sets="request.example.code">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<!--xsl:template match="*[contains(@class, ' topic/dt ')]">
		<dt>
			<xsl:call-template name="commonattributes"/>
			<xsl:if test="@importance = 'required'">
				<span class="importance required"/>
			</xsl:if>
			<xsl:apply-templates/>
		</dt>
	</xsl:template-->
	<xsl:template match="*[contains(@class, ' rest-api/fields ')]">
		<xsl:if test="parent::*[contains(@class, ' rest-api/reqbody ')]">
			<fo:block xsl:use-attribute-sets="topic.topic.topic.title">Request Parameters</fo:block>
		</xsl:if>
		<xsl:if test="parent::*[contains(@class, ' rest-api/resbody ')]">
			<fo:block xsl:use-attribute-sets="topic.topic.topic.title">Response Body</fo:block>
		</xsl:if>
		<fo:table xsl:use-attribute-sets="table.tgroup">
			<xsl:call-template name="commonattributes"/>
			<!-- Force page wide (@pgwide) attribute -->
			<xsl:attribute name="start-indent">0</xsl:attribute>
			<xsl:attribute name="end-indent">0</xsl:attribute>
			<xsl:attribute name="width">auto</xsl:attribute>
			<fo:table-header xsl:use-attribute-sets="tgroup.thead">
				<xsl:call-template name="commonattributes"/>
				<fo:table-row xsl:use-attribute-sets="field.thead.row">
					<fo:table-cell xsl:use-attribute-sets="field.thead.entry">
						<fo:block xsl:use-attribute-sets="thead.row.entry__content"> Parameter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="field.thead.entry">
						<fo:block xsl:use-attribute-sets="thead.row.entry__content"
							>Required</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="field.thead.entry">
						<fo:block xsl:use-attribute-sets="thead.row.entry__content"
							>Description</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:apply-templates/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/field ')]">
		<xsl:param name="id"/>
		<xsl:variable name="fieldID" select="generate-id()"/>
		<xsl:variable name="ancestor_objects">
			<xsl:for-each select="ancestor::field">
				<xsl:value-of select="concat(parmname, '.')"/>
			</xsl:for-each>
		</xsl:variable>
		<fo:table-row xsl:use-attribute-sets="tbody.row" id="{$fieldID}">
			<fo:table-cell xsl:use-attribute-sets="field.parmname">
				<xsl:if test="$id">
					<xsl:attribute name="id">
						<xsl:value-of select="$id"/>
					</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:value-of select="$ancestor_objects"/>
					<fo:inline font-weight="bold">
						<xsl:apply-templates select="parmname"/>
					</fo:inline>
				</fo:block>
				<fo:block>
					<xsl:apply-templates select="type" mode="api"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="field.importance">
				<xsl:if test="@importance = 'required'">
					<fo:inline color="rgb(0,63,119)">&#x2022;</fo:inline>
				</xsl:if>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="field.descr">
				<fo:block>
					<xsl:apply-templates select="descr"/>
				</fo:block>
				<xsl:if test="fields">
					<fo:block> See Object <fo:inline xsl:use-attribute-sets="codeph">
							<fo:basic-link xsl:use-attribute-sets="xref">
								<xsl:attribute name="internal-destination">
									<xsl:value-of select="translate($ancestor_objects, '.', '_')"/>
									<xsl:value-of select="parmname"/>
								</xsl:attribute>
								<xsl:value-of select="$ancestor_objects"/><xsl:apply-templates
									select="parmname"/>
							</fo:basic-link>
						</fo:inline>
					</fo:block>
				</xsl:if>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="fields/*">
			<xsl:with-param name="id">
				<xsl:value-of select="translate($ancestor_objects, '.', '_')"/>
				<xsl:value-of select="parmname"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="*[contains(@class, ' rest-api/type ')]" mode="api">
		<fo:inline xsl:use-attribute-sets="codeph">
			<xsl:call-template name="commonattributes"/> [<xsl:choose>
				<xsl:when test="@format = 'bool'">boolean</xsl:when>
				<xsl:when test="@format = 'int'">integer</xsl:when>
				<xsl:when test="@format = 'float'">float</xsl:when>
				<xsl:otherwise>string</xsl:otherwise>
			</xsl:choose>] </fo:inline>
	</xsl:template>

	<xsl:template match="//response/http/return">
		<fo:block xsl:use-attribute-sets="topic.topic.topic.title">Return Status</fo:block>
		<fo:table xsl:use-attribute-sets="table.tgroup">
			<xsl:call-template name="commonattributes"/>
			<fo:table-column column-number="1" column-width="3cm"/>
			<fo:table-column column-number="2"/>
			<fo:table-header xsl:use-attribute-sets="tgroup.thead">
				<xsl:call-template name="commonattributes"/>
				<fo:table-row xsl:use-attribute-sets="thead.row">
					<fo:table-cell xsl:use-attribute-sets="thead.row.entry">
						<fo:block xsl:use-attribute-sets="thead.row.entry__content">Return Code</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="thead.row.entry">
						<fo:block xsl:use-attribute-sets="thead.row.entry__content">Description</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="tgroup.tbody"> 
				<xsl:apply-templates/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/status ')]">
		<fo:table-row xsl:use-attribute-sets="tbody.row">
			<fo:table-cell xsl:use-attribute-sets="field.parmname">
				<fo:block xsl:use-attribute-sets="tbody.row.entry__content">
					<fo:block  font-weight="bold">
						<xsl:apply-templates select="code"/>
					</fo:block>
					<fo:block>
						<xsl:apply-templates select="format"/>
					</fo:block>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="field.descr">
				<fo:block xsl:use-attribute-sets="tbody.row.entry__content">
					<xsl:apply-templates select="descr"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/code ')]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/msg ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/format ')]">
		<fo:inline xsl:use-attribute-sets="return.format"><xsl:apply-templates/></fo:inline>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/descr ')]">
		<xsl:apply-templates/>
	</xsl:template>

</xsl:stylesheet>
