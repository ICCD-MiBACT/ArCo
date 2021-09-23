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
	xmlns:arco-con="https://w3id.org/arco/ontology/construction-description/"

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />
		
<xsl:template match="/">
	<rdf:RDF>
		<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />	
		<!-- Properties of ArchitecturalHeritage -->						
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
	<xsl:if test="$sheetType='A' or $sheetType='PG'" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="$sheetType='A'">
				<rdf:type>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/A/SI/SII/SIIN or record/metadata/schede/A/SI/SII/SIIP">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Building'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:type>
			</xsl:if>
			<xsl:if test="$sheetType='PG'">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/OpenSpace'" />
					</xsl:attribute>
				</rdf:type>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/LC/PVC/PVCA">
				<arco-con:hasConstructionElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Facade/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-con:hasConstructionElement>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/UB/UBV">
				<arco-con:hasConstructionElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Facade/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-con:hasConstructionElement>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/A/IS/IST">
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/A/IS/IST" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/A/IS/ISP">
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/A/IS/ISP" />
				</arco-core:description>
			</xsl:if>
			<!-- Preexistence -->
			<xsl:for-each select="record/metadata/schede/*/PE/PRE">
				<xsl:choose>	
					<xsl:when test="not(./PREU) or ./PREU='intero bene' or ./PREU='integrale' or ./PREU='tutta' or ./PREU='totale' or ./PREU='carattere generale' or (starts-with(lower-case(normalize-space(./PREU)), 'nr')) or (starts-with(lower-case(normalize-space(./PREU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PREU)), 'intero')) or (starts-with(lower-case(normalize-space(./PREU)), 'intera')) or (starts-with(lower-case(normalize-space(./PREU)), 'esemplar'))">
						<arco-con:hasPreviousStructureOrElements>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PreviousConstruction/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PREI)))" />
							</xsl:attribute>
						</arco-con:hasPreviousStructureOrElements>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PREU)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- Construction space -->
			<xsl:for-each select="record/metadata/schede/A/SI/SII">
				<xsl:if test="./SIIN">
					<xsl:choose>
						<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
							<arco-con:numberOfFloors>
								<xsl:value-of select="normalize-space(./SIIN)" />
							</arco-con:numberOfFloors>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./SIIR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Interior subdivision -->
				<xsl:if test="./SIIV">
					<xsl:choose>
						<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
							<arco-con:hasInteriorSubdivision>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIV)))" />
							</xsl:attribute>
							</arco-con:hasInteriorSubdivision>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./SIIR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="./SIIO">
					<xsl:choose>	
						<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
							<arco-con:hasInteriorSubdivision>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIO)))" />
							</xsl:attribute>
							</arco-con:hasInteriorSubdivision>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./SIIR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Floor -->
				<xsl:if test="./SIIP">
					<xsl:variable name="siip-virgola" select="./SIIP" />
					<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
					<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
					<xsl:choose>
						<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
							<xsl:for-each select="$floorssplit">
								<arco-con:hasConstructionSpace>
									<xsl:attribute name="rdf:resource">
    		    						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(.))" />
									</xsl:attribute>
								</arco-con:hasConstructionSpace>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./SIIR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<!-- Layout e Design -->
			<xsl:for-each select="record/metadata/schede/A/PN">
				<xsl:if test="./PNT/PNTS or ./PNT/PNTF">
					<xsl:choose>	
						<xsl:when test="not(./PNR) or ./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale' or ./PNR='carattere generale' or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar'))">
						<xsl:variable name="layout"> 		
							<xsl:choose>
								<xsl:when test="./PNT/PNTS and ./PNT/PNTF">
									<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), '-', normalize-space(./PNT/PNTF))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), normalize-space(./PNT/PNTF))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
							<arco-con:hasLayout>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$layout" />
								</xsl:attribute>
							</arco-con:hasLayout>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./PNR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>			
				<xsl:if test="./PNT/PNTQ or ./PNT/PNTE">
				<xsl:choose>	
					<xsl:when test="not(./PNR) or ./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale' or ./PNR='carattere generale' or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar'))">
						<arco-con:hasDesign>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PNT)))" />
						</xsl:attribute>
						</arco-con:hasDesign>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./PNR">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<!-- Soil -->
			<xsl:if test="record/metadata/schede/A/FN/FNA">
				<arco-con:laysOnSoil>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
					</xsl:attribute>
				</arco-con:laysOnSoil>
			</xsl:if>
			<!-- Foundation -->
			<xsl:for-each select="record/metadata/schede/A/FN/FNS">
				<xsl:choose>	
					<xsl:when test="not(./FNSU) or ./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or ./FNSU='carattere generale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar'))">
						<arco-con:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-con:hasConstructionElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./FNSU">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>				
			<!-- Vertical element -->
			<xsl:for-each select="record/metadata/schede/A/SV/SVC">
				<xsl:choose>	
					<xsl:when test="not(./SVCU) or ./SVCU='intero bene' or ./SVCU='integrale' or ./SVCU='tutta' or ./SVCU='totale' or ./SVCU='carattere generale' or (starts-with(lower-case(normalize-space(./SVCU)), 'nr')) or (starts-with(lower-case(normalize-space(./SVCU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intero')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intera')) or (starts-with(lower-case(normalize-space(./SVCU)), 'esemplar'))">
						<arco-con:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-con:hasConstructionElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./SVCU">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>	
			<!-- Horizontal element -->
			<xsl:for-each select="record/metadata/schede/A/SO">
				<xsl:choose>	
					<xsl:when test="not(./SOU) or ./SOU='intero bene' or ./SOU='integrale' or ./SOU='tutta' or ./SOU='totale' or ./SOU='carattere generale' or (starts-with(lower-case(normalize-space(./SOU)), 'nr')) or (starts-with(lower-case(normalize-space(./SOU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOU)), 'intero')) or (starts-with(lower-case(normalize-space(./SOU)), 'intera')) or (starts-with(lower-case(normalize-space(./SOU)), 'esemplar'))">
						<arco-con:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-con:hasConstructionElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./SOU">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- Roof and Roofing -->
			<xsl:for-each select="record/metadata/schede/A/CP">
				<xsl:if test="./CPF/* or ./CPC/*">		
					<xsl:choose>	
						<xsl:when test="not(./CPU) or ./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or ./CPU='carattere generale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar'))">
							<arco-con:hasConstructionElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
								</xsl:attribute>
							</arco-con:hasConstructionElement>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPU)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="./CPM">
					<xsl:choose>	
						<xsl:when test="not(./CPU) or ./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or ./CPU='carattere generale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar'))">
							<xsl:choose>
								<xsl:when test="not(./CPM/CPMR) or ./CPM/CPMR='intero bene' or ./CPM/CPMR='integrale' or ./CPM/CPMR='tutta' or ./CPM/CPMR='totale' or ./CPM/CPMR='carattere generale' or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'esemplar'))">
									<arco-con:hasCovering>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
										</xsl:attribute>
									</arco-con:hasCovering>
								</xsl:when>
								<xsl:otherwise>
									<arco-core:hasPart>
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPM/CPMR)))" />
									</arco-core:hasPart>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPU)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<!-- Flooring -->
			<xsl:for-each select="record/metadata/schede/*/PV/PVM">
				<xsl:choose>	
					<xsl:when test="not(./PVMU) or ./PVMU='intero bene' or ./PVMU='integrale' or ./PVMU='tutta' or ./PVMU='totale' or ./PVMU='carattere generale' or (starts-with(lower-case(normalize-space(./PVMU)), 'nr')) or (starts-with(lower-case(normalize-space(./PVMU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intero')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intera')) or (starts-with(lower-case(normalize-space(./PVMU)), 'esemplar'))">
						<arco-con:hasCovering>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasCovering>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./PVMU">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<!-- Stair -->
			<xsl:for-each select="record/metadata/schede/*/SC">
				<xsl:choose>	
					<xsl:when test="not(./SCL/SCLU) or ./SCL/SCLU='intero bene' or ./SCL/SCLU='integrale' or ./SCL/SCLU='tutta' or ./SCL/SCLU='totale' or ./SCL/SCLU='carattere generale' or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'nr')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intero')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intera')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'esemplar'))">
						<arco-con:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-con:hasConstructionElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./SCL/SCLU">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</rdf:Description>
		<!-- Facade as individual -->
		<xsl:for-each select="record/metadata/schede/*/LC/PVC/PVCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	    	    	<xsl:value-of select="concat($NS, 'Facade/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Facade'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Facciata ', position(), ' del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Facciata ', position(), ' del bene culturale: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Facade ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Facade ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-core:note>
					<xsl:value-of select="." />
				</arco-core:note>
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/UB/UBV">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	    	    	<xsl:value-of select="concat($NS, 'Facade/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Facade'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Facciata ', position(), ' del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Facciata ', position(), ' del bene culturale: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Facade ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Facade ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<xsl:if test="./UBVA and starts-with(lower-case(normalize-space(./UBVA)), 'principale')">
					<arco-con:mainFacade>
						<xsl:value-of select="true()" />
					</arco-con:mainFacade>
				</xsl:if>
				<xsl:if test="./UBVP">
					<arco-core:note>
						<xsl:value-of select="./UBVP" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./UBVD">
					<arco-core:note>
						<xsl:choose>
							<xsl:when test="./UBVN">
								<xsl:value-of select="concat('Affaccio su ', ./UBVD, ' ', ./UBVN)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Affaccio su ', ./UBVD)" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./UBVK">
					<arco-core:note>
						<xsl:choose>
							<xsl:when test="./UBVL">
								<xsl:value-of select="concat(./UBVK, ' ', ./UBVL)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./UBVK" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- Architectural Space as individual -->
		<xsl:for-each select="record/metadata/schede/A/SI/SII">
			<!-- Vertical subdivision as individual -->
			<xsl:if test="./SIIV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	    	    		<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIV)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalSubdivision'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SIIV)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SIIV)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Horizontal subdivision as individual -->
			<xsl:if test="./SIIO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	    	    		<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIO)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalSubdivision'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SIIO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SIIO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Floor as individual -->
			<xsl:if test="./SIIP">
				<xsl:if test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
				<xsl:variable name="siip-virgola" select="./SIIP" />
				<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
				<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
					<xsl:for-each select="$floorssplit">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
   	    						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(.))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Floor'" />
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
		</xsl:for-each>
		<!-- ConstructionDesign as individual -->
		<xsl:for-each select="record/metadata/schede/A/PN/PNT">
			<xsl:if test="./PNTQ or ./PNTE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	    	    		<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionDesign'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="en">
						<xsl:value-of select="concat('Construction design  of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="concat('Construction design  of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label  xml:lang="it">
						<xsl:value-of select="concat('Pianta del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="concat('Pianta del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./PNTQ">
						<arco-con:refersToFloorOrLevel>
							<xsl:value-of select="normalize-space(./PNTQ)" />
						</arco-con:refersToFloorOrLevel>
					</xsl:if>
					<xsl:for-each select="./PNTE">
						<arco-con:significantIconographicInformation>
							<xsl:value-of select="normalize-space(.)" />
						</arco-con:significantIconographicInformation>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>		
		<!-- Layout as individual -->
		<xsl:for-each select="record/metadata/schede/A/PN/PNT">
			<xsl:if test="./PNTS or ./PNTF">
				<rdf:Description>
					<xsl:variable name="layout"> 
						<xsl:choose>
							<xsl:when test="./PNTS and ./PNTF">
								<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), '-', normalize-space(./PNTF))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), normalize-space(./PNTF))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="rdf:about">
		        		<xsl:value-of select="$layout" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/PlanLayout'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:variable name="layoutLabel"> 
						<xsl:choose>
							<xsl:when test="./PNTS and ./PNTF">
								<xsl:value-of select="concat(normalize-space(./PNTS), ' ', normalize-space(./PNTF))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(./PNTS), normalize-space(./PNTF))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label>
						<xsl:value-of select="$layoutLabel" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="$layoutLabel" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- Preexistence as individual -->	
		<xsl:for-each select="record/metadata/schede/*/PE/PRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PreviousConstruction/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PREI)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./PREI)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./PREI)" />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
		<!-- Foundation as individual -->
		<xsl:for-each select="record/metadata/schede/A/FN/FNS">
			<xsl:variable name="fnst" select="normalize-space(./FNST)" />
			<xsl:variable name="fnsq" select="normalize-space(./FNSQ)" />
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Foundation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Foundation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Foundation of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Fondazioni del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Fondazioni del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:choose>	
					<xsl:when test="not(./FNSU) or ./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or ./FNSU='carattere generale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar'))">
						<arco-con:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$culturalProperty" />
							</xsl:attribute>
						</arco-con:isFoundationOf>
					</xsl:when>
					<xsl:otherwise>
						<arco-con:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSU)))" />
							</xsl:attribute>
						</arco-con:isFoundationOf>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="./FNSM">
					<arco-dd:hasMaterial>
	 	                	<xsl:attribute name="rdf:resource">
	            				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            			</xsl:attribute>
	 	                </arco-dd:hasMaterial>
				</xsl:for-each>
				<xsl:if test="./FNSC">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FNSC)))" />
						</xsl:attribute>
	            	</arco-dd:hasTechnique>
				</xsl:if>
	           	<xsl:choose>
					<xsl:when test="./FNSQ">
						<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />
						</xsl:attribute>
						</arco-core:hasType>	
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify($fnst))" />
						</xsl:attribute>
						</arco-core:hasType>
					</xsl:otherwise>		
				</xsl:choose>
			</rdf:Description>
			<!-- Material as individual -->
			<xsl:for-each select="./FNSM">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	        	    	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:for-each>
			<!-- Technique as individual -->
			<xsl:if test="./FNSC">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	        	    	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FNSC)))" />
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FNSC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FNSC)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- FoundationType as individual -->
			<xsl:if test="./FNST">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:choose>
							<xsl:when test="./FNSQ">
								<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(normalize-space(concat(./FNST, '-', ./FNSQ))))" />
							</xsl:when>
							<xsl:otherwise>	
								<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(normalize-space(./FNST)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
	 	    	    <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/FoundationType'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="./FNSQ">
							<rdfs:label>
								<xsl:value-of 	select="concat(normalize-space(./FNST), ' ', normalize-space(./FNSQ))" />
							</rdfs:label>	
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label>
								<xsl:value-of 	select="normalize-space(./FNST)" />
							</rdfs:label>
						</xsl:otherwise>		
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./FNSQ">
							<l0:name>
								<xsl:value-of 	select="concat(normalize-space(./FNST), ' ', normalize-space(./FNSQ))" />
							</l0:name>	
						</xsl:when>
						<xsl:otherwise>
							<l0:name>
								<xsl:value-of 	select="normalize-space(./FNST)" />
							</l0:name>
						</xsl:otherwise>		
					</xsl:choose>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- Soil as individual -->
		<xsl:if test="record/metadata/schede/A/FN/FNA">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/Soil'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Soil of cultural property: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Suolo del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Soil of cultural property: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Suolo del bene culturale: ', $itemURI)" />
				</l0:name>
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/A/FN/FNA" />
				</arco-core:description>
			</rdf:Description>
		</xsl:if>	
		<!-- Vertical Element as individual -->
		<xsl:for-each select="record/metadata/schede/A/SV/SVC">
			<xsl:variable name="svcc" select="normalize-space(./SVCC)" />
			<xsl:variable name="svcq" select="normalize-space(./SVCQ)" />
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalElement'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Vertical element of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Vertical element of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Elemento verticale del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Elemento verticale del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:for-each select="./SVCM">
					<arco-dd:hasMaterial>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:hasMaterial>
				</xsl:for-each>
				<xsl:if test="./SVCC">
					<xsl:choose>
						<xsl:when test="./SVCQ">
							<arco-dd:hasTechnique>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat($svcc, '-', $svcq)))" />
							</xsl:attribute>
							</arco-dd:hasTechnique>	
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasTechnique>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify($svcc))" />
							</xsl:attribute>
							</arco-dd:hasTechnique>
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:if>
				<xsl:if test="./SVCT">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of 	select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(./SVCT)))" />
						</xsl:attribute>
	            	</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
			<!-- Material as individual -->
			<xsl:for-each select="./SVCM">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	        	    	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:for-each>
			<!-- VerticalElementShape as individual -->
			<xsl:if test="./SVCC">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	 					<xsl:choose>
							<xsl:when test="./SVCQ">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SVCC), '-', normalize-space(./SVCQ))))" />
							</xsl:when>
							<xsl:otherwise>	
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SVCC)))" />
							</xsl:otherwise>
						</xsl:choose>
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="normalize-space(./SVCQ)">
							<rdfs:label>
								<xsl:value-of 	select="concat(normalize-space(./SVCC), ' ', normalize-space(./SVCQ))" />
							</rdfs:label>	
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label>
								<xsl:value-of 	select="normalize-space(./SVCC)" />
							</rdfs:label>
						</xsl:otherwise>		
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./SVCQ">
							<l0:name>
								<xsl:value-of 	select="concat(normalize-space(./SVCC), ' ', normalize-space(./SVCQ))" />
							</l0:name>	
						</xsl:when>
						<xsl:otherwise>
							<l0:name>
								<xsl:value-of 	select="normalize-space(./SVCC)" />
							</l0:name>
						</xsl:otherwise>		
					</xsl:choose>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- VerticalElementType as individual -->
			<xsl:if test="./SVCT">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	        	    	<xsl:value-of select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(.)))" />
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalElementType'" />
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
		<!-- Horizontal Element as individual -->
		<xsl:for-each select="record/metadata/schede/A/SO">
		<xsl:variable name="soff" select="normalize-space(./SOF/SOFF)" />
		<xsl:variable name="sofq" select="normalize-space(string-join(./SOF/SOFQ,'-'))" />
		<xsl:variable name="sofg" select="normalize-space(./SOF/SOFG)" />
		<xsl:variable name="sofp" select="normalize-space(string-join(./SOF/SOFP,'-'))" />
		<xsl:variable name="horElem" select="arco-fn:arcofy(.)" />
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute> 
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElement'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Horizontal element of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Horizontal element of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Elemento orizzontale del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Elemento orizzontale del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./SOF/SOFF">
					<xsl:choose>
						<xsl:when test="./SOF/SOFQ">
							<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat($soff, '-', $sofq)))" />
							</xsl:attribute>
							</arco-dd:hasShape>	
						</xsl:when>
						<xsl:otherwise>
							<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify($soff))" />
							</xsl:attribute>
							</arco-dd:hasShape>
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:if>
				<xsl:if test="./SOF/SOFG">
					<xsl:choose>
						<xsl:when test="./SOF/SOFP">
							<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(concat($sofg, '-', $sofp)))" />
							</xsl:attribute>
							</arco-core:hasType>	
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify($sofg))" />
							</xsl:attribute>
							</arco-core:hasType>
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:if>
				<xsl:if test="./SOE/SOEC">
					<xsl:choose>
						<xsl:when test="not(./SOE/SOER) or ./SOE/SOER='intero bene' or ./SOE/SOER='integrale' or ./SOE/SOER='tutta' or ./SOE/SOER='totale' or ./SOE/SOER='carattere generale' or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'nr')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intero')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intera')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'esemplar'))">
							<arco-dd:hasTechnique>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./SOE/SOES[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'non ') or starts-with(lower-case(normalize-space()), 'n.r'))]">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(concat(string-join(./SOE/SOEC,'-'), '-', string-join(./SOE/SOES,'-')))))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(string-join(./SOE/SOEC,'-'))))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-dd:hasTechnique>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="./SOE/SOER">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'HorizontalElementPart/', $itemURI, '-part-', arco-fn:arcofy(normalize-space(./SOE)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>					
				</xsl:if>
			</rdf:Description>
			<!-- SOER part as individual --> 
			<xsl:if test="./SOE/SOER  and not(./SOE/SOER='intero bene' or ./SOE/SOER='integrale' or ./SOE/SOER='tutta' or ./SOE/SOER='totale' or ./SOE/SOER='carattere generale' or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'nr')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intero')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intera')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'esemplar')))">
				<xsl:if test="./SOE/SOEC"> 
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	        				<xsl:value-of select="concat($NS, 'HorizontalElementPart/', $itemURI, '-part-', arco-fn:arcofy(normalize-space(./SOE)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElement'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label  xml:lang="en">
							<xsl:value-of select="concat('Horizontal element part of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name  xml:lang="en">
							<xsl:value-of select="concat('Horizontal element part of cultural property ', $itemURI)" />
						</l0:name>
						<rdfs:label  xml:lang="it">
							<xsl:value-of select="concat('Parte di elemento di orizzontamento del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name  xml:lang="it">
							<xsl:value-of select="concat('Parte di elemento di orizzontamento del bene culturale ', $itemURI)" />
						</l0:name>
						<xsl:if test="./SOE/SOEC">	
							<arco-dd:hasTechnique>
								<xsl:choose>
									<xsl:when test="./SOE/SOES[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'non ') or starts-with(lower-case(normalize-space()), 'n.r'))]">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(concat(string-join(./SOE/SOEC,'-'), '-', string-join(./SOE/SOES,'-')))))" />
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(string-join(./SOE/SOEC,'-'))))" />
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-dd:hasTechnique>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:if>							
			<!-- HorizontalElementShape as individual -->
			<xsl:if test="./SOF/SOFF">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	 					<xsl:choose>
							<xsl:when test="./SOFQ">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SOF/SOFF), '-', normalize-space(string-join(./SOF/SOFQ,'-')))))" />
							</xsl:when>
							<xsl:otherwise>	
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SOF/SOFF)))" />
							</xsl:otherwise>
						</xsl:choose>
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="./SOFQ">
							<rdfs:label>
								<xsl:value-of 	select="concat(normalize-space(./SOF/SOFF), ' ', normalize-space(string-join(./SOF/SOFQ,', ')))" />
							</rdfs:label>	
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label>
								<xsl:value-of 	select="normalize-space(./SOF/SOFF)" />
							</rdfs:label>
						</xsl:otherwise>		
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./SOF/SOFQ">
							<l0:name>
								<xsl:value-of 	select="concat(normalize-space(./SOF/SOFF), ' ', normalize-space(string-join(./SOF/SOFQ,', ')))" />
							</l0:name>	
						</xsl:when>
						<xsl:otherwise>
							<l0:name>
								<xsl:value-of 	select="normalize-space(./SOF/SOFF)" />
							</l0:name>
						</xsl:otherwise>		
					</xsl:choose>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/HorizontalElementShape'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- HorizontalElementType as individual -->
			<xsl:if test="./SOF/SOFG">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:choose>
							<xsl:when test="./SOFP">
								<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(concat(./SOF/SOFG, '-', string-join(./SOF/SOFP,'-')))))" />
							</xsl:when>
							<xsl:otherwise>	
								<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(./SOF/SOFG)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
	 	    	    <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElementType'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="./SOF/SOFP">
							<rdfs:label>
								<xsl:value-of 	select="concat(normalize-space(./SOF/SOFG), ' ', normalize-space(string-join(./SOF/SOFP,', ')))" />
							</rdfs:label>	
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label>
								<xsl:value-of 	select="normalize-space(./SOF/SOFG)" />
							</rdfs:label>
						</xsl:otherwise>		
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./SOFP">
							<l0:name>
								<xsl:value-of 	select="concat(normalize-space(./SOF/SOFG), ' ', normalize-space(string-join(./SOF/SOFP,', ')))" />
							</l0:name>
						</xsl:when>
						<xsl:otherwise>
							<l0:name>
								<xsl:value-of 	select="normalize-space(./SOF/SOFG)" />
							</l0:name>
						</xsl:otherwise>		
					</xsl:choose>
				</rdf:Description>
			</xsl:if>
			<!-- Technique as individual -->
			<xsl:for-each select="./SOE[SOEC]">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	        	    	<xsl:choose>
							<xsl:when test="./SOES[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'non ') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(concat(string-join(./SOEC,'-'), '-', string-join(./SOES,'-')))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(string-join(./SOEC,'-'))))" />
							</xsl:otherwise>
						</xsl:choose>
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:choose>
							<xsl:when test="./SOES">
								<xsl:value-of select="concat(normalize-space(string-join(./SOEC,', ')), ' ', normalize-space(string-join(./SOES,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(string-join(./SOEC,', '))" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name>
						<xsl:choose>
							<xsl:when test="./SOES">
								<xsl:value-of select="concat(normalize-space(string-join(./SOEC,', ')), ' ', normalize-space(string-join(./SOES,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(string-join(./SOEC,', '))" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:for-each>
		</xsl:for-each>										
		<!-- Roof as individual -->
		<xsl:for-each select="record/metadata/schede/A/CP">
			<xsl:if test="./CPF/* or ./CPC/* ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	        			<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Roof'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="en">
						<xsl:value-of select="concat('Roof of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="concat('Roof of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label  xml:lang="it">
						<xsl:value-of select="concat('Copertura del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="concat('Copertura del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="./CPF/CPFF">
						<xsl:choose>
							<xsl:when test="./CPF/CPFQ">
								<arco-dd:hasShape>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./CPF/CPFF), '-', normalize-space(./CPF/CPFQ))))" />
									</xsl:attribute>
								</arco-dd:hasShape>	
							</xsl:when>
							<xsl:otherwise>
								<arco-dd:hasShape>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./CPF/CPFF)))" />
									</xsl:attribute>
								</arco-dd:hasShape>
							</xsl:otherwise>		
						</xsl:choose>
					</xsl:if>
					<xsl:if test="./CPF/CPFG">
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./CPF/CPFG)))" />
							</xsl:attribute>
						</arco-core:hasType>	
					</xsl:if>
					<xsl:if test="./CPC/CPCT">
						<xsl:choose>	
							<xsl:when test="not(./CPC/CPCR) or ./CPC/CPCR='intero bene' or ./CPC/CPCR='integrale' or ./CPC/CPCR='tutta' or ./CPC/CPCR='carattere generale' or ./CPC/CPCR='totale' or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'esemplar')) or ((lower-case(normalize-space(./CPC/CPCR)))=(lower-case(normalize-space(./CPU))))">	
								<arco-con:hasRoofStructure>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
									</xsl:attribute>
								</arco-con:hasRoofStructure>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'RoofPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPC/CPCR)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- RoofStructure as individual -->
			<xsl:if test="./CPC/CPCT">
				<!-- RoofStructure as individual -->
				<rdf:Description>
		 			<xsl:attribute name="rdf:about">
	 					<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
	        	    </xsl:attribute>
	 	        	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofStructure'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CPC/CPCT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./CPC/CPCT)" />
					</l0:name>
				</rdf:Description>
				<!-- RoofPart as individual -->
				<xsl:if test="./CPC/CPCR  and not (./CPC/CPCR='intero bene' or ./CPC/CPCR='integrale' or ./CPC/CPCR='tutta' or ./CPC/CPCR='totale' or ./CPC/CPCR='carattere generale' or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'esemplar')) or ((lower-case(normalize-space(./CPC/CPCR)))=(lower-case(normalize-space(./CPU)))))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	    		    		<xsl:value-of select="concat($NS, 'RoofPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPC/CPCR)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Roof'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label  xml:lang="en">
							<xsl:value-of select="concat('Roof of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name  xml:lang="en">
							<xsl:value-of select="concat('Roof of cultural property ', $itemURI)" />
						</l0:name>
						<rdfs:label  xml:lang="it">
							<xsl:value-of select="concat('Copertura del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name  xml:lang="it">
							<xsl:value-of select="concat('Copertura del bene culturale ', $itemURI)" />
						</l0:name>
						<xsl:if test="./CPC/CPCT">	
							<arco-con:hasRoofStructure>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
								</xsl:attribute>
							</arco-con:hasRoofStructure>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- RoofShape as individual -->
			<xsl:if test="./CPF/CPFF">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	 					<xsl:choose>
							<xsl:when test="./CPF/CPFQ">
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./CPF/CPFF), '-', normalize-space(./CPF/CPFQ))))" />
							</xsl:when>
							<xsl:otherwise>	
								<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./CPF/CPFF)))" />
							</xsl:otherwise>
						</xsl:choose>
	            	</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="./CPF/CPFQ">
							<rdfs:label>
								<xsl:value-of 	select="concat(normalize-space(./CPF/CPFF), ' ', normalize-space(./CPF/CPFQ))" />
							</rdfs:label>	
						</xsl:when>
						<xsl:otherwise>
							<rdfs:label>
								<xsl:value-of 	select="normalize-space(./CPF/CPFF)" />
							</rdfs:label>
						</xsl:otherwise>		
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="./CPF/CPFQ">
							<l0:name>
								<xsl:value-of 	select="concat(normalize-space(./CPF/CPFF), ' ', normalize-space(./CPF/CPFQ))" />
							</l0:name>	
						</xsl:when>
						<xsl:otherwise>
							<l0:name>
								<xsl:value-of 	select="normalize-space(./CPF/CPFF)" />
							</l0:name>
						</xsl:otherwise>		
					</xsl:choose>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
	        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/RoofShape'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- RoofType as individual -->
			<xsl:if test="./CPF/CPFG">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./CPF/CPFG)))" />
					</xsl:attribute>
	 	        	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./CPF/CPFG)" />
					</rdfs:label>	
					<l0:name>
						<xsl:value-of 	select="normalize-space(./CPF/CPFG)" />
					</l0:name>	
				</rdf:Description>
			</xsl:if>
			<!-- Roofing as individual -->
			<xsl:if test="./CPM">
				<rdf:Description>	
					<xsl:attribute name="rdf:about">
	        			<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Roofing'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="en">
						<xsl:value-of select="concat('Roofing of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="concat('Roofing of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label  xml:lang="it">
						<xsl:value-of select="concat('Manto di copertura del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="concat('Manto di copertura del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:for-each select="./CPM/CPMM">	
						<arco-dd:hasMaterial>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-dd:hasMaterial>
					</xsl:for-each>
					<xsl:if test="./CPM/CPMT">
						<xsl:choose>	
							<xsl:when test="./CPM/CPMQ">
								<arco-core:hasType>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPM/CPMT), '-', normalize-space(string-join(./CPM/CPMQ,'-')))))" />
									</xsl:attribute>
								</arco-core:hasType>	
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasType>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./CPM/CPMT)))" />
									</xsl:attribute>
								</arco-core:hasType>
							</xsl:otherwise>		
						</xsl:choose>
					</xsl:if>
				</rdf:Description>
				<!-- RoofingType as individual -->
				<xsl:if test="./CPM/CPMT">
					<rdf:Description>
						<xsl:attribute name="rdf:about"> 
							<xsl:choose>	
								<xsl:when test="./CPM/CPMQ">
									<xsl:value-of select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPM/CPMT), '-', normalize-space(string-join(./CPM/CPMQ,'-')))))" />	
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./CPM/CPMT)))" />
								</xsl:otherwise>		
							</xsl:choose>
						</xsl:attribute>
			 	        <rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofingType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>	
								<xsl:when test="./CPM/CPMQ">
									<xsl:value-of 	select="concat(normalize-space(./CPM/CPMT), ' ', normalize-space(string-join(./CPM/CPMQ,', ')))" />	
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of 	select="normalize-space(./CPM/CPMT)" />
								</xsl:otherwise>		
							</xsl:choose>
						</rdfs:label>	
						<l0:name>
							<xsl:choose>	
								<xsl:when test="./CPM/CPMQ">
									<xsl:value-of 	select="concat(normalize-space(./CPM/CPMT), ' ', normalize-space(string-join(./CPM/CPMQ,', ')))" />	
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of 	select="normalize-space(./CPM/CPMT)" />
								</xsl:otherwise>		
							</xsl:choose>
						</l0:name>	
					</rdf:Description>
				</xsl:if>
				<!-- Material as individual -->
				<xsl:for-each select="record/metadata/schede/A/CP/CPM/CPMM">
					<rdf:Description>
	 					<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
			            </xsl:attribute>
	 			        <rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    		        		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>														
		</xsl:for-each>																
		<!-- Flooring as individual -->	
		<xsl:for-each select="record/metadata/schede/*/PV/PVM">	
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Flooring'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Flooring of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Flooring of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Pavimentazione del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Pavimentazione del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./PVMG">	
					<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'FlooringType/', arco-fn:urify(normalize-space(./PVMG)))" />
					</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:for-each select="./PVMS">
					<arco-con:hasFlooringLayout>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'FlooringLayout/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					</arco-con:hasFlooringLayout>
				</xsl:for-each>
			</rdf:Description>
			<!-- FlooringType as individual -->
			<xsl:if test="./PVMG ">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of 	select="concat($NS, 'FlooringType/', arco-fn:urify(normalize-space(./PVMG)))" />
					</xsl:attribute>
		 	        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/FlooringType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./PVMG)" />
					</rdfs:label>	
					<l0:name>
						<xsl:value-of 	select="normalize-space(./PVMG)" />
					</l0:name>	
				</rdf:Description>
			</xsl:if>	
			<!-- FlooringLayout as individual -->
			<xsl:for-each select="./PVMS ">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of 	select="concat($NS, 'FlooringLayout/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
	 	        	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/FlooringLayout'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(.)" />
					</rdfs:label>	
					<l0:name>
						<xsl:value-of 	select="normalize-space(.)" />
					</l0:name>	
				</rdf:Description>
			</xsl:for-each>
		</xsl:for-each>	
		<!-- Stairs as individual -->
		<xsl:for-each select="record/metadata/schede/*/SC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Stairs'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Stairs of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Stairs of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Scala del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Scala del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:if test="./SCL/SCLF">
					<arco-dd:hasShape>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SCL/SCLF)))" />
						</xsl:attribute>
					</arco-dd:hasShape>
				</xsl:if>
				<xsl:if test="./SCL/SCLL">
					<arco-con:spatialLocation>
						<xsl:value-of 	select="normalize-space(./SCL/SCLL)" />
					</arco-con:spatialLocation>
				</xsl:if>
				<xsl:if test="./SCL/SCLN">
					<arco-con:numberOfFlights>
						<xsl:value-of 	select="normalize-space(./SCL/SCLN)" />
					</arco-con:numberOfFlights>
				</xsl:if>
				<xsl:if test="./SCL/SCLO">
					<arco-cd:hasUseFunction>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./SCL/SCLO)))" />
						</xsl:attribute>
					</arco-cd:hasUseFunction>
				</xsl:if>
				<xsl:if test="./SCL/SCLG">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'VerticalConnectionType/', arco-fn:urify(normalize-space(./SCL/SCLG)))" />
						</xsl:attribute>
					</arco-core:hasType>	
				</xsl:if>
				<xsl:if test="./SCS ">
					<xsl:choose>
						<xsl:when test="not(./SCS/SCSR) or ./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale' or ./SCS/SCSR='carattere generale' or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar'))">					
							<xsl:for-each select="./SCS/SCSC">
								<arco-dd:hasTechnique>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
									</arco-dd:hasTechnique>
							</xsl:for-each>
							<xsl:for-each select="./SCS/SCSM">
								<arco-dd:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-dd:hasMaterial>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:value-of select="concat($NS, 'StairsPart/', arco-fn:urify(normalize-space(./SCS/SCSR)))" />
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</rdf:Description>
			<!-- StairsPart as individual -->
			<xsl:if test="./SCS/SCSR and not(./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale' or ./SCS/SCSR='carattere generale' or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        				<xsl:value-of select="concat($NS, 'StairsPart/', arco-fn:urify(normalize-space(./SCS/SCSR)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Stairs'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="en">
						<xsl:value-of select="concat('Stairs part of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="en">
						<xsl:value-of select="concat('Stairs part of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label  xml:lang="it">
						<xsl:value-of select="concat('Parte della scala del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:value-of select="concat('Parte della scala del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:for-each select="./SCS/SCSC">
						<arco-dd:hasTechnique>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-dd:hasTechnique>
					</xsl:for-each>
					<xsl:for-each select="./SCS/SCSM">
						<arco-dd:hasMaterial>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-dd:hasMaterial>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
			<!-- StairsShape as individual -->
			<xsl:if test="./SCL/SCLF">
				<rdf:Description>
		 			<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SCL/SCLF)))" />
		            </xsl:attribute>
	 		        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./SCL/SCLF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./SCL/SCLF)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/StairsShape'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- UseFunction as individual -->
			<xsl:if test="./SCL/SCLO">
				<rdf:Description>
		 			<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./SCL/SCLO)))" />
		            </xsl:attribute>
	 		        <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./SCL/SCLO)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./SCL/SCLO)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- VerticalConnectionType as individual -->
			<xsl:if test="./SCL/SCLG">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 				
						<xsl:value-of 	select="concat($NS, 'VerticalConnectionType/', arco-fn:urify(normalize-space(./SCL/SCLG)))" />
					</xsl:attribute>
	 	        	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalConnectionType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./SCL/SCLG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./SCL/SCLG)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Technique and material as individual -->
			<xsl:if test="./SCS">
				<!-- Technique as individual -->
				<xsl:for-each select="./SCS/SCSC">
					<rdf:Description>
	 					<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
			            </xsl:attribute>
		 		        <rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    	        			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
		    	        	</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:for-each>
				<!-- Material as individual -->
				<xsl:for-each select="./SCS/SCSM">
					<rdf:Description>
	 					<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
		        	    </xsl:attribute>
	 		        	<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	        	    			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>		
		<!-- CulturalPropertyPart when there is SIIR (IntenalSubdivision) -->
		<xsl:for-each select="record/metadata/schede/A/SI/SII">
			<xsl:variable name="siir" select="./SIIR" />
			<xsl:if test="./SIIR and not (./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SIIR)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />				
					<xsl:if test="./SIIN">
						<arco-con:numberOfFloors>
							<xsl:value-of select="normalize-space(./SIIN)" />
						</arco-con:numberOfFloors>
					</xsl:if>				
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SIIR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SIIR)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<xsl:if test="./SIIV">
						<arco-con:hasInteriorSubdivision>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIV)))" />
							</xsl:attribute>
						</arco-con:hasInteriorSubdivision>	
					</xsl:if>
					<xsl:if test="./SIIO">
						<arco-con:hasInteriorSubdivision>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIO)))" />
							</xsl:attribute>
						</arco-con:hasInteriorSubdivision>
					</xsl:if>
					<xsl:if test="./SIIP">
						<xsl:variable name="siip-virgola" select="./SIIP" />
						<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
						<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
						<xsl:for-each select="$floorssplit">
							<arco-con:hasConstructionSpace>
								<xsl:attribute name="rdf:resource">
    		    					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-con:hasConstructionSpace>
						</xsl:for-each>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./SIIP">
					<xsl:variable name="siip-virgola" select="./SIIP" />
					<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
					<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
					<xsl:for-each select="$floorssplit">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	   	    					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', arco-fn:urify(.), '-', arco-fn:urify($siir))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Floor'" />
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
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is PNR (Design) -->
		<xsl:for-each select="record/metadata/schede/A/PN">
			<xsl:if test="./PNR and not (./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale' or ./PNR='carattere generale' or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PNR)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PNR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PNR)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<xsl:if test="./PNT/PNTS or ./PNT/PNTF">
						<xsl:variable name="layout"> 		
							<xsl:choose>
								<xsl:when test="./PNT/PNTS and ./PNT/PNTF">
									<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), '-', normalize-space(./PNT/PNTF))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'PlanLayout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), normalize-space(./PNT/PNTF))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<arco-con:hasLayout>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$layout" />
							</xsl:attribute>
						</arco-con:hasLayout>
					</xsl:if>			
					<xsl:if test="./PNT/PNTQ or ./PNT/PNTE">
						<arco-con:hasDesign>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PNT)))" />
							</xsl:attribute>
						</arco-con:hasDesign>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>								
		<!-- CulturalPropertyPart when there is PREU -->
		<xsl:for-each select="record/metadata/schede/*/PE/PRE">
			<xsl:if test="./PREU and not (./PREU='intero bene' or ./PREU='integrale' or ./PREU='tutta' or ./PREU='totale' or ./PREU='carattere generale' or (starts-with(lower-case(normalize-space(./PREU)), 'nr')) or (starts-with(lower-case(normalize-space(./PREU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PREU)), 'intero')) or (starts-with(lower-case(normalize-space(./PREU)), 'intera')) or (starts-with(lower-case(normalize-space(./PREU)), 'esemplar')))" >
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PREU)))" />
					</xsl:attribute>
					<arco-con:hasPreviousStructureOrElements>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PreviousConstruction/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PREI)))" />
						</xsl:attribute>
					</arco-con:hasPreviousStructureOrElements>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- CulturalPropertyPart when there is FNSU (Foundation) -->
		<xsl:for-each select="record/metadata/schede/A/FN/FNS">
			<xsl:if test="./FNSU and not (./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or ./FNSU='carattere generale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar')))" >
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FNSU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FNSU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is SVCU (VericalElement) -->
		<xsl:for-each select="record/metadata/schede/A/SV/SVC">
			<xsl:if test="./SVCU and not(./SVCU='intero bene' or ./SVCU='integrale' or ./SVCU='tutta' or ./SVCU='totale' or ./SVCU='carattere generale' or (starts-with(lower-case(normalize-space(./SVCU)), 'nr')) or (starts-with(lower-case(normalize-space(./SVCU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intero')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intera')) or (starts-with(lower-case(normalize-space(./SVCU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SVCU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SVCU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SVCU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is SOU (HorizontalElement) -->
		<xsl:for-each select="record/metadata/schede/A/SO">
			<xsl:if test="./SOU and not(./SOU='intero bene' or ./SOU='integrale' or ./SOU='tutta' or ./SOU='totale' or ./SOU='carattere generale' or (starts-with(lower-case(normalize-space(./SOU)), 'nr')) or (starts-with(lower-case(normalize-space(./SOU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOU)), 'intero')) or (starts-with(lower-case(normalize-space(./SOU)), 'intera')) or (starts-with(lower-case(normalize-space(./SOU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SOU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SOU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SOU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is CPU (Roof) -->
		<xsl:for-each select="record/metadata/schede/A/CP">
			<xsl:if test="./CPU and not(./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or ./CPU='carattere generale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CPU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./CPU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<xsl:if test="./CPF or ./CPC">
						<arco-con:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-con:hasConstructionElement>
					</xsl:if>
					<xsl:if test="./CPM">
						<xsl:choose>
							<xsl:when test="not(./CPM/CPMR) or ./CPM/CPMR='intero bene' or ./CPM/CPMR='integrale' or ./CPM/CPMR='tutta' or ./CPM/CPMR='totale' or ./CPM/CPMR='carattere generale' or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'esemplar'))">
								<arco-con:hasCovering>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
									</xsl:attribute>
								</arco-con:hasCovering>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPM/CPMR)))" />
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is CPMR (Roofing) -->
		<xsl:for-each select="record/metadata/schede/A/CP">
			<xsl:if test="./CPM/CPMR and not(./CPM/CPMR='intero bene' or ./CPM/CPMR='integrale' or ./CPM/CPMR='tutta' or ./CPM/CPMR='totale' or ./CPM/CPMR='carattere generale' or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPM/CPMR)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CPM/CPMR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./CPM/CPMR)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasCovering>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
						</xsl:attribute>
					</arco-con:hasCovering>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- CulturalPropertyPart when there is SCLU (Stairs) -->
		<xsl:for-each select="record/metadata/schede/*/SC">
			<xsl:if test="./SCL/SCLU and not(./SCL/SCLU='intero bene' or ./SCL/SCLU='integrale' or ./SCL/SCLU='tutta' or ./SCL/SCLU='totale' or ./SCL/SCLU='carattere generale' or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'nr')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intero')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intera')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SCL/SCLU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SCL/SCLU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SCL/SCLU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is PVMU (Flooring) -->
		<xsl:for-each select="record/metadata/schede/*/PV/PVM">
			<xsl:if test="./PVMU and not(./PVMU='intero bene' or ./PVMU='integrale' or ./PVMU='tutta' or ./PVMU='totale' or ./PVMU='carattere generale' or (starts-with(lower-case(normalize-space(./PVMU)), 'nr')) or (starts-with(lower-case(normalize-space(./PVMU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intero')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intera')) or (starts-with(lower-case(normalize-space(./PVMU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PVMU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PVMU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./PVMU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasCovering>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasCovering>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
	</xsl:if>
	<!-- PG description -->
	<xsl:if test="$sheetType='PG'" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/PG/UT/RAM or record/metadata/schede/PG/CA/CLM">
				<arco-location:hasNaturalEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasNaturalEnvironment>
			</xsl:if>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<!-- Soil -->
			<xsl:if test="record/metadata/schede/PG/CA/CAC or record/metadata/schede/PG/CA/CAM or record/metadata/schede/PG/CA/CAG">
				<arco-con:laysOnSoil>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
					</xsl:attribute>
				</arco-con:laysOnSoil>
			</xsl:if>
			<!-- Technical system -->
			<xsl:if test="record/metadata/schede/PG/CA/CAI">
				<arco-con:hasTechnicalSystem>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
					</xsl:attribute>
				</arco-con:hasTechnicalSystem>
			</xsl:if>
			<!-- Layout -->
			<xsl:for-each select="record/metadata/schede/PG/MP/MPT">
				<xsl:if test="./MPTS">
					<xsl:if test="not(./MPTR)  or ./MPTR='intero bene' or ./MPTR='integrale' or ./MPTR='tutta' or ./MPTR='totale' or ./MPTR='carattere generale' or (starts-with(lower-case(normalize-space(./MPTR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPTR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPTR)), 'esemplar'))">
						<arco-con:hasLayout>
							<xsl:choose>
								<xsl:when test="./MPTF">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./MPTS), '-', normalize-space(./MPTF))))" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(normalize-space(./MPTS)))" />
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-con:hasLayout>
					</xsl:if>
					<xsl:if test="./MPTR  and not(./MPTR='intero bene' or ./MPTR='integrale' or ./MPTR='tutta' or ./MPTR='totale' or ./MPTR='carattere generale' or (starts-with(lower-case(normalize-space(./MPTR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPTR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPTR)), 'esemplar')))">
						<arco-core:hasPart>
							<xsl:choose>
								<xsl:when test="./MPTT">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(concat(normalize-space(./MPTR), '-', normalize-space(./MPTT))))" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPTR)))" />
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- Construction Element -->
			<xsl:for-each select="record/metadata/schede/PG/MP/MPA">
				<xsl:if test="not(./MPAU)  or ./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar'))">
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConstructionElement/', $itemURI, '-', arco-fn:urify(normalize-space(./MPAT)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</xsl:if>
				<xsl:if test="./MPAU and not(./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar')))">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPAU)))" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
			</xsl:for-each>
			<!-- Connection Element -->
			<xsl:for-each select="record/metadata/schede/PG/MP/MPC">
				<xsl:if test="not(./MPCR)  or ./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar'))">
					<arco-con:hasConnectionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConnectionElement/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-con:hasConnectionElement>
				</xsl:if>
				<xsl:if test="./MPCR and not(./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPCR)), 'esemplar')))">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPCR)))" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
			</xsl:for-each>
			<!-- Technical system -->
			<xsl:for-each select="record/metadata/schede/PG/IM/IMP">
				<xsl:if test="./IMPT and contains(normalize-space(lower-case(./IMPT)), 'idrico')">
					<xsl:choose>	
						<xsl:when test="not(./IMPU) or ./IMPU='intero bene' or ./IMPU='integrale' or ./IMPU='tutta' or ./IMPU='totale' or ./IMPU='carattere generale' or (starts-with(lower-case(normalize-space(./IMPU)), 'nr')) or (starts-with(lower-case(normalize-space(./IMPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intero')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intera')) or (starts-with(lower-case(normalize-space(./IMPU)), 'esemplar'))">
							<arco-con:hasTechnicalSystem>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
								</xsl:attribute>
							</arco-con:hasTechnicalSystem>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./IMPU)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:if>
				<xsl:if test="./IMPT and not (contains(normalize-space(lower-case(./IMPT)), 'idrico'))">
					<xsl:choose>	
						<xsl:when test="not(./IMPU) or ./IMPU='intero bene' or ./IMPU='integrale' or ./IMPU='tutta' or ./IMPU='totale' or ./IMPU='carattere generale' or (starts-with(lower-case(normalize-space(./IMPU)), 'nr')) or (starts-with(lower-case(normalize-space(./IMPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intero')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intera')) or (starts-with(lower-case(normalize-space(./IMPU)), 'esemplar'))">
							<arco-con:hasTechnicalSystem>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalSystem/', $itemURI, '-', arco-fn:urify(normalize-space(./IMPT)))" />
								</xsl:attribute>
							</arco-con:hasTechnicalSystem>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./IMPU)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:if>
			</xsl:for-each>
			<!-- Water element -->
			<xsl:for-each select="record/metadata/schede/PG/FO/FOT">
				<xsl:choose>	
					<xsl:when test="not(./FOTU) or ./FOTU='intero bene' or ./FOTU='integrale' or ./FOTU='tutta' or ./FOTU='totale' or ./FOTU='carattere generale' or (starts-with(lower-case(normalize-space(./FOTU)), 'nr')) or (starts-with(lower-case(normalize-space(./FOTU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intero')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intera')) or (starts-with(lower-case(normalize-space(./FOTU)), 'esemplar'))">
						<arco-con:hasWaterElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, position())" />
							</xsl:attribute>
						</arco-con:hasWaterElement>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FOTU)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>	
					<xsl:when test="not(./FOTU) or ./FOTU='intero bene' or ./FOTU='integrale' or ./FOTU='tutta' or ./FOTU='totale' or ./FOTU='carattere generale' or (starts-with(lower-case(normalize-space(./FOTU)), 'nr')) or (starts-with(lower-case(normalize-space(./FOTU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intero')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intera')) or (starts-with(lower-case(normalize-space(./FOTU)), 'esemplar'))">
						<arco-con:hasTechnicalSystem>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
							</xsl:attribute>
						</arco-con:hasTechnicalSystem>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FOTU)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>		
			</xsl:for-each>
			<!-- Parts of culturalproperty -->
			<xsl:for-each select="record/metadata/schede/PG/FV/FVP">
				<xsl:if test="./FVPD and not(./FVPD='intero bene' or ./FVPD='integrale' or ./FVPD='tutta' or ./FVPD='totale' or ./FVPD='carattere generale' or (starts-with(lower-case(normalize-space(./FVPD)), 'nr')) or (starts-with(lower-case(normalize-space(./FVPD)), 'n.r')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intero')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intera')) or (starts-with(lower-case(normalize-space(./FVPD)), 'esemplar')))">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
			</xsl:for-each>
		</rdf:Description>	
		<!-- Natural Environment as individual -->
		<xsl:if test="record/metadata/schede/PG/UT/RAM or record/metadata/schede/PG/CA/CLM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/location/NaturalEnvironment" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Environment of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Environment of cultural property: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Ambiente del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Ambiente del bene culturale: ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/PG/UT/RAM">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/PG/UT/RAM" />
					</arco-core:description>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/PG/CA/CLM">
					<arco-location:hasClimateSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-location:hasClimateSituation>
				</xsl:for-each>
			</rdf:Description>
		</xsl:if>
		<!-- Climate situation as individual -->
		<xsl:for-each select="record/metadata/schede/PG/CA/CLM">
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
				<xsl:if test="./CLMS">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./CLMS))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./CLMF or ./CLMC or ./CLMP">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-environment-measurement-collection-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</rdf:Description>
			<!-- Time interval as individual -->
			<xsl:if test="./CLMS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(./CLMS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CLMS)" />
					</rdfs:label>
					<tiapit:time>
						<xsl:value-of select="normalize-space(./CLMS)" />
					</tiapit:time>
				</rdf:Description>
			</xsl:if>
			<!-- Measurement collection  as individual -->
			<xsl:if test="./CLMF or ./CLMC or ./CLMP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-environment-measurement-collection-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	           	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure della situazione climatica ', position(), ' del bene culturale: ',  $itemURI" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="'Misure della situazione climatica ', position(), ' del bene culturale: ',  $itemURI" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measurements of climate situation ', position(), ' of cultural property: ',  $itemURI" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measurements of climate situation ', position(), ' of cultural property: ',  $itemURI" />
					</l0:name>
					<xsl:if test="./CLMF">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-minimum-temperature')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="./CLMC">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-maximum-temperature')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>
					<xsl:if test="./CLMP">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-rainfall')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>	
				</rdf:Description>
			</xsl:if>
			<!-- Measurement as individual -->
			<xsl:if test="./CLMF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-minimum-temperature')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Measurement'" />
	           	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMF))" />
					</l0:name>
					<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMF))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MinimumTemperature')" />
						</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-minimum-temperature-', arco-fn:urify(./CLMF))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-minimum-temperature-', arco-fn:urify(./CLMF))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./CLMF" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./CLMF" />
					</l0:name>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/CelsiusDegrees')" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/CelsiusDegrees')" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
					<rdfs:label>
						<xsl:value-of select="'°C'" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="'°C'" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./CLMC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-maximum-temperature')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	       	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Measurement'" />
	           	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMC))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMC))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMC))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMC))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MaximumTemperature')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-maximum-temperature-', arco-fn:urify(./CLMC))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-maximum-temperature-', arco-fn:urify(./CLMC))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./CLMC" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./CLMC" />
					</l0:name>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/CelsiusDegrees')" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/CelsiusDegrees')" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
					<rdfs:label>
						<xsl:value-of select="'°C'" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="'°C'" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./CLMP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Measurement/ClimateSituation/', $itemURI, '-', position(), '-rainfall')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	       	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Measurement'" />
	           	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of climate situation ', position (), ' of ', $itemURI, ': ', normalize-space(./CLMP))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della situazone climatica ', position (), ' del bene ', $itemURI, ': ', normalize-space(./CLMP))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Rainfall')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-rainfall-', arco-fn:urify(./CLMP))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-rainfall-', arco-fn:urify(./CLMP))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./CLMP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./CLMP" />
					</l0:name>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/mm')" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/mm')" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
					<rdfs:label>
						<xsl:value-of select="'mm'" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="'mm'" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Soil as individual -->
		<xsl:if test="record/metadata/schede/PG/CA/CAC or record/metadata/schede/PG/CA/CAM or record/metadata/schede/PG/CA/CAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
				</xsl:attribute>
	 	   	    <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/Soil'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Soil of cultural property: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Suolo del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Soil of cultural property: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Suolo del bene culturale: ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/PG/CA/CAM">
					<arco-location:morphologicalDescription>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAM" />
					</arco-location:morphologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/PG/CA/CAG/CAGG">
					<arco-location:geologicalDescription>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAG/CAGG" />
					</arco-location:geologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/PG/CA/CAG/CAGP">
					<arco-location:geologicalDescription>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAG/CAGP" />
					</arco-location:geologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/PG/CA/CAC">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-soil-measurement-collection')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</rdf:Description>
			<!-- Measurement collection as individual -->
			<xsl:if test="record/metadata/schede/PG/CA/CAC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-soil-measurement-collection')" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/MeasurementCollection" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurements of soil of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurements of soil of  cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure del suolo del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure del suolo del bene culturale ', $itemURI)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Soil', $itemURI, '-slope')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Measurement/Soil', $itemURI, '-slope')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	       	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Measurement'" />
	           	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of soil of', $itemURI, ': ', normalize-space(record/metadata/schede/PG/CA/CAC))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of soil of', $itemURI, ': ', normalize-space(record/metadata/schede/PG/CA/CAC))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del suolo del bene ', $itemURI, ': ', normalize-space(record/metadata/schede/PG/CA/CAC))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del suolo del bene ', $itemURI, ': ', normalize-space(record/metadata/schede/PG/CA/CAC))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Slope')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Soil', $itemURI, '-slope-', arco-fn:urify(record/metadata/schede/PG/CA/CAC))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Soil', $itemURI, '-slope-', arco-fn:urify(record/metadata/schede/PG/CA/CAC))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAC" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAC" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<!-- Technical system as individual -->
		<xsl:if test="record/metadata/schede/PG/CA/CAI or record/metadata/schede/PG/FO/FOT">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
				</xsl:attribute>
	 	   	    <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/WaterSystem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Water system of cultural property: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Impianto idrico del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Water system of cultural property: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Impianto idrico del bene culturale: ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/PG/CA/CAI">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/PG/CA/CAI" />
					</arco-core:description>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/PG/FO/FOT">
					<arco-con:hasWaterElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-con:hasWaterElement>
				</xsl:for-each>
			</rdf:Description>
		</xsl:if>
		<!-- Water system as individual -->
		<xsl:for-each select="record/metadata/schede/PG/IM/IMP">		
			<xsl:if test="./IMPT and contains(normalize-space(lower-case(./IMPT)), 'idrico')">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
					</xsl:attribute>
	 	   	    	<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/WaterSystem'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Water system of cultural property: ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Impianto idrico del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Water system of cultural property: ', $itemURI)" />
					</l0:name>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Impianto idrico del bene culturale: ', $itemURI)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./IMPT and not (contains(normalize-space(lower-case(./IMPT)), 'idrico'))">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of select="concat($NS, 'TechnicalSystem/', $itemURI, '-', arco-fn:urify(normalize-space(./IMPT)))" />
					</xsl:attribute>
			    	    <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/TechnicalSystem'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./IMPT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./IMPT" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Water element as individual -->
		<xsl:for-each select="record/metadata/schede/PG/FO/FOT">
			<xsl:variable name="fott" select="normalize-space(./FOTT)" />
			<xsl:variable name="fotg" select="normalize-space(./FOTG)" />
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, '-', position())" />
				</xsl:attribute>
				 <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/WaterElement'" />
					</xsl:attribute>
				</rdf:type>
				<xsl:choose>
					<xsl:when test="./FOTD">
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FOTD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FOTD)" />
						</l0:name>
					</xsl:when>
					<xsl:otherwise>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Water element ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Elemento idrico ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Water element ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Elemento idrico ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="./FOTP">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./FOTP)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./FOTD">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/WaterElement', '-', arco-fn:urify(normalize-space(./FOTD)))" />                      	                            
                        </xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:if>		
				<xsl:if test="./FOTC">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FOTC)))" />
						</xsl:attribute>
					</arco-dd:hasTechnique>
				</xsl:if>
				<xsl:for-each select="./FOTM"><!-- e.g.ICCD14284441  -->
					<arco-dd:hasMaterial>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:hasMaterial>
				</xsl:for-each>
				<xsl:if test="./FOTT or ./FOTG">
					<arco-core:hasType>
						<xsl:choose>
							<xsl:when test="./FOTG and not(./FOTT)">
								<xsl:attribute name="rdf:resource">
		 	   						<xsl:value-of 	select="concat($NS, 'WaterElementType/', arco-fn:urify(normalize-space(./FOTG)))" />
								</xsl:attribute>
							</xsl:when>
							<xsl:when test="./FOTG and ./FOTT">
								<xsl:attribute name="rdf:resource">
		 	   						<xsl:value-of 	select="concat($NS, 'WaterElementType/', arco-fn:urify(concat($fott, '-', $fotg)))" />
								</xsl:attribute>
							</xsl:when>
						</xsl:choose>
    	        	</arco-core:hasType>
				</xsl:if>
			</rdf:Description>
			<!-- Material as individual -->
			<xsl:for-each select="./FOTM"><!-- e.g.ICCD14284441  -->
				<rdf:Description>
 					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
        	  		</xsl:attribute>
 	      			<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
        		    	</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:for-each>
			<!-- Technique as individual -->
			<xsl:if test="./FOTC">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
			           	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FOTC)))" />
	          		</xsl:attribute>
	 	     			<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FOTC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FOTC)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
			           		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
	        	    	</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- Designation as individual -->
			<xsl:if test="./FOTD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	                       	<xsl:value-of select="concat($NS,'DesignationInTime/WaterElement', '-', arco-fn:urify(normalize-space(./FOTD)))" /> 
	                   </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                           <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
	                       </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FOTD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FOTD)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Cultural property part as individual -->
			<xsl:if test="./FOTU and not(./FOTU='intero bene' or ./FOTU='integrale' or ./FOTU='tutta' or ./FOTU='totale' or ./FOTU='carattere generale' or (starts-with(lower-case(normalize-space(./FOTU)), 'nr')) or (starts-with(lower-case(normalize-space(./FOTU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intero')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intera')) or (starts-with(lower-case(normalize-space(./FOTU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FOTU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FOTU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FOTU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasWaterElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-con:hasWaterElement>	
					<arco-con:hasTechnicalSystem>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
						</xsl:attribute>
					</arco-con:hasTechnicalSystem>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Layout as individual -->
		<xsl:for-each select="record/metadata/schede/PG/MP/MPT">
			<xsl:if test="./MPTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	        			<xsl:choose>
							<xsl:when test="./MPTF">
								<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./MPTS), '-', normalize-space(./MPTF))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(normalize-space(./MPTS)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Layout'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:choose>
						<xsl:when test="./MPTF">
							<rdfs:label>
								<xsl:value-of select="concat(normalize-space(./MPTS), ' ', normalize-space(./MPTF))" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="concat(normalize-space(./MPTS), ' ', normalize-space(./MPTF))" />
							</l0:name>
						</xsl:when>
						<xsl:otherwise>
								<rdfs:label>
								<xsl:value-of select="normalize-space(./MPTS)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./MPTS)" />
							</l0:name>
						</xsl:otherwise>
					</xsl:choose>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>						
		<!-- Construction Element as individual -->
		<xsl:for-each select="record/metadata/schede/PG/MP/MPA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS, 'ConstructionElement/', $itemURI, '-', arco-fn:urify(normalize-space(./MPAT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionElement'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label >
					<xsl:value-of select="normalize-space(./MPAT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./MPAT)" />
				</l0:name>
				<arco-con:scenografic>
					<xsl:value-of select="true()" />
		          	</arco-con:scenografic>
			</rdf:Description>
		</xsl:for-each>
		<!-- Connection Element as individual -->
		<xsl:for-each select="record/metadata/schede/PG/MP/MPC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS, 'ConnectionElement/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConnectionElement'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Connection element ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Elemento di connessione ', position(), ' del bene culturale: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Connection element ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Elemento di connessione ', position(), ' del bene culturale: ', $itemURI)" />
				</l0:name>
				<arco-core:description>
					<xsl:value-of select="normalize-space(./MPCS)" />
		          	</arco-core:description>
			</rdf:Description>
		</xsl:for-each>
		<!-- Cultural property part as individual -->
		<xsl:for-each select="record/metadata/schede/PG/IM/IMP">					
			<xsl:if test="./IMPU and not(./IMPU='intero bene' or ./IMPU='integrale' or ./IMPU='tutta' or ./IMPU='totale' or ./IMPU='carattere generale' or (starts-with(lower-case(normalize-space(./IMPU)), 'nr')) or (starts-with(lower-case(normalize-space(./IMPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intero')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intera')) or (starts-with(lower-case(normalize-space(./IMPU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./IMPU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./IMPU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./IMPU)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasTechnicalSystem>
						<xsl:choose>
							<xsl:when test="./IMPT and contains(normalize-space(lower-case(./IMPT)), 'idrico')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalSystem/', $itemURI, '-', arco-fn:urify(normalize-space(./IMPT)))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-con:hasTechnicalSystem>
				</rdf:Description>	
			</xsl:if>
		</xsl:for-each>	
		<!-- Cultural property part as individual -->	
		<xsl:for-each select="record/metadata/schede/PG/MP/MPT">
			<xsl:if test="./MPTR  and not(./MPTR='intero bene' or ./MPTR='integrale' or ./MPTR='tutta' or ./MPTR='totale' or ./MPTR='carattere generale' or (starts-with(lower-case(normalize-space(./MPTR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPTR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPTR)), 'esemplar')))">
				<xsl:if test="./MPTS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:choose>
								<xsl:when test="./MPTT">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(concat(normalize-space(./MPTR), '-', normalize-space(./MPTT))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPTR)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
						<xsl:choose>
							<xsl:when test="./MPTT">
								<rdfs:label>
									<xsl:value-of select="concat(normalize-space(./MPTR), ' ', normalize-space(./MPTT))" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="concat(normalize-space(./MPTR), ' ', normalize-space(./MPTT))" />
								</l0:name>
							</xsl:when>
							<xsl:otherwise>
									<rdfs:label>
									<xsl:value-of select="normalize-space(./MPTR)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./MPTR)" />
								</l0:name>
							</xsl:otherwise>
						</xsl:choose>				
						<arco-core:isPartOf>
							<xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="$culturalProperty" /> 
							</xsl:attribute>
						</arco-core:isPartOf>
						<arco-con:hasLayout>
							<xsl:choose>
								<xsl:when test="./MPTF">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./MPTS), '-', normalize-space(./MPTF))))" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(normalize-space(./MPTS)))" />
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-con:hasLayout>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>	
		<!-- Cultural property part as individual -->
		<xsl:for-each select="record/metadata/schede/PG/MP/MPA">	
			<xsl:if test="./MPAU and not(./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPAU)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./MPAU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./MPAU)" />
					</l0:name>				
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConstructionElement/', $itemURI, '-', arco-fn:urify(normalize-space(./MPAT)))" />
						</xsl:attribute>
					</arco-con:hasConstructionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Cultural property part as individual -->
		<xsl:for-each select="record/metadata/schede/PG/MP/MPC">	
			<xsl:if test="./MPCR and not(./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPCR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPCR)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./MPCR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./MPCR)" />
					</l0:name>				
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConnectionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConnectionElement/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-con:hasConnectionElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- Cultural property part as individual -->
		<xsl:for-each select="record/metadata/schede/PG/FV/FVP">
			<xsl:if test="./FVPD and not(./FVPD='intero bene' or ./FVPD='integrale' or ./FVPD='tutta' or ./FVPD='totale' or ./FVPD='carattere generale' or (starts-with(lower-case(normalize-space(./FVPD)), 'nr')) or (starts-with(lower-case(normalize-space(./FVPD)), 'n.r')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intero')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intera')) or (starts-with(lower-case(normalize-space(./FVPD)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FVPD)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FVPD)" />
					</l0:name>				
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<xsl:if test="./FVPU">
						<arco-dd:positionOnCulturalProperty>
		        			<xsl:value-of 	select="./FVPU" />
						</arco-dd:positionOnCulturalProperty>
					</xsl:if>
					<xsl:if test="./FVPF">
						<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FVPF)))" />
							</xsl:attribute>
						</arco-dd:hasShape>
					</xsl:if>
					<xsl:if test="./FVPS">
						<arco-con:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
							</xsl:attribute>
						</arco-con:hasMeasurementCollection>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- Material as individual -->
			<xsl:if test="./FVPF">
				<rdf:Description>
	 				<xsl:attribute name="rdf:about">
	           			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./FVPF)))" />
					</xsl:attribute>
	 				<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FVPF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FVPF)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
			           		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	        	    	</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<!-- Measurement collection as individual -->
			<xsl:if test="./FVPS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/MeasurementCollection" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurements of ', normalize-space(./FVPD), ' of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurements of ', normalize-space(./FVPD), ' of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure di ', normalize-space(./FVPD), ' bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure di ', normalize-space(./FVPD), ' bene culturale ', $itemURI)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)), '-area')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)), '-area')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Measurement'" />
            	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of ', normalize-space(./FVPD), ' of cultural property ', $itemURI, ': ', normalize-space(./FVPS))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of ', normalize-space(./FVPD), ' of cultural property ',  $itemURI, ': ', normalize-space(./FVPS))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura di', normalize-space(./FVPD), ' bene culturale ', $itemURI, ': ', normalize-space(./FVPS))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura di ', normalize-space(./FVPD), ' bene culturale ', $itemURI, ': ', normalize-space(./FVPS))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Area')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)), '-area-', arco-fn:urify(./FVPS))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)), '-area-', arco-fn:urify(./FVPS))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="./FVPS" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./FVPS" />
					</l0:name>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/mq')" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/mq')" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
					<rdfs:label>
						<xsl:value-of select="'mq'" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="'mq'" />
					</l0:name>
				</rdf:Description>	
			</xsl:if>
		</xsl:for-each>					
	</xsl:if>																
	<!-- MODI description -->
	<xsl:if test="record/metadata/schede/MODI/UR" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/MODI/UR/URL">
				<arco-con:numberOfFlights>
					<xsl:value-of select="normalize-space(record/metadata/schede/MODI/UR/URL)" />
				</arco-con:numberOfFlights>
			</xsl:if>
			<xsl:if test="record/metadata/schede/MODI/UR/URN">
				<arco-con:numberOfConstructionSpaces>
					<xsl:value-of select="normalize-space(record/metadata/schede/MODI/UR/URN)" />
				</arco-con:numberOfConstructionSpaces>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/MODI/UR/URA">
				<arco-core:hasPart>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./URAS)))" />
					</xsl:attribute>
				</arco-core:hasPart>
			</xsl:for-each>
		</rdf:Description>
		<xsl:for-each select="record/metadata/schede/MODI/UR/URA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./URAS)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
				<xsl:choose>
					<xsl:when test="./URAE">
						<rdfs:label>
							<xsl:value-of select="normalize-space(./URAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./URAE)" />
						</l0:name>
					</xsl:when>
					<xsl:otherwise>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./URAS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./URAS)" />
						</l0:name>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="./URAZ">
					<arco-cd:hasUseFunction>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./URAZ)))" />
						</xsl:attribute>
					</arco-cd:hasUseFunction>
				</xsl:if>
				<xsl:if test="./URAD">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./URAD)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./URAV">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./URAV)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./URAZ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./URAZ)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
						</xsl:attribute>
					</rdf:type>
					<l0:name>
						<xsl:value-of select="normalize-space(./URAZ)" />
					</l0:name>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./URAZ)" />
					</rdfs:label>
					<arco-cd:useFunction>
						<xsl:value-of select="normalize-space(./URAZ)" />
					</arco-cd:useFunction>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>