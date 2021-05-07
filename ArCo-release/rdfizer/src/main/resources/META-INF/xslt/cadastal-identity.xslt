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

	<xsl:template name="CamelCase">
		<xsl:param name="text" />
		<xsl:choose>
			<xsl:when test="contains($text,' ')">
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text"
						select="substring-before($text,' ')" />
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="substring-after($text,' ')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text" select="$text" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of
			select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of
			select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	
	<xsl:template name="CamelCase1">
		<xsl:param name="text" />
		<xsl:value-of
			select="translate(($text),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	
	<xsl:variable name="itemURI">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/CD/NCT/NCTN">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/RV/RVE/RVEL">
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/RV/RVE/RVEL)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="record/metadata/schede/MODI/CD/CDM">
				<xsl:value-of select="concat(arco-fn:urify(record/metadata/schede/*/CD/CDR), arco-fn:urify(record/metadata/schede/*/CD/CDM))" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/CD/CBC">
				<xsl:value-of select="record/metadata/schede/*/CD/CBC" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="accc-space">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
							<xsl:value-of select="record/metadata/schede/*/AC/ACC[1]/ACCC" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="record/metadata/schede/*/CD/ACC[1]/ACCC" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="accc-nospace" select="translate($accc-space, ' ', '')" />
				<xsl:variable name="accc" select="translate($accc-nospace, '/', '_')" />
				<xsl:variable name="acc-space" select="record/metadata/schede/*/AC/ACC[1]" />
				<xsl:variable name="acc-nospace" select="translate($acc-space, ' ', '')" />
				<xsl:variable name="acc" select="translate($acc-nospace, '/', '_')" />
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
						<xsl:value-of select="$accc" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/CD/ACC/ACCC">
						<xsl:value-of select="$accc" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$acc" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- xsl:variable name="sheetType" select="record/metadata/schede/*/CD/TSK/text()"></xsl:variable -->
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />

	<!-- xsl:import href="./prova.xsl" / -->

	<xsl:template match="/">

		<rdf:RDF>
			<!-- cadastral identity -->
			<xsl:for-each select="record/metadata/schede/*/CS">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
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
					<xsl:if test="./CTL and not(./CTL='.' or ./CTL='-' or ./CTL='/') and (not(starts-with(lower-case(normalize-space(./CTL)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTL)), 'n.r')))">
						<arco-location:hasLocationType>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(./CTL))='localizzazione fisica' or lower-case(normalize-space(./CTL))='luogo di provenienza' or lower-case(normalize-space(./CTL))='sede di provenienza' or lower-case(normalize-space(./CTL))='provenienza'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./CTL))='luogo di provenienza' or lower-case(normalize-space(./CTL))='sede di provenienza' or lower-case(normalize-space(./CTL))='provenienza'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/PreviousLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='di archivio'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ArchivalLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di produzione/realizzazione' or lower-case(normalize-space(./CTL))='luogo di esecuzione/fabbricazione'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ProductionRealizationLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di reperimento' or lower-case(normalize-space(./CTL))='reperimento'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/FindingLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di deposito' or lower-case(normalize-space(./CTL))='deposito temporaneo' or lower-case(normalize-space(./CTL))='deposito'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/StorageLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di esposizione' or lower-case(normalize-space(./CTL))='espositiva' or lower-case(normalize-space(./CTL))='espositivo' or lower-case(normalize-space(./CTL))='esposizione'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ExhibitionLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='luogo di rilevamento' or lower-case(normalize-space(./CTL))='di rilevamento' or lower-case(normalize-space(./CTL))='localizzazione di rilevamento'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ObservationLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./CTL))='area rappresentata'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SubjectLocation'" />
									</xsl:when>
									<xsl:when test="./CTL">
										<xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./CTL)))" />
									</xsl:when>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasLocationType>
					</xsl:if>
					<xsl:for-each select="./CTS">
						<xsl:if test="./CTST and (not(starts-with(lower-case(normalize-space(./CTST)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTST)), 'n.r')))">
							<arco-location:hasCadastreType>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="lower-case(normalize-space(./CTST))='catasto terreni'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/location/LandCadastre'" />
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./CTST))='catasto fabbricati'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingCadastre'" />
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./CTST))='catasto misto'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingAndLandCadastre'" />
										</xsl:when>
									</xsl:choose>
								</xsl:attribute>
							</arco-location:hasCadastreType>
						</xsl:if>
						<xsl:for-each select="./CTSC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<arco-location:hasCadastralCity>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space()))" />
								</xsl:attribute>
							</arco-location:hasCadastralCity>
						</xsl:for-each>
						<xsl:for-each select="./CTSF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CadastralFolio/', arco-fn:urify(normalize-space(../CTSC)), '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:for-each>
					<xsl:for-each select="./CTSN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', arco-fn:urify(normalize-space(../CTSC)), '-', arco-fn:urify(normalize-space(string-join(../CTSF,','))), '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:for-each>
					<xsl:for-each select="./CTSE[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'NeighbouringCadastralEntity/', $itemURI, '-', $parentPosition, '-', position())" />
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:for-each>
					</xsl:for-each>
					<xsl:if test="./CTN">
						<arco-core:note>
		                	<xsl:value-of select="normalize-space(./CTN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- cadastral city as an individual -->
				<xsl:for-each select="./CTS">
					<xsl:for-each select="./CTSC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
            	                <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space()))" />
                	        </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            	    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
	                            </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:call-template name="CamelCase">
									<xsl:with-param name="text" select="normalize-space()" />
								</xsl:call-template>
							</rdfs:label>
							<l0:name>
								<xsl:call-template name="CamelCase">
									<xsl:with-param name="text" select="normalize-space()" />
								</xsl:call-template>
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
					<!-- cadastre folio as an individual -->
					<xsl:for-each select="./CTSF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space(./CTSF)), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CadastralFolio/', arco-fn:urify(normalize-space(../CTSC)), '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
					<!-- cadastre unit collection as an individual -->
					<xsl:for-each select="./CTSN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', arco-fn:urify(normalize-space(../CTSC)), '-', arco-fn:urify(normalize-space(string-join(../CTSF,','))), '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralUnitCollection'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<!-- Legal situation of cadastral unit collection -->
							<xsl:if	test="./CTSP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<arco-cd:hasLegalSituation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'LegalSituation/', arco-fn:urify(normalize-space(../CTSC)), '-', arco-fn:urify(normalize-space(string-join(../CTSF,','))), '-', arco-fn:urify(normalize-space(.)), '-cadastral-legal-situation')" />
									</xsl:attribute>
								</arco-cd:hasLegalSituation>
							</xsl:if>
						</rdf:Description>
					</xsl:for-each>
					<!-- Neighbouring Cadastral Entity as an individual -->
					<xsl:for-each select="./CTSE[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'NeighbouringCadastralEntity/', $itemURI, '-', $parentPosition, '-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Elemento di confine del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Elemento di confine del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Neighbouring cadastral identity of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Neighbouring cadastral identity of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
					<!-- Legal situation of cadastral identity as an individual -->
					<xsl:if	test="./CTSP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'LegalSituation/', arco-fn:urify(normalize-space(./CTSC)), '-', arco-fn:urify(normalize-space(string-join(./CTSF,','))), '-', arco-fn:urify(normalize-space(.)), '-cadastral-legal-situation')" />
							</xsl:attribute>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Condizione giuridica catastale delle particelle ', normalize-space(./CTSC), '-', normalize-space(string-join(./CTSF,',')), '/', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Condizione giuridica catastale delle particelle ', normalize-space(./CTSC), '-', normalize-space(string-join(./CTSF,',')), '/', normalize-space(.))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Cadastral legal situation of unit collection ', normalize-space(./CTSC), '-', normalize-space(string-join(./CTSF,',')), '/', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Cadastral legal situation of unit collection ', normalize-space(./CTSC), '-', normalize-space(string-join(./CTSF,',')), '/', normalize-space(.))" />
							</l0:name>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
								</xsl:attribute>
							</rdf:type>
							<xsl:for-each select="./CTSP">
								<arco-cd:hasOwner>
									<xsl:attribute name="rdf:resource">
			        	    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
			            			</xsl:attribute>
								</arco-cd:hasOwner>
							</xsl:for-each>
						</rdf:Description>
						<xsl:for-each select="./CTSP">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
			        	    		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
			            		</xsl:attribute>
								<rdfs:label>
									<xsl:call-template name="CamelCase">
										<xsl:with-param name="text" select="normalize-space(.)" />
									</xsl:call-template>
								</rdfs:label>
								<l0:name>
									<xsl:call-template name="CamelCase">
										<xsl:with-param name="text" select="normalize-space(.)" />
									</xsl:call-template>
								</l0:name>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
									</xsl:attribute>
								</rdf:type>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<!-- Cadastral identity for PG and A v. 1.00 and 2.00 -->
			<xsl:for-each select="record/metadata/schede/*/UB">
				<xsl:if test="./CTS">
					<xsl:variable name="parentPosition">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<rdf:Description>
						<xsl:attribute name="rdf:about"> 
							<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
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
						<xsl:if test="./CTL and not(./CTL='.' or ./CTL='-' or ./CTL='/') and (not(starts-with(lower-case(normalize-space(./CTL)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTL)), 'n.r')))">
							<arco-location:hasLocationType>
								<xsl:attribute name="rdf:resource">
	            	                    <xsl:choose>
	                	               		<xsl:when test="lower-case(normalize-space(./CTL))='localizzazione fisica' or lower-case(normalize-space(./CTL))='luogo di provenienza' or lower-case(normalize-space(./CTL))='sede di provenienza' or lower-case(normalize-space(./CTL))='provenienza'">
	                    	                    <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
	                        	            </xsl:when>
	                            	        <xsl:when test="lower-case(normalize-space(./CTL))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./CTL))='luogo di provenienza' or lower-case(normalize-space(./CTL))='sede di provenienza' or lower-case(normalize-space(./CTL))='provenienza'">
	                                	        <xsl:value-of select="'https://w3id.org/arco/ontology/location/PreviousLocation'" />
	                                    	</xsl:when>
		                                     <xsl:when test="lower-case(normalize-space(./CTL))='di archivio'">
		                                        <xsl:value-of select="'https://w3id.org/arco/ontology/location/ArchivalLocation'" />
	    	                                </xsl:when>
	        	                            <xsl:when test="lower-case(normalize-space(./CTL))='luogo di produzione/realizzazione' or lower-case(normalize-space(./CTL))='luogo di esecuzione/fabbricazione'">
	            	                            <xsl:value-of select="'https://w3id.org/arco/ontology/location/ProductionRealizationLocation'" />
	                	                    </xsl:when>
	                    	                <xsl:when test="lower-case(normalize-space(./CTL))='luogo di reperimento' or lower-case(normalize-space(./CTL))='reperimento'">
	                        	                <xsl:value-of select="'https://w3id.org/arco/ontology/location/FindingLocation'" />
	                            	        </xsl:when>
	                                	    <xsl:when test="lower-case(normalize-space(./CTL))='luogo di deposito' or lower-case(normalize-space(./CTL))='deposito temporaneo' or lower-case(normalize-space(./CTL))='deposito'">
	                                    	    <xsl:value-of select="'https://w3id.org/arco/ontology/location/StorageLocation'" />
		                                    </xsl:when>
		                                    <xsl:when test="lower-case(normalize-space(./CTL))='luogo di esposizione' or lower-case(normalize-space(./CTL))='espositiva' or lower-case(normalize-space(./CTL))='espositivo' or lower-case(normalize-space(./CTL))='esposizione'">
	    	                                    <xsl:value-of select="'https://w3id.org/arco/ontology/location/ExhibitionLocation'" />
	        	                            </xsl:when>
	            	                        <xsl:when test="lower-case(normalize-space(./CTL))='luogo di rilevamento' or lower-case(normalize-space(./CTL))='di rilevamento' or lower-case(normalize-space(./CTL))='localizzazione di rilevamento'">
	                	                        <xsl:value-of select="'https://w3id.org/arco/ontology/location/ObservationLocation'" />
	                    	                </xsl:when>
	                        	            <xsl:when test="lower-case(normalize-space(./CTL))='area rappresentata'">
	                            	            <xsl:value-of select="'https://w3id.org/arco/ontology/location/SubjectLocation'" />
	                                	    </xsl:when>
	                                    	<xsl:when test="./CTL">
	                                        	<xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./CTL)))" />
		                                    </xsl:when>
		                                </xsl:choose>
	    	                        </xsl:attribute>
							</arco-location:hasLocationType>
						</xsl:if>
						<xsl:for-each select="./CTS/CTSC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<arco-location:hasCadastralCity>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space()))" />
								</xsl:attribute>
							</arco-location:hasCadastralCity>
						</xsl:for-each>
						<xsl:if test="./CTS/CTSF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:for-each select="./CTS">
								<arco-location:hasCadastralEntity>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="./CTSD">
												<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF), '-', arco-fn:urify(./CTSD))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</arco-location:hasCadastralEntity>
							</xsl:for-each>
						</xsl:if>
						<xsl:if	test="./CTS/CTSP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:for-each select="./CTS/CTSP">
								<arco-location:hasCadastralEntity>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(.))" />
									</xsl:attribute>
								</arco-location:hasCadastralEntity>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="./CTS/CTSE and (not(starts-with(lower-case(normalize-space(./CTS/CTSE)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTS/CTSE)), 'n.r')))">
							<xsl:for-each select="./CTS/CTSE">
								<arco-location:hasCadastralEntity>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'NeighbouringCadastralEntity/', $itemURI, '-', $parentPosition, '-', position())" />
									</xsl:attribute>
								</arco-location:hasCadastralEntity>
							</xsl:for-each>
						</xsl:if>
					</rdf:Description>
					<!-- cadastral city as an individual -->
					<xsl:for-each select="./CTS/CTSC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                	            <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space()))" />
                    	    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                	<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
	                            </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:call-template name="CamelCase">
									<xsl:with-param name="text" select="normalize-space()" />
								</xsl:call-template>
							</rdfs:label>
							<l0:name>
								<xsl:call-template name="CamelCase">
									<xsl:with-param name="text" select="normalize-space()" />
								</xsl:call-template>
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
					<!-- cadastre folio as an individual -->
					<xsl:if test="./CTS/CTSF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:for-each select="./CTS">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:choose>
										<xsl:when test="./CTSD">
											<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF), '-', arco-fn:urify(./CTSD))" />
										</xsl:when>
											<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./CTSF))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	        	                        <xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
		                            </xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./CTSF))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Foglio di mappa catastale del bene culturale ', $itemURI, ': ', normalize-space(./CTSF))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CTSF))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CTSF))" />
								</l0:name>
								<xsl:if test="./CTSD">
									<tiapit:time>
										<xsl:value-of select="normalize-space(./CTSD)" />
									</tiapit:time>
								</xsl:if>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
					<!-- cadastre unit collection as an individual -->
					<xsl:for-each select="./CTS/CTSP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(.))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralUnitCollection'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
					<!-- Neighbouring Cadastral Entity as an individual -->
					<xsl:if test="./CTS/CTSE and (not(starts-with(lower-case(normalize-space(./CTS/CTSE)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTS/CTSE)), 'n.r')))">
						<xsl:for-each select="./CTS/CTSE">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'NeighbouringCadastralEntity/', $itemURI, '-', $parentPosition, '-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                            	    <xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
		                            </xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Elemento di confine del bene culturale ', $itemURI, ': ', normalize-space(.))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Elemento di confine del bene culturale ', $itemURI, ': ', normalize-space(.))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Neighbouring cadastral identity of cultural property ', $itemURI, ': ', normalize-space(.))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Neighbouring cadastral identity of cultural property ', $itemURI, ': ', normalize-space(.))" />
								</l0:name>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- historical cadastral identity -->
			<xsl:if test="record/metadata/schede/*/LS/CSS/*">
				<xsl:for-each select="record/metadata/schede/*/LS/CSS">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-historical-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralIdentity'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Identità catastale storica ', position(), ' del bene: ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Cadastral historical identity ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Identità catastale storica ', position(), ' del bene: ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Cadastral historical identity ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<arco-location:hasLocationType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/HistoricalLocation'" />
							</xsl:attribute>
						</arco-location:hasLocationType>
						<xsl:if test="./CSST">
							<tiapit:time>
								<xsl:value-of select="normalize-space(./CSST)" />
							</tiapit:time>
						</xsl:if>
						<xsl:if test="./CSSD">
							<arco-location:cadastreName>
								<xsl:value-of select="normalize-space(./CSSD)" />
							</arco-location:cadastreName>
						</xsl:if>
						<xsl:if test="./CSSF and (not(starts-with(lower-case(normalize-space(./CSSF)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSF)), 'n.r')))">
							<arco-location:hasCadastralEntity>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-historical-', position())" />
								</xsl:attribute>
							</arco-location:hasCadastralEntity>
						</xsl:if>
						<xsl:if test="./CSSN and (not(starts-with(lower-case(normalize-space(./CSSN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSN)), 'n.r')))">
							<xsl:for-each select="./CSSN">
								<arco-location:hasCadastralEntity>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-historical-', $parentPosition)" />
									</xsl:attribute>
								</arco-location:hasCadastralEntity>
							</xsl:for-each>
						</xsl:if>
						<!-- Legal situation of cadastral identity -->
						<xsl:if test="./CSSP and (not(starts-with(lower-case(normalize-space(./CSSP)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSP)), 'n.r')))">
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-cadastral-historical-legal-situation-', position())" />
								</xsl:attribute>
							</arco-cd:hasLegalSituation>
						</xsl:if>
						<!-- Note -->
						<xsl:if test="./CSSS and (not(starts-with(lower-case(normalize-space(./CSSS)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSS)), 'n.r')))">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./CSSS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- cadastre folio as an individual -->
					<xsl:if test="./CSSF and (not(starts-with(lower-case(normalize-space(./CSSF)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSF)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-historical-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralFolio'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Foglio di mappa catastale storica del bene culturale ', $itemURI, ': ', normalize-space(./CSSF))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Foglio di mappa catastale storica del bene culturale ', $itemURI, ': ', normalize-space(./CSSF))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Historical cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CSSF))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Historical cadastral folio of cultural property ', $itemURI, ': ', normalize-space(./CSSF))" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- cadastre unit collection as an individual -->
					<xsl:if test="./CSSN and (not(starts-with(lower-case(normalize-space(./CSSN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSN)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-historical-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="'https://w3id.org/arco/ontology/location/CadastralUnitCollection'" />
	                            </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Collezione di particelle catastali storiche del bene culturale ', $itemURI, ': ', normalize-space(./CSSN))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Collezione di particelle catastali storiche del bene culturale ', $itemURI, ': ', normalize-space(./CSSN))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Cadastral historical unit collection of cultural property ', $itemURI, ': ', normalize-space(./CSSN))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Cadastral historical unit collection of cultural property ', $itemURI, ': ', normalize-space(./CSSN))" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- Legal situation of cultural property as an individual -->
					<xsl:if test="./CSSP and (not(starts-with(lower-case(normalize-space(./CSSP)), 'nr')) and not(starts-with(lower-case(normalize-space(./CSSP)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-cadastral-historical-legal-situation-', position())" />
		                	</xsl:attribute>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Condizione giuridica catastale storica del bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Condizione giuridica catastale storica del bene culturale ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Cadastral historical legal situation of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Cadastral historical legal situation of cultural property ', $itemURI)" />
							</l0:name>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
								</xsl:attribute>
							</rdf:type>
							<arco-cd:hasOwner>
								<xsl:attribute name="rdf:resource">
			            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CSSP))" />
			            		</xsl:attribute>
							</arco-cd:hasOwner>
						</rdf:Description>
						<!-- agent as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CSSP))" />
			            	</xsl:attribute>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
								</xsl:attribute>
							</rdf:type>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/RP/LGC">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
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
					<xsl:if	test="./LGCR and (not(starts-with(lower-case(normalize-space(./LGCR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCR)), 'n.r')))">
						<arco-location:hasCadastralEntity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(./LGCR))" />
							</xsl:attribute>
						</arco-location:hasCadastralEntity>
					</xsl:if>
					<!-- Legal situation of cadastral identity -->
					<xsl:if test="./LGCO">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-cadastral-legal-situation-', $parentPosition)" />
							</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
				</rdf:Description>
				<!-- City -->
					<xsl:if test="./LGCC and (not(starts-with(lower-case(normalize-space(./LGCC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LGCC)))" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
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
									<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM), '-', arco-fn:urify(./LGCA))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CadastralFolio/', $itemURI, '-', arco-fn:urify(./LGCM))" />
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
				<xsl:if test="./LGCR and (not(starts-with(lower-case(normalize-space(./LGCR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LGCR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CadastralUnitCollection/', $itemURI, '-', arco-fn:urify(./LGCR))" />
						</xsl:attribute>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(./LGCR))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of  select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(./LGCR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Cadastral unit collection of cultural property ', $itemURI, ': ', normalize-space(./LGCR))" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Collezione di particelle catastali del bene culturale ', $itemURI, ': ', normalize-space(./LGCR))" />
						</l0:name>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/CadastralUnitCollection" />
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>