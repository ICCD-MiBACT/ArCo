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

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="1.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


	
	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*)" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS"
		select="$NS,''" /-->
	<xsl:param name="NS" />
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
	<xsl:variable name="culturalProperty" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />	
	<xsl:variable name="smnv">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/SM/SMN/SMNV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SM/SMN/SMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SM/SMN/SMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(record/metadata/schede/*/SM/SMN/SMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable> 
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/RM/RMN/RMNV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RM/RMN/RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RM/RMN/RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(record/metadata/schede/*/RM/RMN/RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable> 
	<xsl:variable name="smnv-label">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/SM/SMN/SMNV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SM/SMN/SMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SM/SMN/SMNV)), 'n.r')))">
				<xsl:value-of select="concat(' ', record/metadata/schede/*/SM/SMN/SMNV)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable> 
	<xsl:variable name="rmnv-label">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/RM/RMN/RMNV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RM/RMN/RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RM/RMN/RMNV)), 'n.r')))">
				<xsl:value-of select="concat(' ', record/metadata/schede/*/RM/RMN/RMNV)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable> 
		
<xsl:template match="/">
	<rdf:RDF>

							<!-- Properties of MineralHeritage -->
	
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<xsl:if test="$sheetType='BNM'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MineralHeritage'" />
		        </xsl:attribute>
			</rdf:type>			
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/Specimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:isClassifiedByCurrentTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    </xsl:choose>
			</arco-mp:isClassifiedByCurrentTaxon>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:choose>
							<xsl:when test="./RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(./RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNI)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="./RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(./RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNA)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
			
		<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/LR">
			<arco-mp:hasSpecimenHarvesting>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasSpecimenHarvesting>
		</xsl:if>				
		<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/RM/RMT/RMTT)), 'non tipo'))">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SMA/SMAI">
			<arco-mp:hasInclusion>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Inclusion/', arco-fn:urify(.))" />
				</xsl:attribute>
			</arco-mp:hasInclusion>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAZ and starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAZ)), 'presente')">
			<arco-mp:zoning>
            	<xsl:value-of select="true()" />
			</arco-mp:zoning>
		</xsl:if>
		<xsl:if test="not(record/metadata/schede/BNM/SM/SMA/SMAZ) or record/metadata/schede/BNM/SM/SMA/SMAZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAZ)), 'presente'))">
			<arco-mp:zoning>
            	<xsl:value-of select="false()" />
			</arco-mp:zoning>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFR and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFR)), 'non rilevata'))">
			<arco-mp:radioactivity>
            	<xsl:value-of select="true()" />
			</arco-mp:radioactivity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAB or record/metadata/schede/BNM/SM/SMA/SMAA or record/metadata/schede/BNM/SM/SMA/SMAF or record/metadata/schede/BNM/SM/SMA/SMAG or record/metadata/schede/BNM/SM/SMA/SMAP or record/metadata/schede/BNM/SM/SMA/SMAS or record/metadata/schede/BNM/RM/RMA/RMAB or record/metadata/schede/BNM/RM/RMA/RMAA or record/metadata/schede/BNM/RM/RMA/RMAF or record/metadata/schede/BNM/RM/RMA/RMAG or record/metadata/schede/BNM/RM/RMA/RMAP or record/metadata/schede/BNM/RM/RMA/RMAS">
			<arco-mp:hasCrystal>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Crystal/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasCrystal>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-dd:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicallCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
            	</xsl:attribute>
			</arco-dd:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasOpticalPhenomena>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
            	</xsl:attribute>
			</arco-mp:hasOpticalPhenomena>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasMagnetism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
            	</xsl:attribute>
			</arco-mp:hasMagnetism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasFluorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
            	</xsl:attribute>
			</arco-mp:hasFluorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPhosphorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
            	</xsl:attribute>
			</arco-mp:hasPhosphorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasFracture>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
            	</xsl:attribute>
			</arco-mp:hasFracture>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-dd:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
            	</xsl:attribute>
			</arco-dd:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
            	</xsl:attribute>
			</arco-mp:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
            	</xsl:attribute>
			</arco-mp:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
            	</xsl:attribute>
			</arco-mp:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
		<xsl:if test="./RMFV or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:hasRefraction>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Refraction/', arco-fn:arcofy(.))" />
				</xsl:attribute>
			</arco-mp:hasRefraction>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMO and not(record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:hasReflectance>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Reflectance/', arco-fn:arcofy(.))" />
				</xsl:attribute>
			</arco-mp:hasReflectance>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMR">
				<arco-mp:internalReflection>
            		<xsl:value-of select="true()" />
				</arco-mp:internalReflection>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMM and not(record/metadata/schede/BNM/SM/SMM or record/metadata/schede/BNM/SM/SMO)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>	
		<xsl:for-each select="record/metadata/schede/BNM/RM">
			<xsl:if test="./RMF or ./RMO or ./RMM">
				<xsl:if test="./RMF/RMFC or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMF/RMFU or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</rdf:Description>
	
					<!-- Cultural entity technical status -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF or record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM">
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC or record/metadata/schede/BNM/SM/SMF/SMFO or record/metadata/schede/BNM/SM/SMF/SMFM or record/metadata/schede/BNM/SM/SMF/SMFL or record/metadata/schede/BNM/SM/SMF/SMFS or record/metadata/schede/BNM/SM/SMF/SMFU or record/metadata/schede/BNM/SM/SMM/SMMC or record/metadata/schede/BNM/SM/SMM/SMMA or record/metadata/schede/BNM/SM/SMM/SMMP or record/metadata/schede/BNM/SM/SMO/SMOP">
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
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Cultural entity technical status -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
	<xsl:if test="./RMF or ./RMO or ./RMM">
		<xsl:if test="./RMF/RMFC or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMF/RMFU or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
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
				<xsl:if test="./RMF/RMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMO/RMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
				<!-- Physical characteristic as individual -->
	<xsl:if test="./RMF/RMFC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFO)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFO)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/OpticalPhenomena'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFM)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Magnetism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFL)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFL)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fluorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFS)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Phosphorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFU)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fracture'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMA)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Anisotropy'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMO/RMOP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMO/RMOP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMO/RMOP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
	
						<!-- Physical characteristic as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/OpticalPhenomena'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Magnetism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fluorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Phosphorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fracture'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Anisotropy'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	
						<!-- Measurement collection as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
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
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	
								<!-- measurement as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>

								<!-- Value as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
					<!-- Measurement collection as individual -->
	<xsl:if test="./RMFV or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
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
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</l0:name>
			<xsl:if test="./RMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	
								<!-- measurement as individual -->
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', ./RMFV)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', ./RMFD)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', ./RMFF)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', ./RMFH)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', ./RMFN)" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>

								<!-- Value as individual -->
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', ./RMFV)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', ./RMFD)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', ./RMFF)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', ./RMFH)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', ./RMFH)" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
						<!-- Taxon of mineral property -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNV">
		<rdf:Description>
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv)" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv)" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:otherwise>
		   </xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, $smnv-label, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, $smnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, $smnv-label, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, $smnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, $smnv-label, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, $smnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, $smnv-label, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, $smnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
		  		</l0:name>
			</xsl:if>
			<arco-mp:hasDirectHigherRank>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
			   					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		   						</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
			   		</xsl:when>
			   		<xsl:otherwise>
		   				<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
			   						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
			   					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		   						</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
			    </xsl:choose>
           	</arco-mp:hasDirectHigherRank>
		</rdf:Description>
	</xsl:if>
					<!-- Taxon when not SMNV -->
	<rdf:Description>
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:otherwise>
		   </xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNI)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA, ' ', record/metadata/schede/BNM/SM/SMN/SMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMN/SMNA)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC or record/metadata/schede/BNM/SM/SMS/SMSS">
				<arco-mp:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMS/SMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSS">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>						
						<!-- Taxon of mineral property -->	
	<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNV">
		<rdf:Description>
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)), $rmnv)" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)), $rmnv)" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:otherwise>
		   </xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, $rmnv-label, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, $rmnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNA">
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, $rmnv-label, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, $rmnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, $rmnv-label, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, $rmnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNA">
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, $rmnv-label, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, $rmnv-label)" />
						</xsl:otherwise>
					</xsl:choose>
		  		</l0:name>
			</xsl:if>
			<arco-mp:hasDirectHigherRank>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
			   					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)))" />
		   						</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
			   		</xsl:when>
			   		<xsl:otherwise>
		   				<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
								<xsl:attribute name="rdf:resource">
			   						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
			   					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		   							<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)))" />
		   						</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
			    </xsl:choose>
           	</arco-mp:hasDirectHigherRank>
		</rdf:Description>
	</xsl:if>
					<!-- Taxon when not RMNV -->
	<rdf:Description>
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNI)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)), '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNP)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
		    				<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMN/RMNA)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
		    </xsl:otherwise>
		   </xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNA">
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNI">
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNI)" />
						</xsl:otherwise>
					</xsl:choose>
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMN/RMNA">
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMN/RMNP">
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA, ' ', record/metadata/schede/BNM/RM/RMN/RMNP)" />
						</xsl:when>
						<xsl:otherwise>
	   						<xsl:value-of select="concat(record/metadata/schede/BNM/RM/RMN/RMNA)" />
						</xsl:otherwise>
					</xsl:choose>
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSD">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSD)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSC or record/metadata/schede/BNM/RM/RMS/RMSS">
				<arco-mp:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/RM/RMS/RMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSS">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSS" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSS" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSC">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSC)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSC">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSC" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/RM/RMS/RMSD">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/RM/RMS/RMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/RM/RMS/RMSD" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	
								<!-- Classification in time -->
	<rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione nel tempo  del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
				</xsl:choose>
			</arco-mp:hasTaxon>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione nel tempo  del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:choose>
							<xsl:when test="./RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(./RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNI)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="./RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(./RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMNA)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:hasTaxon>
		</xsl:for-each>
	</rdf:Description>
	

							<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
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
			<xsl:if test="./SMET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./SMET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SMEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./SMEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
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
			<xsl:if test="./RMET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./RMET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./RMEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./RMEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>

								<!-- Specimen Harvesting as individual -->
	<xsl:if test="record/metadata/schede/*/LR and not($sheetType='BNB')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SpecimenHarvesting'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
<!-- inserire funzione split name con /  -->
					<arco-mp:hasHarvestingOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingOperator>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
					<arco-mp:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingResponsible>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
					<arco-mp:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingResponsible>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
					<arco-mp:hasHarvestingSponsor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingSponsor>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIE">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIE)" />
				</arco-core:note>
			</xsl:if>			
			<arco-location:hasTimeIndexedTypedLocation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
				</xsl:attribute>
			</arco-location:hasTimeIndexedTypedLocation>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
				<arco-location:hasHarvestingMethod>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
					</xsl:attribute>
				</arco-location:hasHarvestingMethod>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU">
				<arco-location:hasHarvestingMotivation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
					</xsl:attribute>
				</arco-location:hasHarvestingMotivation>
			</xsl:if>
		</rdf:Description>
	</xsl:if>	
					
								<!-- Harvesting Method as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/HarvestingMethod'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	
								<!-- Harvesting Motivation as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/HarvestingMotivation'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>				
							
							<!-- Time indexed typed location as individual -->
	<xsl:if test="record/metadata/schede/*/LR and not($sheetType='BNB')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAM or record/metadata/schede/*/IM/IMA/IMAR or record/metadata/schede/*/IM/IMA/IMAT or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF">
				<arco-mp:hasGeologicalContex>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasGeologicalContex>
			</xsl:if>						
			<arco-location:hasLocationType>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="'https://w3id.org/arco/ontology/location/CollectingLocation'" />
            	</xsl:attribute>
			</arco-location:hasLocationType>			
			<xsl:for-each select="record/metadata/schede/*/LR/LRV">
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
	                </xsl:attribute>
				</arco-location:atLocation>
			</xsl:for-each>
		</rdf:Description>
	</xsl:if>
					
					<!-- Feature as individual -->
	<xsl:for-each select="record/metadata/schede/*/LR/LRV">
	<!-- Specificare la divisione in continente, città etc... -->
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(normalize-space(./LRVS), ' - ', normalize-space(./LRVP),  ' - ', normalize-space(./LRVC))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(normalize-space(./LRVS), ' - ', normalize-space(./LRVP),  ' - ', normalize-space(./LRVC))" />
			</l0:name>			
		</rdf:Description>
	</xsl:for-each>		
					
					<!-- Geological context as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAM or record/metadata/schede/*/IM/IMA/IMAR or record/metadata/schede/*/IM/IMA/IMAT or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of Collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of Collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAR or record/metadata/schede/*/IM/IMA/IMAM or record/metadata/schede/*/IM/IMA/IMAT">
				<arco-mp:hasMineralDeposit>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasMineralDeposit>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD">
				<arco-mp:hasOutcrop>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasOutcrop>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC">
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAC" />
				</arco-core:description>
			</xsl:if>
		</rdf:Description>
	</xsl:if>						
	
						<!-- Mineral deposit as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAR or record/metadata/schede/*/IM/IMA/IMAM or record/metadata/schede/*/IM/IMA/IMAT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAR">
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDeposit'" />
	            		</xsl:attribute>
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAM">
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/Mine'" />
	            		</xsl:attribute>
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAT">
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/Geotope'" />
	            		</xsl:attribute>
					</xsl:when>
				</xsl:choose>	
			</rdf:type>
			<rdfs:label>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAR">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAR)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAM">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAM)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAT">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAT)" />
					</xsl:when>
				</xsl:choose>
			</rdfs:label>
			<l0:name>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAR">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAR)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAM">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAM)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/IM/IMA/IMAT">
	            		<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAT)" />
					</xsl:when>
				</xsl:choose>
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
				<arco-mp:hasMineralDepositType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
					</xsl:attribute>
				</arco-mp:hasMineralDepositType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
				<arco-mp:hasMineralDepositType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
					</xsl:attribute>
				</arco-mp:hasMineralDepositType>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	
							<!-- Mineral Deposit Type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
					
						<!-- OutCrop as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Outcrop'" />
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
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>						
					
					<!-- OutCrop type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/OutcropType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>				
										
					<!-- Time interval as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	
					<!-- Type specimen identification as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
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
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv, '-',arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)), $smnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    </xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
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
					<xsl:value-of select="concat('Bibliography about type specime of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>	
						
						<!-- Type specimen identification as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
		<xsl:if test="./RMT/RMTT and not(starts-with(lower-case(normalize-space(./RMTT)), 'non tipo'))">
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
			<xsl:if test="./RMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RMTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./RMN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="./RMN/RMNI">
						<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'InorganicTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    </xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>

		<xsl:if test="./RMT/RMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
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
					<xsl:value-of select="concat('Bibliography about type specime of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="./RMT/RMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RMT/RMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMT/RMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
	
	
					
					<!-- Author as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/CPV/Person'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	
	
	
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>