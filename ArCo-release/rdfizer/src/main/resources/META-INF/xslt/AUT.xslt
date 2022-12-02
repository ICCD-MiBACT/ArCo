<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:cpv="https://w3id.org/italia/onto/CPV/"
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
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>

	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	<xsl:template name="CamelCase">
		<xsl:param name="text" />
		<xsl:choose>
			<xsl:when test="contains($text,' ')">
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text" select="substring-before($text,' ')" />
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="substring-after($text,' ')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text" select="$text" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template match="/">
	<rdf:RDF>
		<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
		<xsl:if test="$sheetType='AUT' and record/metadata/schede/*/AU/AUT/AUTN" >
		
			<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
			<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
			<xsl:variable name="cp-name" select="''" />
			<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
			<xsl:variable name="itemURI">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/CD/NCT/NCTN">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/RV/RVE/RVEL">
						<xsl:variable name="rvel-punto" select="lower-case(normalize-space(record/metadata/schede/*/RV/RVE/RVEL))" />
								<xsl:variable name="rvel" select="translate($rvel-punto, '.', '_')" />
								<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', arco-fn:urify($rvel))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
					</xsl:otherwise>
				</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="accc-space" select="record/metadata/schede/*/AC/ACC[1]/ACCC" />
					<xsl:variable name="accc-nospace" select="translate($accc-space, ' ', '')" />
					<xsl:variable name="accc" select="translate($accc-nospace, '/', '_')" />
					<xsl:variable name="acc-space" select="record/metadata/schede/*/AC/ACC[1]" />
					<xsl:variable name="acc-nospace" select="translate($acc-space, ' ', '')" />
					<xsl:variable name="acc" select="translate($acc-nospace, '/', '_')" />
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
								<xsl:value-of select="$accc" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$acc" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
			</xsl:choose>
			</xsl:variable>
			<xsl:variable name="nameAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTN, ' - ', record/metadata/schede/*/AU/AUT/AUTA)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTN, ' ', record/metadata/schede/*/AU/AUT/AUTB)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTN" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="idAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTN, '-', record/metadata/schede/*/AU/AUT/AUTA))" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTN, '-', record/metadata/schede/*/AU/AUT/AUTB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTN)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="author" select="concat($NS, 'Agent/', $idAuthor)"/>
			
			<xsl:variable name="sex">
			 <xsl:choose>
				<xsl:when test="$sheetVersion='4.00_ICCD0'"><xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTE"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTZ"/></xsl:otherwise>
			 </xsl:choose>
			</xsl:variable>
		
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', 'CatalogueRecord', $sheetType)" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Catalogue Record of author ', $nameAuthor)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Scheda catalografica dell autore ', $nameAuthor)" />
				</rdfs:label>
					<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
				<arco-catalogue:systemRecordCode>
					<xsl:value-of select="$item" />
				</arco-catalogue:systemRecordCode>
				<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idAuthor, '-compilation')" />
						</xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AN/OSS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AN/OSS)" />
					</arco-core:note>
				</xsl:if>
				<!-- access profile -->
				<xsl:if test="record/metadata/schede/*/AD/ADS">
					<arco-catalogue:hasAccessProfile>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'AccessProfile/', $idAuthor, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
	                	</xsl:attribute>
					</arco-catalogue:hasAccessProfile>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idAuthor, '-compilation')" />
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
							<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
						</xsl:attribute>
					</arco-catalogue:isCatalogueRecordVersionOf>
					<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
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
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
							<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
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
						<!-- Version time interval - CMPD -->
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
		                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
		                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
			<!-- Access profile as an individual -->
			<xsl:if test="record/metadata/schede/*/AD/ADS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AccessProfile/', $idAuthor, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AccessProfile'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Profilo d''accesso ai dati della scheda catalografica dell autore ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Profilo d''accesso alla scheda catalografica dell autore ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Access profile to catalogue record of author ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Access profile to catalogue record of author ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</l0:name>
					<arco-catalogue:hasPrivacyLevel>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='1'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MinimumPrivacy'" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='2'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MediumPrivacy'" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='3'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MaximumPrivacy'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'PrivacyLevel/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-catalogue:hasPrivacyLevel>
					<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
						<arco-catalogue:hasPrivacyReason>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
							</xsl:attribute>
						</arco-catalogue:hasPrivacyReason>
					</xsl:if>
				</rdf:Description>
				<!-- privacy reason as an individuals -->
				<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/PrivacyReason'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			
			<!-- Author -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$author" />
				</xsl:attribute>
				<rdf:type>
					<xsl:choose>
						<xsl:when test="($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTP))='p'">
							<xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
						</xsl:when>
						<xsl:when test="($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTP))='e'">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:otherwise>
						</xsl:choose>
					</rdf:type>
				<arco-catalogue:isDescribedByCatalogueRecord>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
	                </xsl:attribute>
				</arco-catalogue:isDescribedByCatalogueRecord>
				<rdfs:label>
					<xsl:value-of select="$nameAuthor" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="$nameAuthor" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTA">
					<arco-cd:agentDate>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTA)" />
					</arco-cd:agentDate>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTC">
					<cpv:familyName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTC)" />
					</cpv:familyName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTO">
					<cpv:givenName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTO)" />
					</cpv:givenName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTP and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:pseudonym>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTP)" />
					</arco-cd:pseudonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTF and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:signature>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTF)" />
					</arco-cd:signature>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTF and ($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:nationality>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTF" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTY and ($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:nationality>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTY" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00_ICCD0') and record/metadata/schede/*/AU/AUT/AUTE">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTE)" />
					</arco-cd:alternativeName>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AU/AUV">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-cd:alternativeName>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTQ">
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, arco-fn:urify(.))" />
						</xsl:attribute>
					</arco-core:isAgentOf>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTV">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-cd:alternativeName>
				</xsl:for-each>
				<!-- historical information -->
				<xsl:if test="record/metadata/schede/*/AU/NSC">
					<arco-cd:historicalInformation>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/NSC)" />
					</arco-cd:historicalInformation>
				</xsl:if>
				<xsl:if test="string-length($sex)">
					<arco-lite:sex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$sex" />
						</xsl:attribute>
					</arco-lite:sex>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTL">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTL))" />
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTD">
					<cpv:dateOfBirth>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTD)" />
					</cpv:dateOfBirth>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTX">
					<cpv:hasDeathPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTX))" />
						</xsl:attribute>
					</cpv:hasDeathPlace>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTT">
					<cpv:dateOfDeath>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTT)" />
					</cpv:dateOfDeath>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTG">
					<arco-cd:activityPlaceAndPeriod>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTG)" />
					</arco-cd:activityPlaceAndPeriod>
				</xsl:if>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/BIB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Bibliography/', $idAuthor, '-bibliography-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'n.r')))">
					<arco-lite:localIdentifier>
   			        	<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTH" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AuthorIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTH))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
			</rdf:Description>
			<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, arco-fn:urify(.))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ruolo ricoperto da ', $nameAuthor, ': ', normalize-space(.))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Role of ', $nameAuthor, ': ', normalize-space(.))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ruolo ricoperto da ', $nameAuthor, ': ', normalize-space(.))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Role of ', $nameAuthor, ': ', normalize-space(.))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(.))" />
						</xsl:attribute>
					</arco-core:hasRole>
				</rdf:Description>
				<!-- role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(.))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTX))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTX)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AuthorIdentifier/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTH))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
			            </xsl:attribute>
					</rdf:type>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
					  		<xsl:value-of select="'https://w3id.org/arco/ontology/core/LocalIdentifier'" />
						</xsl:attribute>
					</arco-core:hasType>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTH)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTH)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTH)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- Bibliography of cultural property as an individual -->
			<xsl:for-each select="record/metadata/schede/*/DO/BIB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Bibliography/', $idAuthor, '-bibliography-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Bibliography ', position())" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Bibliography ', position())" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Bibliografia ', position())" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Bibliografia ', position())" />
					</l0:name>
					<xsl:if test="./BIBR and (not(starts-with(lower-case(normalize-space(./BIBR)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBR)), 'n.r')))">
						<arco-cd:abbreviation>
							<xsl:value-of select="normalize-space(./BIBR)" />
						</arco-cd:abbreviation>
					</xsl:if>
					<xsl:if test="./BIBM and (not(starts-with(lower-case(normalize-space(./BIBM)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBM)), 'n.r')))">
						<arco-cd:completeBibliographicReference>
							<xsl:value-of select="normalize-space()" />
						</arco-cd:completeBibliographicReference>
					</xsl:if>
					<xsl:if test="./BIBN and (not(starts-with(lower-case(normalize-space(./BIBN)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBN)), 'n.r')))">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./BIBN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</rdf:RDF>
	</xsl:template>								
</xsl:stylesheet>