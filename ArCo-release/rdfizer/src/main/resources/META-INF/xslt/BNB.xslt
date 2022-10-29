<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
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
	
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

	<!-- xsl:variable name="NS"	select="$NS,''" /-->
	<xsl:param name="NS" />
			
<xsl:template match="/">
	<rdf:RDF>
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:if test="$sheetType='BNB'">							

							<!-- Properties of BotanicalHeritage -->
	
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
	
	<xsl:variable name="naa-species">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAA/NAAB, record/metadata/schede/BNB/SB/NAA/NAAA))">
				<xsl:value-of select="concat(arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAA)), '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAB)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAB))" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-subspecies" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAD">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAD)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-variety" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAF">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAF)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-form" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAH">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAH)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-cultivar" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAL">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAL)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-species-lab">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAA/NAAB, record/metadata/schede/BNB/SB/NAA/NAAA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAA/NAAA, ' ', record/metadata/schede/BNB/SB/NAA/NAAB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-subspecies-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAD">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAA/NAAD)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-variety-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAF">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAA/NAAF)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-form-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAH">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAA/NAAH)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naa-cultivar-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAA/NAAL">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAA/NAAL)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BiologicalTaxon">   
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr (recupero pregresso)')">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA)))" />
			</xsl:when>                	
			<xsl:otherwise>
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety, $naa-form, $naa-cultivar)" />		                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BiologicalTaxonLabel">   		
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr (recupero pregresso)')">
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="record/metadata/schede/BNB/SB/NBN/NBNA" />
				</xsl:call-template>
			</xsl:when>                	
			<xsl:otherwise>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab, $naa-form-lab, $naa-cultivar-lab)" />
				</xsl:call-template>	                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-species">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAT/NATB, record/metadata/schede/BNB/SB/NAT/NATA))">
				<xsl:value-of select="concat(arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATA)), '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATB)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATB))" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-subspecies" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATD">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATD)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-variety" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATF">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATF)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-form" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATH">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATH)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-cultivar" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATL">
				<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATL)))" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-species-lab">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAT/NATB, record/metadata/schede/BNB/SB/NAT/NATA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAT/NATA, ' ', record/metadata/schede/BNB/SB/NAT/NATB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-subspecies-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATD">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAT/NATD)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-variety-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATF">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAT/NATF)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-form-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATH">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAT/NATH)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nat-cultivar-lab" >
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NAT/NATL">
				<xsl:value-of select="concat(' ', record/metadata/schede/BNB/SB/NAT/NATL)" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TypespecimenTaxon">   
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr (recupero pregresso)')">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN)))" />
			</xsl:when>                	
			<xsl:otherwise>
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety, $nat-form, $nat-cultivar)" />		                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TypespecimenTaxonLabel">   		
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr (recupero pregresso)')">
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="record/metadata/schede/BNB/SB/TBI/TBIN" />
				</xsl:call-template>
			</xsl:when>                	
			<xsl:otherwise>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab, $nat-form-lab, $nat-cultivar-lab)" />
				</xsl:call-template>	                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/BotanicalHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<!-- identifier -->
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACE">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNB/AC/ACE" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HerbariumIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACE))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACI">
				<arco-lite:InternationalIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNB/AC/ACI" />
				</arco-lite:InternationalIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HerbariumIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACI))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACO">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNB/AC/ACO" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACO))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'contenitore'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACJ">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNB/AC/ACJ" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ContainerIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACJ))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACK">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/BNB/AC/ACK" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACK))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACN">
				<l0:localIdentifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACN" />
				</l0:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACN))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<!-- container sequence -->
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'contenitore'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACZ">
			<arco-spe:containerSequence>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACZ" />
			</arco-spe:containerSequence>
			</xsl:if>
		</xsl:if>
		<!-- historical information -->
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTS">
			<arco-cd:historicalInformation>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/OG/OGT/OGTS)" />
			</arco-cd:historicalInformation>
		</xsl:if>
		<!-- taxon -->	
		<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA or record/metadata/schede/BNB/SB/NAA">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN or record/metadata/schede/BNB/RB/RBN">
					<arco-lite:isIdentifiedByOriginalTaxon>
						<xsl:attribute name="rdf:resource">
					    	<xsl:value-of select="$BiologicalTaxon" />
					    </xsl:attribute>
					</arco-lite:isIdentifiedByOriginalTaxon>
					<arco-lite:isClassifiedByOriginalTaxon>
						<xsl:attribute name="rdf:resource">
					    	<xsl:value-of select="$BiologicalTaxon" />
					    </xsl:attribute>
					</arco-lite:isClassifiedByOriginalTaxon>
				</xsl:when>
				<xsl:otherwise>
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
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
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
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA">
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
		</xsl:if>
		<!-- revised taxon -->
		<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRN">
			<arco-spe:isIdentifiedBy>
				<xsl:attribute name="rdf:resource">
			    	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
			</arco-spe:isIdentifiedBy>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
			    	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/RB/RBN">
		<xsl:variable name="rbn-species">
			<xsl:choose>
				<xsl:when test="not(contains(./RBNB, ./RBNA))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./RBNA)), '-', arco-fn:urify(normalize-space(./RBNB)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="arco-fn:urify(normalize-space(./RBNB))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-subspecies" >
			<xsl:choose>
				<xsl:when test="./RBND">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBND)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-variety" >
			<xsl:choose>
				<xsl:when test="./RBNF">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBNF)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-form" >
			<xsl:choose>
				<xsl:when test="./RBNH">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBNH)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-cultivar" >
			<xsl:choose>
				<xsl:when test="./RBNL">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBNL)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxon">   
			<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form, $rbn-cultivar)" />	
		</xsl:variable>
			<arco-spe:isIdentifiedBy>
				<xsl:attribute name="rdf:resource">
 					<xsl:value-of select="$RevisedTaxon" />
				</xsl:attribute>
			</arco-spe:isIdentifiedBy>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
 					<xsl:value-of select="$RevisedTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
		<!-- identification/classification in time -->
		<xsl:if test="record/metadata/schede/BNB/SB/NBN or record/metadata/schede/BNB/SB/NAA">
			<arco-spe:hasIdentificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification')" />
				</xsl:attribute>
			</arco-spe:hasIdentificationInTime>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification')" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNB/RB">
			<xsl:if test="./RBR/RBRN or ./RB/RBN">
				<arco-spe:hasIdentificationInTime>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-revised-identification-', position())" />
					</xsl:attribute>
				</arco-spe:hasIdentificationInTime>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
			</xsl:if>
		</xsl:for-each>
		<!-- accession -->
		<xsl:if test="record/metadata/schede/BNB/SB/ABC">				
			<arco-spe:hasAccession>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Accession/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasAccession>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPF">
			<arco-arco:numberOfElements>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPF" />			
			</arco-arco:numberOfElements>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPE">
			<arco-spe:numberOfLabels>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPE" />			
			</arco-spe:numberOfLabels>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPB">
			<arco-spe:numberOfEnvelopes>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPB" />			
			</arco-spe:numberOfEnvelopes>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNB/SB/SBE">
			<arco-spe:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasLabel>			
		</xsl:for-each>
		<!-- specimen harvesting -->	
		<xsl:if test="record/metadata/schede/BNB/LR/LRI or record/metadata/schede/BNB/LR/LRV">
			<arco-location:hasTimeIndexedTypedLocation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
				</xsl:attribute>
			</arco-location:hasTimeIndexedTypedLocation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/LR">
			<arco-spe:hasSpecimenHarvesting>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasSpecimenHarvesting>
		</xsl:if>
		<!-- laboratory test -->					
		<xsl:for-each select="record/metadata/schede/BNB/RB">
			<arco-cd:hasSurvey>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-cd:hasSurvey>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBR">
			<arco-spe:hasAssociatedPreparation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Preparation/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasAssociatedPreparation>
		</xsl:for-each>
		<!-- related sample -->			
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBC">
			<arco-spe:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'FruitSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasRelatedSample>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBX">
			<arco-spe:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'WoodSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasRelatedSample>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBS">
			<arco-spe:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SeedSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasRelatedSample>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBP">
			<arco-spe:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'PollenSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasRelatedSample>
		</xsl:for-each>
		<!-- host individual -->	
		<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIM">
			<arco-spe:hasHostIndividual>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'HostIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIM))" />
				</xsl:attribute>
			</arco-spe:hasHostIndividual>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIV">
			<arco-spe:hasCloseIndividual>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CloseIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIV))" />
				</xsl:attribute>
			</arco-spe:hasCloseIndividual>
		</xsl:if>
		<!-- type specimen identification in time -->	
		<xsl:if test="record/metadata/schede/BNB/SB/TBI">
			<arco-spe:hasTypification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Typification/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasTypification>
		</xsl:if>	
	</rdf:Description>
	<!-- identifier -->
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'HerbariumIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACE))" />
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
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACE" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACE" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'HerbariumIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACI))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
    	            </xsl:attribute>
				</rdf:type>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/InternationalIdentifier'" />
			        </xsl:attribute>
				</arco-core:hasType>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACI" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACI" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACI" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACO))" />
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
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACO" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACO" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'contenitore'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACJ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ContainerIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACJ))" />
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
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACJ" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACJ" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACJ" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACK))" />
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
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACK" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACK" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACK" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
		<xsl:if test="record/metadata/schede/BNB/AC/ACN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/BNB/AC/ACN))" />
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
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACN" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACN" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/BNB/AC/ACN" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- IdentificationInTime as individual --> 	
	<xsl:if test="record/metadata/schede/BNB/SB/NBN or record/metadata/schede/BNB/SB/NAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-identification')" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione nel tempo  del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione nel tempo del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN or record/metadata/schede/BNB/RB/RBN">  
		            <arco-core:current>
        		    	<xsl:value-of select="false()" />
            		</arco-core:current>
            	</xsl:when>
            	<xsl:otherwise>
            		<arco-core:current>
            	<xsl:value-of select="true()" />
            		</arco-core:current>
            	</xsl:otherwise>
            </xsl:choose>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVC), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVE">
						<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVE), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/DBV/DBVF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/SB/DBV/DBVA">
			<xsl:variable name="virgola" select="record/metadata/schede/*/SB/DBV/DBVA" />
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
			<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA">
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<!-- ClassificationInTime as individual --> 	
	<xsl:if test="record/metadata/schede/BNB/SB/NBN or record/metadata/schede/BNB/SB/NAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification')" />
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
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN or record/metadata/schede/BNB/RB/RBN">  
		            <arco-core:current>
        		    	<xsl:value-of select="false()" />
            		</arco-core:current>
            	</xsl:when>
            	<xsl:otherwise>
            		<arco-core:current>
            	<xsl:value-of select="true()" />
            		</arco-core:current>
            	</xsl:otherwise>
            </xsl:choose>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVC), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVE">
						<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVE), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/DBV/DBVF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/SB/DBV/DBVA">
			<xsl:variable name="virgola" select="record/metadata/schede/*/SB/DBV/DBVA" />
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
			<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA">
				<arco-core:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-core:hasTaxon>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB">
		<xsl:variable name="rbn-species">
			<xsl:choose>
				<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./RBN/RBNA)), '-', arco-fn:urify(normalize-space(./RBN/RBNB)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="arco-fn:urify(normalize-space(./RBN/RBNB))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-subspecies" >
			<xsl:choose>
				<xsl:when test="./RBN/RBND">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBND)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-variety" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNF">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNF)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-form" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNH">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNH)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-cultivar" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNL">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNL)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-species-lab">
			<xsl:choose>
				<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
					<xsl:value-of select="concat(./RBN/RBNA, ' ', ./RBN/RBNB)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./RBN/RBNB" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-subspecies-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBND">
					<xsl:value-of select="concat(' ', ./RBN/RBND)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-variety-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNF">
					<xsl:value-of select="concat(' ', ./RBN/RBNF)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-form-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNH">
					<xsl:value-of select="concat(' ', ./RBN/RBNH)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-cultivar-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNL">
					<xsl:value-of select="concat(' ', ./RBN/RBNL)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxon">   
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr (recupero pregresso)')">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA)))" />
				</xsl:when>                	
				<xsl:otherwise>
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form, $rbn-cultivar)" />		                		
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxonLabel">   		
			<xsl:choose>
				<xsl:when test="./RBN/RBNA and not(lower-case(normalize-space(./RBN/RBNA))='nr' or lower-case(normalize-space(./RBN/RBNA))='n.r.' or lower-case(normalize-space(./RBN/RBNA))='nr (recupero pregresso)')">
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="./RBN/RBNA" />
					</xsl:call-template>
				</xsl:when>                	
				<xsl:otherwise>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab, $rbn-cultivar-lab)" />
					</xsl:call-template>	                		
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="./RBR/RBRN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-revised-identification-', position())" />
		        </xsl:attribute>
    		   	<rdf:type>
					<xsl:attribute name="rdf:resource">
            		    <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
        		    	 <xsl:value-of select="concat('Identificazione nel tempo del bene culturale ', $itemURI)" />
            		</rdfs:label>
	            	<l0:name xml:lang="it">
    	        		<xsl:value-of select="concat('Identificazione nel tempo del bene culturale ', $itemURI)" />
	        	    </l0:name>
					<rdfs:label xml:lang="en">
        	    		 <xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
	        	    </rdfs:label>
    	        	<l0:name xml:lang="en">
        	    		<xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
	            	</l0:name>
		            <arco-spe:originalIdentification>
    		        	<xsl:value-of select="false()" />
        		    </arco-spe:originalIdentification>
					<xsl:if test="./RBD/RBDB">
						<xsl:variable name="startDate">
						<xsl:choose>
							<xsl:when test="./RBD/RBDC">
								<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDB)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endDate">
						<xsl:choose>
							<xsl:when test="./RBDE">
								<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			    	    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBD/RBDF">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			    	    	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(./RBD/RBDF))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBR/RBRB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:for-each select="./RBR/RBRA">
					<xsl:variable name="virgola" select="." />
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
				</xsl:for-each>
				<xsl:if test="./RBR/RBRN">
					<arco-core:hasTaxon>
						<xsl:attribute name="rdf:resource">
		    	    		<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./RBR/RBRN)))" />
						</xsl:attribute>
					</arco-core:hasTaxon>
				</xsl:if>
				<xsl:if test="./RBA">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./RBA)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
		        </xsl:attribute>
    		   	<rdf:type>
					<xsl:attribute name="rdf:resource">
            		    <xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
        		    	 <xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
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
		            <arco-spe:originalClassification>
    		        	<xsl:value-of select="false()" />
        		    </arco-spe:originalClassification>
					<xsl:if test="./RBD/RBDB">
						<xsl:variable name="startDate">
						<xsl:choose>
							<xsl:when test="./RBD/RBDC">
								<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDB)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endDate">
						<xsl:choose>
							<xsl:when test="./RBDE">
								<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			    	    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBD/RBDF">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			    	    	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(./RBD/RBDF))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBR/RBRB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:for-each select="./RBR/RBRA">
					<xsl:variable name="virgola" select="." />
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
				</xsl:for-each>
				<xsl:if test="./RBR/RBRN">
					<arco-core:hasTaxon>
						<xsl:attribute name="rdf:resource">
		    	    		<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./RBR/RBRN)))" />
						</xsl:attribute>
					</arco-core:hasTaxon>
				</xsl:if>
				<xsl:if test="./RBA">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./RBA)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RBN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-revised-identification-', position())" />
		        </xsl:attribute>
    		   	<rdf:type>
					<xsl:attribute name="rdf:resource">
            		    <xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
    	    	   	 <xsl:value-of select="concat('Identificazione nel tempo del bene culturale ', $itemURI)" />
        	    </rdfs:label>
	        	<l0:name xml:lang="it">
    				<xsl:value-of select="concat('Identificazione nel tempo del bene culturale ', $itemURI)" />
	        	</l0:name>
				<rdfs:label xml:lang="en">
        	    	 <xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
	        	   </rdfs:label>
    	        <l0:name xml:lang="en">
        	    	<xsl:value-of select="concat('Identification in time of cultural property ', $itemURI)" />
	            </l0:name>
				<arco-spe:originalIdentification>
    		       	<xsl:value-of select="false()" />
        		</arco-spe:originalIdentification>
				<xsl:if test="./RBD/RBDB">
					<xsl:variable name="startDate">
						<xsl:choose>
							<xsl:when test="./RBD/RBDC">
								<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDB)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endDate">
						<xsl:choose>
							<xsl:when test="./RBDE">
								<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBD/RBDF">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(./RBD/RBDF))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBR/RBRB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:for-each select="./RBR/RBRA">
					<xsl:variable name="virgola" select="." />
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
				</xsl:for-each>
				<xsl:if test="./RBN">
					<arco-core:hasTaxon>
						<xsl:attribute name="rdf:resource">
				       		<xsl:value-of select="$RevisedTaxon" />
						</xsl:attribute>
					</arco-core:hasTaxon>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
		        </xsl:attribute>
    		   	<rdf:type>
					<xsl:attribute name="rdf:resource">
            		    <xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
    	    	   	 <xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
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
				<arco-spe:originalClassification>
    		       	<xsl:value-of select="false()" />
        		</arco-spe:originalClassification>
				<xsl:if test="./RBD/RBDB">
					<xsl:variable name="startDate">
						<xsl:choose>
							<xsl:when test="./RBD/RBDC">
								<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDB)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endDate">
						<xsl:choose>
							<xsl:when test="./RBDE">
								<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./RBD/RBDD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBD/RBDF">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(./RBD/RBDF))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./RBR/RBRB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:for-each select="./RBR/RBRA">
					<xsl:variable name="virgola" select="." />
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
				</xsl:for-each>
				<xsl:if test="./RBN">
					<arco-core:hasTaxon>
						<xsl:attribute name="rdf:resource">
				       		<xsl:value-of select="$RevisedTaxon" />
						</xsl:attribute>
					</arco-core:hasTaxon>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- BiologicalTaxon as individual --> 
	<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$BiologicalTaxon" />
	        </xsl:attribute>    
			<rdf:type>
				<xsl:attribute name="rdf:resource">
           	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalTaxon'" />
           		</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NBN/NBNA" />
           	</rdfs:label>
	           <l0:name>
    	       	<xsl:value-of select="record/metadata/schede/BNB/SB/NBN/NBNA" />
            </l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
	        			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSN">
            	<arco-spe:genusNumber>
            		<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSN" />
            	</arco-spe:genusNumber>
        	</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSG">
				<arco-lite:taxonomicNumber>
					<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSG" />		
				</arco-lite:taxonomicNumber>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$BiologicalTaxon" />
	        </xsl:attribute>    
			<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
	        			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>	
			<rdfs:label>
            	 <xsl:value-of select="$BiologicalTaxonLabel" />
           	</rdfs:label>
	           <l0:name>
    	       	<xsl:value-of select="$BiologicalTaxonLabel" />
            </l0:name>		
		</rdf:Description>
	</xsl:if>																		
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety, $naa-form, $naa-cultivar)" />	
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cultivar'" />      
            	</xsl:attribute>
            </rdf:type>
            <rdfs:label>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab, $naa-form-lab, $naa-cultivar-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab, $naa-form-lab, $naa-cultivar-lab)" />
				</xsl:call-template>
            </l0:name>
			<arco-core:hasDirectHigherRank>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety, $naa-form)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>	
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety, $naa-form)" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalForm'" />      
            	</xsl:attribute>
            </rdf:type>
           <rdfs:label>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab, $naa-form-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab, $naa-form-lab)" />
				</xsl:call-template>
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAI">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAI))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>           
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
              <xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies, $naa-variety)" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalVariety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
            	<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab, $naa-variety-lab)" />
				</xsl:call-template>
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAG">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAG))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>           
  		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species, $naa-subspecies)" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalSubspecies'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
            	<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($naa-species-lab, $naa-subspecies-lab)" />
				</xsl:call-template>
            </l0:name>	
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAE">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAE))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>       
    	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $naa-species)" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
				<arco-core:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
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
					<xsl:with-param name="text" select="$naa-species-lab" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="$naa-species-lab" />
				</xsl:call-template>
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAC">
				<arco-lite:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAC))" />
					</xsl:attribute>
				</arco-lite:hasAuthor>
			</xsl:if>
		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
            </xsl:attribute>
            <arco-core:hasDirectHigherRank>
           		<xsl:attribute name="rdf:resource">
            		 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            	</xsl:attribute>
            </arco-core:hasDirectHigherRank>
            <rdf:type>
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAA" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAA" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSN">
            	<arco-spe:genusNumber>
            		<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSN" />
            	</arco-spe:genusNumber>
            </xsl:if>
    	</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            </xsl:attribute>
           <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
	            <arco-core:hasDirectLowerRank>
    	        <xsl:attribute name="rdf:resource">
        	    	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
            	</xsl:attribute>
	            </arco-core:hasDirectLowerRank>
            </xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATA">
            	<arco-core:hasDirectLowerRank>
	            <xsl:attribute name="rdf:resource">
    	        	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
        	    </xsl:attribute>
            	</arco-core:hasDirectLowerRank>
            </xsl:if>
            <xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
 	           <arco-core:hasLowerRank>
    	        <xsl:attribute name="rdf:resource">
        	    	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NBN/NBNA))" />
            	</xsl:attribute>
	            </arco-core:hasLowerRank>
            </xsl:if>
            <xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
				<arco-core:hasLowerRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIN))" />
					</xsl:attribute>
            	</arco-core:hasLowerRank>
            </xsl:if>  
            <rdf:type>
				<xsl:attribute name="rdf:resource">
    	        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Family'" />      
        	    </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSF" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSF" />
            </l0:name>	           
    	</rdf:Description>
	</xsl:if>	
	<!-- Typification as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIN))" />
	        </xsl:attribute>    
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalTaxon'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIN" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIN" />
            </l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'n.r')))">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
	        			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
		</rdf:Description>
	</xsl:if>															
	<xsl:if test="record/metadata/schede/BNB/SB/NAT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$TypespecimenTaxon" />
	        </xsl:attribute>    
			<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
	        			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>	
			<rdfs:label>
            	 <xsl:value-of select="$TypespecimenTaxonLabel" />
           	</rdfs:label>
	           <l0:name>
    	       	<xsl:value-of select="$TypespecimenTaxonLabel" />
            </l0:name>		
		</rdf:Description>
	</xsl:if>																		
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety, $nat-form, $nat-cultivar)" />	
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cultivar'" />      
            	</xsl:attribute>
            </rdf:type>
            <rdfs:label>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab, $nat-form-lab, $nat-cultivar-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab, $nat-form-lab, $nat-cultivar-lab)" />
				</xsl:call-template>
            </l0:name>
			<arco-core:hasDirectHigherRank>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety, $nat-form)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety, $nat-form)" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalForm'" />      
            	</xsl:attribute>
            </rdf:type>
           <rdfs:label>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab, $nat-form-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab, $nat-form-lab)" />
				</xsl:call-template>
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATI">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATI))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>	           
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
              <xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies, $nat-variety)" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalVariety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
            	<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab, $nat-variety-lab)" />
				</xsl:call-template>
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATG">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATG))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>           
  		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species, $nat-subspecies)" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalSubspecies'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab)" />
				</xsl:call-template>
            </rdfs:label>
            <l0:name>
            	<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="concat($nat-species-lab, $nat-subspecies-lab)" />
				</xsl:call-template>
            </l0:name>	
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATE">
            	<arco-lite:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATE))" />
            	</xsl:attribute>
            	</arco-lite:hasAuthor>
            </xsl:if>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species)" />
				</xsl:attribute>	
			</arco-core:hasDirectHigherRank>        
    	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', $nat-species)" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATA">
				<arco-core:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
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
					<xsl:with-param name="text" select="$nat-species-lab" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase1">
					<xsl:with-param name="text" select="$nat-species-lab" />
				</xsl:call-template>
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATC">
				<arco-lite:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATC))" />
					</xsl:attribute>
				</arco-lite:hasAuthor>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
            </xsl:attribute>
            <arco-core:hasDirectHigherRank>
            	<xsl:attribute name="rdf:resource">
            		 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            	</xsl:attribute>
            </arco-core:hasDirectHigherRank>
            <rdf:type>
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATA" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATA" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSN">
            	<arco-spe:genusNumber>
            		<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSN" />
            	</arco-spe:genusNumber>
            </xsl:if>
    	</rdf:Description>
	</xsl:if> 
	<!-- Revised BiologicalTaxon as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/RB">
		<xsl:variable name="rbn-species">
			<xsl:choose>
				<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./RBN/RBNA)), '-', arco-fn:urify(normalize-space(./RBN/RBNB)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="arco-fn:urify(normalize-space(./RBN/RBNB))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-subspecies" >
			<xsl:choose>
				<xsl:when test="./RBN/RBND">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBND)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-variety" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNF">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNF)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-form" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNH">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNH)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-cultivar" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNL">
					<xsl:value-of select="concat('-', arco-fn:urify(normalize-space(./RBN/RBNL)))" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-species-lab">
			<xsl:choose>
				<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
					<xsl:value-of select="concat(./RBN/RBNA, ' ', ./RBN/RBNB)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./RBN/RBNB" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-subspecies-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBND">
					<xsl:value-of select="concat(' ', ./RBN/RBND)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-variety-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNF">
					<xsl:value-of select="concat(' ', ./RBN/RBNF)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-form-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNH">
					<xsl:value-of select="concat(' ', ./RBN/RBNH)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbn-cultivar-lab" >
			<xsl:choose>
				<xsl:when test="./RBN/RBNL">
					<xsl:value-of select="concat(' ', ./RBN/RBNL)" />
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxon">   
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr (recupero pregresso)')">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA)))" />
				</xsl:when>                	
				<xsl:otherwise>
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form, $rbn-cultivar)" />		                		
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxonLabel">   		
			<xsl:choose>
				<xsl:when test="./RBN/RBNA and not(lower-case(normalize-space(./RBN/RBNA))='nr' or lower-case(normalize-space(./RBN/RBNA))='n.r.' or lower-case(normalize-space(./RBN/RBNA))='nr (recupero pregresso)')">
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="./RBN/RBNA" />
					</xsl:call-template>
				</xsl:when>                	
				<xsl:otherwise>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab, $rbn-cultivar-lab)" />
					</xsl:call-template>	                		
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="./RBR/RBRN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
    				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./RBR/RBRN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalTaxon'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RBR/RBRN" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RBR/RBRN" />
				</l0:name>
			</rdf:Description>
		</xsl:if>	   
		<xsl:if test="./RBN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="$RevisedTaxon" />
	        	</xsl:attribute>    
				<xsl:if test="./RBR/RBRB and (not(starts-with(lower-case(normalize-space(./RBR/RBRB)), 'nr')) and not(starts-with(lower-case(normalize-space(./RBR/RBRB)), 'n.r')))">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	    	    			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>	
				<rdfs:label>
    	        	 <xsl:value-of select="$RevisedTaxonLabel" />
        	   	</rdfs:label>
				<l0:name>
					<xsl:value-of select="$RevisedTaxonLabel" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>																		
		<xsl:if test="./RBN/RBNL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
    	           <xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form, $rbn-cultivar)" />	
        	    </xsl:attribute>
            	<rdf:type>
            		<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cultivar'" />      
        	    	</xsl:attribute>
            	</rdf:type>
	            <rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab, $rbn-cultivar-lab)" />
					</xsl:call-template>
	            </rdfs:label>
    	        <l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab, $rbn-cultivar-lab)" />
					</xsl:call-template>
	            </l0:name>
				<arco-core:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form)" />
					</xsl:attribute>	
				</arco-core:hasDirectHigherRank>
  			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RBN/RBNH">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	               <xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety, $rbn-form)" />
    	        </xsl:attribute>
        	    <rdf:type>
            		<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalForm'" />      
	            	</xsl:attribute>
    	        </rdf:type>
        	   <rdfs:label>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab)" />
					</xsl:call-template>
    	        </rdfs:label>
        	    <l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab, $rbn-form-lab)" />
					</xsl:call-template>
    	        </l0:name>
        	    <xsl:if test="./RBN/RBNI">
            		<arco-lite:hasAuthor>
            			<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNI))" />
        		    	</xsl:attribute>
            		</arco-lite:hasAuthor>
	            </xsl:if>
    	        <arco-core:hasDirectHigherRank>
        	    	<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety)" />
					</xsl:attribute>	
				</arco-core:hasDirectHigherRank>          
  			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RBN/RBNF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies, $rbn-variety)" />
				</xsl:attribute>
            	<rdf:type>
		            <xsl:attribute name="rdf:resource">
        		    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BotanicalVariety'" />      
		            </xsl:attribute>
        	    </rdf:type>
            	<rdfs:label>
            		<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab)" />
					</xsl:call-template>
    	        </rdfs:label>
        	    <l0:name>
            		<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab, $rbn-variety-lab)" />
					</xsl:call-template>
    	        </l0:name>
        	    <xsl:if test="./RBN/RBNG">
            		<arco-lite:hasAuthor>
            			<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNG))" />
        		    	</xsl:attribute>
            		</arco-lite:hasAuthor>
	            </xsl:if>
    	        <arco-core:hasDirectHigherRank>
        	    	<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies)" />
					</xsl:attribute>	
				</arco-core:hasDirectHigherRank>           
  			</rdf:Description>
		</xsl:if>	
		<xsl:if test="./RBN/RBND">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species, $rbn-subspecies)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/BiologicalSubspecies'" />      
					</xsl:attribute>
	            </rdf:type>
    	        <rdfs:label>
        	    	 <xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab)" />
					</xsl:call-template>
	            </rdfs:label>
    	        <l0:name>
        	    	<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat($rbn-species-lab, $rbn-subspecies-lab)" />
					</xsl:call-template>
	            </l0:name>	
    	        <xsl:if test="./RBN/RBNE">
        	    	<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNE))" />
	            		</xsl:attribute>
	            	</arco-lite:hasAuthor>
    	        </xsl:if>
        	    <arco-core:hasDirectHigherRank>
            		<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species)" />
					</xsl:attribute>	
				</arco-core:hasDirectHigherRank>        
    		</rdf:Description>
		</xsl:if>
		<xsl:if test="./RBN/RBNB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', $rbn-species)" />
				</xsl:attribute>
				<xsl:if test="./RBN/RBNA">
					<arco-core:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./RBN/RBNA))" />
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
						<xsl:with-param name="text" select="$rbn-species-lab" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="$rbn-species-lab" />
					</xsl:call-template>
				</l0:name>
				<xsl:if test="./RBN/RBNC">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNC))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="./RBN/RBNA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            	   <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./RBN/RBNA))" />
	            </xsl:attribute>
    	        <rdf:type>
        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Genus'" />      
            	</rdf:type>
	            <rdfs:label>
    	        	 <xsl:value-of select="./RBN/RBNA" />
        	    </rdfs:label>
            	<l0:name>
            		<xsl:value-of select="./RBN/RBNA" />
	            </l0:name>
    		</rdf:Description>
		</xsl:if>	
	</xsl:for-each>	
	<!-- Time Interval as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVC), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVE), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
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
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/DBV/DBVF))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<!-- accession as individual  -->
 	<xsl:if test="record/metadata/schede/BNB/SB/ABC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Accession/', $itemURI)" />
			</xsl:attribute>
	        <rdf:type>
				<xsl:attribute name="rdf:resource">
	        		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Accession'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Accessione del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Accessione del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Accession of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Accession of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
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
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCC">
							<xsl:value-of	select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCC), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCE), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/ABC/ABCF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
		<!-- Agent as individual -->
		<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
			<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
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
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
		<!-- Time Interval as individual -->
		<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCC), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCE">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCE), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
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
				<arco-arco:startTime>
					<xsl:value-of select="$startDate" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="$endDate" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/ABC/ABCF))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
				</l0:name>
				<arco-arco:startTime>
					<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
	</xsl:if>			
	<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/SB/SBE">
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
			<xsl:if test="./SBEC">
				<arco-dd:hasFontStyle>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(./SBEC)))" />
					</xsl:attribute>
				</arco-dd:hasFontStyle>
			</xsl:if>
			<xsl:if test="./SBET">
				<arco-spe:bodyTranscript>
					<xsl:value-of select="normalize-space(./SBET)" />
				</arco-spe:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SBEL and (not(starts-with(lower-case(normalize-space(./SBEL)), 'nr')) and not(starts-with(lower-case(normalize-space(./SBEL)), 'n.r')))">
				<xsl:for-each select="./SBEL">
					<language:hasLanguage>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</language:hasLanguage>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./SBEG">
				<arco-spe:graphicSymbols>
					<xsl:value-of select="normalize-space(./SBEG)" />
				</arco-spe:graphicSymbols>
			</xsl:if>
			<xsl:if test="./SBEI">
				<arco-spe:headingTranscript>
					<xsl:value-of select="normalize-space(./SBEI)" />
				</arco-spe:headingTranscript>
			</xsl:if>		
		</rdf:Description>
		<!-- language as an individual -->
		<xsl:if test="./SBEL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(./SBEL)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/italia/onto/Language/Language" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(./SBEL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./SBEL)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<!-- Font style as individual -->
		<xsl:if test="./SBEC and (not(starts-with(lower-case(normalize-space(./SBEC)), 'nr')) and not(starts-with(lower-case(normalize-space(./SBEC)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	    	       	<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(./SBEC)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/FontStyle" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(./SBEC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./SBEC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Specimen Harvesting as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SpecimenHarvesting'" />
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
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/LR/LRD/LRDA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasOperator>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIE">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRI/LRIE)" />
				</arco-core:note>
			</xsl:if>			
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/LR/LRD/LRDF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<!-- Time Interval as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
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
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/LR/LRD/LRDF))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>	
	<!-- TimeIndexedTypedLocation as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI or record/metadata/schede/BNB/LR/LRV">
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
			<!-- at location -->
			<xsl:for-each select="record/metadata/schede/*/LR/LRV">
				<arco-location:atLocation>
					<xsl:choose>
						<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
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
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIP">
				<arco-dd:hasOrientation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIP)))" />
				</xsl:attribute>
				</arco-dd:hasOrientation>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI">
				<arco-location:hasNaturalEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasNaturalEnvironment>		
			</xsl:if>				
			<arco-location:hasLocationType>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="'https://w3id.org/arco/ontology/location/CollectingLocation'" />
            	</xsl:attribute>
			</arco-location:hasLocationType>			
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/LR/LRD/LRDF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
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
						<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
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
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</clvapit:hasAddress>
			<xsl:for-each select="../LRL">
				<arco-location:hasToponymInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-location:hasToponymInTime>
			</xsl:for-each>
		</rdf:Description>
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
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
		<xsl:for-each select="../LRL">
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
	<!-- Measurement collection as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH or record/metadata/schede/BNB/LR/LRI/LRIT or record/metadata/schede/BNB/LR/LRI/LRIO">
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
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-temperature')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-ph')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>		
		</rdf:Description>
	</xsl:if>	
	<!-- measurement as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Depth')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</arco-dd:hasValue>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-ph')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Ph')" />
			</arco-dd:hasMeasurementType>			
		</rdf:Description>
	</xsl:if>						
	<!-- Substrate as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Substrate/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIR)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/location/Substrate'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIR" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIR" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRII">
				<arco-location:hasIncline>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Incline/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRII)))" />
					</xsl:attribute>
				</arco-location:hasIncline>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIJ">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SubstrateType/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIJ)))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>	
		</rdf:Description>
	</xsl:if>
	<!-- Substrate type as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIJ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'SubstrateType/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIJ)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/arco/ontology/location/SubstrateType'" />
                </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIJ" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIJ" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- NaturalEnvironment as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironment'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/LR/LRI/LRIB">
						<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIB" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('Ambiente del bene culturale: ', $itemURI)" />
					</xsl:otherwise>
				</xsl:choose>
			</rdfs:label>
			<l0:name>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/LR/LRI/LRIB">
						<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIB" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('Ambiente del bene culturale: ', $itemURI)" />
					</xsl:otherwise>
				</xsl:choose>
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRID">
				<arco-location:hasFluidDynamism>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'FluidDynamism/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRID)))" />
				</xsl:attribute>
				</arco-location:hasFluidDynamism>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIS">
				<arco-location:hasShadeTolerance>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ShadeTolerance/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIS)))" />
				</xsl:attribute>
				</arco-location:hasShadeTolerance>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
				<arco-location:hasClimateSituation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasClimateSituation>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH or record/metadata/schede/BNB/LR/LRI/LRIO">
				<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
				</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIR">
				<arco-location:hasSubstrate>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Substrate/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIR)))" />
				</xsl:attribute>
				</arco-location:hasSubstrate>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	<!-- Climate situation as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/ClimateSituation" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Climate situation ', position(), ' of cultural property: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Climate situation ', position(), ' of cultural property: ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Situazione climatica ', position(), ' del bene culturale: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Situazione climatica ', position(), ' del bene culturale: ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-environment-measurement-collection-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-climate-situation-measurement-collection')" />
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
			<arco-dd:hasMeasurement>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-temperature-climate-situation')" />
				</xsl:attribute>
			</arco-dd:hasMeasurement>	
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-temperature-climate-situation')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of climate situaion of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of climate situaion of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura della situazione climatica di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura della situazione climatica di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Temperature')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT))" />
			</arco-dd:hasValue>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementUnit/C')" />
				</xsl:attribute>
			</mu:hasMeasurementUnit>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/C')" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="'°C'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'°C'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<!-- Incline as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRII">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS, 'Incline/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRII)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/location/Incline'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRII" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRII" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Orientation as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIP)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Orientation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIP" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIP" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Fluid dynamism as individual  -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRID">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'FluidDynamism/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRID)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/location/FluidDynamism'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRID" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRID" />
			</l0:name>
		</rdf:Description>
	</xsl:if>	
	<!-- Shade tolerance as individual  -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'ShadeTolerance/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIS)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/arco/ontology/location/ShadeTolerance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIS" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIS" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Laboratory test as individual  -->
 	<xsl:for-each select="record/metadata/schede/BNB/RB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
			      	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LaboratoryTest'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Laboratory test of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</l0:name>		
			<xsl:for-each select="./RBR/RBRA">
				<xsl:variable name="virgola" select="." />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasOperator>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="./RBR/RBRB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-laboratory-test-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RBR/RBRT">	
				<arco-core:hasType>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'LaboratoryTestType/', arco-fn:urify(./RBR/RBRT))" />
				</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="./RBA">
				<arco-core:note>
					<xsl:value-of select="normalize-space(./RBA)" />
				</arco-core:note>
			</xsl:if>					
			<xsl:if test="./RBR/RBRN or ./RBN">
				<arco-core:hasConsequence>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-revised-identification-', position())" />
					</xsl:attribute>
				</arco-core:hasConsequence>
				<arco-core:hasConsequence>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
					</xsl:attribute>
				</arco-core:hasConsequence>
			</xsl:if>	
			<xsl:if test="./RBD/RBDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDC">
							<xsl:value-of 	select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDE">
							<xsl:value-of select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBD/RBDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBD/RBDF, '-',  ./RBD/RBDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
		<!-- Laboratory Test type as individual  -->
		<xsl:if test="./RBR/RBRT">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LaboratoryTestType/', arco-fn:urify(./RBR/RBRT))" />
				</xsl:attribute>
		        <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/LaboratoryTestType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="./RBR/RBRT" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="./RBR/RBRT" />
				</l0:name>	
			</rdf:Description>
		</xsl:if>
		<!-- Time Interval as individual -->
		<xsl:if test="./RBD/RBDB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="./RBD/RBDC">
						<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(./RBD/RBDB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="./RBD/RBDE">
						<xsl:value-of select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(./RBD/RBDD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
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
				<arco-arco:startTime>
					<xsl:value-of select="$startDate" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="$endDate" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RBD/RBDF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBD/RBDF, '-',  ./RBD/RBDF)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="concat(./RBD/RBDF, ' - ', ./RBD/RBDF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="concat(./RBD/RBDF, ' - ', ./RBD/RBDF)" />
				</l0:name>
				<arco-arco:startTime>
					<xsl:value-of select="./RBD/RBDF" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="./RBD/RBDF" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<!--Laboratory test Bibliography as individual -->
		<xsl:if test="./RBR/RBRB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-laboratory-test-bibliography-', position())" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa ad analisi di laboratorio del campione ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa ad analisi di laboratorio del campione', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about laboratory test of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about laboratory test of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="normalize-space(./RBR/RBRB)" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- biological-taxon-bibliography as individual  -->
	<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al taxon biologico del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al taxon biologico del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Bibliography about biological taxon of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Bibliography about biological taxon of cultural property ', $itemURI)" />
			</l0:name>
			<arco-cd:completeBibliographicReference>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)" />
			</arco-cd:completeBibliographicReference>			
		</rdf:Description>
	</xsl:if>
	<!-- Preparation as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Preparation/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Preparation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Preparato ', position(), ' relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Preparato ', position(), ' relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Preparation ', position(), ' related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Preparation ', position(), ' related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBRA">
				<xsl:variable name="virgola" select="./DBRA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBRT">	
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreparationType/', arco-fn:urify(./DBRT))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="./DBRD">
				<arco-spe:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBRD)" />
				</arco-spe:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBRS">
				<arco-core:description>
					<xsl:value-of select="normalize-space(./DBRS)" />
				</arco-core:description>
			</xsl:if>				
		</rdf:Description>
		<!-- Preparation type as individual  -->
		<xsl:if test="./DBRT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	       <xsl:value-of select="concat($NS, 'PreparationType/', arco-fn:urify(./DBRT))" />
        		</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PreparationType'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./DBRT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./DBRT" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>						
	<!-- Fruit sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'FruitSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	        		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/FruitSample'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto carpologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto carpologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Fruit sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Fruit sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBCA">
				<xsl:variable name="virgola" select="./DBCA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBCC">	
				<arco-spe:sampleLocation>
					<xsl:value-of select="normalize-space(./DBCC)" />
				</arco-spe:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBCD">
				<arco-spe:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBCD)" />
				</arco-spe:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBCE">
				<arco-spe:dateOfLastChangePreservative>
					<xsl:value-of select="normalize-space(./DBCE)" />
				</arco-spe:dateOfLastChangePreservative>
			</xsl:if>
			<xsl:if test="./DBCX">
				<arco-spe:hasPreservationType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreservationType/', arco-fn:urify(./DBCX))" />
					</xsl:attribute>
				</arco-spe:hasPreservationType>
			</xsl:if>			
		</rdf:Description>
		<!-- Preservation Type as individual -->
		<xsl:if test="./DBCX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PreservationType/', arco-fn:urify(./DBCX))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PreservationType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./DBCX" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./DBCX" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!--Wood Sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'WoodSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/WoodSample'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto xilologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto xilologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Wood sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Wood sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBXT">
				<xsl:variable name="virgola" select="./DBXT" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBXC">	
				<arco-spe:sampleLocation>
					<xsl:value-of select="normalize-space(./DBXC)" />
				</arco-spe:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBXO">
				<arco-spe:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBXO)" />
				</arco-spe:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBXX">
				<arco-dd:hasShape>
					<xsl:attribute name="rdf:resource">
		 	           	<xsl:value-of select="concat($NS, 'SampleShape/', arco-fn:urify(./DBXX))" />
		            </xsl:attribute>
				</arco-dd:hasShape>
			</xsl:if>
			<xsl:if test="./DBXA or ./DBXL or ./DBXN or ./DBXD or ./DBXP">
				<arco-cd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', 'WoodSample', '-', position(), '-related-sample-measurement-collection')" />
					</xsl:attribute>
				</arco-cd:hasMeasurementCollection>
			</xsl:if>
		</rdf:Description>
		<!-- Measurement collection as individual -->
		<xsl:if test="./DBXA or ./DBXL or ./DBXN or ./DBXD or ./DBXP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', 'WoodSample', '-', position(), '-related-sample-measurement-collection')" />
	    		</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            	   		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure del reperto di collezione di xiloteca'" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure del reperto di collezione di xiloteca'" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of wood sample'" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of wood sample'" />
				</l0:name>
				<xsl:if test="./DBXA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-height')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./DBXL">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-width')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./DBXN">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-length')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./DBXD">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-diameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./DBXP">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>					
			</rdf:Description>
		</xsl:if>
		<!-- measurement as individual -->
		<xsl:variable name="parent-id" select="position()" />
		<xsl:if test="./DBXA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-height')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXA))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXA))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXA))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXA))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Height')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./DBXA))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./DBXA))" />
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:if>		
		<xsl:if test="./DBXL">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-width')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXL))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXL))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXL))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXL))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Width')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./DBXL))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./DBXL))" />
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./DBXN">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-length')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXN))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXN))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXN))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXN))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Length')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./DBXN))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./DBXN))" />
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./DBXD">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-diameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXD))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXD))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXD))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXD))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Diameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./DBXD))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./DBXD))" />
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./DBXP">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-weight')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXP))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (./DBXP))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXP))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (./DBXP))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Weight')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./DBXP))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(./DBXP))" />
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:if>				
		<!-- Shape as individual -->
		<xsl:if test="./DBXX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SampleShape/', arco-fn:urify(./DBXX))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./DBXX" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./DBXX" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	            	</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>		
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Pollen Sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PollenSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PollenSample'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto palinologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto palinologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pollen sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pollen sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBPA">
				<xsl:variable name="virgola" select="./DBPA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
    						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBPC">	
				<arco-spe:sampleLocation>
					<xsl:value-of select="normalize-space(./DBPC)" />
				</arco-spe:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBPD">
				<arco-spe:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBPD)" />
				</arco-spe:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBPT">
				<arco-core:note>
					<xsl:value-of select="concat('Tecnica di preparazione: ', normalize-space(./DBPT))" />
				</arco-core:note>
			</xsl:if>		
		</rdf:Description>
	</xsl:for-each>
	<!-- Seed sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'SeedSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SeedSample'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto spermologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto spermologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Seed sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Seed sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBSR">
				<xsl:variable name="virgola" select="./DBSR" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-lite:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBSC">	
				<arco-spe:sampleLocation>
					<xsl:value-of select="normalize-space(./DBSC)" />
				</arco-spe:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBSD">
				<arco-spe:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBSD)" />
				</arco-spe:manufacturingDate>
			</xsl:if>			
		</rdf:Description>
	</xsl:for-each>
	<!-- Typification as individual -->								
 	<xsl:if test="record/metadata/schede/BNB/SB/TBI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Typification/', $itemURI)" />
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
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIT">	
				<arco-spe:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIT))" />
				</xsl:attribute>
				</arco-spe:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
				<arco-spe:producesTaxon>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="$TypespecimenTaxon" />
					</xsl:attribute>
				</arco-spe:producesTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT">
				<arco-spe:producesTaxon>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="$TypespecimenTaxon" />
					</xsl:attribute>
				</arco-spe:producesTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/TBI/TBIA" />
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
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIC">
							<xsl:value-of	select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIC), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIE">
							<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIE), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBID))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBID)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIF))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
		<!--TypeSpecimen Bibliography as individual -->
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL">
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
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<!--TypeSpecimen Type as individual -->
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeSpecimenType/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>		
		<!-- Time Interval as individual for TypeSpecimen -->
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIC), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIE">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIE), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBID))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBID)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
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
				<arco-arco:startTime>
					<xsl:value-of select="$startDate" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="$endDate" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIF))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
				</l0:name>
				<arco-arco:startTime>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
				</arco-arco:endTime>
			</rdf:Description>														
		</xsl:if>								
	</xsl:if>							
	<!--Host Individual as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'HostIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIM))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/HostIndividual'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIM" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIM" />
			</l0:name>
		</rdf:Description>
	</xsl:if>		
	<!--Close Individual as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'CloseIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIV))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CloseIndividual'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>						
	<!-- value as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXA">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXL">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>		
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXN">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>			
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXD">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>		
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXP">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>		
	<!-- Agent as individual -->
	<xsl:if test="record/metadata/schede/*/SB/DBV/DBVA">
		<xsl:variable name="virgola" select="record/metadata/schede/*/SB/DBV/DBVA" />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/TBI/TBIA" />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRA">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/LR/LRD/LRDA" />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAC))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAC)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAG))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAI))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAI)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAI)" />
			</l0:name>
		</rdf:Description>
	</xsl:if> 
    <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATC))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATC)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATG))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATI))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATI)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATI)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNC">
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
				<xsl:value-of select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>  
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNE">
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
				<xsl:value-of select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>    
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNG">
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
				<xsl:value-of select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNI">
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
				<xsl:value-of select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>    
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBC/DBCA">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXT">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBS/DBSR">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBP/DBPA">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBR/DBRA">
		<xsl:variable name="virgola" select="." />
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
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<!-- MeasurementUnit as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXA">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXL">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXP">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	</xsl:if>
	
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>