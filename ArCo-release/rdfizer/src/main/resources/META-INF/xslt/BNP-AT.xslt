<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
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
	
	
	<xsl:if test="$sheetType='BNP'">			
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PaleontologicalHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<!-- identifier -->
		<xsl:if test="$sheetType='BNP' and (record/metadata/schede/BNP/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNP/OG/OGT/OGTD)), 'collezione'))">
			<xsl:if test="record/metadata/schede/BNP/AC/ACO">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNP/AC/ACO" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNP/AC/ACO))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNP' and (record/metadata/schede/BNP/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNP/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNP/AC/ACK">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNP/AC/ACK" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNP/AC/ACK))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<!-- taxon 	 -->
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPS">
			<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(./SPSR)), '-', arco-fn:urify(normalize-space(./SPSS)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(./SPSS))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./SPST)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(./SPSR, ' ', ./SPSS)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./SPSS" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat(' ', ./SPST)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
			<arco-spe:isIdentifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-spe:isIdentifiedBy>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
			<!-- identification in time  -->
			<arco-spe:hasIdentificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification-', position())" />
				</xsl:attribute>
			</arco-spe:hasIdentificationInTime>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-identification-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each> 
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPE">
			<arco-dd:hasAffixedElement>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasAffixedElement>			
		</xsl:for-each>
		<!-- hostRock -->
		<xsl:if test="record/metadata/schede/BNP/ET/ETA/ETAO">
			<arco-spe:hasHostRock>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/BNP/ET/ETA/ETAO))" />
				</xsl:attribute>
			</arco-spe:hasHostRock>
		</xsl:if>
		<!-- sex -->
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPZ">
			<xsl:if test="./SPZS">
				<arco-cd:hasSex>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Sex/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-cd:hasSex>
				<arco-lite:sexInformation>
					<xsl:value-of select="normalize-space(./SPZS)" />
				</arco-lite:sexInformation>
			</xsl:if>		
		</xsl:for-each>
		<!-- development stage -->
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPZ">
			<xsl:if test="./SPZV">
				<arco-cd:hasDevelopmentStage>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'DevelopmentStage/', arco-fn:urify(normalize-space(./SPZV)))" />
					</xsl:attribute>
				</arco-cd:hasDevelopmentStage>
			</xsl:if>		
		</xsl:for-each>
		<!-- original material -->	
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPZ">
			<xsl:if test="lower-case(normalize-space(./SPZM))='si'">
				<arco-spe:originalMaterial>
					<xsl:value-of select="true()" />
				</arco-spe:originalMaterial>
			</xsl:if>
		</xsl:for-each>	
		<!-- specimen harvesting -->	
		<xsl:for-each select="record/metadata/schede/*/LR">
			<xsl:if test="not(contains(normalize-space(lower-case(./LRT)), 'sconosciuta')) and not (contains(normalize-space(lower-case(./LRT)), 'n.r'))  and not (contains(normalize-space(lower-case(./LRT)), 'nr'))">
				<arco-spe:hasSpecimenHarvesting>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI, position())" />
					</xsl:attribute>
				</arco-spe:hasSpecimenHarvesting>
				<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location-', position())" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
			</xsl:if>
		</xsl:for-each>
		<!-- typification in time -->	
		<xsl:for-each select="record/metadata/schede/BNP/SP/SPM">
			<xsl:if test="lower-case(normalize-space(./SPMT))='si'">
				<arco-spe:hasTypification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Typification/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-spe:hasTypification>
			</xsl:if>
		</xsl:for-each>	
	</rdf:Description>
	<!-- identifier -->
	<xsl:if test="$sheetType='BNP' and (record/metadata/schede/BNP/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNP/OG/OGT/OGTD)), 'collezione'))">
		<xsl:if test="record/metadata/schede/BNP/AC/ACO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNP/AC/ACO))" />
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
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACO" />
				</l0:name>
				<arco-core:identifier>
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACO" />
				</arco-core:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNP' and (record/metadata/schede/BNP/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNP/OG/OGT/OGTD)), 'campione'))">
		<xsl:if test="record/metadata/schede/BNP/AC/ACK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNP/AC/ACK))" />
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
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACK" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACK" />
				</l0:name>
				<arco-core:identifier>
					<xsl:value-of select="record/metadata/schede/BNP/AC/ACK" />
				</arco-core:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- IdentificationInTime as individual	 --> 
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPS">
		<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(./SPSR)), '-', arco-fn:urify(normalize-space(./SPSS)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(./SPSS))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./SPST)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(./SPSR, ' ', ./SPSS)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./SPSS" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat(' ', ./SPST)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification-', position())" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione ', position(), 'del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione ', position(), 'del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:if test="./SPSC">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SPSC))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./SPSL">
			<xsl:variable name="virgola" select="./SPSL" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<arco-core:hasTaxon>
				<xsl:attribute name="rdf:resource">
	    	    	<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:hasTaxon>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification-', position())" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), 'del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), 'del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:if test="./SPSC">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SPSC))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./SPSL">
			<xsl:variable name="virgola" select="./SPSL" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<arco-core:hasTaxon>
				<xsl:attribute name="rdf:resource">
	    	    	<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:hasTaxon>
		</rdf:Description>
	</xsl:for-each> 
	<!-- BiologicalTaxon as individual 	--> 
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPS">
		<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(./SPSR)), '-', arco-fn:urify(normalize-space(./SPSS)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(./SPSS))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./SPST)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(./SPSS, ./SPSR))">
						<xsl:value-of select="concat(./SPSR, ' ', ./SPSS)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./SPSS" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="./SPST">
						<xsl:value-of select="concat(' ', ./SPST)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$BiologicalTaxon" />
	        </xsl:attribute>    
			<rdfs:label>
            	 <xsl:value-of select="$BiologicalTaxonLabel" />
           	</rdfs:label>
	           <l0:name>
    	       	<xsl:value-of select="$BiologicalTaxonLabel" />
            </l0:name>		
		</rdf:Description>																	
		<xsl:if test="./SPST">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	       <xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />	
            	</xsl:attribute>
	            <rdf:type>
    	        	<xsl:attribute name="rdf:resource">
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Subspecies'" />      
            		</xsl:attribute>
	            </rdf:type>
	            <xsl:for-each select="../SPV">
					<arco-cd:synonym>
						<xsl:value-of select="." />
					</arco-cd:synonym>
				</xsl:for-each>
    	        <rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
					</xsl:call-template>
	            </rdfs:label>
    	        <l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
					</xsl:call-template>
	            </l0:name>
	            <xsl:if test="./SPSA">
 					<arco-lite:hasAuthor>
    	    	    	<xsl:attribute name="rdf:resource">
        	    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./SPSA))" />
		            	</xsl:attribute>
        	    	</arco-lite:hasAuthor>
            	</xsl:if>
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
					</xsl:attribute>	
				</arco-spe:hasDirectHigherRank>	
  			</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
				</xsl:attribute>
				<xsl:if test="./SPSR">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSR))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Species'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="$sps-species-lab" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="$sps-species-lab" />
					</xsl:call-template>
				</l0:name>
				<xsl:if test="./SPSD">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./SPSD))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="./SPSR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSR))" />
	            </xsl:attribute>
				<xsl:if test="./SPSF">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSF))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSR" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSR" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSF))" />
	            </xsl:attribute>
    	        <xsl:if test="./SPSO">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSO))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Family'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSF" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSF" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSO))" />
	            </xsl:attribute>
    	        <xsl:if test="./SPSB">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSB))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Order'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSO" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSO" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSB))" />
	            </xsl:attribute>
    	        <xsl:if test="./SPSH">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSH))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Class'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSB" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSB" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSH">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSH))" />
	            </xsl:attribute>
    	       <xsl:if test="./SPSP">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSP))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Phylum'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSH" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSH" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SPSP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SPSP))" />
	            </xsl:attribute>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Kingdom'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SPSP" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SPSP" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Time Interval as individual -->
	<xsl:for-each select ="record/metadata/schede/BNP/SP/SPS">
		<xsl:if test ="./SPSC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SPSC))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./SPSC" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./SPSC" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="./SPSC" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="./SPSC" />
			</arco-arco:endTime>
			<tiapit:time>
				<xsl:value-of select="./SPSC" />
			</tiapit:time>
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>			
	<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AffixedElement'" />
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
			<arco-core:hasType>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/SpecimenLabel'" />
	            </xsl:attribute>
			</arco-core:hasType>
			<xsl:if test="./SPET">
				<arco-spe:bodyTranscript>
					<xsl:value-of select="normalize-space(./SPET)" />
				</arco-spe:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SPEI">
				<arco-spe:headingTranscript>
					<xsl:value-of select="normalize-space(./SPEI)" />
				</arco-spe:headingTranscript>
			</xsl:if>		
		</rdf:Description> 
	</xsl:for-each>
	<!-- Host rock as individual -->							
	<xsl:if test="record/metadata/schede/BNP/ET/ETA/ETAO">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/BNP/ET/ETA/ETAO))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/HostRock'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNP/ET/ETA/ETAO" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNP/ET/ETA/ETAO" />
            </l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Sex as individual  -->
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPZ">
		<xsl:if test="./SPZS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Sex/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sesso ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sesso ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sex ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Sex ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SPZS">
				<arco-cd:sex>
					<xsl:value-of select="normalize-space(./SPZS)" />
				</arco-cd:sex>
			</xsl:if>		
		</rdf:Description>
		</xsl:if> 
	</xsl:for-each>
	<!-- Development stage as individual  -->
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPZ">
		<xsl:if test="./SPZV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'DevelopmentStage/', arco-fn:urify(normalize-space(./SPZV)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DevelopmentStage'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./SPZV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./SPZV" />
			</l0:name>		
		</rdf:Description>
		</xsl:if> 
	</xsl:for-each>
	
	<xsl:for-each select="record/metadata/schede/*/LR">
		<xsl:variable name="parentPosition">
			<xsl:value-of select="position()" />
		</xsl:variable>	
		<xsl:if test="not(contains(normalize-space(lower-case(./LRT)), 'sconosciuta')) and not (contains(normalize-space(lower-case(./LRT)), 'n.r'))  and not (contains(normalize-space(lower-case(./LRT)), 'nr'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI, position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SpecimenHarvesting'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Raccolta ', position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Raccolta ', position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Harvesting ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Harvesting ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:for-each select="./LRL">
				<arco-location:hasToponymInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-location:hasToponymInTime>
				<arco-lite:toponym>
					<xsl:value-of select="(normalize-space(.))" />
				</arco-lite:toponym>
			</xsl:for-each>
			<xsl:for-each select="./LRI/LRIL">
				<xsl:variable name="lril-virgola" select="." />
				<xsl:variable name="lril-novirgola" select="translate($lril-virgola, ',', ' ')" />
				<xsl:variable name="lirl" select="translate($lril-novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($lirl)" />
				<xsl:for-each select="$authorssplit">
					<arco-spe:hasHarvestingOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-spe:hasHarvestingOperator>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="./LRI/LRIY">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./LRI/LRIY))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="contains(normalize-space(lower-case(./LRT)), 'aggiornati')">
				<arco-core:current>
		            	<xsl:value-of select="true()" />
        		    </arco-core:current>	
			</xsl:if>
			<xsl:if test="contains(normalize-space(lower-case(./LRT)), 'storici')">
				<arco-core:current>
		            	<xsl:value-of select="false()" />
        		    </arco-core:current>	
			</xsl:if>
			<xsl:if test="./LRV">
				<clvapit:hasSpatialCoverage>
					<xsl:choose>
						<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</clvapit:hasSpatialCoverage>
			</xsl:if>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Localizzazione ', position(), ' della raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Localizzazione ', position(), ' della raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Collecting location ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Collecting location ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./LRI/LRIR">
				<arco-location:hasNaturalEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI, '-', $parentPosition)" />
					</xsl:attribute>
				</arco-location:hasNaturalEnvironment>
			</xsl:if>	
			<!-- at location -->
			<xsl:for-each select="./LRV">
				<arco-location:atLocation>
					<xsl:choose>
						<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-location:atLocation>
			</xsl:for-each>
		</rdf:Description>
		<!-- Time interval as individual -->
		<xsl:if test="./LRI/LRIY">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./LRI/LRIY)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./LRI/LRIY)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./LRI/LRIY)" />
				</l0:name>
				<tiapit:time>
					<xsl:value-of select="normalize-space(./LRI/LRIY)" />
				</tiapit:time>
				<arco-arco:startTime>
					<xsl:value-of select="normalize-space(./LRI/LRIY)" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="normalize-space(./LRI/LRIY)" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRI/LRIR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI, '-', $parentPosition)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironment'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Ambiente naturale relativo al luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Ambiente naturale relativo al luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Natural environment of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Natural environment of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(./LRI/LRIR))" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="./LRI/LRIO">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>		
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(./LRI/LRIR))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironmentType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./LRI/LRIR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./LRI/LRIR" />
				</l0:name>		
			</rdf:Description>
			<xsl:if test="./LRI/LRIO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
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
					<xsl:if test="./LRI/LRIO">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>		
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', ./LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', ./LRI/LRIO)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', ./LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', ./LRI/LRIO)" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Depth')" />
					</arco-core:hasType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./LRI/LRIO))" />
					</arco-dd:hasValue>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./LRI/LRIO))" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:extract-value(./LRI/LRIO))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="arco-fn:extract-value(./LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="arco-fn:extract-value(./LRI/LRIO)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="arco-fn:extract-value(./LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="arco-fn:extract-value(./LRI/LRIO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>		
		<!-- Feature as individual -->
		<xsl:for-each select="record/metadata/schede/*/LR/LRV">
		<xsl:variable name="lrvk">
		<xsl:choose>
			<xsl:when test="./LRVK and (not(starts-with(lower-case(normalize-space(./LRVK)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVK)), 'n.r')))">
				<xsl:value-of select="concat(normalize-space(arco-fn:urify(./LRVK)), ' - ')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvs">
		<xsl:choose>
			<xsl:when test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
				<xsl:value-of select="normalize-space(arco-fn:urify(./LRVS))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>	
		<xsl:variable name="lrvr">
		<xsl:choose>
			<xsl:when test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVR)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvp">
		<xsl:choose>
			<xsl:when test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVP)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvc">
		<xsl:choose>
			<xsl:when test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVC)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvl">
		<xsl:choose>
			<xsl:when test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrve">
		<xsl:choose>
			<xsl:when test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVE)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="address-label">
		<xsl:value-of select="concat($lrvk, $lrvs, $lrvr, $lrvp, $lrvc, $lrvl, $lrve)" />
		</xsl:variable>
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</l0:name>
			<clvapit:hasAddress>
				<xsl:choose>
					<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</clvapit:hasAddress>
			<xsl:for-each select="./LRL">
				<arco-location:hasToponymInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-location:hasToponymInTime>
			</xsl:for-each>
			<xsl:if test="./LRS and (not(starts-with(lower-case(normalize-space(./LRS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRS)), 'n.r')))">
				<arco-core:specifications>
					<xsl:value-of select="normalize-space(./LRS)" />
				</arco-core:specifications>
			</xsl:if>	
		</rdf:Description>
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</l0:name>
			<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:if>
			<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:if>
			<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
				<clvapit:hasCountry>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
					</xsl:attribute>
				</clvapit:hasCountry>
			</xsl:if>
			<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
				<xsl:choose>
					<xsl:when test="./LRVC and (starts-with(lower-case(normalize-space(./LRVC)), 'firenze') or starts-with(lower-case(normalize-space(./LRVC)), 'siena') or starts-with(lower-case(normalize-space(./LRVC)), 'san severino marche') or starts-with(lower-case(normalize-space(./LRVC)), 'modena'))">	
						<xsl:choose>
							<xsl:when test="./LRVR and (starts-with(lower-case(normalize-space(./LRVR)), 'lombardia'))">
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
                		                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LRVR))" />
				           	        </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>					
					</xsl:when>
					<xsl:otherwise>
						<clvapit:hasRegion>
							<xsl:attribute name="rdf:resource">
        		   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LRVR))" />
						    </xsl:attribute>
						</clvapit:hasRegion>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
				<clvapit:hasProvince>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
					</xsl:attribute>
				</clvapit:hasProvince>
			</xsl:if>				
			<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
				<clvapit:hasCity>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
					</xsl:attribute>
				</clvapit:hasCity>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVL)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVL)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVE)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVE)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVS)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVS)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./LRVR)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVR)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVR)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVP)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVP)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVC)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVC)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="./LRL">
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
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(.)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(.)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>		
		</xsl:if>	
	</xsl:for-each>	
	<!-- Typification as individual -->								
 	<xsl:for-each select="record/metadata/schede/BNP/SP/SPM">
 		<xsl:if test="lower-case(normalize-space(./SPMT))='si'">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Typification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Typification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Typificationof cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SPMP">	
				<arco-spe:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./SPMP))" />
				</xsl:attribute>
				</arco-spe:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./SPMD">
				<arco-spe:producesTaxon>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./SPMD)))" />
					</xsl:attribute>
				</arco-spe:producesTaxon>
			</xsl:if>
			<xsl:if test="./SPMS">
				<arco-core:note>
			        <xsl:value-of select="./SPMS" />
				</arco-core:note>
			</xsl:if>
		</rdf:Description>
		<!--TypeSpecimen Type as individual -->
		<xsl:if test="./SPMP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeSpecimenType/', arco-fn:urify(./SPMP))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./SPMP" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./SPMP" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<!-- biological taxon as individual -->
		<xsl:if test="./SPMD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./SPMD)))" />
	        	</xsl:attribute>    
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	   	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalTaxon'" />
           			</xsl:attribute>
				</rdf:type>
				<rdfs:label>
        	    	 <xsl:value-of select="./SPMD" />
           		</rdfs:label>
				<l0:name>
   					<xsl:value-of select="./SPMD" />
				</l0:name>
			</rdf:Description>
		</xsl:if>				
	</xsl:if>
	</xsl:for-each>							
	<xsl:for-each select="record/metadata/schede/BNP/SP/SPS">
		<xsl:if test="./SPSL">
			<xsl:variable name="virgola" select="./SPSL" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
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
						<xsl:value-of select="arco-fn:name-cleaner(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:name-cleaner(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
	</xsl:if>

	<xsl:if test="$sheetType='BNZ'">			
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ZoologicalHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Animal'" />
			</xsl:attribute>
		</rdf:type>
		<!-- identifier -->
		<xsl:if test="$sheetType='BNZ' and (record/metadata/schede/BNZ/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNZ/OG/OGT/OGTD)), 'collezione'))">
			<xsl:if test="record/metadata/schede/BNZ/AC/ACO">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNZ/AC/ACO" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNZ/AC/ACO))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNZ' and (record/metadata/schede/BNZ/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNZ/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNZ/AC/ACK">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNZ/AC/ACK" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNZ/AC/ACK))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<!-- taxon 	 -->
		<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZS">
			<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(./SZSS, ./SZSR))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(./SZSR)), '-', arco-fn:urify(normalize-space(./SZSS)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(./SZSS))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="./SZSX">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./SZSX)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(./SZSS, ./SZSR))">
						<xsl:value-of select="concat(./SZSR, ' ', ./SZSS)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./SZSS" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="./SZSX">
						<xsl:value-of select="concat(' ', ./SZSX)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
			<arco-spe:isIdentifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-spe:isIdentifiedBy>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
			<!-- identification in time  -->
			<arco-spe:hasIdentificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification-', position())" />
				</xsl:attribute>
			</arco-spe:hasIdentificationInTime>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each> 
		<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZE">
			<arco-dd:hasAffixedElement>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasAffixedElement>			
		</xsl:for-each>
		<!-- sex -->
		<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZAS">
			<xsl:if test="./SZAS">
				<arco-cd:hasSex>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Sex/', $itemURI, '-revised-', position())" />
					</xsl:attribute>
				</arco-cd:hasSex>
				<arco-lite:sexInformation>
					<xsl:value-of select="normalize-space(./SZAS)" />
				</arco-lite:sexInformation>
			</xsl:if>		
		</xsl:for-each>
		<!-- development stage -->
		<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZA">
			<xsl:if test="./SZAE">
				<arco-cd:hasDevelopmentStage>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'DevelopmentStage/', arco-fn:urify(normalize-space(./SZAE)))" />
					</xsl:attribute>
				</arco-cd:hasDevelopmentStage>
			</xsl:if>		
		</xsl:for-each>
		<!-- specimen harvesting -->	
		<xsl:if test="record/metadata/schede/BNZ/LR">
			<arco-spe:hasSpecimenHarvesting>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasSpecimenHarvesting>
		</xsl:if>
		<!-- typification in time -->	
		<xsl:for-each select="record/metadata/schede/BNZ/SZ/TZI">
			<arco-spe:hasTypification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Typificatin/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasTypification>
		</xsl:for-each>	
	</rdf:Description>
	<!-- identifier -->
	<xsl:if test="$sheetType='BNZ' and (record/metadata/schede/BNZ/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNZ/OG/OGT/OGTD)), 'collezione'))">
		<xsl:if test="record/metadata/schede/BNZ/AC/ACO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNZ/AC/ACO))" />
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
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACO" />
				</l0:name>
				<arco-core:identifier>
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACO" />
				</arco-core:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNZ' and (record/metadata/schede/BNZ/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNZ/OG/OGT/OGTD)), 'campione'))">
		<xsl:if test="record/metadata/schede/BNZ/AC/ACK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNZ/AC/ACK))" />
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
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACK" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACK" />
				</l0:name>
				<arco-core:identifier>
					<xsl:value-of select="record/metadata/schede/BNZ/AC/ACK" />
				</arco-core:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZS">
		<!-- IdentificationInTime as individual	 --> 
		<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(./SZSS, ./SZSR))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(./SZSR)), '-', arco-fn:urify(normalize-space(./SZSS)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(./SZSS))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="./SZSX">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./SZSX)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(./SZSS, ./SZSR))">
						<xsl:value-of select="concat(./SZSR, ' ', ./SZSS)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./SZSS" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="./SZSX">
						<xsl:value-of select="concat(' ', ./SZSX)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification-', position())" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione ', position(), 'del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione ', position(), 'del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:if test="./SZSC">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SZSC))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./SZSL">
			<xsl:variable name="virgola" select="./SZSL" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<arco-core:hasTaxon>
				<xsl:attribute name="rdf:resource">
	    	    	<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:hasTaxon>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification-', position())" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), 'del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), 'del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:if test="./SZSC">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SZSC))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./SZSL">
			<xsl:variable name="virgola" select="./SZSL" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<arco-core:hasTaxon>
				<xsl:attribute name="rdf:resource">
	    	    	<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:hasTaxon>
		</rdf:Description>
		<!-- BiologicalTaxon as individual 	--> 
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$BiologicalTaxon" />
	        </xsl:attribute>    
			<rdfs:label>
            	 <xsl:value-of select="$BiologicalTaxonLabel" />
           	</rdfs:label>
	           <l0:name>
    	       	<xsl:value-of select="$BiologicalTaxonLabel" />
            </l0:name>		
		</rdf:Description>																	
		<xsl:if test="./SZSX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	       <xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />	
            	</xsl:attribute>
	            <rdf:type>
    	        	<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Subspecies'" />      
            		</xsl:attribute>
	            </rdf:type>
	            <xsl:if test="./SZSA">
					<arco-cd:synonym>
						<xsl:value-of select="./SZSA" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:for-each select="./SZSN">
					<arco-cd:synonym>
						<xsl:value-of select="." />
					</arco-cd:synonym>
				</xsl:for-each>
    	        <rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
					</xsl:call-template>
	            </rdfs:label>
    	        <l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
					</xsl:call-template>
	            </l0:name>
	            <xsl:if test="./SZSE">
 					<arco-lite:hasAuthor>
    	    	    	<xsl:attribute name="rdf:resource">
        	    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./SZSE))" />
		            	</xsl:attribute>
        	    	</arco-lite:hasAuthor>
            	</xsl:if>
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
					</xsl:attribute>	
				</arco-spe:hasDirectHigherRank>	
  			</rdf:Description>
		</xsl:if>
		<xsl:if test="./SZSS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
				</xsl:attribute>
				<xsl:if test="./SZSR">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSR))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Species'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="$sps-species-lab" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="$sps-species-lab" />
					</xsl:call-template>
				</l0:name>
				<xsl:if test="./SZSD">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./SZSD))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="./SZSR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSR))" />
	            </xsl:attribute>
				<xsl:if test="./SZSF">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSF))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SZSR" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SZSR" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SZSF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSF))" />
	            </xsl:attribute>
    	        <xsl:if test="./SZSO">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSO))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Family'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SZSF" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SZSF" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SZSO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSO))" />
	            </xsl:attribute>
    	        <xsl:if test="./SZSB">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSB))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Order'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SZSO" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SZSO" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SZSB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSB))" />
	            </xsl:attribute>
    	        <xsl:if test="./SZSP">
	    	        <arco-spe:hasDirectHigherRank>
    	    	   		<xsl:attribute name="rdf:resource">
        	    			 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSP))" />
            			</xsl:attribute>
	            	</arco-spe:hasDirectHigherRank>
	            </xsl:if>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Class'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SZSB" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SZSB" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./SZSP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./SZSP))" />
	            </xsl:attribute>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Phylum'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./SZSP" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./SZSP" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Time Interval as individual -->
	<xsl:for-each select ="record/metadata/schede/BNZ/SZ/SZS">
		<xsl:if test ="./SZSC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./SZSC))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./SZSC" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./SZSC" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="./SZSC" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="./SZSC" />
			</arco-arco:endTime>
			<tiapit:time>
				<xsl:value-of select="./SZSC" />
			</tiapit:time>
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>			
	<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AffixedElement'" />
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
			<arco-core:hasType>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/SpecimenLabel'" />
	            </xsl:attribute>
			</arco-core:hasType>
			<xsl:if test="./SZET">
				<arco-spe:bodyTranscript>
					<xsl:value-of select="normalize-space(./SZET)" />
				</arco-spe:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SZEI">
				<arco-spe:headingTranscript>
					<xsl:value-of select="normalize-space(./SZEI)" />
				</arco-spe:headingTranscript>
			</xsl:if>		
		</rdf:Description> 
	</xsl:for-each>
	
	<!-- Sex as individual  -->
	<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZA">
		<xsl:if test="./SZAS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Sex/', $itemURI, '-revised-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sesso ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sesso ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sex ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Sex ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SZAS">
				<arco-cd:sex>
					<xsl:value-of select="normalize-space(./SZAS)" />
				</arco-cd:sex>
			</xsl:if>		
		</rdf:Description>
		</xsl:if> 
	</xsl:for-each>
	<!-- development stage as individual  -->
	<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZA">
		<xsl:if test="./SZAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'DevelopmentStage/', arco-fn:urify(normalize-space(./SZAE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DevelopmentStage'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./SZAE" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./SZAE" />
			</l0:name>		
		</rdf:Description>
		</xsl:if> 
	</xsl:for-each>
	<!-- Typification as individual -->								
 	<xsl:for-each select="record/metadata/schede/BNZ/SZ/TZI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Typification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Typification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./TZIT">	
				<arco-spe:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./TZIT))" />
				</xsl:attribute>
				</arco-spe:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./TZID">
				<arco-spe:producesTaxon>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./TZID)))" />
					</xsl:attribute>
				</arco-spe:producesTaxon>
			</xsl:if>
		</rdf:Description>
		<!--TypeSpecimen Type as individual -->
		<xsl:if test="./TZIT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeSpecimenType/', arco-fn:urify(./TZIT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./TZIT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./TZIT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<!-- biological taxon as individual -->
		<xsl:if test="./TZID">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./TZID)))" />
	        	</xsl:attribute>    
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	   	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalTaxon'" />
           			</xsl:attribute>
				</rdf:type>
				<rdfs:label>
        	    	 <xsl:value-of select="./TZID" />
           		</rdfs:label>
				<l0:name>
   					<xsl:value-of select="./TZID" />
				</l0:name>
			</rdf:Description>				
		</xsl:if>
	</xsl:for-each>							
	<xsl:for-each select="record/metadata/schede/BNZ/SZ/SZS/SZSL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
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

	<xsl:if test="$sheetType='AT'">			
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PhysicalAnthropologyHeritage'" />
				</xsl:attribute>
			</rdf:type>
			<!-- taxon 	 -->
			<xsl:if test="record/metadata/schede/AT/OG/OGS">
				<xsl:variable name="sps-species">
					<xsl:choose>
						<xsl:when test="not(contains(record/metadata/schede/AT/OG/OGS/OGSN, record/metadata/schede/AT/OG/OGS/OGSG))">
							<xsl:value-of select="concat(arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSG)), '-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSN)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSN))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sps-subspecies" >
					<xsl:choose>
						<xsl:when test="record/metadata/schede/AT/OG/OGS/OGST">
							<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGST)))" />
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sps-species-lab">
					<xsl:choose>
						<xsl:when test="not(contains(record/metadata/schede/AT/OG/OGS/OGSN, record/metadata/schede/AT/OG/OGS/OGSG))">
							<xsl:value-of select="concat(record/metadata/schede/AT/OG/OGS/OGSG, ' ', record/metadata/schede/AT/OG/OGS/OGSN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="record/metadata/schede/AT/OG/OGS/OGSN" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sps-subspecies-lab" >
					<xsl:choose>
						<xsl:when test="record/metadata/schede/AT/OG/OGS/OGST">
							<xsl:value-of select="concat(' ', record/metadata/schede/AT/OG/OGS/OGST)" />
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="BiologicalTaxon">   
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
				</xsl:variable>
				<xsl:variable name="BiologicalTaxonLabel">   		
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
					</xsl:call-template>
				</xsl:variable>
				<arco-spe:isIdentifiedBy>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-spe:isIdentifiedBy> 
				<arco-core:isClassifiedBy>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:isClassifiedBy> 
				<arco-lite:isIdentifiedByCurrentTaxon>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-lite:isIdentifiedByCurrentTaxon>
				<arco-lite:isClassifiedByCurrentTaxon>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-lite:isClassifiedByCurrentTaxon>
				<!-- identification in time  -->
				<arco-spe:hasIdentificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'IdentificationInTime/', $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasIdentificationInTime>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
			</xsl:if>
			<!-- sex interpretation -->
			<xsl:if test="record/metadata/schede/AT/DA/STS">
				<arco-cd:hasSex>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Sex/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasSex>
				<arco-lite:sexInformation>
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS)" />
				</arco-lite:sexInformation>
			</xsl:if>
			<!-- finding context	 -->
			<xsl:if test="record/metadata/schede/AT/OG/OGC">
				<arco-cd:hasFindingContext>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'FindingContext/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasFindingContext>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMC">
				<arco-cd:hasFindingContext>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'FindingContext/', $itemURI)" />
					</xsl:attribute>
				</arco-cd:hasFindingContext>
			</xsl:if>
			<!-- age -->
			<xsl:if test="record/metadata/schede/AT/DA/SEM">
				<arco-cd:hasAge>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="concat($NS, 'Age/', $itemURI)" />
               		</xsl:attribute>
				</arco-cd:hasAge>
				<arco-lite:age>
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM)" />
				</arco-lite:age>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/PR/PRR">
				<arco-core:note>
               		<xsl:value-of select="concat('Apposizione oggetti rituali a contatto: ', normalize-space(record/metadata/schede/AT/PR/PRR))" />
				</arco-core:note>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/PR/PRP">
				<arco-core:note>
               		<xsl:value-of select="concat('Trattamenti parti esterne: ', normalize-space(record/metadata/schede/AT/PR/PRP))" />
				</arco-core:note>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/PR/PRA">
				<arco-core:note>
               		<xsl:value-of select="concat('Trattamenti anomali: ', normalize-space(record/metadata/schede/AT/PR/PRA))" />
				</arco-core:note>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/PR/PRT">
				<arco-core:note>
               		<xsl:value-of select="concat('Trattamenti cosmetici: ', normalize-space(record/metadata/schede/AT/PR/PRT))" />
				</arco-core:note>
			</xsl:if>
			<!-- numberOfElements -->
			<xsl:if test="record/metadata/schede/AT/DA/NIA/NIAN">
				<arco-arco:numberOfElements>
               		<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/NIA/NIAN)" />
				</arco-arco:numberOfElements>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/DA/NIA/NIAC">
				<arco-core:specifications>
               		<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/NIA/NIAC)" />
				</arco-core:specifications>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMT and starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SRM/SRMT)), 'naturale')">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/NaturalSpecimen'" />
					</xsl:attribute>
				</rdf:type>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMT and starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SRM/SRMT)), 'artificiale')">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/ArtificialSpecimen'" />
					</xsl:attribute>
				</rdf:type>
			</xsl:if>
			<!-- associated object -->
			<xsl:for-each select="record/metadata/schede/AT/PR/PRO">
				<arco-cd:hasAssociatedObject>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Object/', $itemURI, arco-fn:urify(normalize-space(./PROD)))" />
					</xsl:attribute>
				</arco-cd:hasAssociatedObject>				
			</xsl:for-each>	
			<!-- intervention -->
			<xsl:for-each select="record/metadata/schede/AT/PR/PRM">
				<xsl:choose>	
					<xsl:when test="not(./PRME) or ./PRME='intero bene' or ./PRME='integrale' or ./PRME='tutta' or ./PRME='totale' or ./PRME='carattere generale' or (starts-with(lower-case(normalize-space(./PRME)), 'nr')) or (starts-with(lower-case(normalize-space(./PRME)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRME)), 'intero')) or (starts-with(lower-case(normalize-space(./PRME)), 'intera')) or (starts-with(lower-case(normalize-space(./PRME)), 'esemplar'))">
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-handling-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
						<arco-dd:hasArrangement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Arrangement/', arco-fn:urify(normalize-space(./PRMP)))" />
							</xsl:attribute>
						</arco-dd:hasArrangement>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRME)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/PR/PRI">
				<xsl:choose>	
					<xsl:when test="not(./PRIP) or ./PRIP='intero bene' or ./PRIP='integrale' or ./PRIP='tutta' or ./PRIP='totale' or ./PRIP='carattere generale' or (starts-with(lower-case(normalize-space(./PRIP)), 'nr')) or (starts-with(lower-case(normalize-space(./PRIP)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRIP)), 'intero')) or (starts-with(lower-case(normalize-space(./PRIP)), 'intera')) or (starts-with(lower-case(normalize-space(./PRIP)), 'esemplar'))">
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-specimen-intervention-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRIP)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- bandage -->
			<xsl:for-each select="record/metadata/schede/AT/PR/PRF">
				<xsl:choose>	
					<xsl:when test="not(./PRFP) or ./PRFP='intero bene' or ./PRFP='integrale' or ./PRFP='tutta' or ./PRFP='totale' or ./PRFP='carattere generale' or (starts-with(lower-case(normalize-space(./PRFP)), 'nr')) or (starts-with(lower-case(normalize-space(./PRFP)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intero')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intera')) or (starts-with(lower-case(normalize-space(./PRFP)), 'esemplar'))">
						<arco-dd:hasBandage>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Bandage/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-dd:hasBandage>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRFP)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- part -->
			<xsl:for-each select="record/metadata/schede/AT/VM/VMC">
				<arco-core:hasPart>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./VMCE)))" />
					</xsl:attribute>
				</arco-core:hasPart>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/EL/ELE">
				<arco-core:hasPart>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ELEE)))" />
					</xsl:attribute>
				</arco-core:hasPart>
			</xsl:for-each>
			<!-- PaleopathologySurvey -->
			<xsl:for-each select="record/metadata/schede/AT/PT/PTC">
				<xsl:choose>	
					<xsl:when test="not(./PTCE) or ./PTCE='intero bene' or ./PTCE='integrale' or ./PTCE='tutta' or ./PTCE='totale' or ./PTCE='carattere generale' or (starts-with(lower-case(normalize-space(./PTCE)), 'nr')) or (starts-with(lower-case(normalize-space(./PTCE)), 'n.r')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intero')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intera')) or (starts-with(lower-case(normalize-space(./PTCE)), 'esemplar'))">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS,'PaleopathologySurvey/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PTCE)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:for-each>
			<!-- Survey -->
			<xsl:for-each select="record/metadata/schede/AT/IN/INI">
				<xsl:choose>	
					<xsl:when test="not(./INIE) or ./INIE='intero bene' or ./INIE='integrale' or ./INIE='tutta' or ./INIE='totale' or ./INIE='carattere generale' or (starts-with(lower-case(normalize-space(./INIE)), 'nr')) or (starts-with(lower-case(normalize-space(./INIE)), 'n.r')) or (starts-with(lower-case(normalize-space(./INIE)), 'intero')) or (starts-with(lower-case(normalize-space(./INIE)), 'intera')) or (starts-with(lower-case(normalize-space(./INIE)), 'esemplar'))">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS,'Survey/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./INIE)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:for-each>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/AT/OG/OGS">
			<!-- IdentificationInTime as individual	 --> 
			<xsl:variable name="sps-species">
				<xsl:choose>
					<xsl:when test="not(contains(record/metadata/schede/AT/OG/OGS/OGSN, record/metadata/schede/AT/OG/OGS/OGSG))">
						<xsl:value-of select="concat(arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSG)), '-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSN)))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGSN))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies" >
				<xsl:choose>
					<xsl:when test="record/metadata/schede/AT/OG/OGS/OGST">
						<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGS/OGST)))" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-species-lab">
				<xsl:choose>
					<xsl:when test="not(contains(record/metadata/schede/AT/OG/OGS/OGSN, record/metadata/schede/AT/OG/OGS/OGSG))">
						<xsl:value-of select="concat(record/metadata/schede/AT/OG/OGS/OGSG, ' ', record/metadata/schede/AT/OG/OGS/OGSN)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/AT/OG/OGS/OGSN" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="sps-subspecies-lab" >
				<xsl:choose>
					<xsl:when test="record/metadata/schede/AT/OG/OGS/OGST">
						<xsl:value-of select="concat(' ', record/metadata/schede/AT/OG/OGS/OGST)" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="BiologicalTaxon">   
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />
			</xsl:variable>
			<xsl:variable name="BiologicalTaxonLabel">   		
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
				</xsl:call-template>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI)" />
        		</xsl:attribute>
	       		<rdf:type>
					<xsl:attribute name="rdf:resource">
        	        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
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
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
	    		    	<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
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
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
	    		    	<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</rdf:Description>
			<!-- BiologicalTaxon as individual 	-->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="$BiologicalTaxon" />
	        	</xsl:attribute>    
				<rdfs:label>
    	        	 <xsl:value-of select="$BiologicalTaxonLabel" />
        	   	</rdfs:label>
	        	   <l0:name>
    	       		<xsl:value-of select="$BiologicalTaxonLabel" />
	            </l0:name>		
			</rdf:Description>																	
			<xsl:if test="record/metadata/schede/AT/OG/OGS/OGST">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        		       <xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species, $sps-subspecies)" />	
            		</xsl:attribute>
	            	<rdf:type>
    	        		<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Subspecies'" />      
        	    		</xsl:attribute>
	        	    </rdf:type>
			        <rdfs:label>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
						</xsl:call-template>
		            </rdfs:label>
    		        <l0:name>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat($sps-species-lab, $sps-subspecies-lab)" />
						</xsl:call-template>
		            </l0:name>
					<arco-core:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
						</xsl:attribute>	
					</arco-core:hasDirectHigherRank>
	  			</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/AT/OG/OGS/OGSN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $sps-species)" />
					</xsl:attribute>
					<xsl:if test="record/metadata/schede/AT/OG/OGS/OGSG">
						<arco-core:hasDirectHigherRank>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/AT/OG/OGS/OGSG))" />
							</xsl:attribute>
						</arco-core:hasDirectHigherRank>
					</xsl:if>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Species'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="$sps-species-lab" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="$sps-species-lab" />
						</xsl:call-template>
					</l0:name>
					<xsl:if test="record/metadata/schede/AT/OG/OGS/OGSA">
						<arco-lite:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/AT/OG/OGS/OGSA))" />
							</xsl:attribute>
						</arco-lite:hasAuthor>
					</xsl:if>
				</rdf:Description>
			</xsl:if>	
			<xsl:if test="record/metadata/schede/AT/OG/OGS/OGSG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            		   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/AT/OG/OGS/OGSG))" />
	            	</xsl:attribute>
	    	        <rdf:type>
    	    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
        	    	</rdf:type>
	        	    <rdfs:label>
    	        		 <xsl:value-of select="record/metadata/schede/AT/OG/OGS/OGSG" />
	        	    </rdfs:label>
    	        	<l0:name>
        	    		<xsl:value-of select="record/metadata/schede/AT/OG/OGS/OGSG" />
	        	    </l0:name>
	    		</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- finding context as individual -->
		<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'FindingContext/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FindingContext'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Contesto di rinvenimento del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Contesto di rinvenimento del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Finding context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Finding context of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCS">
					<arco-core:specifications>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/OG/OGC/OGCS)" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/OG/OGC/OGCN)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FindingContextType/', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/AT/OG/OGC/OGCE">
					<arco-cd:hasAssociatedObject>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-cd:hasAssociatedObject>
				</xsl:for-each>	
			</rdf:Description>
			<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'FindingContextType/', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)))" />
                	</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/FindingContextType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/AT/OG/OGC/OGCE">
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
		</xsl:if>
		<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'FindingContext/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FindingContext'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Contesto di rinvenimento del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Contesto di rinvenimento del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Finding context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Finding context of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMS">
					<arco-core:specifications>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SRM/SRMS)" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMC">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FindingContextType/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/SRM/SRMC)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/AT/DA/SRM/SRMC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'FindingContextType/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/SRM/SRMC)))" />
                	</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/FindingContextType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SRM/SRMC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SRM/SRMC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- sex -->
		<xsl:if test="record/metadata/schede/AT/DA/STS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'Sex/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Sesso del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Sesso del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Sex of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Sex of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/AT/DA/STS/STSS">
					<arco-cd:sex>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS/STSS)" />
					</arco-cd:sex>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/DA/STS/STSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'n.r')))">
					<arco-core:informationSource>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS/STSC)" />
					</arco-core:informationSource>
				</xsl:if>		
			</rdf:Description>
		</xsl:if>
		<!-- age as individual -->
		<xsl:if test="record/metadata/schede/AT/DA/SEM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'Age/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Età del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Età del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Age of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Age of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/AT/DA/SEM/SEME">
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEME)" />
					</arco-cd:ageValue>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/DA/SEM/SEMC">
					<arco-core:informationSource>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)" />
					</arco-core:informationSource>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGC/OGCT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AgeOfDeath'" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<!-- Associated object -->
		<xsl:for-each select="record/metadata/schede/AT/PR/PRO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Object/', $itemURI, arco-fn:urify(normalize-space(./PROD)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Object'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./PROD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./PROD)" />
				</l0:name>
				<xsl:if test="./PROS">
					<arco-core:specifications>
            	   		<xsl:value-of select="normalize-space(./PROS)" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="./PRON">
					<arco-core:note>
        	       		<xsl:value-of select="normalize-space(./PRON)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./PROP">
					<arco-dd:positionOnCulturalProperty>
            	   		<xsl:value-of select="normalize-space(./PROP)" />
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- intervention as individual -->
		<xsl:for-each select="record/metadata/schede/AT/PR/PRM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-handling-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Intervention'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Intervention ', position(), ' on cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Intervento ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Intervention ', position(), ' on cultural property ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
						<xsl:value-of select="concat('Intervento ', position(), ' sul bene culturale ', $itemURI)" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterventionType/handling')" />
					</xsl:attribute>
				</arco-core:hasType>
			</rdf:Description>
			<!-- intervention type as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterventionType/handling')" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/InterventionType" />
				<rdfs:label xml:lang="en">
						<xsl:value-of select="'handling'" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'manipolazione'" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'handling'" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="'manipolazione'" />
					</l0:name>
			</rdf:Description>
			<!-- Arrangement as an individual -->
			<xsl:if test="./PRMP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Arrangement/', arco-fn:urify(normalize-space(./PRMP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Arrangement" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PRMP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PRMP)" />
					</l0:name>
			</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/AT/PR/PRI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-specimen-intervention-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Intervention'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Intervention ', position(), ' on cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Intervento ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Intervention ', position(), ' on cultural property ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
						<xsl:value-of select="concat('Intervento ', position(), ' sul bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./PRIN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./PRIN)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./PRIS">
					<arco-core:specifications>
						<xsl:value-of select="normalize-space(./PRIN)" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="./PRIT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./PRIT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
			<!-- intervention type as an individual -->
			<xsl:if test="./PRIT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./PRIT)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/InterventionType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PRIT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PRIT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- bandage as individual -->
		<xsl:for-each select="record/metadata/schede/AT/PR/PRF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bandage/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Bandage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bandage ', position(), ' on cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Fasciatura ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bandage ', position(), ' on cultural property ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
						<xsl:value-of select="concat('Fasciatura ', position(), ' sul bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./PRFN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./PRFN)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./PRFC">
					<arco-dd:hasConservationStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-bandage-conservation-status-', position())" />
						</xsl:attribute>
					</arco-dd:hasConservationStatus>
				</xsl:if>
				<xsl:for-each select="./PRFI">
					<arco-cd:hasAssociatedObject>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Object/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-cd:hasAssociatedObject>
				</xsl:for-each>
				<xsl:if test="./PRFL or ./PRFA">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-bendage-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="./PRFM">
					<arco-dd:hasArrangement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Arrangement/', arco-fn:urify(normalize-space(./PRFM)))" />
						</xsl:attribute>
					</arco-dd:hasArrangement>
				</xsl:if>
				<xsl:if test="./PRFT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'BandageType/', arco-fn:urify(normalize-space(./PRFT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
			<!-- Conservation status -->
			<xsl:if test="./PRFC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-bandage-conservation-status-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ConservationStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato di conservazione della fasciatura ', position(), 'del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato di conservazione della fasciatura ', position(), 'del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Conservation status of bandage', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Conservation status of bandage', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./PRFC">
						<arco-core:specifications>
							<xsl:value-of select="normalize-space(./PRFC)" />
						</arco-core:specifications>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- Associated object -->
			<xsl:for-each select="./PRFI">
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
			<!-- Measurement collection as individual -->
			<xsl:if test="./PRFL or ./PRFA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				        <xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-bendage-', position())" />
					</xsl:attribute>
				 	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Collezione di misure della fasciatura ', position(), 'del bene culturale ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="'Collezione di misure della fasciatura ', position(), 'del bene culturale ', $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measurement collection of bandage ', position(), 'of cultural property ', $itemURI" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="'Measurement collection of bandage ', position(), 'of cultural property ', $itemURI" />
					</l0:name>
					<xsl:if test="./PRFA">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/Bandage-', position(), '-width')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="./PRFL">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/Bandage-', position(), '-length')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./PRFA">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Bandage-', position(), '-width')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Width of bandage ', position(), ': ', (./PRFA))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Width of bandage ', position(), ': ', (./PRFA))" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Larghezza della fasciatura ',  position(), ': ', (./PRFA))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Larghezza della fasciatura ',  position(), ': ', (./PRFA))" />
						</l0:name>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./PRFA))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./PRFA))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="./PRFA" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="./PRFA" />
							</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./PRFL">
					<rdf:Description>
						<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Bandage-', position(), '-length')" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Length of bandage ', position(), ': ', (./PRFL))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Length of bandage ', position(), ': ', (./PRFL))" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Lunghezza della fasciatura ',  position(), ': ', (./PRFL))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Lunghezza della fasciatura ',  position(), ': ', (./PRFL))" />
						</l0:name>
						<arco-dd:hasValue>
							<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./PRFL))" />
						</arco-dd:hasValue>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./PRFL))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<rdfs:label>
								<xsl:value-of select="./PRFL" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="./PRFL" />
							</l0:name>
					</rdf:Description>	
				</xsl:if>
			</xsl:if>
			<!-- Arrangement as an individual -->
			<xsl:if test="./PRFM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Arrangement/', arco-fn:urify(normalize-space(./PRFM)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Arrangement" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PRFM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PRFM)" />
					</l0:name>
			</rdf:Description>
			</xsl:if>
			<!-- bendage type as an individual -->
			<xsl:if test="./PRFT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'BendageType/', arco-fn:urify(normalize-space(./PRFT)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/BandageType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PRFT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PRFT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Part -->
		<xsl:for-each select="record/metadata/schede/AT/EL/ELE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ELEE)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(./ELEE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./ELEE)" />
				</l0:name>
				<!-- numberOfElements -->
				<xsl:if test="./ELEM">
					<arco-arco:numberOfElements>
        	       		<xsl:value-of select="normalize-space(./ELEM)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="./ELES">
					<arco-core:specifications>
            	   		<xsl:value-of select="normalize-space(./ELES)" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="./ELEA">
					<arco-core:specifications>
            	   		<xsl:value-of select="concat(normalize-space(./ELEA), '. ', normalize-space(./ELER))" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="./ELEN and ./ELEZ">
						<arco-core:note>
							<xsl:value-of select="concat(normalize-space(./ELEN), ' - Documentazione: ', normalize-space(./ELEZ))" />
						</arco-core:note>
					</xsl:when>
					<xsl:when test="./ELEZ">
						<arco-core:note>
							<xsl:value-of select="concat('Documentazione: ', normalize-space(./ELEZ))" />
						</arco-core:note>
					</xsl:when>
					<xsl:when test="./ELEN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./ELEN)" />
						</arco-core:note>
					</xsl:when>
				</xsl:choose>
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/AT/PR/PRF">
			<xsl:if test="./PRFP and not(./PRFP='intero bene' or ./PRFP='integrale' or ./PRFP='tutta' or ./PRFP='totale' or ./PRFP='carattere generale' or (starts-with(lower-case(normalize-space(./PRFP)), 'nr')) or (starts-with(lower-case(normalize-space(./PRFP)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intero')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intera')) or (starts-with(lower-case(normalize-space(./PRFP)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRFP)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(./PRFP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./PRFP)" />
				</l0:name>
				<arco-dd:hasBandage>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bandage/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-dd:hasBandage>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/AT/VM/VMC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./VMCE)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(./VMCE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./VMCE)" />
				</l0:name>
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, arco-fn:urify(normalize-space(./VMCE)))" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, arco-fn:urify(normalize-space(./VMCE)))" />
				</xsl:attribute>
				 <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Collezione di misure della parte del bene culturale ', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="'Collezione di misure della parte del bene culturale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measurement collection of cultural property part', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="'Measurement collection of cultural property part', $itemURI" />
				</l0:name>
				<xsl:if test="./VMCV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, arco-fn:urify(normalize-space(./VMCE)), '-', arco-fn:uncamelize(arco-fn:map-measure(lower-case(./VMCT))))" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./VMCV">
				<rdf:Description>
					<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/', $itemURI, arco-fn:urify(normalize-space(./VMCE)), '-', arco-fn:uncamelize(arco-fn:map-measure(lower-case(./VMCT))))" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property part ', normalize-space(./VMCE), ': ', normalize-space(./VMCV))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property part ', normalize-space(./VMCE), ': ',  normalize-space(./VMCV))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della parte di bene culturale ', normalize-space(./VMCE), ': ',  normalize-space(./VMCV))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della parte di bene culturale ', normalize-space(./VMCE), ': ',  normalize-space(./VMCV))" />
					</l0:name>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', arco-fn:uncamelize(arco-fn:map-measure(lower-case(./VMCT))))" />
					</arco-core:hasType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(./VMCV))" />
					</arco-dd:hasValue>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementUnit/', arco-fn:urify(normalize-space(./VMCU)))" />
						</xsl:attribute>
					</mu:hasMeasurementUnit>
					<xsl:if test="./VMCD">
						<arco-core:specifications>
							<xsl:value-of select="normalize-space(./VMCD)" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./VMCN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./VMCN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./VMCV))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./VMCV" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./VMCV" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./VMCU">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:urify(normalize-space(./VMCU)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./VMCU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./VMCU)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Paleopathology survey -->
		<xsl:for-each select="record/metadata/schede/AT/PT/PTC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'PaleopathologySurvey/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PaleopathologySurvey'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Paleopathology survey ', position(), ' on cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Indagine su paleopatologia ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Paleopathology survey ', position(), ' on cultural property ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
						<xsl:value-of select="concat('Indagine su paleopatologia ', position(), ' sul bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./PTCM">
					<arco-cd:hasSurveyMethod>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'SurveyMethod/', arco-fn:urify(normalize-space(./PTCM)))" />
						</xsl:attribute>
					</arco-cd:hasSurveyMethod>
				</xsl:if>
				<xsl:if test="./PTCZ">
					<arco-cd:hasBibliographicSource>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./PTCZ)))" />
	                	</xsl:attribute>
					</arco-cd:hasBibliographicSource>
					<arco-lite:bibliographicReference>
						<xsl:value-of select="normalize-space(./PTCZ)" />
					</arco-lite:bibliographicReference>
				</xsl:if>
				<xsl:if test="./PTCD">
					<arco-spe:diagnosis>
						<xsl:value-of select="normalize-space(./PTCD)" />
					</arco-spe:diagnosis>
				</xsl:if>
				<xsl:if test="./PTCI">
					<arco-spe:refersToSurvey>
						<xsl:value-of select="normalize-space(./PTCI)" />
					</arco-spe:refersToSurvey>
				</xsl:if>
				<xsl:if test="./PTCN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./PTCN)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
			<!-- Survey method as an individual -->
			<xsl:if test="./PTCM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'SurveyMethod/', arco-fn:urify(normalize-space(./PTCM)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/SurveyMethod" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PTCM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PTCM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- bibliography as an individual -->
			<xsl:if test="./PTCZ">
				<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./PTCZ)))" />
            	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Edition'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./PTCZ)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./PTCZ)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="normalize-space(./PTCZ)" />
				</arco-cd:completeBibliographicReference>
			</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- survey -->
		<xsl:for-each select="record/metadata/schede/AT/IN/INI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'Survey/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Survey'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Survey ', position(), ' on cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Indagine ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Survey ', position(), ' on cultural property ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
						<xsl:value-of select="concat('Indagine ', position(), ' sul bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./INIT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'SurveyType/', arco-fn:urify(normalize-space(./INIT)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="./INIZ">
					<arco-cd:hasBibliographicSource>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./INIZ)))" />
	                	</xsl:attribute>
					</arco-cd:hasBibliographicSource>
					<arco-lite:bibliographicReference>
						<xsl:value-of select="normalize-space(./INIZ)" />
					</arco-lite:bibliographicReference>
				</xsl:if>
				<xsl:if test="./INID">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./INID)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:for-each select="./INIL">
					<arco-lite:hasOperator>
						<xsl:attribute name="rdf:resource">
		              		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasOperator>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-survey-', position(), '-activity-operator')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<xsl:for-each select="./INIO">
					<arco-lite:hasResponsibleAgent>
						<xsl:attribute name="rdf:resource">
		              		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasResponsibleAgent>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-survey-', position(), '-activity-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<xsl:if test="./INIR">
					<arco-cd:report>
						<xsl:value-of select="normalize-space(./INIR)" />
					</arco-cd:report>
				</xsl:if>
				<xsl:if test="./ININ">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./ININ)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
			<!-- Survey type as an individual -->
			<xsl:if test="./INIT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'SurveyType/', arco-fn:urify(normalize-space(./INIT)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/SurveyType" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./INIT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./INIT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- time interval as an individual -->
			<xsl:if test="./INID">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./INID)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./INID)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./INID)" />
					</l0:name>
					<tiapit:time>
						<xsl:value-of select="normalize-space(./INID)" />
					</tiapit:time>
					<arco-arco:startTime>
						<xsl:value-of select="normalize-space(./INID)" />
					</arco-arco:startTime>
					<arco-arco:endTime>
						<xsl:value-of select="normalize-space(./INID)" />
					</arco-arco:endTime>
				</rdf:Description>
			</xsl:if>
			<!-- Agent and agent role as an individual -->
			<xsl:for-each select="./INIL">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-survey-', position(), '-activity-operator')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Operatore dell&quot;indagine ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Operatore dell&quot;indagine ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Operator of survey ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Operator of survey ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Operator')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role of activity responsible as an individual -->
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
					<!-- agent of activity responsible as an individual -->
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
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./INIO">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-survey-', position(), '-activity-responsible')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile dell&quot;indagine ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Responsabile dell&quot;indagine ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Responsible of survey ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Responsible of survey ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role of activity responsible as an individual -->
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
							<xsl:value-of select="'Responsabile'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Responsible agent'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent of activity responsible as an individual -->
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
				</xsl:if>
			</xsl:for-each>
			<!-- bibliography as an individual -->
			<xsl:if test="./INIZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
    	        		<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./INIZ)))" />
        	    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Edition'" />
	            		</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./INIZ)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./INIZ)" />
					</l0:name>
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="normalize-space(./INIZ)" />
					</arco-cd:completeBibliographicReference>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>