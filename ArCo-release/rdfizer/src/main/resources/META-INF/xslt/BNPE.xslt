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
	xmlns:arco-ip="https://w3id.org/arco/ontology/imnatural-specimen-description/"

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />
		
<xsl:template match="/">
	<rdf:RDF>
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:if test="$sheetType='BNPE'" >
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
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PetrologicHeritage'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Specimen'" />
			        </xsl:attribute>
				</rdf:type>
				<arco-spe:isClassifiedByCurrentTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:isClassifiedByCurrentTaxon>
				<arco-spe:isIdentifiedByCurrentTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:isIdentifiedByCurrentTaxon>
				<arco-core:isClassifiedBy>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isClassifiedBy>
				<arco-core:isIdentifiedBy>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isIdentifiedBy>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
				<arco-core:hasIdentificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'IdentificationInTime/', $itemURI)" />
					</xsl:attribute>
				</arco-core:hasIdentificationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
				<arco-core:isClassifiedBy>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isClassifiedBy>
				<arco-core:isIdentifiedBy>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isIdentifiedBy>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
				<arco-core:hasIdentificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-', position())" />
					</xsl:attribute>
				</arco-core:hasIdentificationInTime>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRE">
				<arco-spe:hasLabel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-spe:hasLabel>			
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRE">
				<arco-spe:hasLabel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
					</xsl:attribute>
				</arco-spe:hasLabel>			
			</xsl:for-each>			
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRT/SRTT)), 'non tipo'))">
				<arco-spe:hasTypeSpecimenIdentification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasTypeSpecimenIdentification>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRT"> 
				<xsl:if test="./RRTT and not(starts-with(lower-case(normalize-space(./RRTT)), 'non tipo'))">
					<arco-spe:hasTypeSpecimenIdentification>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-spe:hasTypeSpecimenIdentification>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR">
				<xsl:if test="./RRC/RRCD or ./RRC/RRCM or ./RRC/RRCT or ./RRF/RRFC">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
		    	            <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD or record/metadata/schede/BNPE/SR/SRG/SRGS  or record/metadata/schede/BNPE/SR/SRG/SRGP or record/metadata/schede/BNPE/SR/SRG/SRGA or record/metadata/schede/BNPE/SR/SRG/SRGB or record/metadata/schede/BNPE/SR/SRG/SRGC or record/metadata/schede/BNPE/SR/SRG/SRGE or record/metadata/schede/BNPE/SR/SRG/SRGR or record/metadata/schede/BNPE/SR/SRF/SRFV or record/metadata/schede/BNPE/SR/SRF/SRFI  or record/metadata/schede/BNPE/SR/SRM/SRMN or record/metadata/schede/BNPE/SR/SRF/SRFP">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>		
			<xsl:for-each select="record/metadata/schede/BNPE/RR">
				<xsl:if test="./RRG/RRGD or ./RRG/RRGS or ./RRG/RRGP or ./RRG/RRGA or ./RRG/RRGB or ./RRG/RRGC or ./RRG/RRGE or ./RRG/RRGR or ./RRF/RRFV or ./RRF/RRFI or ./RRM/RRMN or ./RRF/RRFP">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFR and (starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFR)), 'presente'))">
				<arco-spe:radioactivity>
	            	<xsl:value-of select="true()" />
				</arco-spe:radioactivity>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)), 'nessuna'))">
				<arco-spe:hasAlterationGrade>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'AlterationGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)))" />
	 				</xsl:attribute>
				</arco-spe:hasAlterationGrade>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCH">
				<arco-spe:hasAlterationType>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'AlterationType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)))" />
	 				</xsl:attribute>
				</arco-spe:hasAlterationType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCE">
				<arco-spe:hasEruptiveType>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'EruptiveType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)))" />
	 				</xsl:attribute>
				</arco-spe:hasEruptiveType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCA">
				<arco-spe:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)))" />
	 				</xsl:attribute>
				</arco-spe:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCP">
				<arco-spe:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)))" />
	 				</xsl:attribute>
				</arco-spe:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCS">
				<arco-spe:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)))" />
	 				</xsl:attribute>
				</arco-spe:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCB">
				<arco-spe:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)))" />
	 				</xsl:attribute>
				</arco-spe:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR or record/metadata/schede/BNPE/SR/SRC/SRCX or record/metadata/schede/BNPE/SR/SRC/SRCC or record/metadata/schede/BNPE/SR/SRC/SRCG or record/metadata/schede/BNPE/SR/SRC/SRCF">
				<arco-spe:hasTexture>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
	 				</xsl:attribute>
				</arco-spe:hasTexture>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRC">
				<xsl:if test="./RRCR or ./RRCX or ./RRCC or ./RRCG or ./RRCF">
				<arco-spe:hasTexture>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
	 				</xsl:attribute>
				</arco-spe:hasTexture>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMP">
				<arco-spe:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-', position())" />
	 				</xsl:attribute>
				</arco-spe:hasMineralPresence>
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
		 			</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMA">
				<arco-spe:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-', position())" />
	 				</xsl:attribute>
				</arco-spe:hasMineralPresence>
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
		               	<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
		 			</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMP">
				<arco-spe:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-revised-', position())" />
	 				</xsl:attribute>
				</arco-spe:hasMineralPresence>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMA">
				<arco-spe:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-revised', position())" />
	 				</xsl:attribute>
				</arco-spe:hasMineralPresence>
			</xsl:for-each>	
			<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLP">
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'Fossil/',  arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)))" />
	 				</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age')" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRR">
				<xsl:if test="./SRRE">
					<arco-cd:hasAgeInterpretation>
						<xsl:attribute name="rdf:resource">
	            	    	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-', position())" />
	 					</xsl:attribute>
					</arco-cd:hasAgeInterpretation>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRL/RRLE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age-', position())" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRR/RRRE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-revised-', position())" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:for-each>
		</rdf:Description>	
						<!-- Taxon of petrologic property -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    		</xsl:attribute>
					</xsl:otherwise>
			    </xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/RockType'" />
	            	</xsl:attribute>
				</rdf:type>	
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNR">
					<rdfs:label xml:lang="en">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNR" />
			   		</rdfs:label>
			   	</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNP">
					<rdfs:label xml:lang="it">
		   				<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNP" />
		   			</rdfs:label>
		    	</xsl:if>
			    <xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNR">
					<l0:name xml:lang="en">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNR" />
		   			</l0:name>
			   	</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNP">
					<l0:name xml:lang="it">
		   				<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNP" />
			  		</l0:name>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNC">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNC" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNN">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNN" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNT">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNT)))" />
			   			</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNV">
					<arco-spe:hasTaxonSpecification>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNV)))" />
			   			</xsl:attribute>
					</arco-spe:hasTaxonSpecification>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNV)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Variety'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label>
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNV" />
				   	</rdfs:label>
					<l0:name>
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNV" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNT)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/LithologicType'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label xml:lang="it">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNT" />
				   	</rdfs:label>
					<l0:name xml:lang="it">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNT" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if> 
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./RRNR">
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    		</xsl:attribute>
					</xsl:otherwise>
			    </xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/RockType'" />
	            	</xsl:attribute>
				</rdf:type>	
				<xsl:if test="./RRNR">
					<rdfs:label xml:lang="en">
			   			<xsl:value-of select="./RRNR" />
			   		</rdfs:label>
			   	</xsl:if>
				<xsl:if test="./RRNP">
					<rdfs:label xml:lang="it">
		   				<xsl:value-of select="./RRNP" />
		   			</rdfs:label>
		    	</xsl:if>
			    <xsl:if test="./RRNR">
					<l0:name xml:lang="en">
			   			<xsl:value-of select="./RRNR" />
		   			</l0:name>
			   	</xsl:if>
				<xsl:if test="./RRNP">
					<l0:name xml:lang="it">
		   				<xsl:value-of select="./RRNP" />
			  		</l0:name>
				</xsl:if>
				<xsl:if test="./RRNC">
					<arco-cd:synonym>
						<xsl:value-of select="./RRNC" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="./RRNN">
					<arco-cd:synonym>
						<xsl:value-of select="./RRNN" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="./RRNT">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNT)))" />
			   			</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
				<xsl:if test="./RRNV">
					<arco-spe:hasTaxonSpecification>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RRNV)))" />
			   			</xsl:attribute>
					</arco-spe:hasTaxonSpecification>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRNV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RRNV)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Variety'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label>
			   			<xsl:value-of select="./RRNV" />
				   	</rdfs:label>
					<l0:name>
			   			<xsl:value-of select="./RRNV" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRNT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNT)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/LithologicType'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label xml:lang="it">
			   			<xsl:value-of select="./RRNT" />
				   	</rdfs:label>
					<l0:name xml:lang="it">
			   			<xsl:value-of select="./RRNT" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Classification in time -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
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
				<arco-spe:hasTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:hasTaxon>
			</rdf:Description>
		</xsl:if>	
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
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
				<arco-spe:hasTaxon>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:hasTaxon>
			</rdf:Description>
		</xsl:for-each>
		<!-- Identification in time -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'IdentificationInTime/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
	            	 <xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="it">
	            	<xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
	            </l0:name>
				<rdfs:label xml:lang="en">
	            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="en">
	            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
	            </l0:name>
	            <arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<arco-spe:hasTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:hasTaxon>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'IdentificationInTime/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/IdentificationInTime'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
	            	 <xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="it">
	            	<xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
	            </l0:name>
				<rdfs:label xml:lang="en">
	            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="en">
	            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
	            </l0:name>
	            <arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<arco-spe:hasTaxon>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:hasTaxon>
			</rdf:Description>
		</xsl:for-each>
		<!-- Label as individual  -->
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Label'" />
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
				<xsl:if test="./SRET">
					<arco-spe:bodyTranscript>
						<xsl:value-of select="normalize-space(./SRET)" />
					</arco-spe:bodyTranscript>
				</xsl:if>
				<xsl:if test="./SREI">
					<arco-spe:headingTranscript>
						<xsl:value-of select="normalize-space(./SREI)" />
					</arco-spe:headingTranscript>
				</xsl:if>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>		
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Label'" />
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
				<xsl:if test="./RRET">
					<arco-spe:bodyTranscript>
						<xsl:value-of select="normalize-space(./RRET)" />
					</arco-spe:bodyTranscript>
				</xsl:if>
				<xsl:if test="./RREI">
					<arco-spe:headingTranscript>
						<xsl:value-of select="normalize-space(./RREI)" />
					</arco-spe:headingTranscript>
				</xsl:if>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>		
			</rdf:Description>
		</xsl:for-each>
		<!-- Geological context as individual -->
		<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">		
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC or record/metadata/schede/*/IR/IRA/IRAE or record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAE">
					<arco-location:hasMineralDeposit>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasMineralDeposit>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAG">
					<arco-location:hasOutcrop>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasOutcrop>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/IR/IRA/IRAB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAC" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAN)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:if>						
		<!-- Mineral deposit as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDeposit'" />
					</xsl:attribute>	
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAP))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAE">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAE))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<!-- Mineral Deposit Type as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAP))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDepositType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAP)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAE))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDepositType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAE)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<!-- OutCrop as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Outcrop'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAF))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IR/IRA/IRAD, '-',  record/metadata/schede/*/IR/IRA/IRAD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAG">
					<arco-dd:hasOrientation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/*/IR/IRA/IRAG)))" />
					</xsl:attribute>
					</arco-dd:hasOrientation>
				</xsl:if>
			</rdf:Description>
		</xsl:if>						
		<!-- OutCrop type as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAF))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/OutcropType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAF)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>				
		<!-- Time interval as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IR/IRA/IRAD, '-',  record/metadata/schede/*/IR/IRA/IRAD)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="concat(record/metadata/schede/*/IR/IRA/IRAD, ' - ', record/metadata/schede/*/IR/IRA/IRAD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="concat(record/metadata/schede/*/IR/IRA/IRAD, ' - ', record/metadata/schede/*/IR/IRA/IRAD)" />
				</l0:name>
				<arco-arco:startTime>
					<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAD" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAD" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<!-- Bibliography as individual -->					
		<xsl:for-each select="record/metadata/schede/*/IR/IRA/IRAB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
		       	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	           	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="." />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:for-each>	
		</xsl:if>
		<!-- Cultural entity technical status -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC or record/metadata/schede/BNPE/SR/SRC/SRCD or record/metadata/schede/BNPE/SR/SRC/SRCM or record/metadata/schede/BNPE/SR/SRC/SRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MetamorphicGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Roundness'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPE/RR">
			<xsl:if test="./RRC/RRCD or ./RRC/RRCM or ./RRC/RRCT or ./RRF/RRFC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 				</xsl:attribute>
	 				<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="./RRC/RRCF">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRF/RRFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCD">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRF/RRFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRF/RRFC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRF/RRFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRF/RRFC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCM)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MetamorphicGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCT)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCT)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Roundness'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
		<!--  Measurement collection as individual  -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD or record/metadata/schede/BNPE/SR/SRG/SRGS  or record/metadata/schede/BNPE/SR/SRG/SRGP or record/metadata/schede/BNPE/SR/SRG/SRGA or record/metadata/schede/BNPE/SR/SRG/SRGB or record/metadata/schede/BNPE/SR/SRG/SRGC or record/metadata/schede/BNPE/SR/SRG/SRGE or record/metadata/schede/BNPE/SR/SRG/SRGR or record/metadata/schede/BNPE/SR/SRF/SRFV or record/metadata/schede/BNPE/SR/SRF/SRFI  or record/metadata/schede/BNPE/SR/SRM/SRMN or record/metadata/schede/BNPE/SR/SRF/SRFP">
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
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-density')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGS">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-cohesion')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGP">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-primary-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-secondary-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-effective-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-permeability-coefficient')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGR">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-electrical-resistivity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFI">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-colour-index')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRM/SRMN">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-normative-mineralogy')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFP">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-paleomagnetism')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-density')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Density')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGD)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGD)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGD" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGS">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-cohesion')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Cohesion')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-cohesion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGS)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-cohesion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGS)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGS" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGS" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGP">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Porosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGA">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-primary-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'PrimaryPorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-primary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGA)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-primary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGA)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGB">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-secondary-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'SecondaryPorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-secondary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGB)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-secondary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGB)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGB" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGB" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGC">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-effective-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'EffectivePorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-effective-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGC)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-effective-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGC)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGC" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGC" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGE">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-permeability-coefficient')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'PermeabilityCoefficient')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-permeability-coefficient', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGE)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-permeability-coefficient', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGE)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGE" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGE" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGR">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-electrical-resistivity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'ElectricalResistivity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-electrical-resistivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGR)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-electrical-resistivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGR)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGR" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGR" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFV">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Radioactivity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFV)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFV)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFV" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFV" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFI">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-colour-index')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'ColourIndex')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-colour-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFI)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-colour-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFI)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFI" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFI" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRM/SRMN">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-normative-mineralogy')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'NormativeMineralogy')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-normative-mineralogy', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRM/SRMN)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-normative-mineralogy', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRM/SRMN)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRM/SRMN" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRM/SRMN" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFP">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-paleomagnetism')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Paleomagnetism')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-paleomagnetism', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-paleomagnetism', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>								
		<!-- Alteration grade as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)), 'nessuna'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'AlterationGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AlterationGrade'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<!-- Alteration type as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCH">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'AlterationType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AlterationType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<!-- Eruptive type as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'EruptiveType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/EruptiveType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<!-- Sedimentary structure as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PrimarySedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SecondarySedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiogenicSedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<!-- Texture as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR or record/metadata/schede/BNPE/SR/SRC/SRCX or record/metadata/schede/BNPE/SR/SRC/SRCC or record/metadata/schede/BNPE/SR/SRC/SRCG or record/metadata/schede/BNPE/SR/SRC/SRCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Texture'" />
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
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF or record/metadata/schede/BNPE/SR/SRC/SRCG">
					<arco-spe:hasGrains>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Grains/', $itemURI)" />
						</xsl:attribute>
					</arco-spe:hasGrains>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCX">
					<arco-spe:hasMatrix>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)))" />
						</xsl:attribute>
					</arco-spe:hasMatrix>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCC">
					<arco-spe:hasCement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)))" />
						</xsl:attribute>
					</arco-spe:hasCement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TextureType'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF or record/metadata/schede/BNPE/SR/SRC/SRCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Grains/', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Grains'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF">
						<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)))" />
							</xsl:attribute>
						</arco-dd:hasShape>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCG">
						<arco-spe:hasContactType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)))" />
							</xsl:attribute>
						</arco-spe:hasContactType>
					</xsl:if>	
				</rdf:Description>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    	       				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/ContactType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>	
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Matrix'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cement'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRC">
			<xsl:if test="./RRCR or ./RRCX or ./RRCC or ./RRCG or ./RRCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Texture'" />
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
				<xsl:if test="./RRCR">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RRCR)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="./RRCF or ./RRCG">
					<arco-spe:hasGrains>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Grains/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-spe:hasGrains>
				</xsl:if>
				<xsl:if test="./RRCX">
					<arco-spe:hasMatrix>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(./RRCX)))" />
						</xsl:attribute>
					</arco-spe:hasMatrix>
				</xsl:if>
				<xsl:if test="./RRCC">
					<arco-spe:hasCement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(./RRCC)))" />
						</xsl:attribute>
					</arco-spe:hasCement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRCR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RRCR)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TextureType'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCR)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRCF or ./RRCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Grains/', $itemURI, '-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Grains'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="./RRCF">
						<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRCF)))" />
							</xsl:attribute>
						</arco-dd:hasShape>
					</xsl:if>
					<xsl:if test="./RRCG">
						<arco-spe:hasContactType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(./RRCG)))" />
							</xsl:attribute>
						</arco-spe:hasContactType>
					</xsl:if>	
				</rdf:Description>
				<xsl:if test="./RRCF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRCF)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./RRCF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./RRCF)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    	       				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./RRCG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(./RRCG)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/ContactType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./RRCG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./RRCG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>	
			</xsl:if>
			<xsl:if test="./RRCX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(./RRCX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Matrix'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCX)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(./RRCC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cement'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCC)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		</xsl:for-each>
		<!-- Mineral Presence as individual -->
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
	            <arco-spe:mainMineral>
	            	<xsl:value-of select="true()" />
	            </arco-spe:mainMineral>
				<arco-spe:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-spe:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMA">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
	            <arco-spe:secondaryMineral>
	            	<xsl:value-of select="true()" />
	            </arco-spe:secondaryMineral>
				<arco-spe:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-spe:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-revised', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
	            <arco-spe:mainMineral>
	            	<xsl:value-of select="true()" />
	            </arco-spe:mainMineral>
				<arco-spe:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-spe:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMA">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-revised', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
	            <arco-spe:secondaryMineral>
	            	<xsl:value-of select="true()" />
	            </arco-spe:secondaryMineral>
				<arco-spe:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-spe:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
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
		<!-- Fossil as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Fossil/',  arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Fossil'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)" />
				</l0:name>
			</rdf:Description>	
		</xsl:if>
		<!-- Age interpretation as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AgeInterpretation'" />
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
				<arco-spe:relativeAge>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLE)" />
				</arco-spe:relativeAge>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRL/RRLE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AgeInterpretation'" />
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
				<arco-spe:relativeAge>
					<xsl:value-of select="normalize-space(.)" />
				</arco-spe:relativeAge>
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRR">
		<xsl:if test="./SRRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AgeInterpretation'" />
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
				<arco-spe:absoluteAge>
					<xsl:value-of select="./SRRE" />
				</arco-spe:absoluteAge>
				<xsl:if test="./SRRM">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./SRRM)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./SRRM)))" />
	              </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                   <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
	                </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./SRRM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./SRRM)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRR">
		<xsl:if test="./RRRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-revised-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/AgeInterpretation'" />
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
				<arco-spe:absoluteAge>
					<xsl:value-of select="normalize-space(./RRRE)" />
				</arco-spe:absoluteAge>
				<xsl:if test="./RRRM">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./RRRM)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./RRRM)))" />
	              </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                   <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
	                </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRRM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRRM)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
		<!-- Type specimen as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRT/SRTT)), 'non tipo'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeSpecimenIdentification'" />
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
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTB">	
					<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
					</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTT">	
					<arco-spe:hasTypeOfTypeSpecimen>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPE/SR/SRT/SRTT))" />
					</xsl:attribute>
					</arco-spe:hasTypeOfTypeSpecimen>
				</xsl:if>								
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRN">
				<arco-spe:producesTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-spe:producesTaxon>
				</xsl:if>		
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTA">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
	        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPE/SR/SRT/SRTA))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTB">
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
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTB" />
					</arco-cd:completeBibliographicReference>			
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPE/SR/SRT/SRTT))" />
			        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
		            	</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTT" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPE/SR/SRT/SRTA))" />
					</xsl:attribute>
	    	        <rdf:type>
						<xsl:attribute name="rdf:resource">
		       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPE/RR"> 
			<xsl:if test="./RRT/RRTT and not(starts-with(lower-case(normalize-space(./RRT/RRTT)), 'non tipo'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeSpecimenIdentification'" />
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
				<xsl:if test="./RRT/RRTB">	
					<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
					</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:if test="./RRT/RRTT">	
					<arco-spe:hasTypeOfTypeSpecimen>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RRT/RRTT))" />
					</xsl:attribute>
					</arco-spe:hasTypeOfTypeSpecimen>
				</xsl:if>								
				<xsl:if test="./RRN">
				<arco-spe:producesTaxon>
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
				</arco-spe:producesTaxon>
				</xsl:if>		
				<xsl:if test="./RRT/RRTA">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
	        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RRT/RRTA))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRT/RRTB">
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
						<xsl:value-of select="./RRT/RRTB" />
					</arco-cd:completeBibliographicReference>			
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRT/RRTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RRT/RRTT))" />
			        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
		            	</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./RRT/RRTT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RRT/RRTT" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRT/RRTA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RRT/RRTA))" />
					</xsl:attribute>
	    	        <rdf:type>
						<xsl:attribute name="rdf:resource">
		       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="./RRT/RRTA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RRT/RRTA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>