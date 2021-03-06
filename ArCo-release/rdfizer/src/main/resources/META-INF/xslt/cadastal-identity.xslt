<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
	xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:arco-location="https://w3id.org/arco/ontology/location/"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:php="http://php.net/xsl"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:mu="https://w3id.org/italia/onto/MU/"
	xmlns:language="https://w3id.org/italia/onto/Language/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />

		<xsl:variable name="itemURI">
	<xsl:choose>
		<xsl:when test="record/metadata/schede/*/CD/NCT/NCTN">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/RV/RVE/RVEL">
				<xsl:value-of
					select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/RV/RVE/RVEL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="accc-space" select="record/metadata/schede/*/AC/ACC/ACCC" />
			<xsl:variable name="accc-nospace" select="translate($accc-space, ' ', '')" />
			<xsl:variable name="accc" select="translate($accc-nospace, '/', '_')" />
			<xsl:variable name="acc-space" select="record/metadata/schede/*/AC/ACC" />
			<xsl:variable name="acc-nospace" select="translate($acc-space, ' ', '')" />
			<xsl:variable name="acc" select="translate($acc-nospace, '/', '_')" />
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
						<xsl:value-of
							select="$accc" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of
							select="$acc" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
	<!-- xsl:variable name="sheetType" select="record/metadata/schede/*/CD/TSK/text()"></xsl:variable -->
	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />

	<!-- xsl:import href="./prova.xsl" / -->

	<xsl:template match="/">

		<rdf:RDF>
			<xsl:for-each select="record/metadata/schede/*/RP/LGC">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		                		<xsl:value-of
						select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralIdentity'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Identità catastale ', position(), ' del bene: ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Cadastral identity ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Identità catastale ', position(), ' del bene: ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Cadastral identity ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./LGCC and (not(starts-with(lower-case(normalize-space(./LGCC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCC)), 'n.r')))">
						<arco-location:hasCadastralCity>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LGCC)))" />
								</xsl:attribute>
						</arco-location:hasCadastralCity>
					</xsl:if>
					<xsl:if
						test="./LGCM and (not(starts-with(lower-case(normalize-space(./LGCM)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCM)), 'n.r')))">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./LGCA">
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM), '-', arco-fn:urify(./LGCA))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:if>
					<xsl:if
						test="./LGCR and (not(starts-with(lower-case(normalize-space(./LGCR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCR)), 'n.r')))">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
									select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(./LGCR))" />
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:if>
					<!-- Legal situation of cadastral identity -->
					<xsl:if test="./LGCO">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
									select="concat($NS, 'LegalSituation/', $itemURI, '-cadastral-legal-situation-', $parentPosition)" />
		                		</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
				</rdf:Description>
				<!-- City -->
					<xsl:if test="./LGCC and (not(starts-with(lower-case(normalize-space(./LGCC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LGCC)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/City'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./LGCC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./LGCC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- CadastralFolio -->
				<xsl:if test="./LGCM and (not(starts-with(lower-case(normalize-space(./LGCM)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCM)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:choose>
									<xsl:when test="./LGCA">
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM), '-', arco-fn:urify(./LGCA))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
	                            </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./LGCM))" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./LGCM))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./LGCM))" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./LGCM))" />
							</l0:name>
							<xsl:if test="./LGCA">
								<tiapit:time>
									<xsl:value-of select="normalize-space(./LGCA)" />
								</tiapit:time>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				<!-- CadastralLegalSituation with LGCO -->
				<xsl:if test="./LGCO">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                		<xsl:value-of
								select="concat($NS, 'LegalSituation/', $itemURI, '-cadastral-legal-situation-', $parentPosition)" />
	                	</xsl:attribute>
	                	<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral legal situation of cultural property ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Condizione giuridica catastale del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral legal situation of cultural property ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Condizione giuridica catastale del bene culturale ', $itemURI)" />
						</l0:name>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/LegalSituation" />
						<arco-cd:hasOwner>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./LGCO))" />
							</xsl:attribute>
						</arco-cd:hasOwner>	
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./LGCO))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./LGCO)"/>
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./LGCO)"/>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- CadastralUnitCollection -->
				<xsl:if test="./LGCR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                		<xsl:value-of
								select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(./LGCR))" />
	                	</xsl:attribute>
	                	<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(./LGCR))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(./LGCR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(./LGCR))" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(./LGCR))" />
						</l0:name>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/CadastralUnitCollection" />
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			
			<xsl:for-each select="record/metadata/schede/A/UB/CTS">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		                		<xsl:value-of
						select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
								select="'https://w3id.org/arco/ontology/location/CadastralIdentity'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Identità catastale ', position(), ' del bene: ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Cadastral identity ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Identità catastale ', position(), ' del bene: ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Cadastral identity ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if
						test="./CTSF and (not(starts-with(lower-case(normalize-space(./CTSF)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTSF)), 'n.r')))">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./CTSD">
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF), '-', arco-fn:urify(./CTSD))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:if>
					<xsl:if	test="./CTSP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:for-each select="./CTSP">
							<arco-location:hasCadastralEntity>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-location:hasCadastralEntity>
						</xsl:for-each>
					</xsl:if>
				</rdf:Description>
				
				<!-- CadastralUnitCollection with CTSP -->
				<xsl:if test="./CTSP">
					<xsl:for-each select="./CTSP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                		<xsl:value-of
									select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(.))" />
		                	</xsl:attribute>
		                	<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/CadastralUnitCollection" />
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
				<!-- CadastralFolio with CTSF -->
				<xsl:if test="./CTSF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:choose>
									<xsl:when test="./CTSD">
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF), '-', arco-fn:urify(./CTSD))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
	                	<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CTSF))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./CTSF))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CTSF))" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./CTSF))" />
						</l0:name>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/CadastralFolio" />
						<xsl:if test="./CTSD">
							<tiapit:time>
								<xsl:value-of select="normalize-space(./CTSD)" />
							</tiapit:time>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>