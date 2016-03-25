<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs">
	
	<xsl:template name="gen-user-styles">
		<link rel="stylesheet" type="text/css" href="{$PATH2PROJ}{$CSSPATH}css/api.css"/><xsl:value-of select="$newline"/>
	</xsl:template>
	
	<xsl:template match="*[contains(@class, ' rest-api/apiref ')]/*[contains(@class, ' topic/title ')]">
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
			<xsl:apply-templates select="../*[contains(@class, ' rest-api/shortdesc ')]"></xsl:apply-templates>
		</header>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/headers')]">
		<h3>
			<xsl:call-template name="commonattributes"/>
			Headers
		</h3>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="*[contains(@class, ' rest-api/verb ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/resource ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/request ')]">
		<hr/>
		<section>
			<h2>Request</h2>
			<xsl:apply-templates/>
		</section>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/response ')]">
		<hr/>
		<section>
			<h2>Response</h2>
			<xsl:apply-templates/>
		</section>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' topic/dt ')]">
		<dt>
			<xsl:call-template name="commonattributes"/>
			<xsl:if test="@importance = 'required'">
				<span class="importance required"/>
			</xsl:if>
			<xsl:apply-templates/>
		</dt>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/fields ')]">
		<xsl:if test="parent::*[contains(@class, ' rest-api/reqbody ')]">
			<h3 class="title sectiontitle reqparams">Request Parameters</h3>
		</xsl:if>
		<xsl:if test="parent::*[contains(@class, ' rest-api/resbody ')]">
			<h3 class="title sectiontitle resparams">Response Body</h3>
		</xsl:if>
		<table class="fields">
			<xsl:call-template name="commonattributes"/>
			<thead>
				<tr>
					<th>Parameter</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*[contains(@class, ' rest-api/field ')]">
		<xsl:param name="parents"/>
		<xsl:variable name="fieldID" select="generate-id()"/>
		<xsl:variable name="toggleClass">
			<xsl:value-of select="$parents"/>
		</xsl:variable>
		<xsl:variable name="ancestor_objects">
			<xsl:for-each select="ancestor::field">
				<xsl:value-of select="concat(parmname,'.')"/>
			</xsl:for-each>
		</xsl:variable>
		<tr id="{$fieldID}">
			<xsl:attribute name="class">
				<xsl:if test="$parents != ''"><xsl:value-of select="$toggleClass"/> hide</xsl:if>
				<xsl:text> field </xsl:text>
			</xsl:attribute>
			<td class="id">
				<xsl:if test="@importance = 'required'">
					<span class="importance required"/>
				</xsl:if>
				<div class="parmname">
					<xsl:call-template name="commonattributes"/>
					<xsl:value-of select="$ancestor_objects"/><xsl:apply-templates select="parmname"/>
				</div>
				<div class="type"><xsl:apply-templates select="type" mode="api"/></div>
			</td>
			<td class="descr">
				<xsl:apply-templates select="descr"/>
				<xsl:if test="fields">
					<p><span class="toggle plus" onclick="javascript:toggle('{$fieldID}');"
						title="Toggle object definitions">
						</span></p>
				</xsl:if>
			</td>
		</tr>
		<xsl:apply-templates select="fields/*">
			<xsl:with-param name="parents">
				<xsl:value-of select="$toggleClass"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$fieldID"/>
				<xsl:text> </xsl:text>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/type ')]" mode="api">
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
		<table class="table fields">
			<thead>
				<tr>
					<th>Return Code</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/status ')]">
		<tr class="field">
			<td class="id">
				<div class="parmname">
					<xsl:apply-templates select="code"/>
				</div>
				<div class="type"><xsl:apply-templates select="format"/></div>
			</td>
			<td class="descr">
				<xsl:apply-templates select="descr"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/code ')]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/msg ')]"/>
	<xsl:template match="*[contains(@class, ' rest-api/format ')]">
		<samp class="ph codeph"><xsl:apply-templates/></samp>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/descr ')]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' rest-api/apibody ')]">
		<xsl:apply-templates/>
		<script>
			<xsl:text disable-output-escaping="yes">function toggle(id) {
				var list = document.getElementsByClassName(id);
				for (i = 0; i &lt; list.length; i++) {
				var el = document.getElementById(list[i].id);
				if (el.style.display == 'none') {
				el.style.display = 'table-row';
				} else {
				el.style.display = 'none';
				}
				}
			};</xsl:text>
		</script>
	</xsl:template>
	
</xsl:stylesheet>
