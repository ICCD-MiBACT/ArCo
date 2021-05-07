<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-mp="https://w3id.org/arco/ontology/movable-property/"
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
	xmlns:arco-ip="https://w3id.org/arco/ontology/immovable-property/"

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />


  
	
	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />
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
		
<xsl:template match="/">
	<rdf:RDF>
	<xsl:if test="$sheetType='BNPL'" >
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PlanetaryScienceHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<xsl:if test="not($sheetType='BNB')">
			<xsl:if test="record/metadata/schede/*/AC/ACK">
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:isClassifiedByCurrentTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:isClassifiedByCurrentTaxon>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-core:isClassifiedBy>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPN/RPNN">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(.)))" />
		    	</xsl:attribute>
			</arco-core:isClassifiedBy>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/SP/SPE">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPE">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>			
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPT/SPTT)), 'non tipo'))">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPT"> 
			<xsl:if test="./RPTT and not(starts-with(lower-case(normalize-space(./RPTT)), 'non tipo'))">
				<arco-mp:hasTypeSpecimenIdentification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-mp:hasTypeSpecimenIdentification>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO or record/metadata/schede/BNPL/SP/SPC/SPCS">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT">
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPL/RP">
			<xsl:if test="./RPO or ./RPC/RPCS">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCA and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)), 'nessuna'))">
			<arco-mp:hasAlterationGrade>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'WeatheringGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)))" />
 				</xsl:attribute>
			</arco-mp:hasAlterationGrade>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR or record/metadata/schede/BNPL/SP/SPC/SPCT or record/metadata/schede/BNPL/SP/SPC/SPCC">
			<arco-mp:hasTexture>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
 				</xsl:attribute>
			</arco-mp:hasTexture>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC">
			<xsl:if test="./RPCR or ./RPCT or ./RPCC">
			<arco-mp:hasTexture>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
 				</xsl:attribute>
			</arco-mp:hasTexture>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMO">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMP">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPML">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMM">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Metal')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMS">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPM">
		<xsl:if test="./RPMO">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMP">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPML">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMM">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMS">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
			<arco-mp:hasChondrulePresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'ChondrulePresence/', $itemURI)" />
 				</xsl:attribute>
			</arco-mp:hasChondrulePresence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDE">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDG">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDX">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDT">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDE">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDG">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDX">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDT">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK or record/metadata/schede/BNPL/SP/SPN/SPNW">
			<arco-core:isPartOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Meteorite/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
 				</xsl:attribute>
			</arco-core:isPartOf>
		</xsl:if>
	</rdf:Description>	

					<!-- Taxon of planetologic property -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicSpecies'" />
            	</xsl:attribute>
			</rdf:type>	
			<rdfs:label xml:lang="en">
		   		<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNN" />
		   	</rdfs:label>
			<l0:name xml:lang="en">
		   		<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNN" />
	   		</l0:name>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNG">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		   				<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNG)))" />
		   			</xsl:attribute>
				</arco-mp:hasDirectHigherRank>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNG)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGroup'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNG" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNG" />
		   		</l0:name>
		   		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNC">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNC)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNC)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicClass'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNC" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNC" />
		   		</l0:name>
		   		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNE">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNE)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNE)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGenus'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNE" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNE" />
		   		</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if> 	
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPN">
	<xsl:if test="./RPNN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNN)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicSpecies'" />
            	</xsl:attribute>
			</rdf:type>	
			<rdfs:label xml:lang="en">
		   		<xsl:value-of select="./RPNN" />
		   	</rdfs:label>
			<l0:name xml:lang="en">
		   		<xsl:value-of select="./RPNN" />
	   		</l0:name>
			<xsl:if test="./RPNG">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		   				<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNG)))" />
		   			</xsl:attribute>
				</arco-mp:hasDirectHigherRank>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPNG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNG)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGroup'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNG" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNG" />
		   		</l0:name>
		   		<xsl:if test="./RPNC">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNC)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPNC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNC)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicClass'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNC" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNC" />
		   		</l0:name>
		   		<xsl:if test="./RPNE">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNE)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPNE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNE)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGenus'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNE" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNE" />
		   		</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if> 
	</xsl:for-each>

						<!-- Classification in time -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:if>	
	<xsl:for-each select="record/metadata/schede/BNPL/RR/RRN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNN)))" />
		    	</xsl:attribute>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:for-each>
	
					<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNPL/SP/SPE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SPET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./SPET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SPEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./SPEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RPET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./RPET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./RPEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./RPEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>

					<!--  Measurement collection as individual  -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta18O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta17O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>								
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-shok-stage')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-shok-stage')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ShockStage')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCS)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCS)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPC/SPCS" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPC/SPCS" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPT">
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-weight')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-weight')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
			</arco-dd:hasValue>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RPOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta18O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(./RPOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(./RPOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta17O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(./RPOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(./RPOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>								
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC/RPCS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test=".">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-shok-stage-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test=".">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-shok-stage-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ',(.))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (.))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ShockStage')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(.)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(.)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNPL/RP">
	<xsl:if test="./RPT">
	<xsl:if test="./RPN/RPNP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test=".">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-weight-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPN/RPNP">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-weight-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (./RPN/RPNP))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (./RPN/RPNP))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (./RPN/RPNP))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (./RPN/RPNP))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(./RPN/RPNP)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(./RPN/RPNP)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPN/RPNP" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPN/RPNP" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>
	
						<!-- Meteorite as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK or record/metadata/schede/BNPL/SP/SPN/SPNW">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Meteorite/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNPL/SP/SPN/SPNL">
						<xsl:attribute name="rdf:resource">
	            	 		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MeteoriteFall'" />
	            		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
	            	 		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Meteorite'" />
	            		</xsl:attribute>
					</xsl:otherwise>
	            </xsl:choose>
			</rdf:type>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK">
				<arco-core:hasPart>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
					</xsl:attribute>
				</arco-core:hasPart>
			</xsl:if>
			<xsl:if test="not(record/metadata/schede/BNPL/SP/SPT)">
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS or record/metadata/schede/BNPL/SP/SPN/SPNP">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPND">
				<arco-mp:fallDate>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPND) " />
				</arco-mp:fallDate>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="not(record/metadata/schede/BNPL/SP/SPT)">
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS or record/metadata/schede/BNPL/SP/SPN/SPNP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
	    	        </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of
							select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNS))" />
		            	</xsl:attribute>
					</arco-cd:hasOwner>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNS))" />
		            </xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNS)" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)), '-typespecimen')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of type specimen of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measuerements of type specimen of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misure del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misure del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPNW">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNW" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNW" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MainMass'" />
	    	        </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Massa pricipale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Massa pricipale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNK">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)),'-main-mass')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
						</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of
							select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNM))" />
		            	</xsl:attribute>
					</arco-cd:hasOwner>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNM))" />
		            </xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNM)" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNK">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of the main mass of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measuerements of the main mass of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNK" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNK" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>
	
					<!-- Alteration grade as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCA and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)), 'nessuna'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'WeatheringGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/WeatheringGrade'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)" />
			</l0:name>		
		</rdf:Description>
	</xsl:if>
		
					<!-- Texture as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR or record/metadata/schede/BNPL/SP/SPC/SPCT or record/metadata/schede/BNPL/SP/SPC/SPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCT">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
				<arco-mp:hasChondrule>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
					</xsl:attribute>
				</arco-mp:hasChondrule>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR">
				<arco-mp:chondrule-matrixRatio>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCR)" />
				</arco-mp:chondrule-matrixRatio>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'Chondrule/',arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Chondrule'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>	
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondruleType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>	
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC">	
		<xsl:if test="./RPCR or ./RPCT or ./RPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPCT">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RPCT)))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="./RPCC">
				<arco-mp:hasChondrule>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(./RPCC)))" />
					</xsl:attribute>
				</arco-mp:hasChondrule>
			</xsl:if>
			<xsl:if test="./RPCR">
				<arco-mp:chondrule-matrixRatio>
					<xsl:value-of select="normalize-space(./RPCR)" />
				</arco-mp:chondrule-matrixRatio>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RPCT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RPCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RPCT)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(./RPCC)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Chondrule'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RPCC">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(./RPCC)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>	
			</rdf:Description>
			<xsl:if test="./RPCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(./RPCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondruleType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RPCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RPCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>	
		</xsl:if>
		</xsl:if>
	</xsl:for-each>
	
						<!-- Mineral Presence as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Olivine presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Olivine presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMO" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMF" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Olivine'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Olivine'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMP" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMR" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Pyroxene'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Pyroxene'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPML">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPML" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMA" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Plagioclase'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Plagioclase'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Metal presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Metal presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMM" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Metal'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Metal'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMS" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Sulphides'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Sulphides'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPM">
	<xsl:if test="./RPMO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Olivine presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Olivine presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMO" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMF" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Olivine'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Olivine'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMP" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMR" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Pyroxene'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Pyroxene'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPML">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPML" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMA" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Plagioclase'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Plagioclase'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Metal presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Metal presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMM" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Metal'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Metal'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMS" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Sulphides'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Sulphides'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	</xsl:for-each>
	
					<!-- Chondrule Presence as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CondrulePresence/', $itemURI)" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondrulePresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di condrule nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di condrule nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Chondrule presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Chondrule presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesChondrule>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
				</xsl:attribute>
			</arco-mp:involvesChondrule>
		</rdf:Description>
	</xsl:if>
	
						<!-- Age interpretation as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDE)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IngeousAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDG)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ShokAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDX)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CosmicRayExposureAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDT)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/TerrestrialAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD">
	<xsl:if test="./RPDE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDE)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IngeousAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDG)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ShokAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDX)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CosmicRayExposureAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDT)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/TerrestrialAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
		
						<!-- Type specimen as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPT/SPTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPL/SP/SPT/SPTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNN">
			<arco-mp:producesTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTA">
				<arco-core:involvesAgent>
					<xsl:attribute name="rdf:resource">
        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPT/SPTA))" />
					</xsl:attribute>
				</arco-core:involvesAgent>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPL/SP/SPT/SPTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPT/SPTA))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>		
	<xsl:for-each select="record/metadata/schede/BNPL/RP"> 
		<xsl:if test="./RPT/RPTT and not(starts-with(lower-case(normalize-space(./RPT/RPTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPT/RPTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RPT/RPTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RPT/RPTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./RRN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="./RRN/RRNR">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNR)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNP)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="./RPT/RPTA">
				<arco-core:involvesAgent>
					<xsl:attribute name="rdf:resource">
        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RPT/RPTA))" />
					</xsl:attribute>
				</arco-core:involvesAgent>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPT/RPTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="./RPT/RPTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPT/RPTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RPT/RPTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RPT/RPTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPT/RPTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPT/RPTA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RPT/RPTA))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="./RPT/RPTA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPT/RPTA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:if>
	</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>