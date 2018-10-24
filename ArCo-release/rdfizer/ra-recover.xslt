<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/core/" xmlns:arco-fn="http://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/catalogue/" xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:arco-dd="https://w3id.org/arco/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/cultural-event/"
	xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:arco-location="https://w3id.org/arco/location/" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:php="http://php.net/xsl" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	version="1.0" exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />

	<!-- xsl:import href="test.xsl"/ -->

	<xsl:template match="/">
		<rdf:RDF>
		<xsl:if test="schede/RA">
			<xsl:if
					test="schede/RA/OG/OGT/OGTD and not(lower-case(normalize-space(OG/OGT/OGTD))='nr' or lower-case(normalize-space(schede/RA/OG/OGT/OGTD))='n.r.' or lower-case(normalize-space(schede/RA/OG/OGT/OGTD))='nr (recupero pregresso)')">
					
					<xsl:variable name="ra-definition" select="arco-fn:ra-definition(normalize-space(schede/RA/OG/OGT/OGTD))" />
					<xsl:if test="$ra-definition != ''">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                        <xsl:value-of
								select="concat('https://w3id.org/arco/resource/CulturalPropertyDefinition/', arco-fn:urify(normalize-space(schede/RA/OG/OGT/OGTD)))" />
		                    </xsl:attribute>
						
							<skos:closeMatch>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$ra-definition" />
								</xsl:attribute>
							</skos:closeMatch>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>