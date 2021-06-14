<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
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
			<!-- circumstance of cultural property -->
			<xsl:if test="record/metadata/schede/*/CA/*">
				<arco-cd:hasCircumstance>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(record/metadata/schede/*/CA/*)))" />
					</xsl:attribute>
				</arco-cd:hasCircumstance>
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
			<!-- communication  medium series -->
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
						<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-music-vocal')" />
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
			<!-- has actor -->
			<xsl:for-each select="record/metadata/schede/*/AT">
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-actor-', position())" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
				<arco-cd:hasActor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
					</xsl:attribute>
				</arco-cd:hasActor>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/TC">
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-actor-group', position())" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
				<arco-cd:hasActor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./TCD))" />
					</xsl:attribute>
				</arco-cd:hasActor>
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
		</rdf:Description>
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
				<arco-cd:hasDatingEvent>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS, 'Event/', $itemURI, '-creation')" />
		    	    </xsl:attribute>
				</arco-cd:hasDatingEvent>
				<!-- Source of dating -->
				<xsl:if test="./DTFM and (not(starts-with(lower-case(normalize-space(./DTFM)), 'nr')) and not(starts-with(lower-case(normalize-space(./DTFM)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DTFM)))" />
			            </xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
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
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)), 'n.r')))">
					<arco-cd:hasActivityResponsible>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVE))" />
               			</xsl:attribute>
					</arco-cd:hasActivityResponsible>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="not($sheetType='BDM' and $sheetVersion='1.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='2.00')">
					<xsl:if test="record/metadata/schede/*/DR/DRV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRV)), 'n.r')))">
						<arco-cd:hasActivityResponsible>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRV))" />
               				</xsl:attribute>
						</arco-cd:hasActivityResponsible>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRL)), 'n.r')))">
					<arco-cd:hasActivityOperator>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRL))" />
               			</xsl:attribute>
					</arco-cd:hasActivityOperator>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-operator')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRO and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRO)), 'n.r')))">
					<arco-cd:hasVideoOperator>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRO))" />
               			</xsl:attribute>
					</arco-cd:hasVideoOperator>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-video-operator')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRG)), 'n.r')))">
					<arco-cd:hasSurveyPhotographer>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRG))" />
               			</xsl:attribute>
					</arco-cd:hasSurveyPhotographer>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-photographer')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DR/DRF)), 'n.r')))">
					<arco-cd:hasSurveySoundEngineer>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRF))" />
               			</xsl:attribute>
					</arco-cd:hasSurveySoundEngineer>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-sound-engineer')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BDM/DR/DRV/DRVR">
					<arco-cd:isRelatedToResearch>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isRelatedToResearch>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DR/DRT or record/metadata/schede/*/DR/DRR">
					<arco-cd:isRelatedToResearch>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isRelatedToResearch>
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
					<tiapit:time>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVD)" />
					</tiapit:time>
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
					<tiapit:time>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRD)" />
				</tiapit:time>
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
	                           <xsl:value-of select="concat($NS, 'Role/ActivityResponsible')" />
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
	                       <xsl:value-of select="concat($NS, 'Role/ActivityResponsible')" />
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
						<xsl:value-of select="'Activity Responsible'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
	                       </xsl:attribute>
					</arco-core:isRoleOf>
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
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVE)" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
	                       </xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="not($sheetType='BDM' and $sheetVersion='1.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='2.00')">
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
	               	            <xsl:value-of select="concat($NS, 'Role/ActivityResponsible')" />
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
	           	            <xsl:value-of select="concat($NS, 'Role/ActivityResponsible')" />
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
							<xsl:value-of select="'Activity Responsible'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
	       	                    <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
	           	            </xsl:attribute>
						</arco-core:isRoleOf>
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
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRV)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRV)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
	       	                    <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-observation-survey-activity-responsible')" />
	           	            </xsl:attribute>
						</arco-core:isAgentOf>
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
	                           <xsl:value-of select="concat($NS, 'Role/ActivityResponsible')" />
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
	                       <xsl:value-of select="concat($NS, 'Role/ActivityOperator')" />
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Operatore dell''attività'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Activity Operator'" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRL)" />
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
						<xsl:value-of select="'Video operatore dell''attività'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Video operator'" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRL)" />
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
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRG))" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRG)" />
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
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Video operatore del rilevamento del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Video operator of obervation activity  of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRF))" />
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
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRG)" />
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
					<arco-cd:hasResearchScientificDirector>
						<xsl:attribute name="rdf:resource">
               				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BDM/DR/DRV/DRVR))" />
               			</xsl:attribute>
					</arco-cd:hasResearchScientificDirector>
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
							<xsl:value-of select="concat('Agente responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Agente responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Responsible agent of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Responsible agent of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Role/ResearchScientificResponsible')" />
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
		                       <xsl:value-of select="concat($NS, 'Role/ResearchScientificResponsible')" />
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
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
							</xsl:attribute>
						</arco-core:isRoleOf>
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
							<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BDM/DR/DRV/DRVR)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
		                       </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DR/DRT or record/metadata/schede/*/DR/DRR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Research/', $itemURI)" />
					</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Research" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRT)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/DR/DRR">
						<arco-cd:hasResearchScientificDirector>
							<xsl:attribute name="rdf:resource">
        	       				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/DR/DRR))" />
            	   			</xsl:attribute>
						</arco-cd:hasResearchScientificDirector>
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
							<xsl:value-of select="concat('Agente responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Agente responsabile scientifico della ricerca sul bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Responsible agent of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Responsible agent of research on cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DR/DRR))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'Role/ResearchScientificResponsible')" />
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
		                       <xsl:value-of select="concat($NS, 'Role/ResearchScientificResponsible')" />
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
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
							</xsl:attribute>
						</arco-core:isRoleOf>
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
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DR/DRR)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-research-scientific-director')" />
		                       </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
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
		<!-- production realization location for BDM < version 4.00 -->
		<xsl:for-each select="record/metadata/schede/BDM/AU/LDF">
			<xsl:variable name="location">
				<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(.)))" />
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
				<xsl:if test="./LDFF">
					<arco-location:hasToponymInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./LDFF)))" />
						</xsl:attribute>
					</arco-location:hasToponymInTime>
				</xsl:if>
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
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LDFR))" />
						</xsl:attribute>
					</clvapit:hasRegion>
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
						<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(record/metadata/schede/*/OC/OCT)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(record/metadata/schede/*/OC/OCC)))" />
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
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
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
					<tiapit:time>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OC/OCD)" />
					</tiapit:time>
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
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(record/metadata/schede/*/OC/OCC/OCCR))" />
						</xsl:attribute>
					</clvapit:hasRegion>
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
		<!-- circumstance of cultural property -->
		<xsl:if test="record/metadata/schede/*/CA/*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(record/metadata/schede/*/CA/*)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/CA/CAA">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/YearCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAV">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LifeCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAS">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SeasonCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAP">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ProductionCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAL">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/WorkCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAF">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FairMarketCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAQ">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SocialInteractionCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAI">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IndeterminateCircumstance'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Circumstance'" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOA">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/YearCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOV">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LifeCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOS">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SeasonCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOP">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ProductionCylceCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOL">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/WorkCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOF">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FairMarketCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOQ">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SocialInteractionCircumstance'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/CA/CAO/CAOI">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IndeterminateCircumstance'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Circumstance'" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="($sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01')">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/CA/CAA">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAV">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAS">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAP">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAL">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAF">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAQ">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAI">
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOA">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOV">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOS">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOP">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOL">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOF">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOQ">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/CA/CAO/CAOI">
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="record/metadata/schede/*/CA/CAO/CAOA" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
                		<xsl:choose>
                			<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAR))='si'">
                				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ReligiousCircumstance'" />
                			</xsl:when>
                			<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/CA/CAC))='si'">
                				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CivilCircumstance'" />
                			</xsl:when>
                		</xsl:choose>
                	</xsl:attribute>
				</arco-core:hasType>
			</rdf:Description>
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
					<arco-ce:hasRecurrentTimePeriod>
						<xsl:attribute name="rdf:resource">
            	    		<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCP)))" />
                		</xsl:attribute>
					</arco-ce:hasRecurrentTimePeriod>
				</rdf:Description>
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
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
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
					<arco-ce:hasRecurrentTimePeriod>
						<xsl:attribute name="rdf:resource">
            	    		<xsl:value-of select="concat($NS, 'RecurrentTimePeriod/', arco-fn:urify(normalize-space(record/metadata/schede/*/RC/RCR/RCRP)))" />
                		</xsl:attribute>
					</arco-ce:hasRecurrentTimePeriod>
				</rdf:Description>
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
						<xsl:value-of select="concat('Recurrent situation related to cultural property ', $itemURI)" />
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
              		<xsl:value-of select="concat($NS, 'CommunicationMedium/', $itemURI, '-music-vocal')" />
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
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MusicVocalCommunication'" />
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
				<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSS">
					<arco-dd:involvesSoloInstrument>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesSoloInstrument>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSA">
					<arco-dd:involvesAccompanyingInstrument>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesAccompanyingInstrument>
				</xsl:for-each>
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
			<xsl:for-each select="record/metadata/schede/*/CU/CUS/CUSS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                      	<xsl:value-of select="concat($NS, 'MusicalInstrument/', arco-fn:urify(normalize-space(.)))" />
                  	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MusicalInstrument'" />		
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MusicalInstrument'" />		
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
				<xsl:for-each select="./CUCE">
					<arco-dd:involvesAgeRange>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesAgeRange>
				</xsl:for-each>
			</rdf:Description>
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
				<xsl:if test="record/metadata/schede/*/CU/CUC/CUCG">
					<arco-core:description>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CU/CUC/CUCG)" />
					</arco-core:description>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/CU/CUP/CUPE">
					<arco-dd:involvesAgeRange>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeRange/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:involvesAgeRange>
				</xsl:for-each>
			</rdf:Description>
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
				<xsl:if test="./CURA">
					<arco-dd:graphicSymbols>
						<xsl:value-of select="normalize-space(./CURA)" />
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
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Animal'" />
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
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Vegetal'" />
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
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Mineral'" />
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
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Object'" />
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
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Object'" />
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
		<!-- Actor -->
		<xsl:for-each select="record/metadata/schede/*/AT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-actor-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attore ', position(), ' del bene ', $itemURI, ': ', ./ATT/ATTN)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Actor ', position(), ' of cultural property ', $itemURI, ': ', ./ATT/ATTN)" />
				</rdfs:label>
				<arco-core:hasRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/Actor')" />
					</xsl:attribute>
				</arco-core:hasRole>
				<xsl:if test="./ATT/ATTI">
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./ATT/ATTI)) )" />
						</xsl:attribute>
					</arco-core:hasRole>
				</xsl:if>
				<arco-core:hasAgent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
					</xsl:attribute>
				</arco-core:hasAgent>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Role/Actor')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Attore'" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Actor'" />
				</rdfs:label>
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
				</rdf:Description>
			</xsl:if>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ATT/ATTN))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./ATT/ATTN" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./ATT/ATTN" />
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
				<xsl:if test="./ATT/ATTM">
					<arco-core:note>
						<xsl:value-of select="concat('Mestiere: ', ./ATT/ATTM)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ATT/ATTB">
					<arco-core:note>
						<xsl:value-of select="concat('Contesto culturale: ', ./ATT/ATTB)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ATA">
					<arco-core:note>
						<xsl:value-of select="./ATA" />
					</arco-core:note>
				</xsl:if>
				<!-- sex interpretation -->
				<xsl:if test="./ATT/ATTS">
					<arco-cd:hasSexInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'SexInterpretation/', arco-fn:arcofy(normalize-space(./ATT/ATTN)))" />
						</xsl:attribute>
					</arco-cd:hasSexInterpretation>
				</xsl:if>
				<!-- age interpretation -->
				<xsl:if test="./ATT/ATTE">
					<arco-cd:hasAgeInterpretation>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'AgeInterpretation/', arco-fn:arcofy(normalize-space(./ATT/ATTN)))" />
               			</xsl:attribute>
					</arco-cd:hasAgeInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./DNA and not(./DNA/DNAN)">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./ATT/ATTN)), '-birth-place')" />
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./DML">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./ATT/ATTN)), '-domicile')" />
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
			<!-- sex interpretation as individual -->
			<xsl:if test="./ATT/ATTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'SexInterpretation/', arco-fn:arcofy(normalize-space(./ATT/ATTN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SexInterpretation'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione del sesso dell attore ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione del sesso dell attore ', ./ATT/ATTN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Sex interpretation of actor ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Sex interpretation of actor ', ./ATT/ATTN)" />
					</l0:name>
					<arco-cd:sex>
						<xsl:value-of select="normalize-space(./ATT/ATTS)" />
					</arco-cd:sex>
				</rdf:Description>
			</xsl:if>
			<!-- age interpretation as individual -->
			<xsl:if test="./ATT/ATTE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'AgeInterpretation/', arco-fn:arcofy(normalize-space(./ATT/ATTN)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AgeInterpretation'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione dell età dell attore ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione dell età dell attore ', ./ATT/ATTN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age interpretation of actor ', ./ATT/ATTN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age interpretation of actor ', ./ATT/ATTN)" />
					</l0:name>
					<arco-cd:age>
						<xsl:value-of select="normalize-space(./ATT/ATTE)" />
					</arco-cd:age>
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
					<arco-cd:hasAgeType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-cd:hasAgeType>
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
								<xsl:value-of select="'attribuzione dell'" />
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
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./DNA and not(./DNA/DNAN)">
			<xsl:variable name="location">
				<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(./DNA)))" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./ATT/ATTN)), '-birth-place')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Location'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Luogo di nascita di ', ./ATT/ATTN)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Luogo di nascita di ', ./ATT/ATTN)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Birth place of ', ./ATT/ATTN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Birth place of ', ./ATT/ATTN)" />
				</l0:name>
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
			</rdf:Description>
			<!-- feature -->
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
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
						</xsl:attribute>
					</clvapit:hasRegion>
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
				<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(./DML)))" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./ATT/ATTN)), '-birth-place')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Location'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Domicilio di ', ./ATT/ATTN)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Domicilio di ', ./ATT/ATTN)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Domicile of ', ./ATT/ATTN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Domicile of ', ./ATT/ATTN)" />
				</l0:name>
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
			</rdf:Description>
			<!-- feature -->
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
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
						</xsl:attribute>
					</clvapit:hasRegion>
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
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-actor-group-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attore ', position(), ' del bene ', $itemURI, ': ', ./TCD)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Actor ', position(), ' of cultural property ', $itemURI, ': ', ./TCD)" />
				</rdfs:label>
				<arco-core:hasRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/Actor')" />
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
					<xsl:value-of select="concat($NS, 'Role/Actor')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Attore'" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Actor'" />
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
					<l0:identifier>
               			<xsl:value-of select="record/metadata/schede/*/DU/DUC" />
					</l0:identifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUL)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUR">
					<arco-cd:isMemberOfCollectionOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
						</xsl:attribute>
					</arco-cd:isMemberOfCollectionOf>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUS">
					<arco-cd:isMemberOfCollectionOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
						</xsl:attribute>
					</arco-cd:isMemberOfCollectionOf>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUO/DUOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DU/DUO/DUOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUO/DUOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DU/DUO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-support-', position())" />
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
			</rdf:Description>
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
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Recording', $itemURI)" />
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
						<xsl:value-of select="concat('Measurement of recording: ', (record/metadata/schede/*/DU/DUU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of recording: ', (record/metadata/schede/*/DU/DUU))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DU/DUU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della registrazione: ', (record/metadata/schede/*/DU/DUU))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Duration')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Recording-duration-', (record/metadata/schede/*/DU/DUU))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Recording-duration-', (record/metadata/schede/*/DU/DUU))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/*/DU/DUU" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/*/DU/DUU" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DU/DUO/DUOM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI)" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of recording of cultural property ', $itemURI" />
					</l0:name>
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(record/metadata/schede/*/DU/DUO/DUOM)), 'hz')">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-frequency')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-recording-speed')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
				<xsl:choose>
					<xsl:when test="contains(lower-case(normalize-space(record/metadata/schede/*/DU/DUO/DUOM)), 'hz')">
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-frequency')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Frequency')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/StorageMedium-duration-', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/StorageMedium-duration-', (record/metadata/schede/*/DU/DUO/DUOM))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOM" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOM" />
							</l0:name>
						</rdf:Description>
					</xsl:when>
					<xsl:otherwise>
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-recording-speed')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'RecordingSpeed')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/StorageMedium-recording-speed-', (record/metadata/schede/*/DU/DUO/DUOM))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/StorageMedium-recording-speed-', (record/metadata/schede/*/DU/DUO/DUOM))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOM" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOM" />
							</l0:name>
						</rdf:Description>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DU/DUM/DUMM">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI)" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Misure del supporto della registrazione del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of recording of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measuerements storage medium of recording of cultural property ', $itemURI" />
					</l0:name>
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(record/metadata/schede/*/DU/DUM/DUMM)), 'hz')">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-frequency')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-recording-speed')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
				<xsl:choose>
					<xsl:when test="contains(lower-case(normalize-space(record/metadata/schede/*/DU/DUM/DUMM)), 'hz')">
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-frequency')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Frequency')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/StorageMedium-duration-', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/StorageMedium-duration-', (record/metadata/schede/*/DU/DUM/DUMM))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/*/DU/DUM/DUMM" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/*/DU/DUM/DUMM" />
							</l0:name>
						</rdf:Description>
					</xsl:when>
					<xsl:otherwise>
						<rdf:Description>
							<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/StorageMedium', $itemURI, '-recording-speed')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of storage medium: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del supporto: ', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'RecordingSpeed')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/StorageMedium-recording-speed-', (record/metadata/schede/*/DU/DUM/DUMM))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/StorageMedium-recording-speed-', (record/metadata/schede/*/DU/DUM/DUMM))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/*/DU/DUM/DUMM" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/*/DU/DUM/DUMM" />
							</l0:name>
						</rdf:Description>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<!-- collection membership -->
			<xsl:if test="record/metadata/schede/*/DU/DUR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollectionMembership'" />
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
						<arco-arco:positionInSequence>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUR/DURN)" />
						</arco-arco:positionInSequence>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUR/DURD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
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
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DU/DUS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AudioCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AudioCollectionMembership'" />
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
						<arco-arco:positionInSequence>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUS/DUSN)" />
						</arco-arco:positionInSequence>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AudioCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUS/DUST)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
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
				</rdf:Description>
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
			<xsl:if test="record/metadata/schede/*/DU/DUO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-support-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUO/DUOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUO/DUOC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUO/DUOC)" />
					</l0:identifier>
					<arco-cd:originalSupport>
						<xsl:value-of select="true()" />
					</arco-cd:originalSupport>
					<xsl:if test="record/metadata/schede/*/DU/DUO/DUOF">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(record/metadata/schede/*/DU/DUO/DUOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUO/DUOD">
						<arco-core:description>
								<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUO/DUOI">
						<arco-core:note>
							<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUO/DUOZ">
						<arco-core:note>
							<xsl:value-of select="record/metadata/schede/*/DU/DUO/DUOZ" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DU/DUO/DUOM">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI)" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
					<!-- CIS -->
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
					<!-- current physical location -->
					<xsl:if test="record/metadata/schede/*/DU/DUG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="record/metadata/schede/*/DU/DUZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)))" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
					<!-- Acquisition of cultural property -->
					<xsl:if test="record/metadata/schede/*/DU/DUQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
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
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DUMC)" />
					</l0:identifier>
					<arco-cd:originalSupport>
						<xsl:value-of select="false()" />
					</arco-cd:originalSupport>
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
					<xsl:if test="record/metadata/schede/*/DU/DUM/DUMM">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/StorageMedium', $itemURI)" />
					        </xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
				</rdf:Description>
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
				<cis:hasCISNameInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CISNameInTime/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUP/DUPN)))" />
					</xsl:attribute>
				</cis:hasCISNameInTime>
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
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
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
				<xsl:if test="record/metadata/schede/*/DU/DUG/DUG">
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
					<xsl:for-each select="record/metadata/schede/*/DU/DUG/DUG/*">
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
						<xsl:when test="record/metadata/schede/*/DU/DUG/DUGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUG/DUGC)), 'firenze'))">	
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
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUZ/DUZG)))" />
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
					<xsl:for-each select="record/metadata/schede/*/DU/DUZ/DUZS">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasOwner>
								<xsl:attribute name="rdf:resource">
		            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            			</xsl:attribute>
							</arco-cd:hasOwner>
						</xsl:if>
					</xsl:for-each>
				</rdf:Description>
				<xsl:for-each select="record/metadata/schede/*/DU/DUZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
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
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
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
					<xsl:if test="record/metadata/schede/*/DU/DUQ/DUQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DU/DUQ/DUQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DU/DUQ/DUQN">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-cd:hasPreviousOwner>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
					</xsl:for-each>
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
						<tiapit:time>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DU/DUQ/DUQD)" />
						</tiapit:time>
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
				<!-- previous owner in acquisition as an individual -->
				<xsl:for-each select="record/metadata/schede/*/DU/DUQ/DUQN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
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
								<xsl:value-of select="'Proprietario precedente'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Previous owner'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-core:isRoleOf>
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
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
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
					<l0:identifier>
               			<xsl:value-of select="record/metadata/schede/*/DV/DVC" />
					</l0:identifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVL">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVL)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVU">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVB">
					<arco-core:abstract>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVB)" />
					</arco-core:abstract>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVR">
					<arco-cd:isMemberOfCollectionOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
						</xsl:attribute>
					</arco-cd:isMemberOfCollectionOf>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVV">
					<arco-cd:isMemberOfCollectionOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
						</xsl:attribute>
					</arco-cd:isMemberOfCollectionOf>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVO/DVOA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DV/DVO/DVOA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DV/DVO/DVOT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecordingType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVO/DVOT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DV/DVO">
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-support-', position())" />
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
			</rdf:Description>
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
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Recording', $itemURI)" />
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
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Recording-duration-', (record/metadata/schede/*/DV/DVU))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Recording-duration-', (record/metadata/schede/*/DV/DVU))" />
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
						<xsl:value-of select="concat($NS, 'VideoCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollectionMembership'" />
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
						<arco-arco:positionInSequence>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVR/DVRN)" />
						</arco-arco:positionInSequence>
					</xsl:if>
					<arco-cd:hasCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VideoCollection/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVR/DVRD)))" />
						</xsl:attribute>
					</arco-cd:hasCollection>
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
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DV/DVV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'VideoCollectionMembership/', $itemURI, arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVV/DVVT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/VideoCollectionMembership'" />
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
			<xsl:if test="record/metadata/schede/*/DV/DVO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI, '-original-support-', position())" />
               		</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/StorageMedium" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVO/DVOC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVO/DVOC)" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVO/DVOC)" />
					</l0:identifier>
					<arco-cd:originalSupport>
						<xsl:value-of select="true()" />
					</arco-cd:originalSupport>
					<xsl:if test="record/metadata/schede/*/DV/DVO/DVOF">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'StorageMediumType/', arco-fn:urify(record/metadata/schede/*/DV/DVO/DVOF))" />
							</xsl:attribute>
						</arco-core:hasType>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVO/DVOD">
						<arco-core:description>
								<xsl:value-of select="record/metadata/schede/*/DV/DVO/DVOD" />
						</arco-core:description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVO/DVOI">
						<arco-core:note>
							<xsl:value-of select="record/metadata/schede/*/DV/DVO/DVOI" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DV/DVO/DVOZ">
						<arco-core:note>
							<xsl:value-of select="record/metadata/schede/*/DV/DVO/DVOZ" />
						</arco-core:note>
					</xsl:if>
					<!-- CIS -->
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
					<!-- current physical location -->
					<xsl:if test="record/metadata/schede/*/DV/DVG">
						<arco-location:hasTimeIndexedTypedLocation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
							</xsl:attribute>
						</arco-location:hasTimeIndexedTypedLocation>
					</xsl:if>
					<!-- Legal situation of cultural property -->
					<xsl:if test="record/metadata/schede/*/DV/DVZ">
						<arco-cd:hasLegalSituation>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)))" />
                			</xsl:attribute>
						</arco-cd:hasLegalSituation>
					</xsl:if>
					<!-- Acquisition of cultural property -->
					<xsl:if test="record/metadata/schede/*/DV/DVQ">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
	            	    	</xsl:attribute>
						</arco-cd:hasAcquisition>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
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
					<l0:identifier>
						<xsl:value-of select="normalize-space(./DVMC)" />
					</l0:identifier>
					<arco-cd:originalSupport>
						<xsl:value-of select="false()" />
					</arco-cd:originalSupport>
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
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
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
						<xsl:when test="record/metadata/schede/*/DV/DVG/DVGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVG/DVGC)), 'firenze'))">	
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
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVZ/DVZG)))" />
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
					<xsl:for-each select="record/metadata/schede/*/DV/DVZ/DVZS">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasOwner>
								<xsl:attribute name="rdf:resource">
		            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            			</xsl:attribute>
							</arco-cd:hasOwner>
						</xsl:if>
					</xsl:for-each>
				</rdf:Description>
				<xsl:for-each select="record/metadata/schede/*/DV/DVZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
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
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
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
					<xsl:if test="record/metadata/schede/*/DV/DVQ/DVQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DV/DVQ/DVQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DV/DVQ/DVQN">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-cd:hasPreviousOwner>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
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
						<tiapit:time>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DV/DVQ/DVQD)" />
						</tiapit:time>
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
				<xsl:for-each select="record/metadata/schede/*/DV/DVQ/DVQN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
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
								<xsl:value-of select="'Proprietario precedente'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Previous owner'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-core:isRoleOf>
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
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
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
				<xsl:if test="record/metadata/schede/*/DF/DFC">
					<l0:identifier>
               			<xsl:value-of select="record/metadata/schede/*/DF/DFC/DFCC" />
					</l0:identifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTQ">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTQ)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTT">
					<arco-cd:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/Recording', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFT/DFTT)))" />
						</xsl:attribute>
					</arco-cd:hasTitle>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCF">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCX">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if></xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFT/DFTI">
					<arco-cd:subject>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFT/DFTI)" />
					</arco-cd:subject>
					<arco-cd:hasSubject>
						<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(record/metadata/schede/*/DF/DFT/DFTI))" />	                    	</xsl:attribute>
						</arco-cd:hasSubject>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DF/DFC/DFCA">
					<arco-cd:recordingEquipment>
						<xsl:value-of select="record/metadata/schede/*/DF/DFC/DFCA" />
					</arco-cd:recordingEquipment>
				</xsl:if>
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
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- Legal situation of cultural property -->
				<xsl:if test="record/metadata/schede/*/DF/DFZ">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
               				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)))" />
               			</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<!-- Acquisition of cultural property -->
				<xsl:if test="record/metadata/schede/*/DF/DFQ">
					<arco-cd:hasAcquisition>
						<xsl:attribute name="rdf:resource">
	       	        		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
	           	    	</xsl:attribute>
					</arco-cd:hasAcquisition>
				</xsl:if>
			</rdf:Description>
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
			<!-- technical status -->
			<xsl:if test="record/metadata/schede/*/DF/DFC/DFCF">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
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
		          			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFC/DFCF)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical characteristic as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		          		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFC/DFCF)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFC/DFCF)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoSize'" />
		          		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DF/DFC/DFCX">
				<rdf:Description>
				 	<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TechnicalStatus/Recording', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
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
					<xsl:if test="record/metadata/schede/*/DF/DFT/DFTD">
						<arco-core:specifications>
							<xsl:value-of select="record/metadata/schede/*/DF/DFT/DFTD" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/DF/DFT/DFTN">
						<arco-core:note>
							<xsl:value-of select="record/metadata/schede/*/DF/DFT/DFTN" />
						</arco-core:note>
					</xsl:if>
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
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-original-support')" />
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
						<xsl:when test="record/metadata/schede/*/DF/DFG/DFGC and (starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFG/DFGC)), 'firenze'))">	
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
                		<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-storage-medium-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFZ/DFZG)))" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del supporto del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of storage medium of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/*/DF/DFZ/DFZG))" />
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
					<xsl:for-each select="record/metadata/schede/*/DF/DFZ/DFZS">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasOwner>
								<xsl:attribute name="rdf:resource">
		            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            			</xsl:attribute>
							</arco-cd:hasOwner>
						</xsl:if>
					</xsl:for-each>
				</rdf:Description>
				<xsl:for-each select="record/metadata/schede/*/DF/DFZS[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
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
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-storage-medium-acquisition')" />
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
					<xsl:if test="record/metadata/schede/*/DF/DFQ/DFQT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)), 'n.r')))">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(record/metadata/schede/*/DF/DFQ/DFQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/DF/DFQ/DFQN">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasPreviousOwner>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            				</xsl:attribute>
							</arco-cd:hasPreviousOwner>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
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
						<tiapit:time>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DF/DFQ/DFQD)" />
						</tiapit:time>
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
				<xsl:for-each select="record/metadata/schede/*/DF/DFQ/DFQN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-previous-owner')" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
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
								<xsl:value-of select="'Proprietario precedente'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Previous owner'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-core:isRoleOf>
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
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>		
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>