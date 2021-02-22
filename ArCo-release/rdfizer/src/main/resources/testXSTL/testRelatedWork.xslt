<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:php="http://php.net/xsl"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/" version="1.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType"
		select="name(record/metadata/schede/*)" />
	<xsl:variable name="cp-name" select="''" />
	<xsl:param name="NS" />

	<xsl:variable name="rel"
		select="record/metadata/schede/OA/RV/RSE/RSEC" />
	<xsl:template match="/">
	

			
		<rdf:RDF>
			<xsl:for-each select="record/metadata/schede/OA/RV/RSE/RSEC">
				<rdf:Description >
					<xsl:attribute name="rdf:about">
							<xsl:value-of
							select="concat('http://example.org/',.)" />
					</xsl:attribute>
					
					<xsl:variable name="rels" select="arco-fn:related-property(.,' ')"/>
					<arco-core:count>
						<xsl:value-of select="count($rels)"/>
					</arco-core:count>
					<xsl:for-each select="$rels">
						<arco-core:testRelatedWork>
							<xsl:value-of select="."></xsl:value-of>
						</arco-core:testRelatedWork>
					</xsl:for-each>
				</rdf:Description>
			</xsl:for-each>
		</rdf:RDF>

	</xsl:template>
</xsl:stylesheet>