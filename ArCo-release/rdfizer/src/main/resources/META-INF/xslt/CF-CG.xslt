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
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
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
	xmlns:ar-agentrole="https://w3id.org/arco/resource/AgentRole/"
	xmlns:ar-agent="https://w3id.org/arco/resource/Agent/"
	xmlns:ar-role="https://w3id.org/arco/resource/Role/"
	xmlns:ar-privacyReason="https://w3id.org/arco/resource/PrivacyReason/"
	xmlns:COV="https://w3id.org/italia/onto/COV/"
	xmlns:CPV="https://w3id.org/italia/onto/CPV/"
	xmlns:ar-archeologicalProperty="https://w3id.org/arco/resource/ArchaeologicalProperty/"
	xmlns:ar-TimeInterval="https://w3id.org/arco/resource/TimeInterval/"
	xmlns:ar-city="https://w3id.org/arco/resource/City/"
	xmlns:ar-geometry="https://w3id.org/arco/resource/Geometry/"
	xmlns:ar-event="https://w3id.org/arco/resource/Event/"
	xmlns:ar-country="https://w3id.org/arco/resource/Country/"
	xmlns:ar-timeIndexedTypedLocation="https://w3id.org/arco/resource/TimeIndexedTypedLocation/"
	xmlns:ar-feature="https://w3id.org/arco/resource/Feature/"
	xmlns:ar-timeIndexedRole="https://w3id.org/arco/resource/TimeIndexedRole/"
	xmlns:ar-catalogueRecordSI="https://w3id.org/arco/resource/CatalogueRecordSI/"
	xmlns:ar-detectionMethod="https://w3id.org/arco/resource/DetectionMethod/"
	xmlns:ar-interpretationCriterion="https://w3id.org/arco/resource/InterpretationCriterion/"
	xmlns:ar-bibliography="https://w3id.org/arco/resource/Bibliography/"
	xmlns:ar-culturalPropertyDefinition="https://w3id.org/arco/resource/CulturalPropertyDefinition/"
	xmlns:ar-legalSituation="https://w3id.org/arco/resource/LegalSituation/"
	xmlns:ar-province="https://w3id.org/arco/resource/Province/"
	xmlns:ar-culturalPropertySpecification="https://w3id.org/arco/resource/CulturalPropertySpecification/"
	xmlns:ar-addressArea="https://w3id.org/arco/resource/AddressArea/"
	xmlns:ar-designationInTime="https://w3id.org/arco/resource/DesignationInTime/"
	xmlns:ar-accessProfile="https://w3id.org/arco/resource/AccessProfile/"
	xmlns:ar-documentType="https://w3id.org/arco/resource/DocumentationType/"
	xmlns:ar-address="https://w3id.org/arco/resource/Address/"
	xmlns:ar-culturalPropertyType="https://w3id.org/arco/resource/CulturalPropertyType/"
	xmlns:ar-photograpyDocumentation="https://w3id.org/arco/resource/PhotographicDocumentation/"
	xmlns:ar-docutmentationType="https://w3id.org/arco/resource/DocumentationType/"
	xmlns:ar-dating="https://w3id.org/arco/resource/Dating/"
	xmlns:ar-archeologicalFieldSurvey="https://w3id.org/arco/resource/ArchaeologicalFieldSurvey/"
	xmlns:ar-region="https://w3id.org/arco/resource/Region/"
	xmlns:ar-catalogueRecordVersion="https://w3id.org/arco/resource/CatalogueRecordVersion/"
	xmlns:ar-HistoricOrArtisticProperty="https://w3id.org/arco/resource/HistoricOrArtisticProperty/"
	xmlns:ar-CulturalPropertyCataloguingCategory="https://w3id.org/arco/resource/CulturalPropertyCataloguingCategory/"
	xmlns:ar-RelatedWorkSituation="https://w3id.org/arco/resource/RelatedWorkSituation/"
	xmlns:ar-CulturalEntityTechnicalStatus="https://w3id.org/arco/resource/CulturalEntityTechnicalStatus/"
	xmlns:ar-Value="https://w3id.org/arco/resource/Value/"
	xmlns:ar-PreferredAuthorshipAttribution="https://w3id.org/arco/resource/PreferredAuthorshipAttribution/"
	xmlns:ar-CatalogueRecordOA="https://w3id.org/arco/resource/CatalogueRecordOA/"
	xmlns:ar-TechnicalCharacteristic="https://w3id.org/arco/resource/TechnicalCharacteristic/"
	xmlns:ar-Site="https://w3id.org/arco/resource/Site/"
	xmlns:ar-SiteType="https://w3id.org/arco/resource/SiteType/"
	xmlns:ar-ConservationStatus="https://w3id.org/arco/resource/ConservationStatus/"
	xmlns:ar-Subject="https://w3id.org/arco/resource/Subject/"
	xmlns:ar-SourceAndDocument="https://w3id.org/arco/resource/SourceAndDocument/"
	xmlns:ar-cis="https://w3id.org/arco/resource/CulturalInstituteOrSite/"
	xmlns:ar-SiteDefinition="https://w3id.org/arco/resource/SiteDefinition/"
	xmlns:ar-MeasurementCollection="https://w3id.org/arco/resource/MeasurementCollection/"
	xmlns:ar-CISNameInTime="https://w3id.org/arco/resource/CISNameInTime/"
	xmlns:ar-Measurement="https://w3id.org/arco/resource/Measurement/"
xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="1.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>
	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*)" />
	<xsl:variable name="idCF" select="record/metadata/schede/CF/CD/CCF" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" /-->
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
	<xsl:variable name="contenitoreFisico"
			select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $idCF)" />

	
		
	
		
<xsl:template match="/">
	<rdf:RDF>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCF)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', 'CatalogueRecord', $sheetType)" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Catalogue Record of site n: ', $idCF)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Scheda catalografica del contenitore fisico n: ', $idCF)" />
				</rdfs:label>
			<xsl:for-each select="record/metadata/schede/*/CD/LIR">
				<arco-catalogue:hasCataloguingLevel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', upper-case(arco-fn:urify(.)))" />
					</xsl:attribute>
				</arco-catalogue:hasCataloguingLevel>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/CF/CD/CCF">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="record/metadata/schede/CF/CD/CCF" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="$item" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
				<arco-catalogue:hasCatalogueRecordVersion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idCF, '-compilation')" />
					</xsl:attribute>
				</arco-catalogue:hasCatalogueRecordVersion>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AN/OSS">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/AN/OSS)" />
				</arco-core:note>
			</xsl:if>		
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idCF, '-compilation')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/CatalogueRecordVersion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CM/CMP">
							<xsl:value-of select="concat(record/metadata/schede/*/CM/CMP/@hint, ' - ', normalize-space(record/metadata/schede/*/CM/CMP))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'COMPILAZIONE'" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<arco-catalogue:isCatalogueRecordVersionOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCF)" />
					</xsl:attribute>
				</arco-catalogue:isCatalogueRecordVersionOf>
				<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-compilation-', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-catalogue:hasCatalogueRecordVersionRiT>
						<arco-catalogue:hasResponsibleResearchAndCompilation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-catalogue:hasResponsibleResearchAndCompilation>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/CM/CMP/CMPD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'n.r')))">
					<arco-catalogue:editedAtTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)))" />
						</xsl:attribute>
					</arco-catalogue:editedAtTime>
				</xsl:if>
					<!-- Referente verifica scientifica -->
				<xsl:for-each select="record/metadata/schede/*/CM/RSR">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
							</xsl:attribute>
						</arco-catalogue:hasCatalogueRecordVersionRiT>
						<arco-catalogue:hasScientificDirector>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-catalogue:hasScientificDirector>
					</xsl:if>
				</xsl:for-each>
					<!-- Funzionario responsabile -->
				<xsl:for-each select="record/metadata/schede/*/CM/FUR">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
							</xsl:attribute>
						</arco-catalogue:hasCatalogueRecordVersionRiT>
						<arco-catalogue:hasOfficialInCharge>
							<xsl:attribute name="rdf:resource">	
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-catalogue:hasOfficialInCharge>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
		</xsl:if>
		<!-- Participant role - Compilation -->
		<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
			<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-compilation-', arco-fn:arcofy(.))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Compilation by ', normalize-space(.))" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Compilazione da ', normalize-space(.))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
						</xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
			<!-- responsible research and compilation Agent -->
		<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
			<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
				</rdf:Description>
					<!-- responsible research and compilation role -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible research and compilation'" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Responsabile ricerca e redazione'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
					<!-- Version time interval - CMD -->
		<xsl:if test="record/metadata/schede/*/CM/CMP/CMPD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
				</rdfs:label>
				<tiapit:time>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
				</tiapit:time>
			</rdf:Description>
		</xsl:if>
		<!-- Referente verifica scientifica -->
		<xsl:for-each select="record/metadata/schede/*/CM/RSR">
			<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                          <xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat(./@hint, ': ', normalize-space(.))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Scientific director', ': ', normalize-space(.))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
				<!-- Agent: Referente verifica scientifica -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
				</rdf:Description>
					<!-- Role: Referente verifica scientifica -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
	                </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(./@hint)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Scientific Director'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
			<!-- Funzionario responsabile -->
		<xsl:for-each select="record/metadata/schede/*/CM/FUR">
			<xsl:if test="(not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat(./@hint, ': ', normalize-space(.))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Official in charge', ': ', normalize-space(.))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
	                    </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                     </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
					<!-- Agent: Funzionario responsabile -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
				</rdf:Description>
					<!-- Role: Funzionario responsabile -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                      <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
	                </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                    </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(./@hint)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Official in charge'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>


		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$contenitoreFisico" />
			</xsl:attribute>
		</rdf:Description>
					<!-- xsl:variable name="sheetType" select="record/metadata/schede/*/CD/TSK/text()"></xsl:variable -->
				
												<!-- dc:type -->
						
					

	
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>