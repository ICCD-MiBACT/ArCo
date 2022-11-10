<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-mi="https://w3id.org/arco/ontology/musical-instrument/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-spe="https://w3id.org/arco/ontology/natural-specimen-description/"
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
	xmlns:ar-agentrole="https://w3id.org/arco/resource/AgentRole/"
	xmlns:ar-agent="https://w3id.org/arco/resource/Agent/"
	xmlns:ar-role="https://w3id.org/arco/resource/Role/"
	xmlns:ar-privacyReason="https://w3id.org/arco/resource/PrivacyReason/"
	xmlns:COV="https://w3id.org/italia/onto/COV/"
	xmlns:cpv="https://w3id.org/italia/onto/CPV/"
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
	xmlns:ar-TechnicalStatus="https://w3id.org/arco/resource/TechnicalStatus/"
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

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
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

	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	
	<xsl:template name="CamelCase1">
		<xsl:param name="text" />
		<xsl:value-of select="translate(($text),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>

	<!-- xsl:variable name="NS"	select="$NS,''" /-->
	<xsl:param name="NS" />
			
<xsl:template match="/">
	<rdf:RDF>
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
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
	<xsl:variable name="culturalProperty">
		<xsl:choose>
			<xsl:when test="$sheetType='MODI'">
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType(record/metadata/schede/MODI/OG/AMB)), '/', $itemURI)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>		
	<xsl:if test="$sheetType='BDI'">			
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/l0/EventOrSituation'" />
				</xsl:attribute>
			</rdf:type>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="$sheetType='BDI' or $sheetType='BDM'">			
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/DemoEthnoAnthropologicalHeritage'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/*/MT/MOF">
				<arco-cd:methodOfManufacturing>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/MT/MOF)" />
				</arco-cd:methodOfManufacturing>
			</xsl:if>
			<!-- production realization location for BDM < version 4.00 -->
			<xsl:for-each select="record/metadata/schede/BDM/AU/LDF">
				<arco-location:hasTimeIndexedTypedLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-production-realization-', position())" />
					</xsl:attribute>
				</arco-location:hasTimeIndexedTypedLocation>
			</xsl:for-each>
			<!-- original location location  -->
			<xsl:if test="record/metadata/schede/*/OC">
				<arco-location:hasTimeIndexedTypedLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-location')" />
					</xsl:attribute>
				</arco-location:hasTimeIndexedTypedLocation>
			</xsl:if>
			<!-- has dating for BDM < 4.00 norm -->
			<xsl:for-each select="record/metadata/schede/BDM/AU/DTF">
				<arco-cd:hasDating>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-cd:hasDating>
			</xsl:for-each>
			<xsl:if test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
				<xsl:if test="record/metadata/schede/*/RC/RCI or record/metadata/schede/*/RC/RCF">
					<arco-cd:hasDating>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasDating>
				</xsl:if>
			</xsl:if>
			<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:if test="record/metadata/schede/*/RC/RCR/RCRI or record/metadata/schede/*/RC/RCR/RCRF">
					<arco-cd:hasDating>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasDating>
				</xsl:if>
			</xsl:if>
			<!-- has cultural property category -->
			<xsl:if test="record/metadata/schede/BDM/OG/OGT/OGTG">
				<arco-arco:hasCulturalPropertyCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)))" />
					</xsl:attribute>
				</arco-arco:hasCulturalPropertyCategory>
			</xsl:if>
			<!-- observation survey of cultural property -->
			<xsl:if test="record/metadata/schede/*/DR/*">
				<arco-cd:hasSurvey>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ObservationSurvey/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasSurvey>
			</xsl:if>
			<!-- detection method of cultural property -->
			<xsl:if test="record/metadata/schede/*/RD/RDM">
				<arco-cd:hasDetectionMethod>
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/RD/RDM))='archivio'">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchivalResearch'" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/RD/RDM))='terreno'">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DirectObservation'" />
						</xsl:when>
					</xsl:choose>
				</arco-cd:hasDetectionMethod>
			</xsl:if>	
			<!-- detection method of cultural property -->
			<xsl:if test="record/metadata/schede/*/LA/PRM">
				<arco-cd:hasDetectionMethod>
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LA/PRM))='archivio'">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchivalResearch'" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LA/PRM))='rilevamento nel contesto'">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DirectObservation'" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LA/PRM))='rilevamento decontestualizzato'">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DirectObservation'" />
						</xsl:when>
					</xsl:choose>
				</arco-cd:hasDetectionMethod>
			</xsl:if>
			<!-- circumstance of cultural property -->
			<xsl:if test="not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:if test="record/metadata/schede/*/CA/CAA">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAA))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAV">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAV))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAS">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAS))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAP">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAP))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAL">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAL))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAF">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAF))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAQ">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAQ))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAI">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAI))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$sheetVersion='4.00_ICCD0' or $sheetVersion='4.00'">
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOA">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOA))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOV">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOV))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOS">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOS))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOP">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOP))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOL">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOL))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOF">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOF))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOQ">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOQ))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOI">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOI))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CA/CAO/CAOO">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOO))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
			</xsl:if>
			<!-- recurrent situation series -->
			<xsl:if test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
				<xsl:if test="record/metadata/schede/*/RC/RCP">
					<arco-ce:isSituationMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecurrentSituationSeries/', $itemURI)" />
						</xsl:attribute>
					</arco-ce:isSituationMemberOf>
				</xsl:if>
			</xsl:if>
			<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:if test="record/metadata/schede/*/RC/RCR/RCRP">
					<arco-ce:isSituationMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecurrentSituationSeries/', $itemURI)" />
						</xsl:attribute>
					</arco-ce:isSituationMemberOf>
				</xsl:if>
			</xsl:if>
			<!-- communication  medium -->
			<xsl:if test="record/metadata/schede/*/CU/CUV">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-verbal')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CU/CUM">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-singing')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CU/CUS">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-instrumental')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CU/CUC">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-kinetic')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/CU/CUP">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-proxemics')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CU/CUR">
				<arco-dd:hasCommunicationMedium>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-written')" />
					</xsl:attribute>
				</arco-dd:hasCommunicationMedium>
			</xsl:for-each>
			<!-- elements -->
			<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMA">
				<arco-dd:involvesElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Animal/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-dd:involvesElement>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMV">
				<arco-dd:involvesElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Vegetal/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-dd:involvesElement>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMM">
				<arco-dd:involvesElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-dd:involvesElement>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMO">
				<arco-dd:involvesElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-dd:involvesElement>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRME">
				<arco-dd:involvesElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-dd:involvesElement>
			</xsl:for-each>
			<!-- involves main agent -->
			<xsl:for-each select="record/metadata/schede/*/AT">
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-', position())" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
				<xsl:choose>
					<xsl:when test="./ATT/ATTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-lite:involvesMainAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
							</xsl:attribute>
						</arco-lite:involvesMainAgent>
					</xsl:when>
					<xsl:otherwise>
						<arco-lite:involvesMainAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./ATT/ATTI, ./ATT/ATTZ, ./ATT/ATTB, ./ATT/ATTM)))" />
							</xsl:attribute>
						</arco-lite:involvesMainAgent>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/TC">
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-group', position())" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
				<arco-lite:involvesMainAgent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./TCD))" />
					</xsl:attribute>
				</arco-lite:involvesMainAgent>
			</xsl:for-each>
			<!-- has recording -->
			<xsl:if test="record/metadata/schede/*/DU">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AudioRecording/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DV">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'VideoRecording/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DF">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicRecording/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/AI">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AudioRecording/', $itemURI, '-integrative-recording-', position())" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/VI">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'VideoRecording/', $itemURI, '-integrative-recording-', position())" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/FI">
				<arco-cd:hasRecording>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicRecording/', $itemURI, '-integrative-recording-', position())" />
					</xsl:attribute>
				</arco-cd:hasRecording>
			</xsl:for-each>
		</rdf:Description>
		<!-- production realization location for BDM < version 4.00 -->
		<xsl:for-each select="record/metadata/schede/BDM/AU/LDF">
			<xsl:variable name="location">
				<xsl:choose>
					<xsl:when test="./LDFS and not(lower-case(normalize-space(./LDFS))='italia')">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFS)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
					</xsl:when>
					<xsl:otherwise>
	               	     <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFP)), normalize-space(lower-case(./LDFC)), normalize-space(lower-case(./LDFF)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-production-realization-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
					</xsl:attribute>
				</rdf:type>
				<arco-location:isTimeIndexedTypedLocationOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-location:isTimeIndexedTypedLocationOf>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Localizzazione di produzione/realizzazione del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Localizzazione di produzione/realizzazione del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Production/realization location of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Production/realization location of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-location:hasLocationType>
				<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/ProductionRealizationLocation'" />
					</xsl:attribute>
				</arco-location:hasLocationType>
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
			</rdf:Description>
			<!-- feature for BDM < version 4.00 -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$location" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(.)" />
				</rdfs:label>
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./LDFS and not(lower-case(normalize-space(./LDFS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFS)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFP)), normalize-space(lower-case(./LDFC)), normalize-space(lower-case(./LDFF)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
							</xsl:otherwise>
						</xsl:choose>
                       </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                        <xsl:choose>
						<xsl:when test="./LDFS and not(lower-case(normalize-space(./LDFS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFS)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
						</xsl:when>
						<xsl:otherwise>
	                            <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./LDFP)), normalize-space(lower-case(./LDFC)), normalize-space(lower-case(./LDFF)), normalize-space(lower-case(./LDFL)), normalize-space(lower-case(./LDFU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="./*">
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
				<!-- Stato -->
				<xsl:if test="./LDFS and (not(starts-with(lower-case(normalize-space(./LDFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./LDFS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./LDFR and (not(starts-with(lower-case(normalize-space(./LDFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./LDFC and (starts-with(lower-case(normalize-space(./LDFC)), 'firenze') or starts-with(lower-case(normalize-space(./LDFC)), 'siena') or starts-with(lower-case(normalize-space(./LDFC)), 'san severino marche') or starts-with(lower-case(normalize-space(./LDFC)), 'modena'))">		
							<xsl:choose>
								<xsl:when test="./LDFR and (starts-with(lower-case(normalize-space(./LDFR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LDFR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LDFR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./LDFP and (not(starts-with(lower-case(normalize-space(./LDFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./LDFP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./LDFC and (not(starts-with(lower-case(normalize-space(./LDFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./LDFC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="./LDFL and (not(starts-with(lower-case(normalize-space(./LDFL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFL)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./LDFL))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="./LDFF and (not(starts-with(lower-case(normalize-space(./LDFF)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFF)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./LDFF))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="./LDFU and not(./LDFU='.' or ./LDFU='-' or ./LDFU='/') and (not(starts-with(lower-case(normalize-space(./LDFU)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFU)), 'n.r')))">
					<clvapit:fullAddress>
						<xsl:value-of select="normalize-space(./LDFU)" />
					</clvapit:fullAddress>
				</xsl:if>
			</rdf:Description>
			<!-- Country LA -->
			<xsl:if test="./LDFS and (not(starts-with(lower-case(normalize-space(./LDFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./LDFS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./LDFS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./LDFS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region LA -->
			<xsl:if test="./LDFR and (not(starts-with(lower-case(normalize-space(./LDFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LDFR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province LA -->
			<xsl:if test="./LDFP and (not(starts-with(lower-case(normalize-space(./LDFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./LDFP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./LDFP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./LDFP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City LA -->
			<xsl:if test="./LDFC and (not(starts-with(lower-case(normalize-space(./LDFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./LDFC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) LA -->
			<xsl:if test="./LDFF and (not(starts-with(lower-case(normalize-space(./LDFF)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFF)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./LDFF))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFF)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFF)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LDFL and (not(starts-with(lower-case(normalize-space(./LDFL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LDFL)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./LDFL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFL)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LDFL)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- original location -->
		<xsl:if test="record/metadata/schede/*/OC">
			<xsl:variable name="location">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OC/OCT">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTR)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTL)))))" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OC/OCC/OCCS and not(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS))='italia')">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCR)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-location')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
					</xsl:attribute>
				</rdf:type>
				<arco-location:isTimeIndexedTypedLocationOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-location:isTimeIndexedTypedLocationOf>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Localizzazione di origine del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Localizzazione di origine del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Original location of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Original location of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-location:hasLocationType>
				<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/OriginalLocation'" />
					</xsl:attribute>
				</arco-location:hasLocationType>
				<!-- feature -->
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
				<!-- Time interval -->
				<xsl:if test="record/metadata/schede/*/OC/OCD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/OC/OCD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
			</rdf:Description>
			<!-- Time interval as individual -->
			<xsl:if test="record/metadata/schede/*/OC/OCD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/OC/OCD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCD)" />
					</rdfs:label>
					<tiapit:startTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCD)" />
					</tiapit:startTime>
					<tiapit:endTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCD)" />
					</tiapit:endTime>
				</rdf:Description>
			</xsl:if>
			<!-- feature for BDM < version 4.00 -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$location" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OC/OCT">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCT)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCC)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<!-- address -->
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OC/OCT">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTR)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTL)))))" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OC/OCC/OCCS and not(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCE)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    <xsl:choose>
                    	<xsl:when test="record/metadata/schede/*/OC/OCT">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTR)), normalize-space(lower-case(record/metadata/schede/*/OC/OCT/OCTL)))))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/*/OC/OCC/OCCS and not(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCS)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCE)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
						</xsl:when>
						<xsl:otherwise>
	               	            <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCP)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCC)), normalize-space(lower-case(record/metadata/schede/*/OC/OCC/OCCL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<xsl:if test="record/metadata/schede/*/OC/OCT">
				<rdfs:label>
					<xsl:for-each select="record/metadata/schede/*/OC/OCT/*">
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
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OC/OCC">
				<rdfs:label>
					<xsl:for-each select="record/metadata/schede/*/OC/OCC/*">
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
				</xsl:if>
				<!-- Stato -->
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OC/OCT/OCTS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCT/OCTS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCT/OCTS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OC/OCC/OCCC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'firenze') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'siena') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'san severino marche') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'modena'))">		
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OC/OCC/OCCR and (starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OC/OCT/OCTR">
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
        		            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTR))" />
					    </xsl:attribute>
					</clvapit:hasRegion>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="record/metadata/schede/*/OC/OCT/OCTL">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTL))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCL)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCL))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OC/OCC/OCCE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
			</rdf:Description>
			<!-- Country -->
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCC/OCCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCC/OCCS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OC/OCT/OCTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCT/OCTS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCT/OCTS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region -->
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OC/OCT/OCTR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCT/OCTR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCT/OCTR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province -->
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCC/OCCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCC/OCCP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City -->
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) -->
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCL)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCL)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCL)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OC/OCT/OCTL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCT/OCTL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCT/OCTL)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCT/OCTL)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OC/OCC/OCCE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OC/OCC/OCCE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/OC/OCC/OCCE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- dating as individual -->
		<xsl:for-each select="record/metadata/schede/BDM/AU/DTF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Dating'" />
		        	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<!-- Source of dating -->
				<xsl:if test="./DTFM and (not(starts-with(lower-case(normalize-space(./DTFM)), 'nr')) and not(starts-with(lower-case(normalize-space(./DTFM)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DTFM)))" />
			            </xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
				<!-- dating event -->
				<arco-cd:hasDatingEvent>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
		    	    </xsl:attribute>
				</arco-cd:hasDatingEvent>
			</rdf:Description>
			<!-- Source of dating as individual -->
			<xsl:if test="./DTFM and (not(starts-with(lower-case(normalize-space(./DTFM)), 'nr')) and not(starts-with(lower-case(normalize-space(./DTFM)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DTFM)))" />
			        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		    	        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
		        	    </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DTFM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DTFM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- event of dating as individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Event'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
				</l0:name>
				<!-- time interval -->
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTFZ)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</rdf:Description>
			<!-- Time interval as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTFZ)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./DTFZ)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./DTFZ)" />
				</l0:name>
				<tiapit:time>
					<xsl:value-of select="normalize-space(./DTFZ)" />
				</tiapit:time>
			</rdf:Description>
		</xsl:for-each>
		<xsl:if test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
			<xsl:if test="record/metadata/schede/*/RC/RCI or record/metadata/schede/*/RC/RCF">
			<xsl:variable name="startDate">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/RC/RCI)" />
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/RC/RCF)" />
			</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		    	    		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Dating'" />
			        	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</l0:name>
					<!-- dating event -->
					<arco-cd:hasDatingEvent>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
			    	    </xsl:attribute>
					</arco-cd:hasDatingEvent>
				</rdf:Description>
				<!-- event of dating as individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Event'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
					</l0:name>
					<!-- time interval -->
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/RC/RCI">
						<arco-arco:startTime>
							<xsl:value-of select="$startDate" />
						</arco-arco:startTime>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/RC/RCF">
						<arco-arco:endTime>
							<xsl:value-of select="$endDate" />
						</arco-arco:endTime>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
			<xsl:if test="record/metadata/schede/*/RC/RCR/RCRI or record/metadata/schede/*/RC/RCR/RCRF">
			<xsl:variable name="startDate">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/RC/RCR/RCRI)" />
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/RC/RCR/RCRF)" />
			</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		    	    		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Dating'" />
			        	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Cronologia ', position(), ' del bene culturale ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</l0:name>
					<!-- dating event -->
					<arco-cd:hasDatingEvent>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
			    	    </xsl:attribute>
					</arco-cd:hasDatingEvent>
				</rdf:Description>
				<!-- event of dating as individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Event'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Creation of cultural property ', $itemURI)" />
					</l0:name>
					<!-- time interval -->
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/RC/RCR/RCRI">
						<arco-arco:startTime>
							<xsl:value-of select="$startDate" />
						</arco-arco:startTime>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/RC/RCR/RCRF">
						<arco-arco:endTime>
							<xsl:value-of select="$endDate" />
						</arco-arco:endTime>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- cultural property category -->
		<xsl:if test="record/metadata/schede/BDM/OG/OGT/OGTG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/BDM/OG/OGT/OGTG)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                           <xsl:value-of select="'https://w3id.org/arco/ontology/arco/CulturalPropertyCategory'" />
                       </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BDM/OG/OGT/OGTG)" />
				</rdfs:label>
			</rdf:Description>
		</xsl:if>
		<!-- observation survey -->
		<xsl:if test="record/metadata/schede/BDI/DR/* or record/metadata/schede/BDM/DR/*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              			<xsl:value-of select="concat($NS, 'ObservationSurvey/', $itemURI)" />
              		</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ObservationSurvey'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Observation survey of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Observation survey of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Indagine di rilevamento del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Indagine di rilevamento del bene culturale ', $itemURI)" />
				</l0:name>
				<!-- at time -->
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVD and not(record/metadata/schede/BDM/DR/DRV/DRVD='0000/00/00' or record/metadata/schede/BDM/DR/DRV/DRVD='/')">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRD and not(record/metadata/schede/*/DR/DRD='0000/00/00' or record/metadata/schede/*/DR/DRD='/')">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DR/DRD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRN)" />
					</arco-core:note>
				</xsl:if>
				<!-- has agent role -->
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'n.r')))">
					<arco-lite:hasResponsibleAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVE))" />
               			</xsl:attribute>
					</arco-lite:hasResponsibleAgent>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="not(record/metadata/schede/*/DR/DRV/*)">
					<xsl:if test="record/metadata/schede/*/DR/DRV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'n.r')))">
						<arco-lite:hasResponsibleAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRV))" />
               				</xsl:attribute>
						</arco-lite:hasResponsibleAgent>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'n.r')))">
					<arco-lite:hasOperator>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRL))" />
               			</xsl:attribute>
					</arco-lite:hasOperator>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-operator')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRO and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'n.r')))">
					<arco-lite:hasVideoOperator>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRO))" />
               			</xsl:attribute>
					</arco-lite:hasVideoOperator>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-video-operator')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'n.r')))">
					<arco-lite:hasPhotographer>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRG))" />
               			</xsl:attribute>
					</arco-lite:hasPhotographer>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-photographer')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'n.r')))">
					<arco-lite:hasSoundEngineer>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRF))" />
               			</xsl:attribute>
					</arco-lite:hasSoundEngineer>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-sound-engineer')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<!-- has research -->
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVR">
					<arco-cd:hasResearch>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:hasResearch>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRT or record/metadata/schede/*/DR/DRR">
					<arco-cd:hasResearch>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:hasResearch>
				</xsl:if>
			</rdf:Description>
			<!-- Time interval as an individual -->
			<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVD and not(record/metadata/schede/BDM/DR/DRV/DRVD='0000/00/00' or record/metadata/schede/BDM/DR/DRV/DRVD='/')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)" />
					</l0:name>
					<tiapit:startTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)" />
					</tiapit:startTime>
					<tiapit:endTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)" />
					</tiapit:endTime>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DR/DRD and not(record/metadata/schede/*/DR/DRD='0000/00/00' or record/metadata/schede/*/DR/DRD='/')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DR/DRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRD)" />
					</l0:name>
					<tiapit:startTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRD)" />
					</tiapit:startTime>
					<tiapit:endTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRD)" />
					</tiapit:endTime>
				</rdf:Description>
			</xsl:if>
			<!-- Activity responsible as an individual -->
			<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Responsible agency of obervation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Responsible agency of observation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
	                       </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVE))" />
	                       </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- Role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Responsabile dell''attività'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible agent'" />
					</rdfs:label>
				</rdf:Description>
				<!-- Agent as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVE))" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BDM/DR/DRV/DRVE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BDM/DR/DRV/DRVE)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="not(record/metadata/schede/*/DR/DRV/*)">
				<xsl:if test="record/metadata/schede/*/DR/DRV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                       		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
           	       		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                   	        <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       	</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Ente responsabile del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRV))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Ente responsabile del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRV))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Responsible agency of obervation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRV))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Responsible agency of observation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRV))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
	               	            <xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
	                   	    </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	       	                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRV))" />
	           	            </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	           	            <xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
	               	    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                           	<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
		                       </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile dell''attività'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Responsible agent'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	           	            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRV))" />
	               	    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                           	<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                       </xsl:attribute>
						</rdf:type>
						<xsl:variable name="getName">
							<xsl:value-of select="arco-fn:get-nome-ente-from-codice(record/metadata/schede/*/DR/DRV)" />
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($getName)>0">
								<rdfs:label>
									<xsl:value-of select="arco-fn:get-nome-ente-from-codice(record/metadata/schede/*/DR/DRV)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="arco-fn:get-nome-ente-from-codice(record/metadata/schede/*/DR/DRV)" />
								</l0:name>
							</xsl:when>
							<xsl:otherwise>
								<rdfs:label>
									<xsl:value-of select="record/metadata/schede/*/DR/DRV" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="record/metadata/schede/*/DR/DRV" />
								</l0:name>
							</xsl:otherwise>
						</xsl:choose>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Activity operator as an individual -->
			<xsl:if test="record/metadata/schede/*/DR/DRL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-operator')" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ente operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRL))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ente operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRL))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Operator of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRL))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Operator of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRL))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Role/Operator')" />
	                       </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRL))" />
	                       </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- Role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Role/Operator')" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Operatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Operator'" />
					</rdfs:label>
				</rdf:Description>
				<!-- Agent as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRL))" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Video operator as an individual -->
			<xsl:if test="record/metadata/schede/*/DR/DRO and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-video-operator')" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRO))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRO))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRO))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRO))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Role/VideoOperator')" />
	                       </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRO))" />
	                       </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- Role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/VideoOperator')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Video operatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Video operator'" />
					</rdfs:label>
				</rdf:Description>
				<!-- Agent as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRO))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Photographer as an individual -->
			<xsl:if test="record/metadata/schede/*/DR/DRG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-photographer')" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Fotografo del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Fotografo del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Photographer of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Photographer of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Role/Photographer')" />
	                       </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRG))" />
	                       </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- Role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Role/Photographer')" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                       </xsl:attribute>
					</rdf:type>
						<rdfs:label xml:lang="it">
						<xsl:value-of select="'Fotografo'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Photographer'" />
					</rdfs:label>
				</rdf:Description>
				<!-- Agent as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRG))" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRG)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- SoundEngineer as an individual -->
			<xsl:if test="record/metadata/schede/*/DR/DRF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-sound engineer')" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Fonico del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Fonico del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Sound engineer of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Sound engineer of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Role/SoudEngineer')" />
	                       </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRF))" />
	                       </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- Role as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Role/SoundEngineer')" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Fonico'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Sound engineer'" />
					</rdfs:label>
				</rdf:Description>
				<!-- Agent as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRF))" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRF)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Research as an individual -->
			<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Research" />
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DR/DRV/DRVTT">
							<rdfs:label>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRV/DRVT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRV/DRVT)" />
							</l0:name>
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Research on cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Research on cultural property ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ricerca sul bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ricerca sul bene culturale ', $itemURI)" />
							</l0:name>
						</xsl:otherwise>
					</xsl:choose>
					<arco-lite:hasScientificDirector>
						<xsl:attribute name="rdf:resource">
               				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVR))" />
               			</xsl:attribute>
					</arco-lite:hasScientificDirector>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</rdf:Description>
				<!-- Agent role as an individual -->
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
                   		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
		                       </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Scientific director of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Scientific director of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
		                       </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVR))" />
		                       </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Role as an individual -->
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
							<xsl:value-of select="'Responsabile scientifico della ricerca'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Scientific Director'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVR))" />
		                   </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BDM/DR/DRV/DRVR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BDM/DR/DRV/DRVR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DR/DRT or record/metadata/schede/*/DR/DRR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Research" />
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DR/DRT">
							<rdfs:label>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRT)" />
							</l0:name>
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Research on cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Research on cultural property ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ricerca sul bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ricerca sul bene culturale ', $itemURI)" />
							</l0:name>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="record/metadata/schede/*/DR/DRR">
						<arco-lite:hasScientificDirector>
							<xsl:attribute name="rdf:resource">
        	       				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRR))" />
            	   			</xsl:attribute>
						</arco-lite:hasScientificDirector>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- Agent role as an individual -->
				<xsl:if test="record/metadata/schede/*/DR/DRR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                      		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
                   		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
		                       </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Scientific director of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Scientific director of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
		                       </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRR))" />
		                       </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Role as an individual -->
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
							<xsl:value-of select="'Responsabile scientifico della ricerca'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Research scientific Responsible'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRR))" />
		                   </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DR/DRR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<!-- circumstance of cultural property -->
		<xsl:if test="not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
			<xsl:variable name="religiousorcivilicircumstance">
				<xsl:choose>
                	<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAR))='si'">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ReligiousCircumstance'" />
                	</xsl:when>
                	<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAC))='si'">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CivilCircumstance'" />
                	</xsl:when>
                </xsl:choose>
			</xsl:variable>
			<xsl:if test="record/metadata/schede/*/CA/CAA">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAA))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/YearCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAV">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAV))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LifeCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAV" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAV" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAS">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SeasonCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAS" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAS" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAP">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ProductionCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAP" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAL">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/WorkCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAL" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAL" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAF">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAF))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FairMarketCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAF" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAF" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAQ">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAQ))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SocialInteractionCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAQ" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAQ" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAI">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAI))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IndeterminateCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAI" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAI" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Circumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetVersion='4.00_ICCD0' or $sheetVersion='4.00'">
			<xsl:variable name="religiousorcivilicircumstance">
				<xsl:choose>
                	<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAR))='si'">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ReligiousCircumstance'" />
                	</xsl:when>
                	<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAC))='si'">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CivilCircumstance'" />
                	</xsl:when>
                </xsl:choose>
			</xsl:variable>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOA">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOA))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/YearCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOV">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOV))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LifeCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOV" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOV" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOS">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SeasonCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOS" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOS" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOP">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ProductionCylceCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOP" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOL">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/WorkCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOL" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOL" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOF">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOF))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FairMarketCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOF" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOF" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOQ">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOQ))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SocialInteractionCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOQ" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOQ" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOI">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOI))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IndeterminateCircumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOI" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOI" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CA/CAO/CAOO">			
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/*/CA/CAO/CAOO))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Circumstance'" />
    	                </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOO" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOO" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="$religiousorcivilicircumstance" />
	                	</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- recurrent situation series -->
		<xsl:if test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
			<xsl:if test="record/metadata/schede/*/RC/RCP">				
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'RecurrentSituationSeries/', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/cultural-event/RecurrentSituationSeries'" />
    					</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Evento ricorrente relativo al bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Evento ricorrente relativo al bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
					</rdfs:label>
					<!-- has recurrent time period -->
					<arco-ce:hasRecurrentTimePeriod>
						<xsl:attribute name="rdf:resource">
            	    		<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCP)))" />
                		</xsl:attribute>
					</arco-ce:hasRecurrentTimePeriod>
				</rdf:Description>
				<!-- recurrent time period -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCP)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/cultural-event/RecurrentTimePeriod'" />
    					</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Periodo di tempo ricorrente ', normalize-space(record/metadata/schede/*/RC/RCP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Recurrent time period ', normalize-space(record/metadata/schede/*/RC/RCP))" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Periodo di tempo ricorrente ', normalize-space(record/metadata/schede/*/RC/RCP))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Recurrent time period ', normalize-space(record/metadata/schede/*/RC/RCP))" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
			<xsl:if test="record/metadata/schede/*/RC/RCR/RCRP">				
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'RecurrentSituationSeries/', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/cultural-event/RecurrentSituationSeries'" />
    					</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Evento ricorrente relativo al bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Evento ricorrente relativo al bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
					</rdfs:label>
					<!-- recurrent time period -->
					<arco-ce:hasRecurrentTimePeriod>
						<xsl:attribute name="rdf:resource">
            	    		<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCR/RCRP)))" />
                		</xsl:attribute>
					</arco-ce:hasRecurrentTimePeriod>
				</rdf:Description>
				<!-- recurrent time period -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCR/RCRP)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/cultural-event/RecurrentTimePeriod'" />
    					</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Periodo di tempo ricorrente ', normalize-space(record/metadata/schede/*/RC/RCR/RCRP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Recurrent time period ', normalize-space(record/metadata/schede/*/RC/RCR/RCRP))" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Periodo di tempo ricorrente ', normalize-space(record/metadata/schede/*/RC/RCR/RCRP))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Recurrent time period ', normalize-space(record/metadata/schede/*/RC/RCR/RCRP))" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- communication medium -->
		<xsl:if test="record/metadata/schede/*/CU/CUV">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-verbal')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Verbal communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Verbal communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa verbale del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa verbale del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/VerbalCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="record/metadata/schede/*/CU/CUV/CUVF">
					<arco-dd:numberOfFemaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUV/CUVF)" />
					</arco-dd:numberOfFemaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUV/CUVM">
					<arco-dd:numberOfMaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUV/CUVM)" />
					</arco-dd:numberOfMaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUV/CUVI">
					<arco-dd:numberOfChildParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUV/CUVI)" />
					</arco-dd:numberOfChildParticipants>
				</xsl:if>
				<!-- has implementation method -->
				<xsl:if test="record/metadata/schede/*/CU/CUV/CUVD">
					<arco-dd:hasImplementationMethod>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUV/CUVD)))" />
						</xsl:attribute>
					</arco-dd:hasImplementationMethod>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/ICM/ICMC">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/ICM/ICMC)" />
					</arco-dd:transcript>
				</xsl:if>
			</rdf:Description>
			<!-- implementation method -->
			<xsl:if test="record/metadata/schede/*/CU/CUV/CUVD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUV/CUVD)))" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ImplementationMethod'" />		
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUV/CUVD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUV/CUVD)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/CU/CUM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-singing')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Music and vocal communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Musica and vocal communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa musicale e vocale del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa musicale e vocale del bene culturale ', $itemURI)" />
				</l0:name>
				<!-- type -->
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/SingingCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="record/metadata/schede/*/CU/CUM/CUMF">
					<arco-dd:numberOfFemaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUM/CUMF)" />
					</arco-dd:numberOfFemaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUM/CUMM">
					<arco-dd:numberOfMaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUM/CUMM)" />
					</arco-dd:numberOfMaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUM/CUMI">
					<arco-dd:numberOfChildParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUM/CUMI)" />
					</arco-dd:numberOfChildParticipants>
				</xsl:if>
				<!-- has implementation method -->
				<xsl:if test="record/metadata/schede/*/CU/CUM/CUMD">
					<arco-dd:hasImplementationMethod>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUM/CUMD)))" />
						</xsl:attribute>
					</arco-dd:hasImplementationMethod>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/ICM/ICMC">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/ICM/ICMC)" />
					</arco-dd:transcript>
				</xsl:if>
			</rdf:Description>
			<!-- implementation method -->
			<xsl:if test="record/metadata/schede/*/CU/CUM/CUMD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      	<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUM/CUMD)))" />
                  	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ImplementationMethod'" />		
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUM/CUMD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUM/CUMD)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/CU/CUS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-instrumental')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Instrumental communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Instrumental communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa strumentale del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa strumentale del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/CU/CUS/CUSN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUS/CUSN)" />
					</arco-core:note>
				</xsl:if>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/InstrumentalCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<!-- involves solo instrument -->
				<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSS">
					<arco-mi:involvesSoloInstrument>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-mi:involvesSoloInstrument>
				</xsl:for-each>
				<!--  involves accompayining instrument -->
				<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSA">
					<arco-mi:involvesAccompanyingInstrument>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-mi:involvesAccompanyingInstrument>
				</xsl:for-each>
				<!-- has implementation method -->
				<xsl:if test="record/metadata/schede/*/CU/CUS/CUSD">
					<arco-dd:hasImplementationMethod>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUS/CUSD)))" />
						</xsl:attribute>
					</arco-dd:hasImplementationMethod>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/ICM/ICMC">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/ICM/ICMC)" />
					</arco-dd:transcript>
				</xsl:if>
			</rdf:Description>
			<!-- implementation method -->
			<xsl:if test="record/metadata/schede/*/CU/CUS/CUSD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'ImplementationMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/CU/CUS/CUSD)))" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ImplementationMethod'" />		
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUS/CUSD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUS/CUSD)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- musical instrument -->
			<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      	<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
                  	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/MusicalInstrument'" />		
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
			<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      	<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
                  	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/MusicalInstrument'" />		
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
		<xsl:for-each select="record/metadata/schede/*/CU/CUC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-kinetic')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Kinetic communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Kinetic communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa cinesica del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa cinesica del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/KineticCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="./CUCF">
					<arco-dd:numberOfFemaleParticipants>
						<xsl:value-of select="normalize-space(./CUCF)" />
					</arco-dd:numberOfFemaleParticipants>
				</xsl:if>
				<xsl:if test="./CUCM">
					<arco-dd:numberOfMaleParticipants>
						<xsl:value-of select="normalize-space(./CUCM)" />
					</arco-dd:numberOfMaleParticipants>
				</xsl:if>
				<xsl:if test="./CUCC">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./CUCC)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./CUCG">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./CUCG)" />
					</arco-core:description>
				</xsl:if>
				<!-- involves age range -->
				<xsl:for-each select="./CUCE">
					<arco-dd:involvesAgeRange>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesAgeRange>
				</xsl:for-each>
			</rdf:Description>
			<!-- age range -->
			<xsl:for-each select="./CUCE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AgeRange'" />		
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
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/*/CU/CUP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-proxemics')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Proxemics communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Proxemics communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa prossemica del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa prossemica del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ProxemicsCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="record/metadata/schede/*/CU/CUP/CUPF">
					<arco-dd:numberOfFemaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUP/CUPF)" />
					</arco-dd:numberOfFemaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUP/CUPM">
					<arco-dd:numberOfMaleParticipants>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUP/CUPM)" />
					</arco-dd:numberOfMaleParticipants>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CU/CUP/CUPD">
					<arco-core:description>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUP/CUPD)" />
					</arco-core:description>
				</xsl:if>
				<!-- involves age range -->
				<xsl:for-each select="record/metadata/schede/*/CU/CUP/CUPE">
					<arco-dd:involvesAgeRange>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesAgeRange>
				</xsl:for-each>
			</rdf:Description>
			<!-- agerange -->
			<xsl:for-each select="record/metadata/schede/*/CU/CUP/CUPE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      		<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
                  		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AgeRange'" />		
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
		<xsl:for-each select="record/metadata/schede/*/CU/CUR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-written')" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CommunicationMedium'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Written communication medium of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Written communication medium of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa scritta del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Modalità comunicativa scritta del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/WrittenCommunication'" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="./CURA">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(./CURA)" />
					</arco-dd:transcript>
				</xsl:if>
				<xsl:if test="./CURS">
					<arco-dd:graphicSymbols>
						<xsl:value-of select="normalize-space(./CURS)" />
					</arco-dd:graphicSymbols>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- elements -->
		<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'Animal/', arco-fn:urify(normalize-space(.)))" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Animal'" />
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
		<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMV">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'Vegetal/', arco-fn:urify(normalize-space(.)))" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Vegetal'" />
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
		<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'Mineral/', arco-fn:urify(normalize-space(.)))" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Mineral'" />
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
		<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRMO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/italia/onto/l0/Object'" />
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
		<xsl:for-each select="record/metadata/schede/*/DA/DRM/DRME">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/italia/onto/l0/Object'" />
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
		<!-- main agent -->
		<xsl:for-each select="record/metadata/schede/*/AT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Agente principale relativo al bene culturale ', $itemURI, ': ', normalize-space(./ATT/ATTN))" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Main agent involved in cultural property ', $itemURI, ': ', normalize-space(./ATT/ATTN))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Agente principale relativo al bene culturale ', $itemURI, ': ', normalize-space(./ATT/ATTN))" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Main agent involved in cultural property ', $itemURI, ': ', normalize-space(./ATT/ATTN))" />
				</l0:name>
				<xsl:if test="./ATA">
					<arco-core:note>
						<xsl:value-of select="./ATA" />
					</arco-core:note>
				</xsl:if>
				<!-- hasRole -->
				<xsl:if test="./ATT/ATTI">
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./ATT/ATTI)) )" />
						</xsl:attribute>
					</arco-core:hasRole>
				</xsl:if>
				<!-- has agent -->
				<arco-core:hasAgent>
					<xsl:choose>
						<xsl:when test="./ATT/ATTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./ATT/ATTI, ./ATT/ATTZ, ./ATT/ATTB, ./ATT/ATTM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-core:hasAgent>
			</rdf:Description>
			<xsl:if test="./ATT/ATTI">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./ATT/ATTI)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ATT/ATTI)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ATT/ATTI)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./ATT/ATTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./ATT/ATTI, ./ATT/ATTZ, ./ATT/ATTB, ./ATT/ATTM)))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./ATT/ATTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./ATT/ATTN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./ATT/ATTI, ' ', ./ATT/ATTZ, ' ', ./ATT/ATTB, ' ', ./ATT/ATTM)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./ATT/ATTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./ATT/ATTN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./ATT/ATTI, ' ', ./ATT/ATTZ, ' ', ./ATT/ATTB, ' ', ./ATT/ATTM)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<xsl:if test="./ATT/ATTZ">
					<arco-cd:nationality>
						<xsl:value-of select="./ATT/ATTZ" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="./ATT/ATTO">
					<arco-core:note>
						<xsl:value-of select="concat('Scolarità: ', ./ATT/ATTO)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ATT/ATTM and (not(starts-with(lower-case(normalize-space(./ATT/ATTM)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATT/ATTM)), 'n.r')))">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./ATT/ATTM)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:if>
				<xsl:if test="./ATT/ATTB">
					<arco-cd:hasCulturalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./ATT/ATTB)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalContext>
				</xsl:if>
				<!-- sex -->
				<xsl:if test="./ATT/ATTS">
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'Sex/', arco-fn:arcofy(normalize-space(./ATT/ATTS)))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<!-- age -->
				<xsl:if test="./ATT/ATTE">
					<arco-cd:hasAge>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./ATT/ATTE)))" />
               			</xsl:attribute>
					</arco-cd:hasAge>
					<arco-lite:age>
						<xsl:value-of select="normalize-space(./ATT/ATTE)" />
					</arco-lite:age>
					<arco-cd:isSubjectOfInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./ATT/ATTE))" />
						</xsl:attribute>
					</arco-cd:isSubjectOfInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./DNA/DNAP or ./DNA/DNAC or ./DNA/DNAE">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
								</xsl:when>
								<xsl:otherwise>
	               	    			<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./DML">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
								</xsl:when>
								<xsl:otherwise>
	            	   	             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasDomicile>
				</xsl:if>
				<!-- date Of Birth -->
				<xsl:if test="./DNA/DNAN">
					<cpv:dateOfBirth>
						<xsl:value-of select="./DNA/DNAN" />
					</cpv:dateOfBirth>
				</xsl:if>
			</rdf:Description>
			<!-- profession of user as an individual -->
			<xsl:if test="./ATT/ATTM and (not(starts-with(lower-case(normalize-space(./ATT/ATTM)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATT/ATTM)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./ATT/ATTM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ATT/ATTM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ATT/ATTM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- cultural context -->
			<xsl:if test="./ATT/ATTB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./ATT/ATTB)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalContext'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ATT/ATTB)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ATT/ATTB)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- sex as individual -->
			<xsl:if test="./ATT/ATTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy(normalize-space(./ATT/ATTS)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ATT/ATTS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ATT/ATTS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- age interpretation as individual -->
			<xsl:if test="./ATT/ATTE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./ATT/ATTE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Interpretation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./ATT/ATTN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./ATT/ATTN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./ATT/ATTN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./ATT/ATTN))" />
					</l0:name>
					<arco-cd:involvesEntity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./ATT/ATTE)))" />
						</xsl:attribute>
					</arco-cd:involvesEntity>
					<arco-cd:hasInterpretationCriterion>
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasInterpretationCriterion>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./ATT/ATTE)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;agente principale ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;agente principale ', ./ATT/ATTN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age of main agent ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age of main agent ', ./ATT/ATTN)" />
					</l0:name>
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(./ATT/ATTE)" />
					</arco-cd:ageValue>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="it">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
								<xsl:value-of select="'attribuzione del catalogatore'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<rdfs:label  xml:lang="en">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
								<xsl:value-of select="'cataloguer attribution'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
								<xsl:value-of select="'attribuzione del catalogatore'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<l0:name  xml:lang="en">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./ATT/ATTE)), 'ca')">
								<xsl:value-of select="'cataloguer attribution'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./DNA/DNAP or ./DNA/DNAC or ./DNA/DNAE">
			<xsl:variable name="location">
				<xsl:choose>
					<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
					</xsl:when>
					<xsl:otherwise>
		    			<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$location" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./DNA)" />
				</rdfs:label>
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
						</xsl:when>
						<xsl:otherwise>
	               			<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="./DNA/*">
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
				<!-- Stato -->
				<xsl:if test="./DNA/DNAS and (not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DNA/DNAS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./DNA/DNAR and (not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./DNA/DNAC and (starts-with(lower-case(normalize-space(./DNA/DNAC)), 'firenze') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'siena') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'san severino marche') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'modena'))">	
							<xsl:choose>
								<xsl:when test="./DNA/DNAR and (starts-with(lower-case(normalize-space(./DNA/DNAR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./DNA/DNAP and (not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DNA/DNAP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./DNA/DNAC and (not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DNA/DNAC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="./DNA/DNAE and (not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DNA/DNAE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
			</rdf:Description>
			<!-- Country -->
			<xsl:if test="./DNA/DNAS and (not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DNA/DNAS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DNA/DNAS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DNA/DNAS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region -->
			<xsl:if test="./DNA/DNAR and (not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province -->
			<xsl:if test="./DNA/DNAP and (not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DNA/DNAP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DNA/DNAP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DNA/DNAP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City -->
			<xsl:if test="./DNA/DNAC and (not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DNA/DNAC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) -->
			<xsl:if test="./DNA/DNAE and (not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DNA/DNAE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
			<!-- domicile -->
			<xsl:if test="./DML">
			<xsl:variable name="location">
				<xsl:choose>
					<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
					</xsl:when>
					<xsl:otherwise>
			             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$location" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./DML)" />
				</rdfs:label>
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
						</xsl:when>
						<xsl:otherwise>
	               			<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="./DNA/*">
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
				<!-- Stato -->
				<xsl:if test="./DML/DMLS and (not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DML/DMLS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./DML/DMLR and (not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./DML/DMLC and (starts-with(lower-case(normalize-space(./DML/DMLC)), 'firenze') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'siena') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'san severino marche') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'modena'))">		
							<xsl:choose>
								<xsl:when test="./DML/DMLR and (starts-with(lower-case(normalize-space(./DML/DMLR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./DML/DMLP and (not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DML/DMLP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./DML/DMLC and (not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DML/DMLC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="./DML/DMLE and (not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DML/DMLE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
			</rdf:Description>
			<!-- Country -->
			<xsl:if test="./DML/DMLS and (not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DML/DMLS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DML/DMLS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DML/DMLS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region -->
			<xsl:if test="./DML/DMLR and (not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province -->
			<xsl:if test="./DML/DMLP and (not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DML/DMLP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DML/DMLP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DML/DMLP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City -->
			<xsl:if test="./DML/DMLC and (not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DML/DMLC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) -->
			<xsl:if test="./DML/DMLE and (not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DML/DMLE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/TC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-group-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Agente principale ', position(), ' del bene ', $itemURI, ': ', ./TCD)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Main agent ', position(), ' of cultural property ', $itemURI, ': ', ./TCD)" />
				</rdfs:label>
				<arco-core:hasRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/MainAgent')" />
					</xsl:attribute>
				</arco-core:hasRole>
				<arco-core:hasAgent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./TCD))" />
					</xsl:attribute>
				</arco-core:hasAgent>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Role/MainAgent')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Agente principale'" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Main agent'" />
				</rdfs:label>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./TCD))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/COV/Group'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./TCD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./TCD" />
				</l0:name>
				<xsl:if test="./TCS">
					<arco-cd:contacts>
						<xsl:value-of select="./TCS" />
					</arco-cd:contacts>
				</xsl:if>
				<xsl:if test="./TCA">
					<arco-core:note>
						<xsl:value-of select="./TCA" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- recording -->
		<xsl:if test="record/metadata/schede/*/DU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'AudioRecording/', $itemURI)" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Audio recording of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Audio recording of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione audio del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione audio del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="true()" />
				</arco-cd:primaryDocument>
				<xsl:if test="record/metadata/schede/*/DU/DUC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="record/metadata/schede/*/DU/DUC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioRecordingIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/DU/DUC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUO/DUOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="record/metadata/schede/*/DU/DUL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUL)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="record/metadata/schede/*/DU/DUU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/AudioRecording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- is member of collection -->
				<xsl:if test="record/metadata/schede/*/DU/DUR">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUS">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="record/metadata/schede/*/DU/DUO/DUOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUO/DUOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- storage medium -->
				<xsl:for-each select="record/metadata/schede/*/DU/DUO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-', arco-fn:urify(normalize-space(./DUOC)), position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DU/DUM">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/DU/DUY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/AudioRecording-original-', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./DUYN and (not(starts-with(lower-case(normalize-space(./DUYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUYN)), 'n.r')))">
						<arco-lite:hasRightstHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DUYN))" />
							</xsl:attribute>
						</arco-lite:hasRightstHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:if test="record/metadata/schede/*/DU/DUC">
			<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioRecordingIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/DU/DUC))" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- title -->
			<xsl:if test="record/metadata/schede/*/DU/DUL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUL)))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="record/metadata/schede/*/DU/DUU">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/AudioRecording', $itemURI)" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of recording of cultural property ', $itemURI" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/AudioRecording', $itemURI, '-duration')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/AudioRecording', $itemURI, '-duration')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of audio recording: ', (record/metadata/schede/*/DU/DUU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of audio recording: ', (record/metadata/schede/*/DU/DUU))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione audio: ', (record/metadata/schede/*/DU/DUU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione audio: ', (record/metadata/schede/*/DU/DUU))" />
					</l0:name>
					<!-- has measurement type -->
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Duration')" />
					</arco-dd:hasMeasurementType>
					<!-- has value -->
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/',  arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUU)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<!-- Value -->
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/',  arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUU)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DU/DUU" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DU/DUU" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- collection membership -->
			<xsl:if test="record/metadata/schede/*/DU/DUR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DU/DUR/DURN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUR/DURN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DU/DUR/DURD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DU/DUR/DURD" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DU/DUS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DU/DUS/DUSN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUS/DUSN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd_involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd_involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DU/DUS/DUST" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DU/DUS/DUST" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
					<!-- Edition -->
					<xsl:if test="record/metadata/schede/*/DU/DUX">
						<arco-cd:hasEdition>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
							</xsl:attribute>
						</arco-cd:hasEdition>
					</xsl:if>
				</rdf:Description>
				<!-- Edition as an individual -->
				<xsl:if test="record/metadata/schede/*/DU/DUX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Edition'" />
	            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</l0:name>
						<!-- editor -->
						<xsl:if test="record/metadata/schede/*/DU/DUX/DUXE">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXE))" />
            					</xsl:attribute>
							</arco-lite:hasEditor>
						</xsl:if>
						<!-- curator -->
						<xsl:if test="record/metadata/schede/*/DU/DUX/DUXC">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXC))" />
            					</xsl:attribute>
							</arco-lite:hasCurator>
						</xsl:if>
						<!-- time interval -->
						<xsl:if test="record/metadata/schede/*/DU/DUX/DUXP">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUX/DUXP)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/DU/DUX/DUXI">
							<arco-core:note>
								<xsl:value-of select="concat('Indice: ', normalize-space(record/metadata/schede/*/DU/DUX/DUXI))" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/DU/DUX/DUXZ">
							<arco-core:note>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUX/DUXZ)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- Time interval as an individual -->
					<xsl:if test="record/metadata/schede/*/DU/DUX/DUXP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUX/DUXP)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUX/DUXP)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUX/DUXP)" />
							</l0:name>
							<tiapit:time>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUX/DUXP)" />
							</tiapit:time>
						</rdf:Description>
					</xsl:if>
					<!-- editor as an individual -->
					<xsl:if test="record/metadata/schede/*/DU/DUX/DUXE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXE))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXE))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXE))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXE))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Editor')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXE))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Editor')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Editore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Editore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXE))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DU/DUX/DUXE)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DU/DUX/DUXE)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- curator as an individual -->
					<xsl:if test="record/metadata/schede/*/DU/DUX/DUXC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXC))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXC))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXC))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(record/metadata/schede/*/DU/DUX/DUXC))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Curator')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXC))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Curator')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Curatore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Curatore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DU/DUX/DUXC))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DU/DUX/DUXC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/*/DU/DUX/DUXC)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- recording type -->
			<xsl:if test="record/metadata/schede/*/DU/DUO/DUOT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUO/DUOT)))" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/RecordingType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUO/DUOT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUO/DUOT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- storage medium -->
			<xsl:for-each select="record/metadata/schede/*/DU/DUO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-', arco-fn:urify(normalize-space(./DUOC)), position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DUOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DUOC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="normalize-space(./DUOC)" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DUOC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="true()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./DUOD[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:description>
								<xsl:value-of select="./DUOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./DUOI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./DUOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./DUOZ[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./DUOZ" />
						</arco-core:note>
					</xsl:if>
					<!-- storage medium type -->
					<xsl:if test="./DUOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./DUOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<!-- has measurement collection -->
					<xsl:if test="./DUOM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-audio-recording-original-', position())" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
					<!-- CIS -->
					<xsl:if test="../DUP/DUPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="../DUG/DUGS and not(lower-case(normalize-space(../DUG/DUGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../DUG/DUGS)), normalize-space(lower-case(../DUG/DUGE)), normalize-space(lower-case(../DUP/DUPU)), normalize-space(lower-case(../DUP/DUPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	               		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../DUG/DUGP)), normalize-space(lower-case(../DUG/DUGC)), normalize-space(lower-case(../DUG/DUGL)), normalize-space(lower-case(../DUP/DUPU)), normalize-space(lower-case(../DUP/DUPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<!-- current physical location -->
					<xsl:if test="../DUG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="../DUZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-audio-recording-original')" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
						<xsl:for-each select="record/metadata/schede/*/DU/DUZ/DUZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
							<arco-lite:hasOwner>
								<xsl:attribute name="rdf:resource">
		     	      				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		        	   			</xsl:attribute>
							</arco-lite:hasOwner>
						</xsl:for-each>
					</xsl:if>
					<!-- Acquisition of cultural property -->
					<xsl:if test="../DUQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DUQ-storage-medium-acquisition')" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./DUQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DUQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
					</xsl:if>
					<!-- change of availability -->
					<xsl:for-each select="../DUN">
						<arco-cd:hasChangeOfAvailability>
							<xsl:attribute name="rdf:resource">
	    	            		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability', position())" />
	        	        	</xsl:attribute>
						</arco-cd:hasChangeOfAvailability>
					</xsl:for-each>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./DUOC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DUOC))" />
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
							<xsl:value-of select="normalize-space(./DUOC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUOC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./DUOC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
				<!-- storage medium type -->
				<xsl:if test="./DUOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
    	            		<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./DUOF))" />
        	       		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMediumType" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DUOF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUOF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- measurement collection -->
				<xsl:if test="./DUOM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
					<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-audio-recording-original-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-audio-recording-original-', position(), '-frequency')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-audio-recording-original-', position(), '-audio-recording-speed')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
				<xsl:choose>
					<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-audio-recording-original-', position(), '-frequency')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="'https://w3id.org/arco/ontology/denotative-description/Frequency'" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:when>
					<xsl:otherwise>
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-audio-recording-speed')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'AudioRecordingSpeed')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DU/DUM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DUMC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DUMC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DUMC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DUMC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="false()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./DUMF">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./DUMF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="./DUMD">
						<arco-core:description>
							<xsl:value-of select="./DUMD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./DUMI">
						<arco-core:note>
							<xsl:value-of select="./DUMI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./DUMZ">
						<arco-core:note>
							<xsl:value-of select="./DUMZ" />
						</arco-core:note>
					</xsl:if>
					<!-- has measurement collection -->
					<xsl:if test="./DUMM">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI)" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./DUMC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DUMC))" />
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
							<xsl:value-of select="normalize-space(./DUMC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUMC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./DUMC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CIS -->
			<xsl:if test="record/metadata/schede/*/DU/DUP/DUPN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DU/DUG/DUGS and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGS)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGE)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGP)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGC)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGL)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUP/DUPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUP/DUPN)" />
					</l0:name>
					<!-- has cis name in time -->
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUP/DUPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<!-- has site -->
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DU/DUG/DUGS and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGS)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGE)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGP)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGC)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGL)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
				</rdf:Description>
				<!-- Name in time -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUP/DUPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUP/DUPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="record/metadata/schede/*/DU/DUG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DU/DUG/DUGS and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGS)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGE)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGP)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGC)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGL)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DU/DUG/DUGS and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGS)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGE)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGP)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGC)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGL)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="record/metadata/schede/*/DU/DUP/DUPC and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPC))='nr' or lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPC))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPC))='nr (recupero pregresso)' or lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPC))='.' or lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUP/DUPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUP/DUPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DU/DUG/DUGS and not(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGS)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGE)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           			 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGP)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGC)), normalize-space(lower-case(record/metadata/schede/*/DU/DUG/DUGL)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPU)), normalize-space(lower-case(record/metadata/schede/*/DU/DUP/DUPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DU/DUP/DUPN))" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DU/DUG/*">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="record/metadata/schede/*/DU/DUG/*">
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
					<xsl:if test="record/metadata/schede/*/DU/DUP/DUPU and not(record/metadata/schede/*/DU/DUP/DUPU='.' or record/metadata/schede/*/DU/DUP/DUPU='-' or record/metadata/schede/*/DU/DUP/DUPU='/') and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUP/DUPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUP/DUPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DU/DUG/DUGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'firenze') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'siena') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'san severino marche') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DU/DUG/DUGR and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUG/DUGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DU/DUG/DUGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DU/DUG/DUGE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUG/DUGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Legal situation as an individual -->
			<xsl:if test="record/metadata/schede/*/DU/DUZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-audio-recording-original')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DU/DUZ/DUZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DU/DUZ/DUZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DU/DUZ/DUZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DU/DUZ/DUZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="record/metadata/schede/*/DU/DUZ/DUZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUZ/DUZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUZ/DUZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DU/DUZ/DUZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-audio-original', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
				</rdf:Description>
				<xsl:if test="record/metadata/schede/*/DU/DUZ/DUZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DU/DUZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-audio-original', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<xsl:if test="../DUZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(../DUZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="record/metadata/schede/*/DU/DUQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DUQ-storage-medium-acquisition')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<!-- acquisition type -->
					<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<!-- transferor -->
					<xsl:for-each select="record/metadata/schede/*/DU/DUQ/DUQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DUQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<!-- at time -->
					<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- transferor in acquisition as an individual and legal situation -->
				<xsl:for-each select="record/metadata/schede/*/DU/DUQ/DUQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DUQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DUQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DUQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DUQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="record/metadata/schede/*/DU/DUN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DUNT and (not(starts-with(lower-case(normalize-space(./DUNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUNT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DUNT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./DUND and (not(starts-with(lower-case(normalize-space(./DUND)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DUND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./DUNN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./DUNN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./DUND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DUND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DUND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./DUND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./DUNT and (not(starts-with(lower-case(normalize-space(./DUNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUNT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DUNT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DUNT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUNT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="record/metadata/schede/*/DU/DUY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/AudioRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' dela registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DUYN and (not(starts-with(lower-case(normalize-space(./DUYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./DUYD and (not(starts-with(lower-case(normalize-space(./DUYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./DUYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./DUYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./DUYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DUYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DUYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DUYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DUYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DUYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DUYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DUYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DUYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DUYN)" />
						</l0:name>
						<xsl:if test="./DUYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./DUYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/DV">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'VideoRecording/', $itemURI)" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Video recording of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Video recording of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione viedo del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione video del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="true()" />
				</arco-cd:primaryDocument>
				<xsl:if test="record/metadata/schede/*/DV/DVC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="record/metadata/schede/*/DV/DVC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoRecordingIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/DV/DVC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVO/DVOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DV/DVO/DVOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="record/metadata/schede/*/DV/DVL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVL)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="record/metadata/schede/*/DV/DVU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/VideoRecording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- is member of collection of -->
				<xsl:if test="record/metadata/schede/*/DV/DVR">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVV">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="record/metadata/schede/*/DV/DVO/DVOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVO/DVOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- has storage medium -->
				<xsl:for-each select="record/metadata/schede/*/DV/DVO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-', position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DV/DVM">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/DV/DVY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/VideoRecording-original-', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./DVYN and (not(starts-with(lower-case(normalize-space(./DVYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVYN)), 'n.r')))">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DVYN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:if test="record/metadata/schede/*/DV/DVC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoRecordingIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/DV/DVC))" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- title -->
			<xsl:if test="record/metadata/schede/*/DV/DVL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVL)))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="record/metadata/schede/*/DV/DVU">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/VideoRecording', $itemURI)" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of recording of cultural property ', $itemURI" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, '-duration')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, '-duration')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording: ', (record/metadata/schede/*/DV/DVU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording: ', (record/metadata/schede/*/DV/DVU))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DV/DVU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DV/DVU))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Duration')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DV/DVU))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DV/DVU))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DV/DVU" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DV/DVU" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- collection membership -->
			<xsl:if test="record/metadata/schede/*/DV/DVR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DV/DVR/DVRN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVR/DVRN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DV/DVR/DVRD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DV/DVR/DVRD" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DV/DVV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DV/DVV/DVVT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DV/DVV/DVVT" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>
			<!-- recording type -->
			<xsl:if test="record/metadata/schede/*/DV/DVO/DVOT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVO/DVOT)))" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/RecordingType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVO/DVOT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVO/DVOT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- storage medium -->
			<xsl:for-each select="record/metadata/schede/*/DV/DVO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DVOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DVOC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DVOC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DVOC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="true()" />
					</arco-cd:originalStorageMedium>
					<!-- storage medium type -->
					<xsl:if test="./DVOF">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./DVOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="./DVOD">
						<arco-core:description>
								<xsl:value-of select="./DVOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./DVOI">
						<arco-core:note>
							<xsl:value-of select="./DVOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./DVOZ">
						<arco-core:note>
							<xsl:value-of select="./DVOZ" />
						</arco-core:note>
					</xsl:if>
					<!-- CIS -->
					<xsl:if test="../DVP/DVPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="../DVG/DVGS and not(lower-case(normalize-space(../DVG/DVGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../DVG/DVGS)), normalize-space(lower-case(../DVG/DVGE)), normalize-space(lower-case(../DVP/DVPU)), normalize-space(lower-case(../DVP/DVPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	               		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../DVG/DVGP)), normalize-space(lower-case(../DVG/DVGC)), normalize-space(lower-case(../DVG/DVGL)), normalize-space(lower-case(../DVP/DVPU)), normalize-space(lower-case(../DVP/DVPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<!-- current physical location -->
					<xsl:if test="../DVG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="../DVZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-video-recording-original')" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
					<!-- has owner -->
					<xsl:for-each select="record/metadata/schede/*/DV/DVZ/DVZS">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasOwner>
								<xsl:attribute name="rdf:resource">
		            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            			</xsl:attribute>
							</arco-cd:hasOwner>
						</xsl:if>
					</xsl:for-each>
					<!-- Acquisition of cultural property -->
					<xsl:if test="../DVQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DVQ-storage-medium-acquisition')" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./DVQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DVQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
					</xsl:if>
					<xsl:for-each select="../DVN">
						<arco-cd:hasChangeOfAvailability>
							<xsl:attribute name="rdf:resource">
	    	            		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability', position())" />
	        	        	</xsl:attribute>
						</arco-cd:hasChangeOfAvailability>
					</xsl:for-each>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./DVOC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DVOC))" />
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
							<xsl:value-of select="normalize-space(./DVOC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DVOC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./DVOC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DV/DVM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DVMC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DVMC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DVMC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DVMC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="false()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./DVMF">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./DVMF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="./DVMD">
						<arco-core:description>
								<xsl:value-of select="./DVMD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./DVMI">
						<arco-core:note>
							<xsl:value-of select="./DVMI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./DVMZ">
						<arco-core:note>
							<xsl:value-of select="./DVMZ" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./DVMC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./DVMC))" />
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
							<xsl:value-of select="normalize-space(./DVMC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DVMC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./DVMC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CIS -->
			<xsl:if test="record/metadata/schede/*/DV/DVP/DVPN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DV/DVG/DVGS and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGS)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGE)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGP)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGC)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGL)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVP/DVPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVP/DVPN)" />
					</l0:name>
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVP/DVPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DV/DVG/DVGS and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGS)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGE)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGP)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGC)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGL)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
				</rdf:Description>
				<!-- Name in time -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVP/DVPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVP/DVPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="record/metadata/schede/*/DV/DVG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DV/DVG/DVGS and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGS)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGE)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGP)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGC)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGL)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DV/DVG/DVGS and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGS)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGE)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGP)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGC)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGL)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
                           <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
						</xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="record/metadata/schede/*/DV/DVP/DVPC and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPC))='nr' or lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPC))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPC))='nr (recupero pregresso)' or lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPC))='.' or lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVP/DVPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVP/DVPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DV/DVG/DVGS and not(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGS)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGE)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGP)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGC)), normalize-space(lower-case(record/metadata/schede/*/DV/DVG/DVGL)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPU)), normalize-space(lower-case(record/metadata/schede/*/DV/DVP/DVPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DV/DVP/DVPN))" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVG">
					<cis:siteAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$address" />
						</xsl:attribute>
					</cis:siteAddress>
				</xsl:if>
			</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="record/metadata/schede/*/DV/DVG/DVG/*">
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
					<xsl:if test="record/metadata/schede/*/DV/DVP/DVPU and not(record/metadata/schede/*/DV/DVP/DVPU='.' or record/metadata/schede/*/DV/DVP/DVPU='-' or record/metadata/schede/*/DV/DVP/DVPU='/') and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVP/DVPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVP/DVPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS)), 'n.r')))">
							<clvapit:hasCountry>
								<xsl:attribute name="rdf:resource">
                        	        <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGS))" />
                            	</xsl:attribute>
							</clvapit:hasCountry>
						</xsl:if>
					<!-- Regione -->
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DV/DVG/DVGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'firenze') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'siena') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'san severino marche') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DV/DVG/DVGR and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
            	            	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGR))" />
		        	               	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	    	       	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGR))" />
                    	    	    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGC))" />
                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVG/DVGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGS))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
        	                       <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
            	               </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                			<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGC))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                        	   <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGL))" />
                    	   </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
        	                       <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
    	                       </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DV/DVG/DVGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVG/DVGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
        	                   <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DV/DVG/DVGE))" />
    	                   </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                    	           <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                	           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVG/DVGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Legal situation as an individual -->
			<xsl:if test="record/metadata/schede/*/DV/DVZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-video-recording-original')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DV/DVZ/DVZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DV/DVZ/DVZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DV/DVZ/DVZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DV/DVZ/DVZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="record/metadata/schede/*/DV/DVZ/DVZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVZ/DVZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVZ/DVZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<!-- agent role -->
					<xsl:for-each select="record/metadata/schede/*/DV/DVZ/DVZS">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-viedo-oridinal', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
				</rdf:Description>
				<!-- Legal situation type -->
				<xsl:if test="record/metadata/schede/*/DV/DVZ/DVZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- owner -->
				<xsl:for-each select="record/metadata/schede/*/DV/DVZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-video-original', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<xsl:if test="../DVZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(../DVZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="record/metadata/schede/*/DV/DVQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DVQ-storage-medium-acquisition')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<!-- acquisition type -->
					<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<!-- transferor -->
					<xsl:for-each select="record/metadata/schede/*/DV/DVQ/DVQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DVQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="record/metadata/schede/*/DV/DVQ/DVQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DVQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DVQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DVQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DVQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="record/metadata/schede/*/DV/DVN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DVNT and (not(starts-with(lower-case(normalize-space(./DVNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVNT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DVNT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./DVND and (not(starts-with(lower-case(normalize-space(./DVND)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DVND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./DVNN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./DVNN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./DVND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DVND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DVND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DVND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./DVND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./DVNT and (not(starts-with(lower-case(normalize-space(./DVNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVNT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DVNT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DVNT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DVNT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="record/metadata/schede/*/DV/DVY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/VideoRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DVYN and (not(starts-with(lower-case(normalize-space(./DVYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./DVYD and (not(starts-with(lower-case(normalize-space(./DVYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./DVYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./DVYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./DVYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DVYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DVYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DVYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DVYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DVYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DVYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DVYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DVYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DVYN)" />
						</l0:name>
						<xsl:if test="./DVYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./DVYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/DF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'PhotographicRecording/', $itemURI)" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PhotographicRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Photographic recording of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Photographic recording of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione fotografica del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione fotografica del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="true()" />
				</arco-cd:primaryDocument>
				<xsl:for-each select="./DFO/DFOG">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DFO/DFOG" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFO/DFOG))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./DFO/DFOE">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DFO/DFOE" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFO/DFOE))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./DFO/DFOO">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DFO/DFOO" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFO/DFOO))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./DFC/DFCC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DFC/DFCC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFC/DFCC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./DFA/DFAC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./DFA/DFAC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFA/DFAC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTQ">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTQ)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DF/DFC/DFCA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTN">
					<arco-core:abstract>
						<xsl:value-of select="record/metadata/schede/*/DF/DFT/DFTN" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTD">
					<arco-core:abstract>
						<xsl:value-of select="record/metadata/schede/*/DF/DFT/DFTD" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DF/DFA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTT">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFT/DFTT)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="record/metadata/schede/*/DF/DFM">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCF">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- has technical status -->
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCX">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFX">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
				<!-- subject -->
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTI">
					<arco-cd:subject>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTI)" />
					</arco-cd:subject>
					<arco-cd:hasSubject>
						<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(record/metadata/schede/*/DF/DFT/DFTI))" />
	                   	</xsl:attribute>
					</arco-cd:hasSubject>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFO/DFOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- CIS -->
				<xsl:if test="record/metadata/schede/*/DF/DFP/DFPN">
					<arco-location:hasCulturalInstituteOrSite>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
									<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
								</xsl:when>
								<xsl:otherwise>
	              		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasCulturalInstituteOrSite>
				</xsl:if>
				<!-- current physical location -->
				<xsl:if test="record/metadata/schede/*/DF/DFG">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- Legal situation of cultural property -->
				<xsl:if test="record/metadata/schede/*/DF/DFZ">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-video-recording-original')" />
               			</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<!-- has owner -->
				<xsl:for-each select="record/metadata/schede/*/DF/DFZ/DFZS">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-cd:hasOwner>
							<xsl:attribute name="rdf:resource">
		            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            		</xsl:attribute>
						</arco-cd:hasOwner>
					</xsl:if>
				</xsl:for-each>
				<!-- Acquisition of cultural property -->
				<xsl:if test="record/metadata/schede/*/DF/DFQ">
					<arco-cd:hasAcquisition>
						<xsl:attribute name="rdf:resource">
	       	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DFQ-storage-medium-acquisition')" />
	           	    	</xsl:attribute>
					</arco-cd:hasAcquisition>
					<xsl:for-each select="./DFQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DFQ-storage-medium-acquisition')" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DFQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
				</xsl:if>
				<!-- change of availability -->
				<xsl:for-each select="record/metadata/schede/*/DF/DFN">
					<arco-cd:hasChangeOfAvailability>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasChangeOfAvailability>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/DF/DFY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/PhotographicRecording-original-', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./DFYN and (not(starts-with(lower-case(normalize-space(./DFYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFYN)), 'n.r')))">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DFYN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:if test="./DFO/DFOG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFO/DFOG))" />
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
						<xsl:value-of select="normalize-space(./DFO/DFOG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DFO/DFOG)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DFO/DFOG)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./DFO/DFOE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFO/DFOE))" />
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
						<xsl:value-of select="normalize-space(./DFO/DFOE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DFO/DFOE)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DFO/DFOE)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./DFC/DFCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFC/DFCC))" />
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
						<xsl:value-of select="normalize-space(./DFC/DFCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DFC/DFCC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DFC/DFCC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./DFA/DFAC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(./DFA/DFAC))" />
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
						<xsl:value-of select="normalize-space(./DFA/DFAC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DFA/DFAC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DFA/DFAC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- title -->
			<xsl:if test="record/metadata/schede/*/DF/DFT/DFTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFT/DFTT)))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="record/metadata/schede/*/DF/DFM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<xsl:if test="record/metadata/schede/*/DF/DFM/DFME">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, position(), '1-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFM/DFMO">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, position(), '2-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFM/DFMG">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, position(), '3-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="record/metadata/schede/*/DF/DFM/DFME">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, position(), '1-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFME))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFME))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFME))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFME))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFME))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFME))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFME" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFME" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFM/DFMO">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, position(), '2-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFMO))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFMO))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFMO))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFMO))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFMO))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFMO))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFMO" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFMO" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFM/DFMG">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, position(), '3-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFMG))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFM/DFMG))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFMG))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFM/DFMG))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFMG))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFM/DFMG))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFMG" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/*/DF/DFM/DFMG" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DF/DFC/DFCF">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, position(), '-photosize')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, position(), '-photosize')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFC/DFCF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (record/metadata/schede/*/DF/DFC/DFCF))" />
						</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFC/DFCF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DF/DFC/DFCF))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFC/DFCF))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/DF/DFC/DFCF))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DF/DFC/DFCF" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DF/DFC/DFCF" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- technical status -->
			<xsl:if test="record/metadata/schede/*/DF/DFC/DFCX">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</l0:name>
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFC/DFCX)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
				<!-- Technical characteristic as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		          		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFC/DFCX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCX)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoColour'" />
		          		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DF/DFX">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</l0:name>
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFX)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
				<!-- Technical characteristic as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		          		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFX)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoColour'" />
		          		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- subject -->
			<xsl:if test="record/metadata/schede/*/DF/DFT/DFTI">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	           			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(record/metadata/schede/*/DF/DFT/DFTI))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFT/DFTI)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFT/DFTI)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- recording type -->
			<xsl:if test="record/metadata/schede/*/DF/DFC/DFCT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFC/DFCT)))" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/RecordingType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- CIS -->
			<xsl:if test="record/metadata/schede/*/DF/DFP/DFPN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFP/DFPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFP/DFPN)" />
					</l0:name>
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFP/DFPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
				</rdf:Description>
				<!-- Name in time -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFP/DFPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFP/DFPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="record/metadata/schede/*/DF/DFG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="record/metadata/schede/*/DF/DFP/DFPC and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPC))='nr' or lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPC))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPC))='nr (recupero pregresso)' or lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPC))='.' or lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFP/DFPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFP/DFPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DF/DFG/DFGS and not(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGS)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGE)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGP)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGC)), normalize-space(lower-case(record/metadata/schede/*/DF/DFG/DFGL)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPU)), normalize-space(lower-case(record/metadata/schede/*/DF/DFP/DFPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(record/metadata/schede/*/DF/DFP/DFPN))" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFG">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="record/metadata/schede/*/DF/DFG/DFG/*">
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
					<xsl:if test="record/metadata/schede/*/DF/DFP/DFPU and not(record/metadata/schede/*/DF/DFP/DFPU='.' or record/metadata/schede/*/DF/DFP/DFPU='-' or record/metadata/schede/*/DF/DFP/DFPU='/') and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFP/DFPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFP/DFPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DF/DFG/DFGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'firenze') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'siena') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'san severino marche') or starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/DF/DFG/DFGR and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGC))" />
                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFG/DFGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGS))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
        						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGC))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGC)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGL))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/*/DF/DFG/DFGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFG/DFGE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(record/metadata/schede/*/DF/DFG/DFGE))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFG/DFGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Legal situation as an individual -->
			<xsl:if test="record/metadata/schede/*/DF/DFZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-video-recording-original')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della fotografia bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della fotografia del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of photo of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of photo of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="record/metadata/schede/*/DF/DFZ/DFZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFZ/DFZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFZ/DFZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DF/DFZ/DFZS">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-photo-original', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
					</xsl:for-each>
				</rdf:Description>
				<!-- Legal situation type -->
				<xsl:if test="record/metadata/schede/*/DF/DFZ/DFZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DF/DFZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-photo-original', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' della fotografia del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of photo of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' della fotografia del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of photo of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<xsl:if test="../DFZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(../DFZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="record/metadata/schede/*/DF/DFQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-DFQ-storage-medium-acquisition')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione della fotografia del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione della fotografia del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of photo of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of photo of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DF/DFQ/DFQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DFQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="record/metadata/schede/*/DF/DFQ/DFQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-DFQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DFQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-DFQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-DFQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="record/metadata/schede/*/DF/DFN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materialedella fotografia del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale della fotografia del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of photo of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of photo of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DFNT and (not(starts-with(lower-case(normalize-space(./DFNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFNT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DFNT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./DFND and (not(starts-with(lower-case(normalize-space(./DFND)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DFND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./DFNN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./DFNN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./DFND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DFND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DFND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DFND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./DFND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./DFNT and (not(starts-with(lower-case(normalize-space(./DFNT)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFNT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./DFNT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DFNT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DFNT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="record/metadata/schede/*/DF/DFY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/PhotographicRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DFYN and (not(starts-with(lower-case(normalize-space(./DFYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./DFYD and (not(starts-with(lower-case(normalize-space(./DFYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./DFYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./DFYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./DFYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DFYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DFYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./DFYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./DFYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DFYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DFYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DFYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DFYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DFYN)" />
						</l0:name>
						<xsl:if test="./DFYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./DFYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/*/AI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'AudioRecording/', $itemURI, '-integrative-recording-', position())" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Audio recording ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Audio recording ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione audio ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione audio ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="false()" />
				</arco-cd:primaryDocument>
				<xsl:if test="./AIC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./AIC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioRecordingIdentifier/', $itemURI, arco-fn:arcofy(./AIC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<xsl:if test="./AIB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(./AIB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="./AIO/AIOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="./AIO/AIOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="./AIL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./AIL))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="./AIU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/AudioRecording', $itemURI, '-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- is member of collection of -->
				<xsl:if test="./AIR">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./AIR/AIRD)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<xsl:if test="./AIS">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./AIS/AIST)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="./AIO/AIOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(./AIO/AIOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- recording location -->
				<xsl:if test="./AIA">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-audio-recording-location-', position())" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- informant -->
				<xsl:for-each select="./AIF">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-informant-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<xsl:for-each select="./AIE">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-informant-group-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- rilevatore -->
				<xsl:for-each select="./AID/AIDR">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-operator-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- at time -->
				<xsl:if test="./AID/AIDD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AID/AIDD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<!-- fonico -->
				<xsl:for-each select="./AID/AIDF">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-sound-engineer-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- has storage medium -->
				<xsl:for-each select="./AIO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-audio-recording-original-', position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<xsl:for-each select="./AIM">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-audio-recording-', position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="./AIY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/AudioRecording', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./AIYN and (not(starts-with(lower-case(normalize-space(./AIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIYN)), 'n.r')))">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIYN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:if test="./AIC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioRecordingIdentifier/', $itemURI, arco-fn:arcofy(./AIC))" />
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
						<xsl:value-of select="normalize-space(./AIC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./AIC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- title -->
			<xsl:if test="./AIL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./AIL))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="./AIU">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/AudioRecording', $itemURI, '-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione integrativa del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione integrativa del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '-duration')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '-duration')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./AIU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./AIU))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./AIU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./AIU))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Duration')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./AIU))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./AIU))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./AIU" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./AIU" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:for-each select="./AIO/AIOM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position(), '-frequency')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position(), '-audio-recording-speed')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
				<xsl:choose>
					<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position(), '-frequency')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Frequency')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:when>
					<xsl:otherwise>
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position(), '-audio-recording-speed')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'AudioRecordingSpeed')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="./AIM/AIMM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-integrative-audio-recording-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione integrativa ', position(), ' del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of integrative recording ', position(), ' of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-', position(), '-frequency')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-', position(), '-audio-recording-speed')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
				<xsl:choose>
					<xsl:when test="contains(lower-case(normalize-space(.)), 'hz')">
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-', position(), '-frequency')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Frequency')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:when>
					<xsl:otherwise>
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-integrative-audio-recording-', position(), '-audio-recording-speed')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (.))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (.))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'AudioRecordingSpeed')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(.)))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
						</rdf:Description>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- collection membership -->
			<xsl:if test="./AIR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./AIR/AIRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./AIR/AIRN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(./AIR/AIRN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(./AIR/AIRD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(./AIR/AIRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./AIR/AIRD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./AIR/AIRD" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./AIS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./AIS/AIST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione audio della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Audio collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./AIS/AISN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(./AIS/AISN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(./AIS/AIST)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(./AIS/AIST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./AIS/AIST" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./AIS/AIST" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
					<!-- Edition -->
					<xsl:if test="./AIX">
						<arco-cd:hasEdition>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
							</xsl:attribute>
						</arco-cd:hasEdition>
					</xsl:if>
				</rdf:Description>
				<!-- Edition as an individual -->
				<xsl:if test="./AIX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Edition'" />
	            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</l0:name>
						<!-- editor -->
						<xsl:if test="./AIX/AIXE">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXE))" />
            					</xsl:attribute>
							</arco-lite:hasEditor>
						</xsl:if>
						<!-- curator -->
						<xsl:if test="./AIX/AIXC">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXC))" />
            					</xsl:attribute>
							</arco-lite:hasCurator>
						</xsl:if>
						<!-- time interval -->
						<xsl:if test="./AIX/AIXP">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIX/AIXP)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:if test="./AIX/AIXI">
							<arco-core:note>
								<xsl:value-of select="concat('Indice: ', normalize-space(./AIX/AIXI))" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="./AIX/AIXZ">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./AIX/AIXZ)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- Time interval as an individual -->
					<xsl:if test="./AIX/AIXP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIX/AIXP)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./AIX/AIXP)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./AIX/AIXP)" />
							</l0:name>
							<tiapit:time>
								<xsl:value-of select="normalize-space(./AIX/AIXP)" />
							</tiapit:time>
						</rdf:Description>
					</xsl:if>
					<!-- editor as an individual -->
					<xsl:if test="./AIX/AIXE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./AIX/AIXE))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./AIX/AIXE))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./AIX/AIXE))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./AIX/AIXE))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Editor')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXE))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Editor')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Editore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Editore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXE))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(./AIX/AIXE)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(./AIX/AIXE)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- curator as an individual -->
					<xsl:if test="./AIX/AIXC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./AIX/AIXC))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./AIX/AIXC))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./AIX/AIXC))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./AIX/AIXC))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Curator')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXC))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Curator')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Curatore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Curatore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIX/AIXC))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(./AIX/AIXC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(./AIX/AIXC)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:if>			
			<!-- recording location -->
			<xsl:if test="./AIA">
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./AIA/AIAS and not(lower-case(normalize-space(./AIA/AIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./AIA/AIAS)), normalize-space(lower-case(./AIA/AIAE))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIA/AIAP)), normalize-space(lower-case(./AIA/AIAC)), normalize-space(lower-case(./AIA/AIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./AIAS and not(lower-case(normalize-space(./AIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIAS)), normalize-space(lower-case(./AIAE)))))" />
						</xsl:when>
						<xsl:otherwise>
	    					<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIAP)), normalize-space(lower-case(./AIAC)),  normalize-space(lower-case(./AIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-audio-recording-location-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/RecordingLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./AIH/AIHL and not(lower-case(normalize-space(./AIH/AIHL))='nr' or lower-case(normalize-space(./AIH/AIHL))='n.r.' or lower-case(normalize-space(./AIH/AIHL))='nr (recupero pregresso)' or lower-case(normalize-space(./AIH/AIHL))='.' or lower-case(normalize-space(./AIH/AIHL))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./AIH/AIHL)" />
						</arco-location:locationDetails>
					</xsl:if>
					<arco-location:atLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$location" />
						</xsl:attribute>
					</arco-location:atLocation>
				</rdf:Description>
				<!-- location -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./AIAS, ./AIAR, ./AIAP, ./AIAC, ./AIAL, ./AIAE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$address" />
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./AIA/*">
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
					<clvapit:fullAddress>
						<xsl:for-each select="./AIA/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</clvapit:fullAddress>
					<!-- Stato -->
					<xsl:if test="./AIA/AIAS and (not(starts-with(lower-case(normalize-space(./AIA/AIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIA/AIAS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./AIA/AIAR and (not(starts-with(lower-case(normalize-space(./AIA/AIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./AIA/AIAC and (starts-with(lower-case(normalize-space(./AIA/AIAC)), 'firenze') or starts-with(lower-case(normalize-space(./AIA/AIAC)), 'siena') or starts-with(lower-case(normalize-space(./AIA/AIAC)), 'san severino marche') or starts-with(lower-case(normalize-space(./AIA/AIAC)), 'modena'))">	
								<xsl:choose>
									<xsl:when test="./AIA/AIAR and (starts-with(lower-case(normalize-space(./AIA/AIAR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIA/AIAR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIA/AIAR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./AIA/AIAP and (not(starts-with(lower-case(normalize-space(./AIA/AIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIA/AIAP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./AIA/AIAC and (not(starts-with(lower-case(normalize-space(./AIA/AIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIA/AIAC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./AIA/AIAL and (not(starts-with(lower-case(normalize-space(./AIA/AIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIA/AIAL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./AIA/AIAE and (not(starts-with(lower-case(normalize-space(./AIA/AIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIA/AIAE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./AIA/AIAS and (not(starts-with(lower-case(normalize-space(./AIA/AIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIA/AIAS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIA/AIAS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIA/AIAS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./AIA/AIAR and (not(starts-with(lower-case(normalize-space(./AIA/AIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIA/AIAR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./AIA/AIAP and (not(starts-with(lower-case(normalize-space(./AIA/AIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIA/AIAP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAP)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAP)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./AIA/AIAC and (not(starts-with(lower-case(normalize-space(./AIA/AIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIA/AIAC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./AIA/AIAL and (not(starts-with(lower-case(normalize-space(./AIA/AIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIA/AIAL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIA/AIAL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./AIA/AIAE and (not(starts-with(lower-case(normalize-space(./AIA/AIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIA/AIAE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIA/AIAE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIA/AIAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIA/AIAE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>			
			<!-- informant -->
			<xsl:for-each select="./AIF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-informant-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./AIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./AIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./AIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./AIFN))" />
					</l0:name>
					<!-- hasRole -->
					<xsl:if test="./AIFU">
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AIFU)) )" />
							</xsl:attribute>
						</arco-core:hasRole>
					</xsl:if>
					<!-- has agent -->
					<arco-core:hasAgent>
						<xsl:choose>
							<xsl:when test="./AIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIFN))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AIFU, ./AIFZ, ./AIFB, ./AIFM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-core:hasAgent>
			</rdf:Description>
			<xsl:if test="./AIFU">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AIFU)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIFU)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./AIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIFN))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AIFU, ./AIFZ, ./AIFB, ./AIFM)))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./AIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./AIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./AIFU, ' ', ./AIFZ, ' ', ./AIFB, ' ', ./AIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./AIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./AIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./AIFU, ' ', ./AIFZ, ' ', ./AIFB, ' ', ./AIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<xsl:if test="./AIFZ">
					<arco-cd:nationality>
						<xsl:value-of select="./AIFZ" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="./AIFX">
					<arco-core:note>
						<xsl:value-of select="concat('Scolarità: ', ./AIFX)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./AIFM">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./AIFM)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:if>
				<xsl:if test="./AIFB">
					<arco-cd:hasCulturalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./AIFB)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalContext>
				</xsl:if>
				<!-- date Of Birth -->
				<xsl:if test="./AIFA">
					<cpv:dateOfBirth>
						<xsl:value-of select="./AIFA" />
					</cpv:dateOfBirth>
				</xsl:if>
				<!-- sex -->
				<xsl:if test="./AIFO">
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'Sex/', arco-fn:arcofy(normalize-space(./AIFO)))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<!-- age interpretation -->
				<xsl:if test="./AIFH">
					<arco-cd:hasAge>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./AIFH)))" />
               			</xsl:attribute>
					</arco-cd:hasAge>
					<arco-lite:age>
						<xsl:value-of select="normalize-space(./AIFH)" />
					</arco-lite:age>
					<arco-cd:isSubjectOfInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./AIFH))" />
						</xsl:attribute>
					</arco-cd:isSubjectOfInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./AIFS or ./AIFR or ./AIFP or ./AIFC or ./AIFE">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./AIFS and not(lower-case(normalize-space(./AIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFS)), normalize-space(lower-case(./AIFE)), normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./AIFT or ./AIFI or ./AIFV or ./AIFQ or ./AIFD">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./AIFT and not(lower-case(normalize-space(./AIFT))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFT)), normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasDomicile>
				</xsl:if>
			</rdf:Description>
			<!-- cultural context -->
			<xsl:if test="./AIFB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./AIFB)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalContext'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIFB)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIFB)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- profession of user as an individual -->
			<xsl:if test="./AIFM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./AIFM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIFM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIFM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- sex as individual -->
			<xsl:if test="./AIFO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy(normalize-space(./AIFO)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIFO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIFO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- age as individual -->
			<xsl:if test="./AIFH">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./AIFH))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Interpretation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./AIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./AIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./AIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./AIFN))" />
					</l0:name>
					<arco-cd:involvesEntity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./AIFH)))" />
						</xsl:attribute>
					</arco-cd:involvesEntity>
					<arco-cd:hasInterpretationCriterion>
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./AIFH)), 'ca')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasInterpretationCriterion>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./AIFH)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./AIFN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./AIFN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age of informant ', ./AIFN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age of informant ', ./AIFN)" />
					</l0:name>
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(./AIFH)" />
					</arco-cd:ageValue>
					<arco-cd:hasAgeType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-cd:hasAgeType>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./AIFS or ./AIFR or ./AIFP or ./AIFC or ./AIFE">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./AIFS and not(lower-case(normalize-space(./AIFS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFS)), normalize-space(lower-case(./AIFE)), normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
						</xsl:when>
						<xsl:otherwise>
	    	        		<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./AIFS, ./AIFR, ./AIFP, ./AIFC, ./AIFE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./AIFS and not(lower-case(normalize-space(./AIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFS)), normalize-space(lower-case(./AIFE)), normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./AIFS and not(lower-case(normalize-space(./AIFS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFS)), normalize-space(lower-case(./AIFE)), normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
							</xsl:when>
							<xsl:otherwise>
	    	           	            <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFP)), normalize-space(lower-case(./AIFC)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./AIFS, ./AIFR, ./AIFP, ./AIFC, ./AIFE))" />
					</rdfs:label>
					<!-- Stato -->
					<xsl:if test="./AIFS and (not(starts-with(lower-case(normalize-space(./AIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIFS))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./AIFR and (not(starts-with(lower-case(normalize-space(./AIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFR)), 'n.r')))">
						<clvapit:hasRegion>
							<xsl:attribute name="rdf:resource">
        				        <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIFR))" />
							</xsl:attribute>
						</clvapit:hasRegion>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./AIFP and (not(starts-with(lower-case(normalize-space(./AIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIFP))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./AIFC and (not(starts-with(lower-case(normalize-space(./AIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIFC))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./AIFE and (not(starts-with(lower-case(normalize-space(./AIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIFE))" />
							</xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./AIFS and (not(starts-with(lower-case(normalize-space(./AIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIFS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIFS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIFS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./AIFR and (not(starts-with(lower-case(normalize-space(./AIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIFR))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./AIFP and (not(starts-with(lower-case(normalize-space(./AIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIFP))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIFP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIFP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./AIFC and (not(starts-with(lower-case(normalize-space(./AIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIFC))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFC)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Località (Address Area) -->
				<xsl:if test="./AIFE and (not(starts-with(lower-case(normalize-space(./AIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIFE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFE)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFE)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- domicile -->
			<xsl:if test="./AIFT or ./AIFI or ./AIFV or ./AIFQ or ./AIFD">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./AIFT and not(lower-case(normalize-space(./AIFT))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFT)), normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
						</xsl:when>
						<xsl:otherwise>
	    	        		<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./AIFT, ./AIFI, ./AIFV, ./AIFQ, ./AIFD))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFT)), normalize-space(lower-case(./AIFI)), normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
                    	</xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIFT)), normalize-space(lower-case(./AIFI)), normalize-space(lower-case(./AIFV)), normalize-space(lower-case(./AIFQ)), normalize-space(lower-case(./AIFD)))))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./AIFT, ./AIFI, ./AIFV, ./AIFQ, ./AIFD))" />
					</rdfs:label>
					<xsl:if test="./AIFD and (not(starts-with(lower-case(normalize-space(./AIFD)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFD)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./AIFD)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./AIFT and (not(starts-with(lower-case(normalize-space(./AIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFT)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIFT))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					
					<!-- Provincia -->
					<xsl:if test="./AIFV and (not(starts-with(lower-case(normalize-space(./AIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFV)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIFV))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./AIFQ and (not(starts-with(lower-case(normalize-space(./AIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFQ)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIFQ))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./AIFT and (not(starts-with(lower-case(normalize-space(./AIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIFT))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIFT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIFT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./AIFI and (not(starts-with(lower-case(normalize-space(./AIFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFI)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIFI))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFI)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFI)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./AIFP and (not(starts-with(lower-case(normalize-space(./AIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFV)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIFV))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIFV)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIFV)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./AIFQ and (not(starts-with(lower-case(normalize-space(./AIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIFQ)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIFQ))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFQ)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIFQ)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./AIE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-informant-group-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore ', position(), ' del bene ', $itemURI, ': ', ./AIED)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant ', position(), ' of cultural property ', $itemURI, ': ', ./AIED)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/Informant')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIED))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/Informant')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Informatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Informant'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIED))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Group'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./AIED" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./AIED" />
					</l0:name>
					<xsl:if test="./AIES">
						<arco-cd:contacts>
							<xsl:value-of select="./AIES" />
						</arco-cd:contacts>
					</xsl:if>
					<xsl:if test="./AIEX">
						<arco-core:note>
							<xsl:value-of select="./AIEX" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
			<!-- rilevatore -->
			<xsl:for-each select="./AID/AIDR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-operator-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Rilevatore ', position(), ' del bene ', $itemURI, ': ', ./AID/AIDR)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio recording operator ', position(), ' of cultural property ', $itemURI, ': ', ./AID/AIDR)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/AudioRecordingOperator')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AID/AIDR))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/AudioRecordingOperator')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Rilevatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Audio recording operator'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AID/AIDR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(./AID/AIDR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(./AID/AIDR)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- fonico -->
			<xsl:for-each select="./AID/AIDF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-recording-sound-engineer-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Fonico ', position(), ' del bene ', $itemURI, ': ', ./AID/AIDF)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Audio recording sound engineer ', position(), ' of cultural property ', $itemURI, ': ', ./AID/AIDF)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/AudioRecordingSoundEngineer')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AID/AIDF))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/AudioRecordingSoundEngineer')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Fonico'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Audio recording sound engineer'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AID/AIDF))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(./AID/AIDF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(./AID/AIDF)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- time interval -->
			<xsl:if test="./AID/AIDD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AID/AIDD)))" />
                       </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AID/AIDD)" />
					</rdfs:label>
					<tiapit:time>
						<xsl:value-of select="normalize-space(./AID/AIDD)" />
					</tiapit:time>
				</rdf:Description>
			</xsl:if>
			<!-- storage medium  -->
			<xsl:for-each select="./AIO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-audio-recording-original-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIOC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./AIOC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./AIOC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="true()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./AIOD[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:description>
								<xsl:value-of select="./AIOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./AIOI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./AIOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIOZ[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./AIOZ" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./AIOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="./AIOM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-integrative-audio-recording-original-', position())" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
					<!-- CIS -->
					<xsl:if test="../AIP/AIPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="../AIG/AIGS and not(lower-case(normalize-space(../AIG/AIGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../AIG/AIGS)), normalize-space(lower-case(../AIG/AIGE)), normalize-space(lower-case(../AIP/AIPU)), normalize-space(lower-case(../AIP/AIPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	               		           		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../AIG/AIGP)), normalize-space(lower-case(../AIG/AIGC)), normalize-space(lower-case(../AIG/AIGL)), normalize-space(lower-case(../AIP/AIPU)), normalize-space(lower-case(../AIP/AIPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<!-- current physical location -->
					<xsl:if test="../AIG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="../AIZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(../AIZ/AIZG)))" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
					<xsl:for-each select="./AIZ/AIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-cd:hasOwner>
							<xsl:attribute name="rdf:resource">
		           				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		           			</xsl:attribute>
						</arco-cd:hasOwner>
					</xsl:for-each>
					<!-- Acquisition of cultural property -->
					<xsl:if test="../AIQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-AIQ-storage-medium-acquisition', position())" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./AIQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-AIQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
					</xsl:if>
					<xsl:for-each select="../AIN">
						<arco-cd:hasChangeOfAvailability>
							<xsl:attribute name="rdf:resource">
	    	            		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-integrative-audio-recording-original-', position())" />
	        	        	</xsl:attribute>
						</arco-cd:hasChangeOfAvailability>
					</xsl:for-each>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./AIOC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./AIOC))" />
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
							<xsl:value-of select="normalize-space(./AIOC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIOC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./AIOC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
				<!-- storage medium type -->
				<xsl:if test="./AIOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
    	            		<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./AIOF))" />
        	        	</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="./AIOF" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./AIOF" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/StorageMediumType'" />
							</xsl:attribute>
						</rdf:type>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./AIM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-audio-recording-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIMC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIMC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./AIMC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./AIMC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="false()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./AIMD[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:description>
								<xsl:value-of select="./AIMD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./AIMI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./AIMI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIOZ[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./AIOZ" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIMF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./AIMF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="./AIMM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI, '-integrative-audio-recording-', position())" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./AIMC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./AIMC))" />
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
							<xsl:value-of select="normalize-space(./AIMC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIMC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./AIMC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CIS -->
			<xsl:if test="./AIP/AIPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./AIG/AIGS and not(lower-case(normalize-space(./AIG/AIGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGS)), normalize-space(lower-case(./AIG/AIGE)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
							</xsl:when>
							<xsl:otherwise>
	               		         		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGP)), normalize-space(lower-case(./AIG/AIGC)), normalize-space(lower-case(./AIG/AIGL)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./AIP/AIPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./AIP/AIPN)" />
					</l0:name>
					<!-- has cis name in time -->
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./AIP/AIPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<!-- has site -->
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="./AIG/AIGS and not(lower-case(normalize-space(./AIG/AIGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGS)), normalize-space(lower-case(./AIG/AIGE)), normalize-space(lower-case(./AIP/AIPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGP)), normalize-space(lower-case(./AIG/AIGC)), normalize-space(lower-case(./AIG/AIGL)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
				</rdf:Description>
				<!-- Name in time -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./AIP/AIPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./AIP/AIPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./AIP/AIPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./AIP/AIPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./AIP/AIPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(./AIP/AIPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="./AIG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="./AIG/AIGS and not(lower-case(normalize-space(./AIG/AIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGS)), normalize-space(lower-case(./AIG/AIGE)), normalize-space(lower-case(./AIP/AIPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGP)), normalize-space(lower-case(./AIG/AIGC)), normalize-space(lower-case(./AIG/AIGL)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./AIG/AIGS and not(lower-case(normalize-space(./AIG/AIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./AIG/AIGS)), normalize-space(lower-case(./AIG/AIGE)), normalize-space(lower-case(./AIP/AIPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGP)), normalize-space(lower-case(./AIG/AIGC)), normalize-space(lower-case(./AIG/AIGL)), normalize-space(lower-case(./AIP/AIPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./AIP/AIPC and not(lower-case(normalize-space(./AIP/AIPC))='nr' or lower-case(normalize-space(./AIP/AIPC))='n.r.' or lower-case(normalize-space(./AIP/AIPC))='nr (recupero pregresso)' or lower-case(normalize-space(./AIP/AIPC))='.' or lower-case(normalize-space(./AIP/AIPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./AIP/AIPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="./AIP/AIPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./AIG/AIGS and not(lower-case(normalize-space(./AIG/AIGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGS)), normalize-space(lower-case(./AIG/AIGE)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           			 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./AIG/AIGP)), normalize-space(lower-case(./AIG/AIGC)), normalize-space(lower-case(./AIG/AIGL)), normalize-space(lower-case(./AIP/AIPU)), normalize-space(lower-case(./AIP/AIPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./AIP/AIPN))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./AIP/AIPN))" />
					</l0:name>
					<xsl:if test="./AIG/*">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./AIG/*">
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
					<xsl:if test="./AIP/AIPU and not(./AIP/AIPU='.' or ./AIP/AIPU='-' or ./AIP/AIPU='/') and (not(starts-with(lower-case(normalize-space(./AIP/AIPU)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIP/AIPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./AIP/AIPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./AIG/AIGS and (not(starts-with(lower-case(normalize-space(./AIG/AIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIG/AIGS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./AIG/AIGR and (not(starts-with(lower-case(normalize-space(./AIG/AIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./AIG/AIGC and (starts-with(lower-case(normalize-space(./AIG/AIGC)), 'firenze') or starts-with(lower-case(normalize-space(./AIG/AIGC)), 'siena') or starts-with(lower-case(normalize-space(./AIG/AIGC)), 'san severino marche') or starts-with(lower-case(normalize-space(./AIG/AIGC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./AIG/AIGR and (starts-with(lower-case(normalize-space(./AIG/AIGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIG/AIGR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIG/AIGR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./AIG/AIGP and (not(starts-with(lower-case(normalize-space(./AIG/AIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIG/AIGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./AIG/AIGC and (not(starts-with(lower-case(normalize-space(./AIG/AIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIG/AIGC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./AIG/AIGL and (not(starts-with(lower-case(normalize-space(./AIG/AIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIG/AIGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./AIG/AIGE and (not(starts-with(lower-case(normalize-space(./AIG/AIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIG/AIGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./AIG/AIGS and (not(starts-with(lower-case(normalize-space(./AIG/AIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./AIG/AIGS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIG/AIGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIG/AIGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./AIG/AIGR and (not(starts-with(lower-case(normalize-space(./AIG/AIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./AIG/AIGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./AIG/AIGP and (not(starts-with(lower-case(normalize-space(./AIG/AIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./AIG/AIGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIG/AIGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIG/AIGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./AIG/AIGC and (not(starts-with(lower-case(normalize-space(./AIG/AIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./AIG/AIGC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./AIG/AIGL and (not(starts-with(lower-case(normalize-space(./AIG/AIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIG/AIGL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./AIG/AIGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./AIG/AIGE and (not(starts-with(lower-case(normalize-space(./AIG/AIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIG/AIGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./AIG/AIGE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIG/AIGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIG/AIGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			 <!-- Legal situation as an individual -->
			<xsl:if test="./AIZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(./AIZ/AIZG)))" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./AIZ/AIZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./AIZ/AIZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./AIZ/AIZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./AIZ/AIZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="./AIZ/AIZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AIZ/AIZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIZ/AIZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./AIZ/AIZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:for-each select="./AIZ/AIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-aizs', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
				</rdf:Description>
				<!-- Legal situation type -->
				<xsl:if test="./AIZ/AIZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./AIZ/AIZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIZ/AIZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIZ/AIZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:for-each select="./AIZ/AIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-aizs', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<xsl:if test="./AIZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(./AIZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="./AIQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-AIQ-storage-medium-acquisition', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<!-- acquisition type -->
					<xsl:if test="./AIQ/AIQT and (not(starts-with(lower-case(normalize-space(./AIQ/AIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIQ/AIQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./AIQ/AIQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<!-- transferor -->
					<xsl:for-each select="./AIQ/AIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-AIQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<!-- at time -->
					<xsl:if test="./AIQ/AIQD and (not(starts-with(lower-case(normalize-space(./AIQ/AIQD)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIQ/AIQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIQ/AIQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./AIQ/AIQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AIQ/AIQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AIQ/AIQL and (not(starts-with(lower-case(normalize-space(./AIQ/AIQL)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIQ/AIQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(./AIQ/AIQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./AIQ/AIQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIQ/AIQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIQ/AIQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIQ/AIQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(./AIQ/AIQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(./AIQ/AIQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="./AIQ/AIQT and (not(starts-with(lower-case(normalize-space(./AIQ/AIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIQ/AIQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./AIQ/AIQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIQ/AIQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIQ/AIQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="./AIQ/AIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-AIQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-AIQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-AIQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-AIQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="./AIN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-integrative-audio-recording-original-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./AINT and (not(starts-with(lower-case(normalize-space(./AINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AINT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./AINT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./AIND and (not(starts-with(lower-case(normalize-space(./AIND)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./AINN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AINN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./AIND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AIND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./AIND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./AINT and (not(starts-with(lower-case(normalize-space(./AINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./AINT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./AINT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AINT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AINT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="./AIY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/AudioRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
	           			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./AIYN and (not(starts-with(lower-case(normalize-space(./AIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./AIYD and (not(starts-with(lower-case(normalize-space(./AIYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./AIYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./AIYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./AIYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./AIYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./AIYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./AIYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./AIYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AIYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIYN)" />
						</l0:name>
						<xsl:if test="./AIYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./AIYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/VI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'VideoRecording/', $itemURI, '-integrative-recording-', position())" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Video recording ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Video recording ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione video ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione video ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="false()" />
				</arco-cd:primaryDocument>
				<xsl:if test="./VIC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./VIC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoRecordingIdentifier/', $itemURI, arco-fn:arcofy(./VIC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<xsl:if test="./VIB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(./VIB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="./VIO/VIOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="./VIO/VIOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="./VIL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./VIL))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="./VIU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/VideoRecording', $itemURI, '-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- is member of collection of -->
				<xsl:if test="./VIR">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIR/VIRD)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<xsl:if test="./VIV/VIVT">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIV/VIVT)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<xsl:if test="./VIS">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIS/VIST)))" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="./VIO/VIOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(./VIO/VIOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- recording location -->
				<xsl:if test="./VIA">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-video-recording-location-', position())" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- informant -->
				<xsl:for-each select="./VIF">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-informant-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<xsl:for-each select="./VIE">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-informant-group-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- rilevatore -->
				<xsl:for-each select="./VID/VIDR">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-recording-operator-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- at time -->
				<xsl:if test="./VID/VIDD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VID/VIDD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<!-- operatore -->
				<xsl:for-each select="./VID/VIDO">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-operator-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- has storage medium -->
				<xsl:for-each select="./VIO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-video-recording-original-', position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<xsl:for-each select="./VIM">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-video-recording-', position())" />
						</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="./VIY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/AudioRecording', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./VIYN and (not(starts-with(lower-case(normalize-space(./VIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIYN)), 'n.r')))">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIYN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:if test="./VIC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoRecordingIdentifier/', $itemURI, arco-fn:arcofy(./VIC))" />
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
						<xsl:value-of select="normalize-space(./VIC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(./VIC)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- title -->
			<xsl:if test="./VIL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./VIL))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="./VIU">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/VideoRecording', $itemURI, '-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione integrativa del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione integrativa del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '-duration')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '-duration')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./VIU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./VIU))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./VIU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./VIU))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Duration')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./VIU))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./VIU))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./VIU" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VIU" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- collection membership -->
			<xsl:if test="./VIR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIR/VIRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VIR/VIRN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(./VIR/VIRN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIR/VIRD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<!-- video collection -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIR/VIRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./VIR/VIRD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VIR/VIRD" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./VIV/VIVT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIV/VIVT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VIV/VIVT">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(./VIV/VIVT)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIV/VIVT)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<!-- video collection -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIV/VIVT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./VIV/VIVT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VIV/VIVT" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
					<!-- Edition -->
					<xsl:if test="./VIX">
						<arco-cd:hasEdition>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
							</xsl:attribute>
						</arco-cd:hasEdition>
					</xsl:if>
				</rdf:Description>
				<!-- Edition as an individual -->
				<xsl:if test="./VIX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Edition/', $itemURI)" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Edition'" />
	            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Edizione del documento audio del bene ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Edition of audio documentation of cultural property ', $itemURI)" />
						</l0:name>
						<!-- editor -->
						<xsl:if test="./VIX/VIXE">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXE))" />
            					</xsl:attribute>
							</arco-lite:hasEditor>
						</xsl:if>
						<!-- curator -->
						<xsl:if test="./VIX/VIXC">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXC))" />
            					</xsl:attribute>
							</arco-lite:hasCurator>
						</xsl:if>
						<!-- time interval -->
						<xsl:if test="./VIX/VIXP">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIX/VIXP)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:if test="./VIX/VIXI">
							<arco-core:note>
								<xsl:value-of select="concat('Indice: ', normalize-space(./VIX/VIXI))" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="./VIX/VIXZ">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./VIX/VIXZ)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- Time interval as an individual -->
					<xsl:if test="./VIX/VIXP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIX/VIXP)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./VIX/VIXP)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./VIX/VIXP)" />
							</l0:name>
							<tiapit:time>
								<xsl:value-of select="normalize-space(./VIX/VIXP)" />
							</tiapit:time>
						</rdf:Description>
					</xsl:if>
					<!-- editor as an individual -->
					<xsl:if test="./VIX/VIXE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-editor', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./VIX/VIXE))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./VIX/VIXE))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./VIX/VIXE))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./VIX/VIXE))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Editor')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXE))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Editor')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Editore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Editore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXE))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(./VIX/VIXE)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(./VIX/VIXE)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- curator as an individual -->
					<xsl:if test="./VIX/VIXC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                      			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-curator', position())" />
                  			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                	       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./VIX/VIXC))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Ruolo nella edizione ', position(), ': ', normalize-space(./VIX/VIXC))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./VIX/VIXC))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Role in edition ', position(), ': ', normalize-space(./VIX/VIXC))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                		        <xsl:value-of select="concat($NS, 'Role/Curator')" />
		                       	</xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	            	               <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXC))" />
	                	       </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<!-- Role as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/Curator')" />
			   				</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="Curatore" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="Curatore" />
							</l0:name>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIX/VIXC))" />
	            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
	            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="arco-fn:name-cleaner(./VIX/VIXC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="arco-fn:name-cleaner(./VIX/VIXC)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./VIS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, arco-fn:urify(normalize-space(./VIS/VIST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Appartenenza a collezione video della registrazione del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video collection membership of recording of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VIS/VISN">
						<arco-cd:collectionUnitNumber>
							<xsl:value-of select="normalize-space(./VIS/VISN)" />
						</arco-cd:collectionUnitNumber>
					</xsl:if>
					<!-- has collection -->
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIS/VIST)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
					<arco-cd:involvesMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:involvesMember>
				</rdf:Description>
				<!-- video collection -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(./VIS/VIST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./VIS/VIST" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VIS/VIST" />
					</l0:name>
					<arco-lite:hasCollectionMember>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-lite:hasCollectionMember>
				</rdf:Description>
			</xsl:if>			
			<!-- recording location -->
			<xsl:if test="./VIA">
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./VIA/VIAS and not(lower-case(normalize-space(./VIA/VIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./VIA/VIAS)), normalize-space(lower-case(./VIA/VIAE))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIA/VIAP)), normalize-space(lower-case(./VIA/VIAC)), normalize-space(lower-case(./VIA/VIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./VIAS and not(lower-case(normalize-space(./VIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIAS)), normalize-space(lower-case(./VIAE)))))" />
						</xsl:when>
						<xsl:otherwise>
	    					<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIAP)), normalize-space(lower-case(./VIAC)),  normalize-space(lower-case(./VIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-video-recording-location-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/RecordingLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./VIH/VIHL and not(lower-case(normalize-space(./VIH/VIHL))='nr' or lower-case(normalize-space(./VIH/VIHL))='n.r.' or lower-case(normalize-space(./VIH/VIHL))='nr (recupero pregresso)' or lower-case(normalize-space(./VIH/VIHL))='.' or lower-case(normalize-space(./VIH/VIHL))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./VIH/VIHL)" />
						</arco-location:locationDetails>
					</xsl:if>
					<arco-location:atLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$location" />
						</xsl:attribute>
					</arco-location:atLocation>
				</rdf:Description>
				<!-- location -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./VIAS, ./VIAR, ./VIAP, ./VIAC, ./VIAL, ./VIAE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$address" />
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./VIA/*">
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
					<clvapit:fullAddress>
						<xsl:for-each select="./VIA/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</clvapit:fullAddress>
					<!-- Stato -->
					<xsl:if test="./VIA/VIAS and (not(starts-with(lower-case(normalize-space(./VIA/VIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIA/VIAS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./VIA/VIAR and (not(starts-with(lower-case(normalize-space(./VIA/VIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./VIA/VIAC and (starts-with(lower-case(normalize-space(./VIA/VIAC)), 'firenze') or starts-with(lower-case(normalize-space(./VIA/VIAC)), 'siena') or starts-with(lower-case(normalize-space(./VIA/VIAC)), 'san severino marche') or starts-with(lower-case(normalize-space(./VIA/VIAC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./VIA/VIAR and (starts-with(lower-case(normalize-space(./VIA/VIAR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIA/VIAR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIA/VIAR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./VIA/VIAP and (not(starts-with(lower-case(normalize-space(./VIA/VIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIA/VIAP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./VIA/VIAC and (not(starts-with(lower-case(normalize-space(./VIA/VIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIA/VIAC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./VIA/VIAL and (not(starts-with(lower-case(normalize-space(./VIA/VIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIA/VIAL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./VIA/VIAE and (not(starts-with(lower-case(normalize-space(./VIA/VIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIA/VIAE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./VIA/VIAS and (not(starts-with(lower-case(normalize-space(./VIA/VIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIA/VIAS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIA/VIAS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIA/VIAS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./VIA/VIAR and (not(starts-with(lower-case(normalize-space(./VIA/VIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIA/VIAR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./VIA/VIAP and (not(starts-with(lower-case(normalize-space(./VIA/VIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIA/VIAP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAP)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAP)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./VIA/VIAC and (not(starts-with(lower-case(normalize-space(./VIA/VIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIA/VIAC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./VIA/VIAL and (not(starts-with(lower-case(normalize-space(./VIA/VIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIA/VIAL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIA/VIAL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./VIA/VIAE and (not(starts-with(lower-case(normalize-space(./VIA/VIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIA/VIAE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIA/VIAE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIA/VIAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIA/VIAE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>			
			<!-- informant -->
			<xsl:for-each select="./VIF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-informant-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./VIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./VIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./VIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./VIFN))" />
					</l0:name>
					<!-- hasRole -->
					<xsl:if test="./VIFU">
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./VIFU)) )" />
							</xsl:attribute>
						</arco-core:hasRole>
					</xsl:if>
					<!-- has agent -->
					<arco-core:hasAgent>
						<xsl:choose>
							<xsl:when test="./VIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIFN))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./VIFU, ./VIFZ, ./VIFB, ./VIFM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-core:hasAgent>
			</rdf:Description>
			<xsl:if test="./VIFU">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./VIFU)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIFU)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./VIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIFN))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./VIFU, ./VIFZ, ./VIFB, ./VIFM)))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./VIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./VIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./VIFU, ' ', ./VIFZ, ' ', ./VIFB, ' ', ./VIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./VIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./VIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./VIFU, ' ', ./VIFZ, ' ', ./VIFB, ' ', ./VIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<xsl:if test="./VIFZ">
					<arco-cd:nationality>
						<xsl:value-of select="./VIFZ" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="./VIFX">
					<arco-core:note>
						<xsl:value-of select="concat('Scolarità: ', ./VIFX)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./VIFM">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./VIFM)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:if>
				<xsl:if test="./VIFB">
					<arco-cd:hasCulturalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./VIFB)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalContext>
				</xsl:if>
				<!-- date Of Birth -->
				<xsl:if test="./VIFA">
					<cpv:dateOfBirth>
						<xsl:value-of select="./VIFA" />
					</cpv:dateOfBirth>
				</xsl:if>
				<!-- sex interpretation -->
				<xsl:if test="./VIFO">
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'Sex/', arco-fn:arcofy(normalize-space(./VIFO)))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<!-- age interpretation -->
				<xsl:if test="./VIFH">
					<arco-cd:hasAge>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./VIFH)))" />
               			</xsl:attribute>
					</arco-cd:hasAge>
					<arco-lite:age>
						<xsl:value-of select="normalize-space(./VIFH)" />
					</arco-lite:age>
					<arco-cd:isSubjectOfInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./VIFH))" />
						</xsl:attribute>
					</arco-cd:isSubjectOfInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./VIFS or ./VIFR or ./VIFP or ./VIFC or ./VIFE">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./VIFS and not(lower-case(normalize-space(./VIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFS)), normalize-space(lower-case(./VIFE)), normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./VIFT or ./VIFI or ./VIFV or ./VIFQ or ./VIFD">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./VIFT and not(lower-case(normalize-space(./VIFT))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFT)), normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
								</xsl:when>
								<xsl:otherwise>
		    	        			<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasDomicile>
				</xsl:if>
			</rdf:Description>
			<!-- cultural context -->
			<xsl:if test="./VIFB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./VIFB)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalContext'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIFB)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIFB)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- profession of user as an individual -->
			<xsl:if test="./VIFM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./VIFM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIFM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIFM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- sex as individual -->
			<xsl:if test="./VIFO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy(normalize-space(./VIFO)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIFO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIFO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- age as individual -->
			<xsl:if test="./VIFH">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./VIFH))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Interpretation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./VIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./VIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./VIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./VIFN))" />
					</l0:name>
					<arco-cd:involvesEntity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./VIFH)))" />
						</xsl:attribute>
					</arco-cd:involvesEntity>
					<arco-cd:hasInterpretationCriterion>
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./VIFH)), 'ca')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasInterpretationCriterion>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./VIFH)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./VIFN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./VIFN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age of informant ', ./VIFN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age of informant ', ./VIFN)" />
					</l0:name>
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(./VIFH)" />
					</arco-cd:ageValue>
					<arco-cd:hasAgeType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-cd:hasAgeType>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./VIFS or ./VIFR or ./VIFP or ./VIFC or ./VIFE">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./VIFS and not(lower-case(normalize-space(./VIFS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFS)), normalize-space(lower-case(./VIFE)), normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
						</xsl:when>
						<xsl:otherwise>
	    	        		<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./VIFS, ./VIFR, ./VIFP, ./VIFC, ./VIFE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./VIFS and not(lower-case(normalize-space(./VIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFS)), normalize-space(lower-case(./VIFE)), normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./VIFS and not(lower-case(normalize-space(./VIFS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFS)), normalize-space(lower-case(./VIFE)), normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
							</xsl:when>
							<xsl:otherwise>
	    	           	            <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFP)), normalize-space(lower-case(./VIFC)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./VIFS, ./VIFR, ./VIFP, ./VIFC, ./VIFE))" />
					</rdfs:label>
					<!-- Stato -->
					<xsl:if test="./VIFS and (not(starts-with(lower-case(normalize-space(./VIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIFS))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./VIFR and (not(starts-with(lower-case(normalize-space(./VIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFR)), 'n.r')))">
						<clvapit:hasRegion>
							<xsl:attribute name="rdf:resource">
        	        	   		<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIFR))" />
                        	</xsl:attribute>
						</clvapit:hasRegion>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./VIFP and (not(starts-with(lower-case(normalize-space(./VIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIFP))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./VIFC and (not(starts-with(lower-case(normalize-space(./VIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIFC))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./VIFE and (not(starts-with(lower-case(normalize-space(./VIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIFE))" />
							</xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./VIFS and (not(starts-with(lower-case(normalize-space(./VIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIFS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIFS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIFS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./VIFR and (not(starts-with(lower-case(normalize-space(./VIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIFR))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./VIFP and (not(starts-with(lower-case(normalize-space(./VIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIFP))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIFP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIFP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./VIFC and (not(starts-with(lower-case(normalize-space(./VIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIFC))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFC)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Località (Address Area) -->
				<xsl:if test="./VIFE and (not(starts-with(lower-case(normalize-space(./VIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIFE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFE)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFE)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- domicile -->
			<xsl:if test="./VIFT or ./VIFI or ./VIFV or ./VIFQ or ./VIFD">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./VIFT and not(lower-case(normalize-space(./VIFT))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFT)), normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
						</xsl:when>
						<xsl:otherwise>
		    	    		<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./VIFT, ./VIFI, ./VIFV, ./VIFQ, ./VIFD))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFT)), normalize-space(lower-case(./VIFI)), normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
                    	</xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIFT)), normalize-space(lower-case(./VIFI)), normalize-space(lower-case(./VIFV)), normalize-space(lower-case(./VIFQ)), normalize-space(lower-case(./VIFD)))))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./VIFT, ./VIFI, ./VIFV, ./VIFQ, ./VIFD))" />
					</rdfs:label>
					<xsl:if test="./VIFD and (not(starts-with(lower-case(normalize-space(./VIFD)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFD)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./VIFD)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./VIFT and (not(starts-with(lower-case(normalize-space(./VIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFT)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIFT))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./VIFI and (not(starts-with(lower-case(normalize-space(./VIFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFI)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./VIFQ and (starts-with(lower-case(normalize-space(./VIFQ)), 'firenze') or starts-with(lower-case(normalize-space(./VIFQ)), 'siena') or starts-with(lower-case(normalize-space(./VIFQ)), 'san severino marche') or starts-with(lower-case(normalize-space(./VIFQ)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./VIFI and (starts-with(lower-case(normalize-space(./VIFI)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIFI))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIFI))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./VIFV and (not(starts-with(lower-case(normalize-space(./VIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFV)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIFV))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./VIFQ and (not(starts-with(lower-case(normalize-space(./VIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFQ)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIFQ))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./VIFT and (not(starts-with(lower-case(normalize-space(./VIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIFT))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIFT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIFT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./VIFI and (not(starts-with(lower-case(normalize-space(./VIFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFI)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIFI))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFI)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFI)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./VIFP and (not(starts-with(lower-case(normalize-space(./VIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFV)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIFV))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIFV)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIFV)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./VIFQ and (not(starts-with(lower-case(normalize-space(./VIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIFQ)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIFQ))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFQ)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIFQ)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./VIE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-informant-group-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore ', position(), ' del bene ', $itemURI, ': ', ./VIED)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant ', position(), ' of cultural property ', $itemURI, ': ', ./VIED)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/Informant')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIED))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/Informant')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Informatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Informant'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIED))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Group'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./VIED" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VIED" />
					</l0:name>
					<xsl:if test="./VIES">
						<arco-cd:contacts>
							<xsl:value-of select="./VIES" />
						</arco-cd:contacts>
					</xsl:if>
					<xsl:if test="./VIEX">
						<arco-core:note>
							<xsl:value-of select="./VIEX" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
			<!-- rilevatore -->
			<xsl:for-each select="./VID/VIDR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-recording-operator-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Rilevatore ', position(), ' del bene ', $itemURI, ': ', ./VID/VIDR)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Recording operator ', position(), ' of cultural property ', $itemURI, ': ', ./VID/VIDR)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/RecordingOperator')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VID/VIDR))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<!-- role -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/RecordingOperator')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Rilevatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Recording operator'" />
					</rdfs:label>
				</rdf:Description>
				<!-- agent -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VID/VIDR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(./VID/VIDR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(./VID/VIDR)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- video operator -->
			<xsl:for-each select="./VID/VIDO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-video-recording-operator-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Rilevatore ', position(), ' del bene ', $itemURI, ': ', .)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video recording operator ', position(), ' of cultural property ', $itemURI, ': ', .)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/VideoRecordingOperator')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/VideoRecordingOperator')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Operatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Video recording operator'" />
					</rdfs:label>
				</rdf:Description>
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
						<xsl:value-of select="arco-fn:name-cleaner(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- time interval -->
			<xsl:if test="./VID/VIDD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VID/VIDD)))" />
                       </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VID/VIDD)" />
					</rdfs:label>
					<tiapit:time>
						<xsl:value-of select="normalize-space(./VID/VIDD)" />
					</tiapit:time>
				</rdf:Description>
			</xsl:if>
			<!-- storage medium  -->
			<xsl:for-each select="./VIO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-video-recording-original-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIOC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./VIOC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./VIOC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="true()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./VIOD[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:description>
								<xsl:value-of select="./VIOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./VIOI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./VIOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIOZ[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./VIOZ" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./VIOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<!-- CIS -->
					<xsl:if test="../VIP/VIPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="../VIG/VIGS and not(lower-case(normalize-space(../VIG/VIGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../VIG/VIGS)), normalize-space(lower-case(../VIG/VIGE)), normalize-space(lower-case(../VIP/VIPU)), normalize-space(lower-case(../VIP/VIPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	               		           		<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(../VIG/VIGP)), normalize-space(lower-case(../VIG/VIGC)), normalize-space(lower-case(../VIG/VIGL)), normalize-space(lower-case(../VIP/VIPU)), normalize-space(lower-case(../VIP/VIPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<!-- current physical location -->
					<xsl:if test="../VIG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="../VIZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(../VIZ/VIZG)))" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
					<xsl:for-each select="./VIZ/VIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-cd:hasOwner>
							<xsl:attribute name="rdf:resource">
		           				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		           			</xsl:attribute>
						</arco-cd:hasOwner>
					</xsl:for-each>
					<!-- Acquisition of cultural property -->
					<xsl:if test="../VIQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-VIQ-storage-medium-acquisition', position())" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./VIQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-VIQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
					</xsl:if>
					<xsl:for-each select="../VIN">
						<arco-cd:hasChangeOfAvailability>
							<xsl:attribute name="rdf:resource">
	    	            		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-integrative-video-recording-original-', position())" />
	        	        	</xsl:attribute>
						</arco-cd:hasChangeOfAvailability>
					</xsl:for-each>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./VIOC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./VIOC))" />
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
							<xsl:value-of select="normalize-space(./VIOC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIOC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./VIOC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
				<!-- storage medium type -->
				<xsl:if test="./VIOF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
    	            		<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./VIOF))" />
        	        	</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="./VIOF" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./VIOF" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/StorageMediumType'" />
							</xsl:attribute>
						</rdf:type>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./VIM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-integrative-video-recording-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIMC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIMC)" />
					</l0:name>
					<arco-lite:localIdentifier>
               			<xsl:value-of select="./VIMC" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./VIMC))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
					<arco-cd:originalStorageMedium>
						<xsl:value-of select="false()" />
					</arco-cd:originalStorageMedium>
					<xsl:if test="./VIMD[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:description>
								<xsl:value-of select="./VIMD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="./VIMI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./VIMI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIOZ[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:note>
							<xsl:value-of select="./VIOZ" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIMF[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(./VIMF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
				</rdf:Description>
				<!-- identifier -->
				<xsl:if test="./VIMC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'StorageMediumIdentifier/', $itemURI, arco-fn:arcofy(./VIMC))" />
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
							<xsl:value-of select="normalize-space(./VIMC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIMC)" />
						</l0:name>
						<l0:identifier>
							<xsl:value-of select="normalize-space(./VIMC)" />
						</l0:identifier>
						<arco-core:current>
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CIS -->
			<xsl:if test="./VIP/VIPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./VIG/VIGS and not(lower-case(normalize-space(./VIG/VIGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGS)), normalize-space(lower-case(./VIG/VIGE)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
							</xsl:when>
							<xsl:otherwise>
	               		         		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGP)), normalize-space(lower-case(./VIG/VIGC)), normalize-space(lower-case(./VIG/VIGL)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VIP/VIPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VIP/VIPN)" />
					</l0:name>
					<!-- has cis name in time -->
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./VIP/VIPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<!-- has site -->
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="./VIG/VIGS and not(lower-case(normalize-space(./VIG/VIGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGS)), normalize-space(lower-case(./VIG/VIGE)), normalize-space(lower-case(./VIP/VIPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGP)), normalize-space(lower-case(./VIG/VIGC)), normalize-space(lower-case(./VIG/VIGL)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
				</rdf:Description>
				<!-- Name in time -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./VIP/VIPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./VIP/VIPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./VIP/VIPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./VIP/VIPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./VIP/VIPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(./VIP/VIPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="./VIG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="./VIG/VIGS and not(lower-case(normalize-space(./VIG/VIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGS)), normalize-space(lower-case(./VIG/VIGE)), normalize-space(lower-case(./VIP/VIPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGP)), normalize-space(lower-case(./VIG/VIGC)), normalize-space(lower-case(./VIG/VIGL)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./VIG/VIGS and not(lower-case(normalize-space(./VIG/VIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./VIG/VIGS)), normalize-space(lower-case(./VIG/VIGE)), normalize-space(lower-case(./VIP/VIPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGP)), normalize-space(lower-case(./VIG/VIGC)), normalize-space(lower-case(./VIG/VIGL)), normalize-space(lower-case(./VIP/VIPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./VIP/VIPC and not(lower-case(normalize-space(./VIP/VIPC))='nr' or lower-case(normalize-space(./VIP/VIPC))='n.r.' or lower-case(normalize-space(./VIP/VIPC))='nr (recupero pregresso)' or lower-case(normalize-space(./VIP/VIPC))='.' or lower-case(normalize-space(./VIP/VIPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./VIP/VIPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="./VIP/VIPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./VIG/VIGS and not(lower-case(normalize-space(./VIG/VIGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGS)), normalize-space(lower-case(./VIG/VIGE)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           			 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./VIG/VIGP)), normalize-space(lower-case(./VIG/VIGC)), normalize-space(lower-case(./VIG/VIGL)), normalize-space(lower-case(./VIP/VIPU)), normalize-space(lower-case(./VIP/VIPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./VIP/VIPN))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./VIP/VIPN))" />
					</l0:name>
					<xsl:if test="./VIG/*">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./VIG/*">
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
					<xsl:if test="./VIP/VIPU and not(./VIP/VIPU='.' or ./VIP/VIPU='-' or ./VIP/VIPU='/') and (not(starts-with(lower-case(normalize-space(./VIP/VIPU)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIP/VIPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./VIP/VIPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./VIG/VIGS and (not(starts-with(lower-case(normalize-space(./VIG/VIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIG/VIGS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./VIG/VIGR and (not(starts-with(lower-case(normalize-space(./VIG/VIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./VIG/VIGC and (starts-with(lower-case(normalize-space(./VIG/VIGC)), 'firenze') or starts-with(lower-case(normalize-space(./VIG/VIGC)), 'siena') or starts-with(lower-case(normalize-space(./VIG/VIGC)), 'san severino marche') or starts-with(lower-case(normalize-space(./VIG/VIGC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./VIG/VIGR and (starts-with(lower-case(normalize-space(./VIG/VIGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIG/VIGR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIG/VIGR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./VIG/VIGP and (not(starts-with(lower-case(normalize-space(./VIG/VIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIG/VIGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./VIG/VIGC and (not(starts-with(lower-case(normalize-space(./VIG/VIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIG/VIGC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./VIG/VIGL and (not(starts-with(lower-case(normalize-space(./VIG/VIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIG/VIGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./VIG/VIGE and (not(starts-with(lower-case(normalize-space(./VIG/VIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIG/VIGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./VIG/VIGS and (not(starts-with(lower-case(normalize-space(./VIG/VIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./VIG/VIGS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIG/VIGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIG/VIGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./VIG/VIGR and (not(starts-with(lower-case(normalize-space(./VIG/VIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./VIG/VIGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./VIG/VIGP and (not(starts-with(lower-case(normalize-space(./VIG/VIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./VIG/VIGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIG/VIGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIG/VIGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./VIG/VIGC and (not(starts-with(lower-case(normalize-space(./VIG/VIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./VIG/VIGC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./VIG/VIGL and (not(starts-with(lower-case(normalize-space(./VIG/VIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIG/VIGL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./VIG/VIGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./VIG/VIGE and (not(starts-with(lower-case(normalize-space(./VIG/VIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIG/VIGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./VIG/VIGE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIG/VIGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIG/VIGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			 <!-- Legal situation as an individual -->
			<xsl:if test="./VIZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(./VIZ/VIZG)))" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./VIZ/VIZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./VIZ/VIZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./VIZ/VIZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./VIZ/VIZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="./VIZ/VIZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./VIZ/VIZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIZ/VIZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./VIZ/VIZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:for-each select="./VIZ/VIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-vizs', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
				</rdf:Description>
				<!-- Legal situation type -->
				<xsl:if test="./VIZ/VIZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./VIZ/VIZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIZ/VIZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIZ/VIZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:for-each select="./VIZ/VIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-vizs', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<xsl:if test="./VIZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(./VIZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="./VIQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-VIQ-storage-medium-acquisition', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<!-- acquisition type -->
					<xsl:if test="./VIQ/VIQT and (not(starts-with(lower-case(normalize-space(./VIQ/VIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIQ/VIQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./VIQ/VIQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<!-- transferor -->
					<xsl:for-each select="./VIQ/VIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-VIQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<!-- at time -->
					<xsl:if test="./VIQ/VIQD and (not(starts-with(lower-case(normalize-space(./VIQ/VIQD)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIQ/VIQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIQ/VIQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./VIQ/VIQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./VIQ/VIQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VIQ/VIQL and (not(starts-with(lower-case(normalize-space(./VIQ/VIQL)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIQ/VIQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(./VIQ/VIQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./VIQ/VIQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIQ/VIQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIQ/VIQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIQ/VIQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(./VIQ/VIQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(./VIQ/VIQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="./VIQ/VIQT and (not(starts-with(lower-case(normalize-space(./VIQ/VIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIQ/VIQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./VIQ/VIQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIQ/VIQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIQ/VIQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="./VIQ/VIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-VIQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-VIQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-VIQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-VIQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="./VIN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-integrative-video-recording-original-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VINT and (not(starts-with(lower-case(normalize-space(./VINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VINT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./VINT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./VIND and (not(starts-with(lower-case(normalize-space(./VIND)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./VINN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./VINN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./VIND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./VIND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./VIND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./VINT and (not(starts-with(lower-case(normalize-space(./VINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./VINT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./VINT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VINT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VINT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="./VIY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/VideoRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
	           			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VIYN and (not(starts-with(lower-case(normalize-space(./VIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./VIYD and (not(starts-with(lower-case(normalize-space(./VIYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./VIYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./VIYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./VIYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./VIYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./VIYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./VIYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./VIYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VIYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VIYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VIYN)" />
						</l0:name>
						<xsl:if test="./VIYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./VIYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>		
		<xsl:for-each select="record/metadata/schede/*/FI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
              		<xsl:value-of select="concat($NS, 'PhotographicRecording/', $itemURI, '-integrative-recording-', position())" />
              	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PhotographicRecording'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Photographic recording ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Photographic recording ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Registrazione photographic ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Registrazione photographic ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<arco-cd:primaryDocument>
					<xsl:value-of select="false()" />
				</arco-cd:primaryDocument>
				<xsl:for-each select="./FIO/FIOG">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="." />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./FIO/FIOE">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="." />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:for-each select="./FIO/FIOO">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="." />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:for-each select="./FIC/FICC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="." />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="./FIA/FIAC">
					<arco-lite:localIdentifier>
               			<xsl:value-of select="." />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:for-each>
				<xsl:if test="./FIT/FITQ">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(./FIT/FITQ)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="./FIC/FICA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="./FIC/FICA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<xsl:if test="./FIT/FITN">
					<arco-core:abstract>
						<xsl:value-of select="./FIT/FITN" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="./FIT/FITD">
					<arco-core:abstract>
						<xsl:value-of select="./FIT/FITD" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="./FIA  and not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="./FIA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<!-- has title -->
				<xsl:if test="./FIT/FITT">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./FIT/FITT))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<!-- has measurement collection -->
				<xsl:if test="./FIM">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-integrative-recording-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="./FIC/FICF">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-', position())" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- has technical status -->
				<xsl:if test="./FIC/FICX">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/IntegrativeRecording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
				<xsl:if test="./FIX">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/IntegrativeRecording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
				<!-- subject -->
				<xsl:if test="./FIT/FITI">
					<arco-cd:subject>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTI)" />
					</arco-cd:subject>
					<arco-cd:hasSubject>
						<xsl:attribute name="rdf:resource">
                   			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(record/metadata/schede/*/DF/DFT/DFTI))" />
	                   	</xsl:attribute>
					</arco-cd:hasSubject>
				</xsl:if>
				<!-- recording type -->
				<xsl:if test="./FIC/FICT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(./FIC/FICT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<!-- recording location -->
				<xsl:if test="./FIA and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-integrative-photographic-recording-location')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- recording location -->
				<xsl:if test="./FIC and not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-integrative-photographic-recording-location')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- current location -->
				<xsl:if test="./FIG and not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-integrative-photographic-recording-current-location')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- Legal situation of cultural property -->
				<xsl:if test="./FIZ">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(./FIZ/FIZG)))" />
                		</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<xsl:for-each select="./FIZ/FIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
		          				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		          			</xsl:attribute>
					</arco-cd:hasOwner>
				</xsl:for-each>
				<!-- Acquisition of cultural property -->
					<xsl:if test="./FIQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-FIQ-storage-medium-acquisition', position())" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./FIQN">
							<arco-lite:hasTransferor>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-lite:hasTransferor>
							<arco-cd:hasLegalSituation>
								<xsl:attribute name="rdf:resource">
			                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-FIQ-legal-situation-storage-medium-', position())" />
            			    	</xsl:attribute>
							</arco-cd:hasLegalSituation>
							<arco-lite:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
				           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				           		</xsl:attribute>
							</arco-lite:hasPreviousOwner>
						</xsl:for-each>
					</xsl:if>
				<!-- informant -->
				<xsl:for-each select="./FIF">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-informant-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<xsl:for-each select="./FIE">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-informant-group-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- rilevatore -->
				<xsl:for-each select="./FID/FIDR">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-operator-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- at time -->
				<xsl:if test="./FID/FIDD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FID/FIDD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<!-- photographer -->
				<xsl:for-each select="./FID/FIDF">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographer-', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<!-- copyright -->
				<xsl:for-each select="./FIY">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
	    	           		<xsl:value-of select="concat($NS, 'Copyright/PhotographicRecording', $itemURI, '-copyright-', position())" />
	        	       	</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./FIYN and (not(starts-with(lower-case(normalize-space(./FIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIYN)), 'n.r')))">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIYN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
			</rdf:Description>
			<!-- identifier -->
			<xsl:for-each select="./FIO/FIOG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
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
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(.)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:for-each>
			<xsl:for-each select="./FIO/FIOE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
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
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(.)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:for-each>
			<xsl:for-each select="./FIO/FIOO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
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
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(.)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:for-each>
			<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
			<xsl:for-each select="./FIC/FICC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
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
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(.)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="./FIA/FIAC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicRecordingIdentifier/', $itemURI, arco-fn:arcofy(.))" />
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
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(.)" />
					</l0:identifier>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:for-each>
			<!-- title -->
			<xsl:if test="./FIT/FITT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(./FIT/FITT))" />
            		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Title" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIT/FITT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIT/FITT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- measurement collection -->
			<xsl:if test="./FIM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-integrative-recording-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica integrativa del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica integrativa del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative photographic recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of integrative photographic recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<xsl:if test="./FIM/FIME">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '1-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="./FIM/FIMO">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '2-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="./FIM/FIMG">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '3-photosize')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./FIM/FIME">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '1-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIME))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIME))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIME))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIME))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIME))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIME))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="./FIM/FIME" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./FIM/FIME" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./FIM/FIMO">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '2-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIMO))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIMO))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIMO))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIMO))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIMO))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIMO))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="./FIM/FIMO" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./FIM/FIMO" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./FIM/FIMG">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/IntegrativeRecording', $itemURI, position(), '3-photosize')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIMG))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurement of integrative recording ', position(), ': ', (./FIM/FIMG))" />
							</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIMG))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misura della registrazione: ', (./FIM/FIMG))" />
						</l0:name>
						<arco-dd:hasMeasurementType>
							<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
						</arco-dd:hasMeasurementType>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIMG))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./FIM/FIMG))" />
						<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
						<rdfs:label>
							<xsl:value-of select="./FIM/FIMG" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./FIM/FIMG" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./FIC/FICF">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/PhotographicRecording', $itemURI, '-integrative-recording-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure della registrazione fotografica del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements of photographic recording of cultural property ', $itemURI" />
					</l0:name>
					<!-- has measurement -->
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Recording', $itemURI, position(), '-integrative-recording-photosize')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Recording', $itemURI, position(), '-integrative-recording-photosize')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (./FIC/FICF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording ', position(), ': ', (./FIC/FICF))" />
						</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./FIC/FICF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (./FIC/FICF))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'PhotoSize')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./FIC/FICF))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./FIC/FICF))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./FIC/FICF" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./FIC/FICF" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- technical status -->
			<xsl:if test="./FIC/FICX">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/IntegrativeRecording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</l0:name>
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FIC/FICX)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
				<!-- Technical characteristic as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		          		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FIC/FICX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIC/FICX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIC/FICX)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoColour'" />
		          		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./FIX">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/IntegrativeRecording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico della registrazione fotografica del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of photographic recording of cultural property ', $itemURI)" />
					</l0:name>
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FIX)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
					<arco-core:current>
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
				<!-- Technical characteristic as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		          		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FIX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIX)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoColour'" />
		          		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- subject -->
			<xsl:if test="./FIT/FITI">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	           			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(./FIT/FITI))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./FIT/FITI)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./FIT/FITI)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>		
			<!-- recording type -->
			<xsl:if test="./FIC/FICT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(./FIC/FICT)))" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/RecordingType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIC/FICT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIC/FICT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- recording location -->
			<xsl:if test="./FIA and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./FIA/FIAS and not(lower-case(normalize-space(./FIA/FIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./FIA/FIAS)), normalize-space(lower-case(./FIA/FIAE))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIA/FIAP)), normalize-space(lower-case(./FIA/FIAC)), normalize-space(lower-case(./FIA/FIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./FIAS and not(lower-case(normalize-space(./FIAS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIAS)), normalize-space(lower-case(./FIAE)))))" />
						</xsl:when>
						<xsl:otherwise>
	    					<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIAP)), normalize-space(lower-case(./FIAC)),  normalize-space(lower-case(./FIAL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-integrative-photographic-recording-location-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/RecordingLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./FIH/FIHL and not(lower-case(normalize-space(./FIH/FIHL))='nr' or lower-case(normalize-space(./FIH/FIHL))='n.r.' or lower-case(normalize-space(./FIH/FIHL))='nr (recupero pregresso)' or lower-case(normalize-space(./FIH/FIHL))='.' or lower-case(normalize-space(./FIH/FIHL))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./FIH/FIHL)" />
						</arco-location:locationDetails>
					</xsl:if>
					<arco-location:atLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$location" />
						</xsl:attribute>
					</arco-location:atLocation>
				</rdf:Description>
				<!-- location -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./FIAS, ./FIAR, ./FIAP, ./FIAC, ./FIAL, ./FIAE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$address" />
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./FIA/*">
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
					<clvapit:fullAddress>
						<xsl:for-each select="./FIA/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</clvapit:fullAddress>
					<!-- Stato -->
					<xsl:if test="./FIA/FIAS and (not(starts-with(lower-case(normalize-space(./FIA/FIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIA/FIAS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./FIA/FIAR and (not(starts-with(lower-case(normalize-space(./FIA/FIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./FIA/FIAC and (starts-with(lower-case(normalize-space(./FIA/FIAC)), 'firenze') or starts-with(lower-case(normalize-space(./FIA/FIAC)), 'siena') or starts-with(lower-case(normalize-space(./FIA/FIAC)), 'san severino marche') or starts-with(lower-case(normalize-space(./FIA/FIAC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./FIA/FIAR and (starts-with(lower-case(normalize-space(./FIA/FIAR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIA/FIAR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIA/FIAR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./FIA/FIAP and (not(starts-with(lower-case(normalize-space(./FIA/FIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIA/FIAP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./FIA/FIAC and (not(starts-with(lower-case(normalize-space(./FIA/FIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIA/FIAC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./FIA/FIAL and (not(starts-with(lower-case(normalize-space(./FIA/FIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIA/FIAL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./FIA/FIAE and (not(starts-with(lower-case(normalize-space(./FIA/FIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIA/FIAE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./FIA/FIAS and (not(starts-with(lower-case(normalize-space(./FIA/FIAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIA/FIAS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIA/FIAS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIA/FIAS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./FIA/FIAR and (not(starts-with(lower-case(normalize-space(./FIA/FIAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIA/FIAR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./FIA/FIAP and (not(starts-with(lower-case(normalize-space(./FIA/FIAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIA/FIAP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAP)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAP)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./FIA/FIAC and (not(starts-with(lower-case(normalize-space(./FIA/FIAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIA/FIAC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./FIA/FIAL and (not(starts-with(lower-case(normalize-space(./FIA/FIAL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIA/FIAL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIA/FIAL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./FIA/FIAE and (not(starts-with(lower-case(normalize-space(./FIA/FIAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIA/FIAE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIA/FIAE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIA/FIAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIA/FIAE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./FIC and not($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./FIC/FICS and not(lower-case(normalize-space(./FIC/FICS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./FIC/FICS)), normalize-space(lower-case(./FIC/FICE))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIC/FICP)), normalize-space(lower-case(./FIC/FICC)), normalize-space(lower-case(./FIC/FICL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="./FIC/FICS and not(lower-case(normalize-space(./FIC/FICS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIC/FICS)), normalize-space(lower-case(./FIC/FICE)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIC/FICP)), normalize-space(lower-case(./FIC/FICC)), normalize-space(lower-case(./FIC/FICL)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-integrative-photographic-recording-location-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/RecordingLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./FIH/FIHL and not(lower-case(normalize-space(./FIH/FIHL))='nr' or lower-case(normalize-space(./FIH/FIHL))='n.r.' or lower-case(normalize-space(./FIH/FIHL))='nr (recupero pregresso)' or lower-case(normalize-space(./FIH/FIHL))='.' or lower-case(normalize-space(./FIH/FIHL))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./FIH/FIHL)" />
						</arco-location:locationDetails>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:for-each select="./FIC/*">
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
					<l0:name>
						<xsl:for-each select="./FIC/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</l0:name>
					<xsl:if test="./FIC/*">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./FIC/*">
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
					<clvapit:fullAddress>
						<xsl:for-each select="./FIC/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</clvapit:fullAddress>
					<!-- Stato -->
					<xsl:if test="./FIC/FICS and (not(starts-with(lower-case(normalize-space(./FIC/FICS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIC/FICS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./FIC/FICR and (not(starts-with(lower-case(normalize-space(./FIC/FICR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./FIC/FICC and (starts-with(lower-case(normalize-space(./FIC/FICC)), 'firenze') or starts-with(lower-case(normalize-space(./FIC/FICC)), 'siena') or starts-with(lower-case(normalize-space(./FIC/FICC)), 'san severino marche') or starts-with(lower-case(normalize-space(./FIC/FICC)), 'modena'))">	
								<xsl:choose>
									<xsl:when test="./FIC/FICR and (starts-with(lower-case(normalize-space(./FIC/FICR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIC/FICR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIC/FICR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./FIC/FICP and (not(starts-with(lower-case(normalize-space(./FIC/FICP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIC/FICP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./FIC/FICC and (not(starts-with(lower-case(normalize-space(./FIC/FICC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIC/FICC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./FIC/FICL and (not(starts-with(lower-case(normalize-space(./FIC/FICL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIC/FICL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./FIC/FICE and (not(starts-with(lower-case(normalize-space(./FIC/FICE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIC/FICE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./FIC/FICS and (not(starts-with(lower-case(normalize-space(./FIC/FICS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIC/FICS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIC/FICS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIC/FICS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./FIC/FICR and (not(starts-with(lower-case(normalize-space(./FIC/FICR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIC/FICR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./FIC/FICP and (not(starts-with(lower-case(normalize-space(./FIC/FICP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIC/FICP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICP)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICP)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./FIC/FICC and (not(starts-with(lower-case(normalize-space(./FIC/FICC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIC/FICC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./FIC/FICL and (not(starts-with(lower-case(normalize-space(./FIC/FICL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIC/FICL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIC/FICL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./FIC/FICE and (not(starts-with(lower-case(normalize-space(./FIC/FICE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIC/FICE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIC/FICE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIC/FICE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIC/FICE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>				
			<!-- informant -->
			<xsl:for-each select="./FIF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-informant-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./FIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./FIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Informatore relativo al bene culturale ', $itemURI, ': ', normalize-space(./FIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Informant involved in cultural property ', $itemURI, ': ', normalize-space(./FIFN))" />
					</l0:name>
					<!-- hasRole -->
					<xsl:if test="./FIFU">
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./FIFU)) )" />
							</xsl:attribute>
						</arco-core:hasRole>
					</xsl:if>
					<!-- has agent -->
					<arco-core:hasAgent>
						<xsl:choose>
							<xsl:when test="./FIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIFN))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./FIFU, ./FIFZ, ./FIFB, ./FIFM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-core:hasAgent>
			</rdf:Description>
			<xsl:if test="./FIFU">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./FIFU)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIFU)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./FIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIFN))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./FIFU, ./FIFZ, ./FIFB, ./FIFM)))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./FIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./FIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./FIFU, ' ', ./FIFZ, ' ', ./FIFB, ' ', ./FIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./FIFN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="arco-fn:name-cleaner(./FIFN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(./FIFU, ' ', ./FIFZ, ' ', ./FIFB, ' ', ./FIFM)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<xsl:if test="./FIFZ">
					<arco-cd:nationality>
						<xsl:value-of select="./FIFZ" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="./FIFX">
					<arco-core:note>
						<xsl:value-of select="concat('Scolarità: ', ./FIFX)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./FIFM">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./FIFM)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:if>
				<xsl:if test="./FIFB">
					<arco-cd:hasCulturalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./FIFB)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalContext>
				</xsl:if>
				<!-- date Of Birth -->
				<xsl:if test="./FIFA">
					<cpv:dateOfBirth>
						<xsl:value-of select="./FIFA" />
					</cpv:dateOfBirth>
				</xsl:if>
				<!-- sex interpretation -->
				<xsl:if test="./FIFO">
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'Sex/', arco-fn:arcofy(normalize-space(./FIFO)))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<!-- age interpretation -->
				<xsl:if test="./FIFH">
					<arco-cd:hasAge>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./FIFH)))" />
               			</xsl:attribute>
					</arco-cd:hasAge>
					<arco-lite:age>
						<xsl:value-of select="normalize-space(./FIFH)" />
					</arco-lite:age>
					<arco-cd:isSubjectOfInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./FIFH))" />
						</xsl:attribute>
					</arco-cd:isSubjectOfInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./FIFS or ./FIFR or ./FIFP or ./FIFC or ./FIFE">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./FIFS and not(lower-case(normalize-space(./FIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFS)), normalize-space(lower-case(./FIFE)), normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./FIFT or ./FIFI or ./FIFV or ./FIFQ or ./FIFD">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./FIFT and not(lower-case(normalize-space(./FIFT))='italia')">
									<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFT)), normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
								</xsl:when>
								<xsl:otherwise>
		    	        			<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasDomicile>
				</xsl:if>
			</rdf:Description>
			<!-- cultural context -->
			<xsl:if test="./FIFB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalContext/', arco-fn:urify(normalize-space(./FIFB)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalContext'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIFB)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIFB)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- profession of user as an individual -->
			<xsl:if test="./FIFM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./FIFM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIFM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIFM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- sex as individual -->
			<xsl:if test="./FIFO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy(normalize-space(./FIFO)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIFO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIFO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- age interpretation as individual -->
			<xsl:if test="./FIFH">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./FIFH))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Interpretation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./FIFN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./FIFN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./FIFN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./FIFN))" />
					</l0:name>
					<arco-cd:involvesEntity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./FIFH)))" />
						</xsl:attribute>
					</arco-cd:involvesEntity>
					<arco-cd:hasInterpretationCriterion>
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./FIFH)), 'ca')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasInterpretationCriterion>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./FIFH)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./FIFN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;informatore ', ./FIFN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age of informant ', ./FIFN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age of informant ', ./FIFN)" />
					</l0:name>
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(./FIFH)" />
					</arco-cd:ageValue>
					<arco-cd:hasAgeType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-cd:hasAgeType>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./FIFS or ./FIFR or ./FIFP or ./FIFC or ./FIFE">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./FIFS and not(lower-case(normalize-space(./FIFS))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFS)), normalize-space(lower-case(./FIFE)), normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
						</xsl:when>
						<xsl:otherwise>
	    	           		<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./FIFS, ./FIFR, ./FIFP, ./FIFC, ./FIFE))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./FIFS and not(lower-case(normalize-space(./FIFS))='italia')">
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFS)), normalize-space(lower-case(./FIFE)), normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
								</xsl:when>
								<xsl:otherwise>
	    	           	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
								</xsl:otherwise>
							</xsl:choose>
                    	  </xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./FIFS and not(lower-case(normalize-space(./FIFS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFS)), normalize-space(lower-case(./FIFE)), normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
							</xsl:when>
							<xsl:otherwise>
	    	           	            <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFP)), normalize-space(lower-case(./FIFC)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./FIFS, ./FIFR, ./FIFP, ./FIFC, ./FIFE))" />
					</rdfs:label>
					<!-- Stato -->
					<xsl:if test="./FIFS and (not(starts-with(lower-case(normalize-space(./FIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIFS))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./FIFR and (not(starts-with(lower-case(normalize-space(./FIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./FIFC and (starts-with(lower-case(normalize-space(./FIFC)), 'firenze') or starts-with(lower-case(normalize-space(./FIFC)), 'siena') or starts-with(lower-case(normalize-space(./FIFC)), 'san severino marche') or starts-with(lower-case(normalize-space(./FIFC)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./FIFR and (starts-with(lower-case(normalize-space(./FIFR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./FIFP and (not(starts-with(lower-case(normalize-space(./FIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIFP))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./FIFC and (not(starts-with(lower-case(normalize-space(./FIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIFC))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./FIFE and (not(starts-with(lower-case(normalize-space(./FIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIFE))" />
							</xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./FIFS and (not(starts-with(lower-case(normalize-space(./FIFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIFS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIFS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIFS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./FIFR and (not(starts-with(lower-case(normalize-space(./FIFR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFR))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./FIFP and (not(starts-with(lower-case(normalize-space(./FIFP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIFP))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIFP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIFP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./FIFC and (not(starts-with(lower-case(normalize-space(./FIFC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIFC))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFC)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Località (Address Area) -->
				<xsl:if test="./FIFE and (not(starts-with(lower-case(normalize-space(./FIFE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIFE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFE)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFE)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- domicile -->
			<xsl:if test="./FIFT or ./FIFI or ./FIFV or ./FIFQ or ./FIFD">
				<xsl:variable name="location">
					<xsl:choose>
						<xsl:when test="./FIFT and not(lower-case(normalize-space(./FIFT))='italia')">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFT)), normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
						</xsl:when>
						<xsl:otherwise>
		    				<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$location" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./FIFT, ./FIFI, ./FIFV, ./FIFQ, ./FIFD))" />
					</rdfs:label>
					<clvapit:hasAddress>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFT)), normalize-space(lower-case(./FIFI)), normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
                    	</xsl:attribute>
					</clvapit:hasAddress>
				</rdf:Description>
				<!-- address -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIFT)), normalize-space(lower-case(./FIFI)), normalize-space(lower-case(./FIFV)), normalize-space(lower-case(./FIFQ)), normalize-space(lower-case(./FIFD)))))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(concat(./FIFT, ./FIFI, ./FIFV, ./FIFQ, ./FIFD))" />
					</rdfs:label>
					<xsl:if test="./FIFD and (not(starts-with(lower-case(normalize-space(./FIFD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFD)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./FIFD)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./FIFT and (not(starts-with(lower-case(normalize-space(./FIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFT)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIFT))" />
							</xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./FIFI and (not(starts-with(lower-case(normalize-space(./FIFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFI)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./FIFQ and (starts-with(lower-case(normalize-space(./FIFQ)), 'firenze') or starts-with(lower-case(normalize-space(./FIFQ)), 'siena') or starts-with(lower-case(normalize-space(./FIFQ)), 'san severino marche') or starts-with(lower-case(normalize-space(./FIFQ)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./FIFI and (starts-with(lower-case(normalize-space(./FIFI)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFI))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFI))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./FIFV and (not(starts-with(lower-case(normalize-space(./FIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFV)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIFV))" />
							</xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./FIFQ and (not(starts-with(lower-case(normalize-space(./FIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFQ)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIFQ))" />
							</xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
				</rdf:Description>
				<!-- Country -->
				<xsl:if test="./FIFT and (not(starts-with(lower-case(normalize-space(./FIFT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIFT))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIFT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIFT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Region -->
				<xsl:if test="./FIFI and (not(starts-with(lower-case(normalize-space(./FIFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFI)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIFI))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFI)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFI)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Province -->
				<xsl:if test="./FIFP and (not(starts-with(lower-case(normalize-space(./FIFV)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFV)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIFV))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIFV)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIFV)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- City -->
				<xsl:if test="./FIFQ and (not(starts-with(lower-case(normalize-space(./FIFQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIFQ)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIFQ))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFQ)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIFQ)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./FIE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-informant-group-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Informatore ', position(), ' del bene ', $itemURI, ': ', ./FIED)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Informant ', position(), ' of cultural property ', $itemURI, ': ', ./FIED)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/Informant')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIED))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/Informant')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Informatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Informant'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIED))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Group'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./FIED" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./FIED" />
					</l0:name>
					<xsl:if test="./FIES">
						<arco-cd:contacts>
							<xsl:value-of select="./FIES" />
						</arco-cd:contacts>
					</xsl:if>
					<xsl:if test="./FIEX">
						<arco-core:note>
							<xsl:value-of select="./FIEX" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
			<!-- rilevatore -->
			<xsl:for-each select="./FID/FIDR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-recording-operator-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Rilevatore ', position(), ' del bene ', $itemURI, ': ', ./FID/FIDR)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Photographic recording operator ', position(), ' of cultural property ', $itemURI, ': ', ./FID/FIDR)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/PhotographicRecordingOperator')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FID/FIDR))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/PhotographicRecordingOperator')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Rilevatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Photographic recording operator'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FID/FIDR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(./FID/FIDR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(./FID/FIDR)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- photographer -->
			<xsl:for-each select="./FID/FIDF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographer-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Fotografo ', position(), ' del bene ', $itemURI, ': ', ./FID/FIDF)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Photographer ', position(), ' of cultural property ', $itemURI, ': ', ./FID/FIDF)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/Photographer')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FID/FIDF))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/Photographer')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Fotografo'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Photographer'" />
					</rdfs:label>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FID/FIDF))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:name-cleaner(./FID/FIDF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(./FID/FIDF)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- time interval -->
			<xsl:if test="./FID/FIDD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FID/FIDD)))" />
                       </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FID/FIDD)" />
					</rdfs:label>
					<tiapit:time>
						<xsl:value-of select="normalize-space(./FID/FIDD)" />
					</tiapit:time>
				</rdf:Description>
			</xsl:if>
			<!-- CIS -->
			<xsl:if test="./FIP/FIPN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:choose>
							<xsl:when test="./FIG/FIGS and not(lower-case(normalize-space(./FIG/FIGS))='italia')">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGS)), normalize-space(lower-case(./FIG/FIGE)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
							</xsl:when>
							<xsl:otherwise>
	               		         		 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGP)), normalize-space(lower-case(./FIG/FIGC)), normalize-space(lower-case(./FIG/FIGL)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FIP/FIPN)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FIP/FIPN)" />
					</l0:name>
					<!-- has cis name in time -->
					<cis:hasCISNameInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./FIP/FIPN)))" />
						</xsl:attribute>
					</cis:hasCISNameInTime>
					<!-- has site -->
					<xsl:variable name="site">
						<xsl:choose>
							<xsl:when test="./FIG/FIGS and not(lower-case(normalize-space(./FIG/FIGS))='italia')">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGS)), normalize-space(lower-case(./FIG/FIGE)), normalize-space(lower-case(./FIP/FIPU)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGP)), normalize-space(lower-case(./FIG/FIGC)), normalize-space(lower-case(./FIG/FIGL)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<cis:hasSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</cis:hasSite>
					</rdf:Description>
					<!-- Name in time -->
					<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(./FIP/FIPN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CISNameInTime'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./FIP/FIPN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(./FIP/FIPN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./FIP/FIPN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Name in time: ', normalize-space(./FIP/FIPN))" />
					</l0:name>
					<cis:institutionalCISName>
						<xsl:value-of select="normalize-space(./FIP/FIPN)" />
					</cis:institutionalCISName>
				</rdf:Description>
			</xsl:if>
			<!-- current physical location -->
			<xsl:if test="./FIG">
				<xsl:variable name="site">
					<xsl:choose>
						<xsl:when test="./FIG/FIGS and not(lower-case(normalize-space(./FIG/FIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGS)), normalize-space(lower-case(./FIG/FIGE)), normalize-space(lower-case(./FIP/FIPU)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGP)), normalize-space(lower-case(./FIG/FIGC)), normalize-space(lower-case(./FIG/FIGL)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="address">
					<xsl:choose>
						<xsl:when test="./FIG/FIGS and not(lower-case(normalize-space(./FIG/FIGS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(./FIG/FIGS)), normalize-space(lower-case(./FIG/FIGE)), normalize-space(lower-case(./FIP/FIPU))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGP)), normalize-space(lower-case(./FIG/FIGC)), normalize-space(lower-case(./FIG/FIGL)), normalize-space(lower-case(./FIP/FIPU)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- time indexed typed location -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-storage-medium')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Localizzazione fisica attuale del supporto bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Current physical location of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
            	               <xsl:value-of select="'https://w3id.org/arco/ontology/location/CurrentPhysicalLocation'" />
                	       </xsl:attribute>
					</arco-location:hasLocationType>				
					<xsl:if test="./FIP/FIPC and not(lower-case(normalize-space(./FIP/FIPC))='nr' or lower-case(normalize-space(./FIP/FIPC))='n.r.' or lower-case(normalize-space(./FIP/FIPC))='nr (recupero pregresso)' or lower-case(normalize-space(./FIP/FIPC))='.' or lower-case(normalize-space(./FIP/FIPC))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(./FIP/FIPC)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="./FIP/FIPN">
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./FIG/FIGS and not(lower-case(normalize-space(./FIG/FIGS))='italia')">
										<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGS)), normalize-space(lower-case(./FIG/FIGE)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
									</xsl:when>
									<xsl:otherwise>
	              		           			 <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(./FIG/FIGP)), normalize-space(lower-case(./FIG/FIGC)), normalize-space(lower-case(./FIG/FIGL)), normalize-space(lower-case(./FIP/FIPU)), normalize-space(lower-case(./FIP/FIPN)))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:if>
					<arco-location:atSite>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$site" />
						</xsl:attribute>
					</arco-location:atSite>
					</rdf:Description>
				<!-- site -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$site" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./FIP/FIPN))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('Contenitore fisico di: ', normalize-space(./FIP/FIPN))" />
					</l0:name>
					<xsl:if test="./FIG/*">
						<cis:siteAddress>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$address" />
							</xsl:attribute>
						</cis:siteAddress>
					</xsl:if>
				</rdf:Description>
				<!-- Address as individual -->
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
						<xsl:for-each select="./FIG/*">
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
					<xsl:if test="./FIP/FIPU and not(./FIP/FIPU='.' or ./FIP/FIPU='-' or ./FIP/FIPU='/') and (not(starts-with(lower-case(normalize-space(./FIP/FIPU)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIP/FIPU)), 'n.r')))">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(./FIP/FIPU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="./FIG/FIGS and (not(starts-with(lower-case(normalize-space(./FIG/FIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGS)), 'n.r')))">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIG/FIGS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="./FIG/FIGR and (not(starts-with(lower-case(normalize-space(./FIG/FIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGR)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="./FIG/FIGC and (starts-with(lower-case(normalize-space(./FIG/FIGC)), 'firenze') or starts-with(lower-case(normalize-space(./FIFQ)), 'siena') or starts-with(lower-case(normalize-space(./FIFQ)), 'san severino marche') or starts-with(lower-case(normalize-space(./FIFQ)), 'modena'))">		
								<xsl:choose>
									<xsl:when test="./FIG/FIGR and (starts-with(lower-case(normalize-space(./FIG/FIGR)), 'lombardia'))">
									</xsl:when>
									<xsl:otherwise>
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                	        	                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIG/FIGR))" />
		            	           	        </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:otherwise>
								</xsl:choose>					
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
        	        	   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIG/FIGR))" />
                        		    </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="./FIG/FIGP and (not(starts-with(lower-case(normalize-space(./FIG/FIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGP)), 'n.r')))">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIG/FIGP))" />
                           </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="./FIG/FIGC and (not(starts-with(lower-case(normalize-space(./FIG/FIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGC)), 'n.r')))">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                        	       <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIG/FIGC))" />
	                           </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="./FIG/FIGL and (not(starts-with(lower-case(normalize-space(./FIG/FIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGL)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIG/FIGL))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="./FIG/FIGE and (not(starts-with(lower-case(normalize-space(./FIG/FIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGE)), 'n.r')))">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIG/FIGE))" />
                           </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Stato -->
				<xsl:if test="./FIG/FIGS and (not(starts-with(lower-case(normalize-space(./FIG/FIGS)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGS)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./FIG/FIGS))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIG/FIGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIG/FIGS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./FIG/FIGR and (not(starts-with(lower-case(normalize-space(./FIG/FIGR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGR)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./FIG/FIGR))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGR)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGR)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./FIG/FIGP and (not(starts-with(lower-case(normalize-space(./FIG/FIGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGP)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./FIG/FIGP))" />
                       </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIG/FIGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIG/FIGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./FIG/FIGC and (not(starts-with(lower-case(normalize-space(./FIG/FIGC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGC)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./FIG/FIGC))" />
                		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGC)" />
							</xsl:call-template>
							</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGC)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="./FIG/FIGL and (not(starts-with(lower-case(normalize-space(./FIG/FIGL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGL)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                	          <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIG/FIGL))" />
                    	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGL)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./FIG/FIGL)" />
							</xsl:call-template>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./FIG/FIGE and (not(starts-with(lower-case(normalize-space(./FIG/FIGE)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIG/FIGE)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                           <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./FIG/FIGE))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                               <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIG/FIGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIG/FIGE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			 <!-- Legal situation as an individual -->
			<xsl:if test="./FIZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/StorageMedium/', $itemURI, arco-fn:urify(normalize-space(./FIZ/FIZG)))" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./FIZ/FIZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(./FIZ/FIZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./FIZ/FIZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(./FIZ/FIZG))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="./FIZ/FIZE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./FIZ/FIZE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./FIZ/FIZG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./FIZ/FIZG)))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:for-each select="./FIZ/FIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-fizs', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
				</rdf:Description>
				<!-- Legal situation type -->
				<xsl:if test="./FIZ/FIZG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'LegalSituationType/', arco-fn:urify(normalize-space(./FIZ/FIZG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIZ/FIZG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIZ/FIZG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:for-each select="./FIZ/FIZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner-fizs', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Owner ', position(), ' of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Owner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-owner', position())" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
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
						<xsl:if test="./FIZI ">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(string-join(./FIZI,' ; '))" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:if test="./FIQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-FIQ-storage-medium-acquisition', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Acquisizione del supporto del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Acquisition of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<!-- acquisition type -->
					<xsl:if test="./FIQ/FIQT and (not(starts-with(lower-case(normalize-space(./FIQ/FIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIQ/FIQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./FIQ/FIQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<!-- transferor -->
					<xsl:for-each select="./FIQ/FIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-FIQ-transferor')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:for-each>
					<!-- at time -->
					<xsl:if test="./FIQ/FIQD and (not(starts-with(lower-case(normalize-space(./FIQ/FIQD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIQ/FIQD)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FIQ/FIQD)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./FIQ/FIQE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./FIQ/FIQE)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./FIQ/FIQL and (not(starts-with(lower-case(normalize-space(./FIQ/FIQL)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIQ/FIQL)), 'n.r')))">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="normalize-space(./FIQ/FIQL)" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./FIQ/FIQD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FIQ/FIQD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIQ/FIQD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIQ/FIQD)" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(./FIQ/FIQD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(./FIQ/FIQD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- acquisition type as an individual -->
				<xsl:if test="./FIQ/FIQT and (not(starts-with(lower-case(normalize-space(./FIQ/FIQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIQ/FIQT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./FIQ/FIQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIQ/FIQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIQ/FIQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="./FIQ/FIQN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
					<!-- legal situation as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-FIQ-legal-situation-storage-medium-', position())" />
		                </xsl:attribute>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Condizione giuridica ', position(), 'del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Legal situation ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-FIQ-previous-owner', position())" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</rdf:Description>
					<!-- prevoious owner of acquisition as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-FIQ-previous-owner', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Proprietario precedente ', position(), ' del supporto del bene culturale ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of storage medium of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
						<xsl:if test="contains((.), '?')">
							<arco-core:uncertainData>
								<xsl:value-of select="true()" />
							</arco-core:uncertainData>
						</xsl:if>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Possessore precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
					<!-- transferor -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-FIQ-transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Cedente ', position(), ' del supporto del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Transferor ', position(), 'of storage medium of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Transferor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Transferor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Cedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Transferor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an individual -->
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
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Change of availability -->
			<xsl:for-each select="./FIN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-integrative-photographic-recording-original-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Mutamento condizione materiale del supporto originale del  bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Change of availability of storage medium of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./FINT and (not(starts-with(lower-case(normalize-space(./FINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FINT)), 'n.r')))">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./FINT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./FIND and (not(starts-with(lower-case(normalize-space(./FIND)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIND)), 'n.r')))">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FIND)))" />
							</xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./FINN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./FINN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval as an individual -->
				<xsl:if test="./FIND">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FIND)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIND)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIND)" />
						</l0:name>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./FIND)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- ChangeOfAvailability type as an individual -->
				<xsl:if test="./FINT and (not(starts-with(lower-case(normalize-space(./FINT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FINT)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./FINT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FINT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FINT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Copyright -->
			<xsl:for-each select="./FIY">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Copyright/PhotographicRecording-original-', $itemURI, '-copyright-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
	           			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Copyright ', position(), ' of recording of cultural property ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Diritti d''autore ', position(), ' della registrazione del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./FIYN and (not(starts-with(lower-case(normalize-space(./FIYN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIYN)), 'n.r')))">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./FIYD and (not(starts-with(lower-case(normalize-space(./FIYD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FIYD)), 'n.r')))">
						<arco-cd:expiryDate>
							<xsl:value-of select="normalize-space(./FIYD)" />
						</arco-cd:expiryDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./FIYN">
					<!-- agent role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./FIYN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./FIYN))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Detentore dei diritti sulla registrazione del bene culturale ', $itemURI, ': ', normalize-space(./FIYN))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Rights holder on recording of cultural property ', $itemURI, ': ', normalize-space(./FIYN))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIYN))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Detentore dei diritti'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Rights Holder'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIYN))" />
							</xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<!-- agent as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FIYN))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FIYN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FIYN)" />
						</l0:name>
						<xsl:if test="./FIYI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(./FIYI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>