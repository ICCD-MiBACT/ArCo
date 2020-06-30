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
	xmlns:arco-ip="https://w3id.org/arco/ontology/immovable-property/"

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="1.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />


  
	
	<xsl:variable name="sheetVersion"
		select="schede/*/@version" />
	<xsl:variable name="sheetType" select="name(schede/*)" />
	<xsl:variable name="cp-name" select="''" />
	<xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" />
	<xsl:variable name="itemURI">
		<xsl:choose>
			<xsl:when test="schede/*/RV/RVE/RVEL">
				<xsl:value-of
					select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(schede/*/RV/RVE/RVEL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="culturalProperty" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />	
	<xsl:variable name="fnst" select="normalize-space(schede/A/FN/FNS/FNST)" />
	<xsl:variable name="fnsq" select="normalize-space(schede/A/FN/FNS/FNSQ)" />
	<xsl:variable name="foundationsType">
					<xsl:choose>
						<xsl:when test="schede/A/FN/FNS/FNSQ">
							<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />	
						</xsl:when>
						<xsl:when test="schede/A/FN/FNS/FNST and not(schede/A/FN/FNS/FNSQ)">
							<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify($fnst))" />	
						</xsl:when>
					</xsl:choose>
		</xsl:variable>
	<xsl:variable name="svcc" select="normalize-space(schede/A/SV/SVC/SVCC)" />
	<xsl:variable name="svcq" select="normalize-space(schede/A/SV/SVC/SVCQ)" />
		
<xsl:template match="/">
	<rdf:RDF>

							<!-- Properties of ArchitecturalHeritage -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<xsl:if test="$sheetType='A'">
			<rdf:type>
				<xsl:choose>
					<xsl:when test="schede/A/SI/SII/SIIN or schede/A/SI/SII/SIIP">
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Building'" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Construction'" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</rdf:type>
		</xsl:if>
		<xsl:if test="schede/A/IS/IST">
			<arco-core:description>
				<xsl:value-of select="schede/A/IS/IST" />
			</arco-core:description>
		</xsl:if>
		<xsl:if test="schede/A/IS/ISP">
			<arco-core:description>
				<xsl:value-of select="schede/A/IS/ISP" />
			</arco-core:description>
		</xsl:if>
		<xsl:for-each select="schede/A/SI/SII">
			<xsl:if test="./SIIN">
			<xsl:choose>
				<xsl:when test="./SIIN and (not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale') or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
					<arco-ip:numberOfFloors>
						<xsl:value-of select="normalize-space(./SIIN)" />
					</arco-ip:numberOfFloors>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SIIR">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:if>
			<xsl:if test="./SIIV">
			<xsl:choose>
				<xsl:when test="./SIIV and (not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale') or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
					<arco-ip:hasInteriorSubdivision>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIV)))" />
					</xsl:attribute>
					</arco-ip:hasInteriorSubdivision>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SIIR">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:if>
			<xsl:if test="./SIIO">
			<xsl:choose>	
				<xsl:when test="./SIIO and (not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale') or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
					<arco-ip:hasInteriorSubdivision>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIO)))" />
					</xsl:attribute>
					</arco-ip:hasInteriorSubdivision>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SIIR">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="schede/A/PN">
			<xsl:choose>	
				<xsl:when test="./PNT/* and (not(./PNR) or ./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale') or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar'))">
					<arco-ip:hasDesign>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PNT)))" />
					</xsl:attribute>
					</arco-ip:hasDesign>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./PNR">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="schede/A/FN/FNS">
			<xsl:choose>	
				<xsl:when test="./FNS/* and (not(./FNSU) or ./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale') or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar'))">
					<arco-ip:hasFoundations>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Foundations/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasFoundations>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./FNSU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>				
		<xsl:for-each select="schede/A/SV/SVC">
			<xsl:choose>	
				<xsl:when test="./SVC/* and (not(./SVCU) or ./SVCU='intero bene' or ./SVCU='integrale' or ./SVCU='tutta' or ./SVCU='totale') or (starts-with(lower-case(normalize-space(./SVCU)), 'nr')) or (starts-with(lower-case(normalize-space(./SVCU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intero')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intera')) or (starts-with(lower-case(normalize-space(./SVCU)), 'esemplar'))">
					<arco-ip:hasVerticalElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasVerticalElement>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SVCU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>	
		<xsl:for-each select="schede/A/SO">
			<xsl:choose>	
				<xsl:when test="./SO/*/* and (not(./SOU) or ./SOU='intero bene' or ./SOU='integrale' or ./SOU='tutta' or ./SOU='totale') or (starts-with(lower-case(normalize-space(./SOU)), 'nr')) or (starts-with(lower-case(normalize-space(./SOU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOU)), 'intero')) or (starts-with(lower-case(normalize-space(./SOU)), 'intera')) or (starts-with(lower-case(normalize-space(./SOU)), 'esemplar'))">
					<arco-ip:hasHorizontalElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasHorizontalElement>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SOU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="schede/A/CP">
			<xsl:if test="not(./CPU) or ./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar'))">
			<xsl:choose>	
				<xsl:when test="./CPF/* or ./CPC/* ">
					<arco-ip:hasRoof>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasRoof>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./CPU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:if>
			<xsl:if test="./CPM"> 
					<arco-ip:hasCovering>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
					</xsl:attribute>
					</arco-ip:hasCovering>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="schede/A/PV/PVM">
			<xsl:choose>	
				<xsl:when test="./* and (not(./PVMU) or ./PVMU='intero bene' or ./PVMU='integrale' or ./PVMU='tutta' or ./PVMU='totale') or (starts-with(lower-case(normalize-space(./PVMU)), 'nr')) or (starts-with(lower-case(normalize-space(./PVMU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intero')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intera')) or (starts-with(lower-case(normalize-space(./PVMU)), 'esemplar'))">
					<arco-ip:hasCovering>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasCovering>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./PVMU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="schede/A/SC">
			<xsl:choose>	
				<xsl:when test="./*/* and (not(./SCL/SCLU) or ./SCL/SCLU='intero bene' or ./SCL/SCLU='integrale' or ./SCL/SCLU='tutta' or ./SCL/SCLU='totale') or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'nr')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intero')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intera')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'esemplar'))">
					<arco-ip:hasVerticalConnection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasVerticalConnection>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="./SCL/SCLU">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</rdf:Description>

							<!-- Vertical subdivision as individual -->
	<xsl:for-each select="schede/A/SI/SII/SIIV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/VerticalSubdivision'" />
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
							<!-- Horizontal subdivision as individual -->
	<xsl:for-each select="schede/A/SI/SII/SIIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/HorizontalSubdivision'" />
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
	

							<!-- ConstructionDesign as individual -->
	<xsl:for-each select="schede/A/PN/PNT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/ConstructionDesign'" />
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
				<arco-ip:refersToFloorOrLevel>
					<xsl:value-of select="normalize-space(./PNTQ)" />
				</arco-ip:refersToFloorOrLevel>
			</xsl:if>
			<xsl:for-each select="./PNTE">
				<arco-ip:significantIconographicInformation>
					<xsl:value-of select="normalize-space(.)" />
				</arco-ip:significantIconographicInformation>
			</xsl:for-each>
			<xsl:if test="./PNTS or ./PNTF">
				<xsl:variable name="layout"> 		
					<xsl:choose>
						<xsl:when test="./PNTS and ./PNTF">
							<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), '-', normalize-space(./PNTF))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), normalize-space(./PNTF))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<arco-ip:hasLayout>
					<xsl:attribute name="rdf:resource">
					<xsl:value-of select="$layout" />
					</xsl:attribute>
				</arco-ip:hasLayout>
			</xsl:if>			
		</rdf:Description>
	</xsl:for-each>		
										<!-- Layout as individual -->
	<xsl:for-each select="schede/A/PN/PNT">
		<rdf:Description>
				<xsl:variable name="layout"> 
					<xsl:choose>
						<xsl:when test="./PNTS and ./PNTF">
							<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), '-', normalize-space(./PNTF))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNTS), normalize-space(./PNTF))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$layout" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Layout'" />
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
	</xsl:for-each>
	
							<!-- Foundations as individual -->
	<xsl:for-each select="schede/A/FN/FNS">
	<xsl:variable name="fnst" select="normalize-space(./FNST)" />
	<xsl:variable name="fnsq" select="normalize-space(./FNSQ)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Foundations/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Foundations'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label  xml:lang="en">
				<xsl:value-of select="concat('Foundations of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name  xml:lang="en">
				<xsl:value-of select="concat('Foundations of cultural property ', $itemURI)" />
			</l0:name>
			<rdfs:label  xml:lang="it">
				<xsl:value-of select="concat('Fondamenta del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name  xml:lang="it">
				<xsl:value-of select="concat('Fondamenta del bene culturale ', $itemURI)" />
			</l0:name>
			<xsl:for-each select="./FNSM">
				<arco-dd:hasMaterial>
 	                	<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
 	                </arco-dd:hasMaterial>
			</xsl:for-each>
			<xsl:if test="schede/A/FN/FNA">
				<arco-ip:laysOnSoil>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
				</xsl:attribute>
				</arco-ip:laysOnSoil>
			</xsl:if>
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
						<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />
					</xsl:attribute>
					</arco-core:hasType>	
				</xsl:when>
				<xsl:otherwise>
					<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify($fnst))" />
					</xsl:attribute>
					</arco-core:hasType>
				</xsl:otherwise>		
			</xsl:choose>
		</rdf:Description>
	</xsl:for-each>
									<!-- Material as individual -->
	<xsl:for-each select="schede/A/FN/FNS/FNSM">
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
	<xsl:for-each select="schede/A/FN/FNS/FNSC">
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
									<!-- FoundationsType as individual -->
	<xsl:for-each select="schede/A/FN/FNS ">
		<xsl:if test="./FNST">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 			
 				<xsl:choose>
					<xsl:when test="./FNSQ">
						<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />
					</xsl:when>
					<xsl:otherwise>	
						<xsl:value-of 	select="concat($NS, 'FoundationsType/', arco-fn:urify(normalize-space(./FNST)))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/FoundationsType'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="./FNSQ">
					<rdfs:label>
						<xsl:value-of 	select="concat(normalize-space($fnst), ' ', normalize-space($fnsq))" />
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
						<xsl:value-of 	select="concat(normalize-space($fnst), ' ', normalize-space($fnsq))" />
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
	
	
							<!-- Vertical Element as individual -->
	<xsl:for-each select="schede/A/SV/SVC">
	<xsl:variable name="svcc" select="normalize-space(./SVCC)" />
	<xsl:variable name="svcq" select="normalize-space(./SVCQ)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/VerticalElement'" />
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
						<arco-dd:hasShape>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat($svcc, '-', $svcq)))" />
						</xsl:attribute>
						</arco-dd:hasShape>	
					</xsl:when>
					<xsl:otherwise>
						<arco-dd:hasShape>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify($svcc))" />
						</xsl:attribute>
						</arco-dd:hasShape>
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
	</xsl:for-each>	
											<!-- Material as individual -->
	<xsl:for-each select="schede/A/SV/SVC/SVCM">
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
	<xsl:for-each select="schede/A/SV/SVC">
	<xsl:if test="./SVCC">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
 				<xsl:choose>
					<xsl:when test="./SVCQ">
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat($svcc, '-', $svcq)))" />
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
						<xsl:value-of 	select="concat($svcc, ' ', $svcq)" />
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
						<xsl:value-of 	select="concat($svcc, ' ', $svcq)" />
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
            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/VerticalElementShape'" />
            	</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
									<!-- VerticalElementType as individual -->
	<xsl:for-each select="schede/A/SV/SVC/SVCT">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(.)))" />
            </xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/VerticalElementType'" />
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
	
	
							<!-- Horizontal Element as individual -->
	<xsl:for-each select="schede/A/SO">
	<xsl:variable name="soff" select="normalize-space(./SOF/SOFF)" />
	<xsl:variable name="sofq" select="normalize-space(./SOF/SOFQ)" />
	<xsl:variable name="sofg" select="normalize-space(./SOF/SOFG)" />
	<xsl:variable name="sofp" select="normalize-space(./SOF/SOFP)" />
	<xsl:variable name="horElem" select="arco-fn:arcofy(.)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/HorizontalElement'" />
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
					<arco-dd:hasTechnique>
						<xsl:choose>
							<xsl:when test="./SOE/SOES">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SOE/SOEC), '-', normalize-space(./SOE/SOES))))" />
							</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SOE/SOEC)))" />
							</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-dd:hasTechnique>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>	
									<!-- HorizontalElementShape as individual -->
	<xsl:for-each select="schede/A/SO/SOF">
	<xsl:if test="./SOFF">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
 				<xsl:choose>
					<xsl:when test="./SOFQ">
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SOFF), '-', normalize-space(./SOFQ))))" />
					</xsl:when>
					<xsl:otherwise>	
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SOFF)))" />
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
						<xsl:value-of 	select="concat(normalize-space(./SOFF), ' ', normalize-space(./SOFQ))" />
					</rdfs:label>	
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./SOFF)" />
					</rdfs:label>
				</xsl:otherwise>		
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="./SOFQ">
					<l0:name>
						<xsl:value-of 	select="concat(normalize-space(./SOFF), ' ', normalize-space(./SOFQ))" />
					</l0:name>	
				</xsl:when>
				<xsl:otherwise>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./SOFF)" />
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
	</xsl:for-each>
									<!-- HorizontalElementType as individual -->
	<xsl:for-each select="schede/A/SO/SOF ">
		<xsl:if test="./SOFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 			
 				<xsl:choose>
					<xsl:when test="./SOFP">
						<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(concat(normalize-space(./SOFG), '-', normalize-space(./SOFP))))" />
					</xsl:when>
					<xsl:otherwise>	
						<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(./SOFG)))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/HorizontalElementType'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="./SOFP">
					<rdfs:label>
						<xsl:value-of 	select="concat(normalize-space(./SOFG), ' ', normalize-space(./SOFP))" />
					</rdfs:label>	
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./SOFG)" />
					</rdfs:label>
				</xsl:otherwise>		
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="./SOP">
					<l0:name>
						<xsl:value-of 	select="concat(normalize-space(./SOFG), ' ', normalize-space(./SOFP))" />
					</l0:name>	
				</xsl:when>
				<xsl:otherwise>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./SOFG)" />
					</l0:name>
				</xsl:otherwise>		
			</xsl:choose>
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
									<!-- Technique as individual -->
	<xsl:for-each select="schede/A/SO/SOE">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
            	<xsl:choose>
					<xsl:when test="./SOES">
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SOEC), '-', normalize-space(./SOES))))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SOEC)))" />
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
						<xsl:value-of select="concat(normalize-space(./SOEC), ' ', normalize-space(./SOES))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(./SOEC)" />
					</xsl:otherwise>
				</xsl:choose>
			</rdfs:label>
			<l0:name>
				<xsl:choose>
					<xsl:when test="./SOES">
						<xsl:value-of select="concat(normalize-space(./SOEC), ' ', normalize-space(./SOES))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(./SOEC)" />
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
									
									<!-- Roof as individual -->
	<xsl:for-each select="schede/A/CP">
	<xsl:variable name="horElem" select="arco-fn:arcofy(.)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Roof'" />
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
			<xsl:if test="./CPC">
				<xsl:choose>	
				<xsl:when test="./CPC/* and (not(./CPC/CPCR) or ./CPC/CPCR='intero bene' or ./CPC/CPCR='integrale' or ./CPC/CPCR='tutta' or ./CPC/CPCR='totale') or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'esemplar'))">	
					<arco-dd:hasRoofStructure>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
					</xsl:attribute>
					</arco-dd:hasRoofStructure>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>	
									<!-- RoofShape as individual -->
	<xsl:for-each select="schede/A/CP/CPF">
	<xsl:if test="./CPFF">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
 				<xsl:choose>
					<xsl:when test="./CPFQ">
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./CPFF), '-', normalize-space(./CPFQ))))" />
					</xsl:when>
					<xsl:otherwise>	
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./CPFF)))" />
					</xsl:otherwise>
				</xsl:choose>
            </xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="./CPFQ">
					<rdfs:label>
						<xsl:value-of 	select="concat(normalize-space(./CPFF), ' ', normalize-space(./CPFQ))" />
					</rdfs:label>	
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
						<xsl:value-of 	select="normalize-space(./CPFF)" />
					</rdfs:label>
				</xsl:otherwise>		
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="./CPFQ">
					<l0:name>
						<xsl:value-of 	select="concat(normalize-space(./CPFF), ' ', normalize-space(./CPFQ))" />
					</l0:name>	
				</xsl:when>
				<xsl:otherwise>
					<l0:name>
						<xsl:value-of 	select="normalize-space(./CPFF)" />
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
	</xsl:for-each>
									<!-- RoofType as individual -->
	<xsl:for-each select="schede/A/CP/CPF ">
		<xsl:if test="./CPFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 			
 				<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./CPFG)))" />
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/RoofType'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of 	select="normalize-space(./CPFG)" />
			</rdfs:label>	
			<l0:name>
				<xsl:value-of 	select="normalize-space(./CPFG)" />
			</l0:name>	
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
									<!-- RoofStructure as individual -->
	<xsl:for-each select="schede/A/CP/CPC/CPCT">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
 				<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            </xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/RoofStructure'" />
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
										
	
								<!-- Roofing as individual -->
	<xsl:for-each select="schede/A/CP/CPM">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Roofing'" />
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
			<xsl:for-each select="./CPMM">	
					<arco-dd:hasMaterial>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					</arco-dd:hasMaterial>
			</xsl:for-each>
			<xsl:if test="./CPMT">
			<xsl:choose>	
					<xsl:when test="./CPMQ">
						<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPMT), '-', normalize-space(./CPMQ))))" />
						</xsl:attribute>
						</arco-core:hasType>	
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./CPMT)))" />
						</xsl:attribute>
						</arco-core:hasType>
					</xsl:otherwise>		
			</xsl:choose>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>

										<!-- RoofingType as individual -->
	<xsl:for-each select="schede/A/CP/CPM">
		<xsl:if test="./CPMT">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 
			<xsl:choose>	
					<xsl:when test="./CPMQ">
							<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPMT), '-', normalize-space(./CPMQ))))" />	
					</xsl:when>
					<xsl:otherwise>
							<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./CPMT)))" />
					</xsl:otherwise>		
			</xsl:choose>
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/RoofingType'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:choose>	
					<xsl:when test="./CPMQ">
							<xsl:value-of 	select="concat(normalize-space(./CPMT), '-', normalize-space(./CPMQ))" />	
					</xsl:when>
					<xsl:otherwise>
							<xsl:value-of 	select="normalize-space(./CPMT)" />
					</xsl:otherwise>		
				</xsl:choose>
			</rdfs:label>	
			<l0:name>
				<xsl:choose>	
					<xsl:when test="./CPMQ">
							<xsl:value-of 	select="concat(normalize-space(./CPMT), '-', normalize-space(./CPMQ))" />	
					</xsl:when>
					<xsl:otherwise>
							<xsl:value-of 	select="normalize-space(./CPMT)" />
					</xsl:otherwise>		
				</xsl:choose>
			</l0:name>	
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
								<!-- Material as individual -->
	<xsl:for-each select="schede/A/CP/CPM/CPMM">
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
																	
									
									
									<!-- Flooring as individual -->	
	<xsl:for-each select="schede/A/PV/PVM">	
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Flooring'" />
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
				<arco-ip:hasFlooringDesign>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of 	select="concat($NS, 'FlooringDesign/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
				</arco-ip:hasFlooringDesign>
			</xsl:for-each>
		</rdf:Description>
	</xsl:for-each>										
											<!-- FlooringType as individual -->
	<xsl:for-each select="schede/A/PV/PVM/PVMG ">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 			
 				<xsl:value-of 	select="concat($NS, 'FlooringType/', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/FlooringType'" />
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
									
									<!-- FlooringDesign as individual -->
	<xsl:for-each select="schede/A/PV/PVM/PVMS ">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 			
 				<xsl:value-of 	select="concat($NS, 'FlooringDesign/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/FlooringDesign'" />
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
	
									<!-- Stair as individual -->
	<xsl:for-each select="schede/A/SC">
	<xsl:variable name="soff" select="normalize-space(./SOF/SOFF)" />
	<xsl:variable name="sofq" select="normalize-space(./SOF/SOFQ)" />
	<xsl:variable name="sofg" select="normalize-space(./SOF/SOFG)" />
	<xsl:variable name="sofp" select="normalize-space(./SOF/SOFP)" />
	<xsl:variable name="horElem" select="arco-fn:arcofy(.)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Stair'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label  xml:lang="en">
				<xsl:value-of select="concat('Stair of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name  xml:lang="en">
				<xsl:value-of select="concat('Stair of cultural property ', $itemURI)" />
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
				<arco-dd:spatialLocation>
					<xsl:value-of 	select="normalize-space(./SCL/SCLL)" />
				</arco-dd:spatialLocation>
			</xsl:if>
			<xsl:if test="./SCL/SCLN">
				<arco-dd:numberOfFlights>
					<xsl:value-of 	select="normalize-space(./SCL/SCLN)" />
				</arco-dd:numberOfFlights>
			</xsl:if>
			<xsl:if test="./SCL/SCLO">
				<arco-dd:hasUseFunction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./SCL/SCLO)))" />
					</xsl:attribute>
				</arco-dd:hasUseFunction>
			</xsl:if>
			<xsl:if test="./SCL/SCLG">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'StairType/', arco-fn:urify(normalize-space(./SCL/SCLG)))" />
					</xsl:attribute>
				</arco-core:hasType>	
			</xsl:if>
			<xsl:if test="./SCS and (not(./SCS/SCSR) or ./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale') or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar'))">
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
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>	
									<!-- StairShape as individual -->
	<xsl:for-each select="schede/A/SC/SCL/SCLF">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
            </xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of 	select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of 	select="normalize-space(.)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/StairShape'" />
            	</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:for-each>
									<!-- UseFunction as individual -->
	<xsl:for-each select="schede/A/SC/SCL/SCLO">
		<rdf:Description>
 			<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(.)))" />
            </xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
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
									<!-- StairType as individual -->
	<xsl:for-each select="schede/A/SC/SCL/SCLG ">
		<rdf:Description>
			<xsl:attribute name="rdf:about"> 				
						<xsl:value-of 	select="concat($NS, 'StairType/', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
 	        <rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/StairType'" />
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
									<!-- Technique as individual -->
	<xsl:if test="./SCS and (not(./SCS/SCSR) or ./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale') or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar'))">
		<xsl:for-each select="schede/A/SC/SCS/SCSC">
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
	</xsl:if>
									<!-- Material as individual -->
	<xsl:if test="./SCS and (not(./SCS/SCSR) or ./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale') or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar'))">
		<xsl:for-each select="schede/A/SC/SCS/SCSM">
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
	
						<!-- ConstructionPart when there is SIIR (IntenalSubdivision) -->
	<xsl:for-each select="schede/A/SI/SII">
		<xsl:if test="./SIIR and not (./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SIIR)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />				
				<xsl:if test="./SIIN">
				<arco-ip:numberOfFloors>
					<xsl:value-of select="normalize-space(./SIIN)" />
				</arco-ip:numberOfFloors>
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
					<arco-ip:hasInteriorSubdivision>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIV)))" />
						</xsl:attribute>
					</arco-ip:hasInteriorSubdivision>	
				</xsl:if>
				<xsl:if test="./SIIO">
					<arco-ip:hasInteriorSubdivision>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalSubdivision/', $itemURI, '-', arco-fn:urify(normalize-space(./SIIO)))" />
						</xsl:attribute>
					</arco-ip:hasInteriorSubdivision>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	
								<!-- ConstructionPart when there is PNR (Design) -->
	<xsl:for-each select="schede/A/PN">
		<xsl:if test="./PNR and not (./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale' or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PNR)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<xsl:if test="./PNT">
					<arco-ip:hasDesign>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PNT)))" />
						</xsl:attribute>
					</arco-ip:hasDesign>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>								


								<!-- ConstructionPart when there is FNSU (Foundations) -->
	<xsl:for-each select="schede/A/FN/FNS">
		<xsl:if test="./FNSU and not (./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar')))" >
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<arco-ip:hasFoundations>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Foundations/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
				</arco-ip:hasFoundations>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	
	
							<!-- ConstructionPart when there is SVCU (VericalElement) -->
	<xsl:for-each select="schede/A/SV/SVC">
		<xsl:if test="./SVCU and not(./SVCU='intero bene' or ./SVCU='integrale' or ./SVCU='tutta' or ./SVCU='totale' or (starts-with(lower-case(normalize-space(./SVCU)), 'nr')) or (starts-with(lower-case(normalize-space(./SVCU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intero')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intera')) or (starts-with(lower-case(normalize-space(./SVCU)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SVCU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<arco-ip:hasVerticalElement>
				<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
				</arco-ip:hasVerticalElement>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	
	
							<!-- ConstructionPart when there is SOU (HorizontalElement) -->
	<xsl:for-each select="schede/A/SO">
		<xsl:if test="./SOU and not(./SOU='intero bene' or ./SOU='integrale' or ./SOU='tutta' or ./SOU='totale' or (starts-with(lower-case(normalize-space(./SOU)), 'nr')) or (starts-with(lower-case(normalize-space(./SOU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOU)), 'intero')) or (starts-with(lower-case(normalize-space(./SOU)), 'intera')) or (starts-with(lower-case(normalize-space(./SOU)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SOU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<arco-ip:hasHorizontalElement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
				</arco-ip:hasHorizontalElement>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	
							<!-- ConstructionPart when there is CPU (Roof) -->
	<xsl:for-each select="schede/A/CP">
		<xsl:if test="./CPU and not(./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
					<arco-ip:hasRoof>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasRoof>
				</xsl:if>
				<xsl:if test="./CPM">
					<arco-ip:hasCovering>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
						</xsl:attribute>
					</arco-ip:hasCovering>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	
	
					<!-- ConstructionPart when there is SCLU (Stair) -->
	<xsl:for-each select="schede/A/SC">
		<xsl:if test="./SCL/SCLU and not(./SCL/SCLU='intero bene' or ./SCL/SCLU='integrale' or ./SCL/SCLU='tutta' or ./SCL/SCLU='totale' or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'nr')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intero')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intera')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SCL/SCLU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<arco-ip:hasVerticalConnection>
					<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
				</arco-ip:hasVerticalConnection>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	

						<!-- ConstructionPart when there is PVMU (Flooring) -->
	<xsl:for-each select="schede/A/PV/PVM">
		<xsl:if test="./PVMU and not(./PVMU='intero bene' or ./PVMU='integrale' or ./PVMU='tutta' or ./PVMU='totale' or (starts-with(lower-case(normalize-space(./PVMU)), 'nr')) or (starts-with(lower-case(normalize-space(./PVMU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intero')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intera')) or (starts-with(lower-case(normalize-space(./PVMU)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ConstructionPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PVMU)))" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
				<arco-ip:hasCovering>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Flooring/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
				</arco-ip:hasCovering>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
									
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>