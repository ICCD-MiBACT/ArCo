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

	<xsl:variable name="idCF"
		select="record/metadata/schede/harvesting/idContenitoreFisico" />
	<xsl:template match="/">
		<rdf:RDF>

			<rdf:Description>
				<arco-core:testContenitoriFisici>
					<xsl:value-of select="arco-fn:find-cf($idCF)"></xsl:value-of>
				</arco-core:testContenitoriFisici>
			</rdf:Description>

		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>