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
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0">

	<xsl:param name="item" />
	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>

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

	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
		
	
<xsl:template match="/">
	<rdf:RDF>
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:if test="$sheetType='CF' or $sheetType='CG'" >
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
	<xsl:variable name="cp-name" select="''" />
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
			<xsl:when test="record/metadata/schede/MODI/CD/CDM">
				<xsl:value-of select="concat(arco-fn:urify(record/metadata/schede/*/CD/CDR), arco-fn:urify(record/metadata/schede/*/CD/CDM))" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/CD/CBC">
				<xsl:value-of select="record/metadata/schede/*/CD/CBC" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="accc-space" >
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
	<xsl:variable name="idCF">
		<xsl:choose>
   			<xsl:when test="record/metadata/schede/*/CD/CCF and contains(record/metadata/schede/*/CD/CCF, 'DBunico')">
   				<xsl:value-of select="substring-after(record/metadata/schede/*/CD/CCF, 'DBunico')"/>
   			</xsl:when>
  			<xsl:otherwise>
  				<xsl:value-of select="record/metadata/schede/*/CD/CCF"/>
  			</xsl:otherwise>
  		</xsl:choose>
 	</xsl:variable>
	<xsl:variable name="contenitoreFisico" select="concat('http://dati.beniculturali.it/iccd/cf/resource/CulturalInstituteOrSite/', $idCF)" />
	<xsl:variable name="contenitoreGiuridico" select="concat($NS, 'CulturalInstituteOrSite/', $idCG)" />
	<xsl:variable name="address">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
				<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI))))))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/LC/PVC/PVCI">
						<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVLT)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:if test="$sheetType='CF'" >
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
			<!-- alternative identifier (AC/ACC) -->
			<xsl:if test="record/metadata/schede/*/AC/ACC">
				<xsl:for-each select="record/metadata/schede/*/AC/ACC">
					<arco-catalogue:hasAlternativeIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $idCF, '-', position())" />
	                	</xsl:attribute>
						</arco-catalogue:hasAlternativeIdentifier>
				</xsl:for-each>
			</xsl:if>
			<!-- access profile -->
			<xsl:if test="record/metadata/schede/*/AD/ADS">
				<arco-catalogue:hasAccessProfile>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'AccessProfile/', $idCF, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
	                </xsl:attribute>
				</arco-catalogue:hasAccessProfile>
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
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCF, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
		<!-- Cataloguing level as individual -->
		<xsl:for-each select="record/metadata/schede/*/CD/LIR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', upper-case(arco-fn:urify(.)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/catalogue/CataloguingLevel" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(.)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(.)" />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
		<!-- Alternative Identifier as an individual (AC/ACC) -->
		<xsl:for-each select="record/metadata/schede/*/AC/ACC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $idCF, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AlternativeIdentifier'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del contenitore fisico: ', $idCF)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del contenitore fisico: ', $idCF)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del contenitore fisico: ', $idCF)" />
						</xsl:when>
						<xsl:otherwise> 
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del contenitore fisico: ', $idCF)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of site: ', $idCF)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of site: ', $idCF)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of site: ', $idCF)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of site: ', $idCF)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<l0:identifier>
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="./ACCC" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(.)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:identifier>
				<xsl:if test="./ACCS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./ACCS)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ACCP and (not(starts-with(lower-case(normalize-space(./ACCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCP)), 'n.r')))">
					<arco-catalogue:referenceProject>
						<xsl:value-of select="normalize-space(./ACCP)" />
					</arco-catalogue:referenceProject>
				</xsl:if>
				<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCF, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
			</rdf:Description>
					<!-- agent role for catalogue record responsible for alternative identifier  as an individual -->
			<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $idCF, '-catalogue-record-responsible')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del contenitore fisico ', $idCF, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of site ', $idCF, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del contenitore fisico ', $idCF, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of site ', $idCF, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACCE))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente responsabile della scheda catalografica'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible agency for catalogue record'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCF, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACCE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ACCE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ACCE)" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCF, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$contenitoreFisico" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
				</xsl:attribute>
			</rdf:type>
			<arco-catalogue:isDescribedByCatalogueRecord>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCF)" />
                </xsl:attribute>
			</arco-catalogue:isDescribedByCatalogueRecord>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/CF/CFN">
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFN)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label xml:lang="it">Contenitore fisico</rdfs:label>
					<l0:name xml:lang="it">Contenitore fisico</l0:name>
					<rdfs:label xml:lang="en">Site</rdfs:label>
					<l0:name xml:lang="en">Site</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/*/CF/CFD">
				<arco-core:description>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFD)" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="contains(record/metadata/schede/*/CD/CCF/text(), 'DBunico')">
    			<rdfs:seeAlso>
    				<xsl:attribute name="rdf:resource">
    					<xsl:value-of select="concat('http://dati.beniculturali.it/mibact/luoghi/resource/CulturalInstituteOrSite/', substring-after(record/metadata/schede/*/CD/CCF,'DBunicoCF') )"/>
     				</xsl:attribute>
     			</rdfs:seeAlso>
   			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CF/CFN">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFN)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CF/CFA">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:for-each>	
			<xsl:if test="record/metadata/schede/*/GE/*/*">
				<xsl:for-each select="record/metadata/schede/*/GE">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	        	        	<xsl:value-of select="concat($NS, 'Geometry/', $idCF, '-geometry-', position())" />
	            	    </xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/harvesting/*[name()='geocoding' or name()='puntoPrincipale']/*">
				<clvapit:hasGeometry>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Geometry/', $idCF, '-geometry-point')" />
					</xsl:attribute>
				</clvapit:hasGeometry>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/DO/FTA">
				<arco-cd:hasDocumentation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $idCF, '-photographic-documentation-', position())" />
					</xsl:attribute>
				</arco-cd:hasDocumentation>
				<xsl:for-each select="./FTAN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<xsl:variable name="url" select="arco-fn:find-link-emm(.)" />
						<xsl:for-each select="$url">
							<foaf:depiction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="." />
								</xsl:attribute>
							</foaf:depiction>
							<pico:preview>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="." />
								</xsl:attribute>
							</pico:preview>
						</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/LC/PVC">
				<cis:siteAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$address" />
					</xsl:attribute>
				</cis:siteAddress>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CD/CFF">
				<arco-location:siteIdentifier>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CD/CFF)" />
				</arco-location:siteIdentifier>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CF/CFU">
				<arco-cd:hasUseFunction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFU)))" />
					</xsl:attribute>
				</arco-cd:hasUseFunction>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CF/CFC">
				<cis:isPartOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(record/metadata/schede/*/CF/CFC))" />
					</xsl:attribute>
				</cis:isPartOf>
			</xsl:if>
							<!-- Site Type -->
			<xsl:if test="record/metadata/schede/*/CF/CFT">
				<arco-location:hasSiteType>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CF/CFQ">
								<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFQ)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-location:hasSiteType>
			</xsl:if>
		</rdf:Description>
						<!-- site use function as an individual -->
		<xsl:if test="record/metadata/schede/*/CF/CFU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFU)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
					</xsl:attribute>
				</rdf:type>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFU)" />
				</l0:name>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFU)" />
				</rdfs:label>
				<arco-cd:useFunction>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFU)" />
				</arco-cd:useFunction>
			</rdf:Description>
		</xsl:if>
						<!-- Site Type as an individual -->
		<xsl:if test="record/metadata/schede/*/CF/CFT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CF/CFQ">
							<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFQ)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                         <xsl:value-of select="'https://w3id.org/arco/ontology/location/SiteType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CF/CFQ">
							<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(record/metadata/schede/*/CF/CFT), ' ', normalize-space(record/metadata/schede/*/CF/CFQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(record/metadata/schede/*/CF/CFT))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CF/CFQ">
							<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(record/metadata/schede/*/CF/CFT), ' ', normalize-space(record/metadata/schede/*/CF/CFQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(record/metadata/schede/*/CF/CFT))" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CF/CFQ">
							<xsl:value-of select="concat('Site type:', ' ', normalize-space(record/metadata/schede/*/CF/CFT), ' ', normalize-space(record/metadata/schede/*/CF/CFQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Site type:', ' ', normalize-space(record/metadata/schede/*/CF/CFT))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CF/CFQ">
							<xsl:value-of select="concat('Site type:', ' ', normalize-space(record/metadata/schede/*/CF/CFT), ' ', normalize-space(record/metadata/schede/*/CF/CFQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Site type:', ' ', normalize-space(record/metadata/schede/*/CF/CFT))" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<arco-location:hasSiteDefinition>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($NS,'SiteDefinition/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)))" />
					</xsl:attribute>
				</arco-location:hasSiteDefinition>
				<xsl:if test="record/metadata/schede/*/CF/CFQ">
					<arco-location:hasSiteSpecification>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'SiteSpecification/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFQ)))" />
						</xsl:attribute>
					</arco-location:hasSiteSpecification>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
						<!-- Site Definition as an individual -->
		<xsl:if test="record/metadata/schede/*/CF/CFT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'SiteDefinition/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/SiteDefinition'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFT)" />
				</rdfs:label>
			</rdf:Description>
		</xsl:if>
						<!-- Site Specification as an individual -->
		<xsl:if test="record/metadata/schede/*/CF/CFQ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'SiteSpecification/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFQ)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/SiteSpecification'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFQ)" />
				</rdfs:label>
			</rdf:Description>
		</xsl:if>
						<!-- Monumental Area as individual -->
		<xsl:if test="record/metadata/schede/*/CF/CFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFC)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'http://dati.beniculturali.it/cis/MonumentalArea'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
						<!-- Address as individual -->
		<xsl:if test="record/metadata/schede/*/LC/PVC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                       <xsl:value-of select="$address" />
                </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="record/metadata/schede/*/LC/PVC/*">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</rdfs:label>
				<xsl:for-each select="record/metadata/schede/*/LC/PVL">
					<arco-location:hasToponymInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-location:hasToponymInTime>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCI and not(record/metadata/schede/*/LC/PVC/PVCI='.' or record/metadata/schede/*/LC/PVC/PVCI='-' or record/metadata/schede/*/LC/PVC/PVCI='/') and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCI)), 'n.r')))">
					<clvapit:fullAddress>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCI)" />
					</clvapit:fullAddress>
				</xsl:if>
				
					<!-- Stato -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
					<!-- Regione -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCR)), 'n.r')))">
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCR))" />
						</xsl:attribute>
					</clvapit:hasRegion>
				</xsl:if>
					<!-- Provincia -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
					<!-- Comune -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
 							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
					<!-- Località -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCL)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCL))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/LC/PVC/PVCE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
					<!-- ClericalAdministrativeArea -->
				<xsl:if test="record/metadata/schede/*/LC/PVE">
					<arco-location:hasClericalAdministrativeArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ClericalAdministrativeArea/', arco-fn:urify(record/metadata/schede/*/LC/PVE))" />
						</xsl:attribute>
					</arco-location:hasClericalAdministrativeArea>
				</xsl:if>
			</rdf:Description>

				<!-- Clerical Administrative Area : if any exists -->
			<xsl:if test="record/metadata/schede/*/LC/PVE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'ClericalAdministrativeArea/', arco-fn:urify(record/metadata/schede/*/LC/PVE))" />
					</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVE)" />
					</l0:name>
					<rdf:type rdf:resource="http://dati.beniculturali.it/cis/ClericalAdministrativeArea" />
				</rdf:Description>
			</xsl:if>

				<!-- Toponym in Time as individual -->
			<xsl:for-each select="record/metadata/schede/*/LC/PVL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/ToponymInTime'" />
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
				<!-- Stato -->
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
				<!-- Regione -->
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
				<!-- Provincia -->
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
				<!-- Comune -->
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
				<!-- Address Area -->
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCL)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCL)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/LC/PVC/PVCL)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LC/PVC/PVCE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/PVC/PVCE)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>		
		</xsl:if>						
		<!-- Geometry of cultural property as an individual for GE (version 4.00) -->
		<xsl:if test="record/metadata/schede/*/GE/*/*">
			<xsl:for-each select="record/metadata/schede/*/GE">
			<xsl:variable name="geometry-position" select="position()" />
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Geometry/', $idCF, '-geometry-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Geometry ', position(), ' of site: ', $idCF)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Geometry ', position(), ' of site: ', $idCF)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Georeferenziazione ', position(), ' del contenitore fisico: ', $idCF)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Georeferenziazione ', position(), ' del contenitore fisico: ', $idCF)" />
					</l0:name>
					<xsl:if test="./GET and (not(starts-with(lower-case(normalize-space(./GET)), 'nr')) and not(starts-with(lower-case(normalize-space(./GET)), 'n.r')))">
						<clvapit:hasGeometryType>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
                                <xsl:when test="./GET='georeferenziazione puntuale'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Point'" />
                                </xsl:when>
                                <xsl:when test="./GET='georeferenziazione areale'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Polygon'" />
                                </xsl:when>
                                <xsl:when test="./GET='georeferenziazione lineare'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Line'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
                                </xsl:otherwise>
                          		</xsl:choose>
                        	</xsl:attribute>
						</clvapit:hasGeometryType>
					</xsl:if>
					<xsl:for-each select="./GEC">
						<xsl:if test="./GECX and (not(starts-with(lower-case(normalize-space(./GECX)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECX)), 'n.r'))) or ./GECY and (not(starts-with(lower-case(normalize-space(./GECY)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECY)), 'n.r'))) or ./GECZ">
							<arco-location:hasCoordinates>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Coordinates/', $idCF, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            					</xsl:attribute>
							</arco-location:hasCoordinates>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="./GEP and (not(starts-with(lower-case(normalize-space(./GEP)), 'nr')) and not(starts-with(lower-case(normalize-space(./GEP)), 'n.r')))">
						<arco-location:spacialReferenceSystem>
							<xsl:value-of select="normalize-space(./GEP)" />
						</arco-location:spacialReferenceSystem>
					</xsl:if>
					<xsl:if test="./GPT and (not(starts-with(lower-case(normalize-space(./GPT)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPT)), 'n.r')))">
						<arco-location:hasGeometryTechnique>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryTechnique>
					</xsl:if>
					<xsl:if test="./GPM and (not(starts-with(lower-case(normalize-space(./GPM)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPM)), 'n.r')))">
						<arco-location:hasGeometryMethod>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryMethod>
					</xsl:if>
					<xsl:if test="./GPB">
						<arco-location:hasBaseMap>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BaseMap/', $idCF, '-geometry-', $geometry-position, '-base-map')" />
            				</xsl:attribute>
						</arco-location:hasBaseMap>
					</xsl:if>
					<xsl:if test="./GEL and not(./GEL='.' or ./GEL='-' or ./GEL='/') and (not(starts-with(lower-case(normalize-space(./GEL)), 'nr')) and not(starts-with(lower-case(normalize-space(./GEL)), 'n.r')))">
						<arco-location:hasLocationType>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./GEL))='luogo di provenienza' or lower-case(normalize-space(./GEL))='sede di provenienza' or lower-case(normalize-space(./GEL))='provenienza' or lower-case(normalize-space(./GEL))='provenienza'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/PreviousLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di produzione/realizzazione' or lower-case(normalize-space(./GEL))='luogo di esecuzione/fabbricazione'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ProductionRealizationLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='reperimento' or lower-case(normalize-space(./GEL))='reperimento'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/FindingLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito' or lower-case(normalize-space(./GEL))='deposito'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/StorageLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='esposizione' or lower-case(normalize-space(./GEL))='esposizione'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ExhibitionLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/ObservationLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='area rappresentata' or lower-case(normalize-space(./GEL))='area rappresentata'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SubjectLocation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./GEL))='localizzazione fisica'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
									</xsl:when>
									<xsl:when test="./GEL">
										<xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./GEL)))" />
									</xsl:when>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasLocationType>
					</xsl:if>
				</rdf:Description>
					<!-- referred location type for GE as an individual -->
				<xsl:if test="./GEL and not(./GEL='.' or ./GEL='-' or ./GEL='/') and (not(starts-with(lower-case(normalize-space(./GEL)), 'nr')) and not(starts-with(lower-case(normalize-space(./GEL)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./GEL))='luogo di provenienza' or lower-case(normalize-space(./GEL))='sede di provenienza' or lower-case(normalize-space(./GEL))='provenienza' or lower-case(normalize-space(./GEL))='provenienza'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di produzione/realizzazione' or lower-case(normalize-space(./GEL))='luogo di esecuzione/fabbricazione'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='reperimento' or lower-case(normalize-space(./GEL))='reperimento'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito' or lower-case(normalize-space(./GEL))='deposito'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='esposizione' or lower-case(normalize-space(./GEL))='esposizione'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento'" />
						<xsl:when test="lower-case(normalize-space(./GEL))='area rappresentata' or lower-case(normalize-space(./GEL))='area rappresentata'" />
						<xsl:when test="./GEL">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./GEL)))" />
                                </xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/LocationType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./GEL)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./GEL)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
					<!-- geometry type for GE as an individual -->
				<xsl:if test="./GET and not(./GET='.' or ./GET='-' or ./GET='/') and (not(starts-with(lower-case(normalize-space(./GET)), 'nr')) and not(starts-with(lower-case(normalize-space(./GET)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./GET='georeferenziazione puntuale'" />
						<xsl:when test="./GET='georeferenziazione areale'" />
						<xsl:when test="./GET='georeferenziazione lineare'" />
						<xsl:otherwise>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
                                </xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/italia/onto/CLV/GeometryType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./GET)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./GET)" />
								</l0:name>
							</rdf:Description>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- geometry coordinates for GE as an individual -->
				<xsl:for-each select="./GEC">
					<xsl:if test="./GECX and (not(starts-with(lower-case(normalize-space(./GECX)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECX)), 'n.r'))) or ./GECY and (not(starts-with(lower-case(normalize-space(./GECY)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECY)), 'n.r'))) or ./GECZ">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
            					<xsl:value-of select="concat($NS, 'Coordinates/', $idCF, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/Coordinates" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Coordinates ', position(), ' of site: ', $idCF)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Coordinates ', position(), ' of site: ', $idCF)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Coordinate ', position(), ' del contenitore fisico: ', $idCF)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Coordinate ', position(), ' del contenitore fisico: ', $idCF)" />
							</l0:name>
							<xsl:if test="./GECX and (not(starts-with(lower-case(normalize-space(./GECX)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECX)), 'n.r')))">
								<arco-location:long>
									<xsl:value-of select="normalize-space(./GECX)" />
								</arco-location:long>
							</xsl:if>
							<xsl:if test="./GECY and (not(starts-with(lower-case(normalize-space(./GECY)), 'nr')) and not(starts-with(lower-case(normalize-space(./GECY)), 'n.r')))">
								<arco-location:lat>
									<xsl:value-of select="normalize-space(./GECY)" />
								</arco-location:lat>
							</xsl:if>
							<xsl:if test="./GECZ">
								<arco-location:hasAltitude>
									<xsl:attribute name="rdf:resource">
       			    					<xsl:value-of select="concat($NS, 'Altitude/', $idCF, '-geometry-', $geometry-position, '-altitude')" />
            						</xsl:attribute>
								</arco-location:hasAltitude>
							</xsl:if>
							<xsl:if test="./GEC/GECS">
								<arco-core:note>
									<xsl:value-of select="normalize-space(./GEC/GECS)" />
								</arco-core:note>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
					<!-- geometry technique for GE as an individual -->
				<xsl:if test="./GPT and (not(starts-with(lower-case(normalize-space(./GPT)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            			</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/GeometryTechnique" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
					<!-- geometry method for GE as an individual -->
				<xsl:if test="./GPM and (not(starts-with(lower-case(normalize-space(./GPM)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPM)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            			</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/GeometryMethod" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
					<!-- geometry base map for GE as an individual -->
				<xsl:if test="./GPB">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
        	    			<xsl:value-of select="concat($NS, 'BaseMap/', $idCF, '-geometry-', $geometry-position, '-base-map')" />
            			</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/BaseMap" />
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Base cartografica del contenitore fisico: ', $idCF)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Base cartografica del contenitore fisico: ', $idCF)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Base map of site: ', $idCF)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Base map of site: ', $idCF)" />
						</l0:name>
						<xsl:if test="./GPB/GPBB">
							<arco-core:description>
								<xsl:value-of select="normalize-space(./GPB/GPBB)" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="./GPB/GPBT and (not(starts-with(lower-case(normalize-space(./GPB/GPBT)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPB/GPBT)), 'n.r')))">
							<tiapit:time>
								<xsl:value-of select="normalize-space(./GPB/GPBT)" />
							</tiapit:time>
						</xsl:if>
						<xsl:if test="./GPB/GPBU and (not(starts-with(lower-case(normalize-space(./GPB/GPBU)), 'nr')) and not(starts-with(lower-case(normalize-space(./GPB/GPBU)), 'n.r')))">
							<smapit:url>
								<xsl:value-of select="normalize-space(./GPB/GPBU)" />
							</smapit:url>
						</xsl:if>
						<xsl:if test="./GPB/GPBO">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./GPB/GPBO)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
					<!-- altitude for GE as an individual -->
				<xsl:if test="./GEC/GECZ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Altitude/', $idCF, '-geometry-', $geometry-position, '-altitude')" />
            			</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/Altitude" />
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Altitudine del contenitore fisico: ', $idCF)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Altitudine del contenitore fisico: ', $idCF)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Altitude of site: ', $idCF)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Altitude of site: ', $idCF)" />
						</l0:name>
						<xsl:if test="./GEC/GECZ and (not(starts-with(lower-case(normalize-space(./GEC/GECZ)), 'nr')) and not(starts-with(lower-case(normalize-space(./GEC/GECZ)), 'n.r')))">
							<arco-location:alt>
								<xsl:value-of select="normalize-space(./GEC/GECZ)" />
							</arco-location:alt>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		
		<!-- Geometry of site as an individual for geocoding|puntoPrincipale -->
		<xsl:if test="record/metadata/schede/harvesting/*[name()='geocoding' or name()='puntoPrincipale']/*">
			<xsl:variable name="xy" select="record/metadata/schede/harvesting/puntoPrincipale|record/metadata/schede/harvesting[not(puntoPrincipale)]/geocoding"/>
		    <rdf:Description>
		        <xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'Geometry/', $idCF, '-geometry-point')" />
		        </xsl:attribute>
		        <rdf:type>
		            <xsl:attribute name="rdf:resource">
		                <xsl:value-of
		                select="'https://w3id.org/italia/onto/CLV/Geometry'" />
		            </xsl:attribute>
		        </rdf:type>
		        <rdfs:label xml:lang="en">
		            <xsl:value-of
		                select="concat('Geometry (point) of site: ', $idCF)" />
		        </rdfs:label>
		        <l0:name xml:lang="en">
		            <xsl:value-of
		                select="concat('Geometry (point) of site: ', $idCF)" />
		        </l0:name>
		        <rdfs:label xml:lang="it">
		            <xsl:value-of
		                select="concat('Georeferenziazione (puntuale) del contenitore fisico: ', $idCF)" />
		        </rdfs:label>
		        <l0:name xml:lang="it">
		            <xsl:value-of
		                select="concat('Georeferenziazione (puntuale) del contenitore fisico: ', $idCF)" />
		        </l0:name>
		        <clvapit:isGeometryFor>
		            <xsl:attribute name="rdf:resource">
		               <xsl:value-of select="$contenitoreFisico" />
		            </xsl:attribute>
		        </clvapit:isGeometryFor>
		        <clvapit:hasGeometryType>
		            <xsl:attribute name="rdf:resource">
		                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Point'" />
		            </xsl:attribute>
		        </clvapit:hasGeometryType>
		        <!-- http://www.openlinksw.com/schemas/virtrdf#Geometry virtuoso datatype for geometry -->
		        <!-- http://www.opengis.net/ont/geosparql#wktLiteral virtuoso datatype for geometry -->
		        <clvapit:serialization rdf:datatype= "http://www.openlinksw.com/schemas/virtrdf#Geometry">
		            <!-- xsl:text disable-output-escaping="yes">&lt;![CDATA[ &lt;http://www.opengis.net/def/crs/OGC/1.3/CRS84&gt; </xsl:text-->
		            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
		            <xsl:value-of select="normalize-space(concat('POINT(', $xy/x, ' ', $xy/y, ')'))" />
		            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
		        </clvapit:serialization>
		        <arco-location:hasCoordinates>
		            <xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Coordinates/', $idCF, '-geometry-', 'coordinates')" />
		            </xsl:attribute>
		        </arco-location:hasCoordinates>
		    </rdf:Description>
			<!-- geometry coordinates for geocoding|puntoPrincipale as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Coordinates/', $idCF, '-geometry-', 'coordinates')" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/Coordinates" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Coordinates of site: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Coordinates of site: ', $idCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Coordinate del contenitore fisico: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Coordinate del contenitore fisico: ', $idCF)" />
				</l0:name>
				<arco-location:long>
					<xsl:value-of select="normalize-space($xy/x)" />
				</arco-location:long>
				<arco-location:lat>
					<xsl:value-of select="normalize-space($xy/y)" />
				</arco-location:lat>
			</rdf:Description>
		</xsl:if>
					
				<!-- Photographic documentation of cultural property as an individual -->
		<xsl:for-each select="record/metadata/schede/*/DO/FTA">
			<xsl:variable name="photodocu-position">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
           			<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $idCF, '-photographic-documentation-', position())" />
            	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PhotographicDocumentation'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Photographic documentation ', position(), ' of site: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Photographic documentation ', position(), ' of site: ', $idCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Documentazione fotografica ', position(), ' del contenitore fisico: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Documentazione fotografica ', position(), ' del contenitore fisico: ', $idCF)" />
				</l0:name>
				<xsl:if test="./FTAN and (not(starts-with(lower-case(normalize-space(./FTAN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAN)), 'n.r')))">
					<arco-cd:documentationIdentifier>
						<xsl:value-of select="normalize-space(./FTAN)" />
					</arco-cd:documentationIdentifier>
				</xsl:if>
				<xsl:if test="./FTAN and (not(starts-with(lower-case(normalize-space(./FTAN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAN)), 'n.r')))">
					<xsl:for-each select="./FTAN">
						<xsl:variable name="url" select="arco-fn:find-link-emm(.)" />
						<xsl:for-each select="$url">
							<foaf:depiction>
								<xsl:attribute name="rdf:resource">
                           	    	<xsl:value-of select="." />
                        		</xsl:attribute>
							</foaf:depiction>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="./FTAK and (not(starts-with(lower-case(normalize-space(./FTAK)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAK)), 'n.r')))">
					<arco-cd:digitalFileName>
						<xsl:value-of select="normalize-space(./FTAK)" />
					</arco-cd:digitalFileName>
				</xsl:if>
				<xsl:if test="./FTAT and (not(starts-with(lower-case(normalize-space(./FTAT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAT)), 'n.r')))">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./FTAT)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
								</xsl:when>
								<xsl:when test="./FTAX">
									<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
								</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="./FTAP and (not(starts-with(lower-case(normalize-space(./FTAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAP)), 'n.r')))">
					<arco-cd:hasDocumentationType>
						<xsl:attribute name="rdf:resource">
           					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            			</xsl:attribute>
					</arco-cd:hasDocumentationType>
				</xsl:if>
			</rdf:Description>
				<!-- documentation category of photographic documentation as an individual -->
			<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
				<xsl:choose>
					<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'" />
					<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'" />
					<xsl:when test="./FTAX">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./FTAX)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./FTAX)" />
							</l0:name>
						</rdf:Description>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
				<!-- documentation type of photographic documentation as an individual -->
			<xsl:if test="./FTAP and (not(starts-with(lower-case(normalize-space(./FTAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
           				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
           					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DocumentationType'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FTAP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FTAP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
			<!-- Access profile as an individual -->
		<xsl:if test="record/metadata/schede/*/AD/ADS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AccessProfile/', $idCF, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AccessProfile'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Profilo d''accesso ai dati della scheda catalografica del contenitore fisico ', $idCF, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Profilo d''accesso alla scheda catalografica del contenitore fisico ', $idCF, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Access profile to catalogue record of site ', $idCF, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Access profile to catalogue record of site ', $idCF, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
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
		<!-- Name in time for < 4.00 -->
		<xsl:if test="record/metadata/schede/*/CF/CFN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFN)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CF/CFN)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/*/CF/CFA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
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
	</xsl:if>
	<xsl:if test="$sheetType='CG'" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCG)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', 'CatalogueRecord', $sheetType)" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Catalogue Record of cultural institute or site n: ', $idCG)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Scheda catalografica del contenitore giuridico n: ', $idCG)" />
				</rdfs:label>
			<xsl:for-each select="record/metadata/schede/*/CD/LIR">
				<arco-catalogue:hasCataloguingLevel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', upper-case(arco-fn:urify(.)))" />
					</xsl:attribute>
				</arco-catalogue:hasCataloguingLevel>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/CG/CD/CCG">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="record/metadata/schede/CG/CD/CCG" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="$item" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
				<arco-catalogue:hasCatalogueRecordVersion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idCG, '-compilation')" />
					</xsl:attribute>
				</arco-catalogue:hasCatalogueRecordVersion>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AN/OSS">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/AN/OSS)" />
				</arco-core:note>
			</xsl:if>
			<!-- alternative identifier (AC/ACC) -->
			<xsl:if test="record/metadata/schede/*/AC/ACC">
				<xsl:for-each select="record/metadata/schede/*/AC/ACC">
					<arco-catalogue:hasAlternativeIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $idCG, '-', position())" />
	                	</xsl:attribute>
						</arco-catalogue:hasAlternativeIdentifier>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idCG, '-compilation')" />
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
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCG)" />
					</xsl:attribute>
				</arco-catalogue:isCatalogueRecordVersionOf>
				<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-compilation-', arco-fn:arcofy(.))" />
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
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
								<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
						<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-compilation-', arco-fn:arcofy(.))" />
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
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
	                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idCG, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
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
		<!-- Cataloguing level as individual -->
		<xsl:for-each select="record/metadata/schede/*/CD/LIR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', upper-case(arco-fn:urify(.)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/catalogue/CataloguingLevel" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(.)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(.)" />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
		<!-- Alternative Identifier as an individual (AC/ACC) -->
		<xsl:for-each select="record/metadata/schede/*/AC/ACC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $idCG, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AlternativeIdentifier'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del contenitore giuridico: ', $idCG)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del contenitore giuridico: ', $idCG)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del contenitore giuridico: ', $idCG)" />
						</xsl:when>
						<xsl:otherwise> 
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del contenitore giuridico: ', $idCG)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural institute or site: ', $idCG)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural institute or site: ', $idCG)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural institute or site: ', $idCG)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural institute or site: ', $idCG)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<l0:identifier>
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="./ACCC" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(.)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:identifier>
				<xsl:if test="./ACCS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./ACCS)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ACCP and (not(starts-with(lower-case(normalize-space(./ACCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCP)), 'n.r')))">
					<arco-catalogue:referenceProject>
						<xsl:value-of select="normalize-space(./ACCP)" />
					</arco-catalogue:referenceProject>
				</xsl:if>
				<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCG, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
			</rdf:Description>
					<!-- agent role for catalogue record responsible for alternative identifier  as an individual -->
			<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $idCG, '-catalogue-record-responsible')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del contenitore giuridico ', $idCG, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of cultural institute or site ', $idCG, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del contenitore giuridico ', $idCG, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of cultural institute or site ', $idCG, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACCE))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente responsabile della scheda catalografica'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible agency for catalogue record'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCG, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACCE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ACCE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ACCE)" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idCG, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$contenitoreGiuridico" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
				</xsl:attribute>
			</rdf:type>
			<arco-catalogue:isDescribedByCatalogueRecord>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCG)" />
                </xsl:attribute>
			</arco-catalogue:isDescribedByCatalogueRecord>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/CG/CGN">
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGN)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label xml:lang="it">Contenitore giuridico</rdfs:label>
					<l0:name xml:lang="it">Contenitore giuridico</l0:name>
					<rdfs:label xml:lang="en">Cultural institute or site</rdfs:label>
					<l0:name xml:lang="en">Cultural institute or site</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/*/CG/CGN">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGN)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CG/CGA">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:for-each>	
			<xsl:for-each select="record/metadata/schede/*/DO/BIB">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $idCF, '-bibliography-', position())" />
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/CD/CCF">
				<cis:hasSite>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$contenitoreFisico" />
					</xsl:attribute>
				</cis:hasSite>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CD/CCG">
				<arco-location:culturalInstituteOrSiteIdentifier>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CD/CCG)" />
				</arco-location:culturalInstituteOrSiteIdentifier>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CG/CGD">
				<arco-core:description>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGD)" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CG/NSC">
				<arco-cd:historicalInformation>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/NSC)" />
				</arco-cd:historicalInformation>
			</xsl:if>
							<!-- CIS Type -->
			<xsl:if test="record/metadata/schede/*/CG/CGT">
				<arco-location:hasCulturalInstituteOrSiteType>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CG/CGQ">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGQ)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-location:hasCulturalInstituteOrSiteType>
			</xsl:if>
		</rdf:Description>
						
						<!-- CIS Type as an individual -->
		<xsl:if test="record/metadata/schede/*/CG/CGT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CG/CGQ">
							<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGQ)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                         <xsl:value-of select="'https://w3id.org/arco/ontology/location/CulturalInstituteOrSiteType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CG/CGQ">
							<xsl:value-of select="concat('Tipo di contenitore giuridico:', ' ', normalize-space(record/metadata/schede/*/CG/CGT), ' ', normalize-space(record/metadata/schede/*/CG/CGQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Tipo di contenitore giuridico:', ' ', normalize-space(record/metadata/schede/*/CG/CGT))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CG/CGQ">
							<xsl:value-of select="concat('Tipo di contenitore giuridico:', ' ', normalize-space(record/metadata/schede/*/CG/CGT), ' ', normalize-space(record/metadata/schede/*/CG/CGQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Tipo di contenitore giuridico:', ' ', normalize-space(record/metadata/schede/*/CG/CGT))" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CG/CGQ">
							<xsl:value-of select="concat('Cultural institute or site type:', ' ', normalize-space(record/metadata/schede/*/CG/CGT), ' ', normalize-space(record/metadata/schede/*/CG/CGQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Cultural institute or site type:', ' ', normalize-space(record/metadata/schede/*/CG/CGT))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CG/CGQ">
							<xsl:value-of select="concat('Cultural institute or site type:', ' ', normalize-space(record/metadata/schede/*/CG/CGT), ' ', normalize-space(record/metadata/schede/*/CG/CGQ))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Cultural institute or site type:', ' ', normalize-space(record/metadata/schede/*/CG/CGT))" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<arco-location:hasCulturalInstituteOrSiteDefinition>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($NS,'CulturalInstituteOrSiteDefinition/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)))" />
					</xsl:attribute>
				</arco-location:hasCulturalInstituteOrSiteDefinition>
				<xsl:if test="record/metadata/schede/*/CG/CGQ">
					<arco-location:hasCulturalInstituteOrSiteSpecification>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'hasCulturalInstituteOrSiteSpecification/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGQ)))" />
						</xsl:attribute>
					</arco-location:hasCulturalInstituteOrSiteSpecification>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
						<!-- Site Definition as an individual -->
		<xsl:if test="record/metadata/schede/*/CG/CGT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'hasCulturalInstituteOrSiteDefinition/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/CulturalInstituteOrSiteDefinition'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGT)" />
				</rdfs:label>
			</rdf:Description>
		</xsl:if>
						<!-- Site Specification as an individual -->
		<xsl:if test="record/metadata/schede/*/CG/CGQ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'CulturalInstituteOrSiteSpecification/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGQ)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/CulturalInstituteOrSiteSpecification'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGQ)" />
				</rdfs:label>
			</rdf:Description>
		</xsl:if>						
					
				<!-- Bibliography of cultural property as an individual -->
		<xsl:for-each select="record/metadata/schede/*/DO/BIB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
           			<xsl:value-of select="concat($NS, 'Bibliography/', $idCF, '-bibliography-', position())" />
           		</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
           				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography ', position(), ' of cultural institute or site: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography ', position(), ' of cultural institute or site: ', $idCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia ', position(), ' del contenitore giuridico: ', $idCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliografia ', position(), ' del contenitore giuridico: ', $idCF)" />
				</l0:name>
				<xsl:if test="./BIBR and (not(starts-with(lower-case(normalize-space(./BIBR)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBR)), 'n.r')))">
					<arco-cd:abbreviation>
						<xsl:value-of select="normalize-space(./BIBR)" />
					</arco-cd:abbreviation>
				</xsl:if>
				<xsl:if test="./BIBN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./BIBN)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./BIBM">
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="normalize-space(./BIBM)" />
					</arco-cd:completeBibliographicReference>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- Name in time for < 4.00 -->
		<xsl:if test="record/metadata/schede/*/CG/CGN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGN)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CG/CGN)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/*/CG/CGA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
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
	</xsl:if>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>