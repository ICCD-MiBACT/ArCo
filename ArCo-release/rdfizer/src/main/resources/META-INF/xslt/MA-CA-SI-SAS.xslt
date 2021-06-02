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
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
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
	<xsl:if test="not($sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB')" >

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
				<xsl:variable name="accc-space">
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
		<!-- 	
		<xsl:variable name="fnst" select="normalize-space(record/metadata/schede/*/FN/FNS/FNST)" />
		<xsl:variable name="fnsq" select="normalize-space(record/metadata/schede/*/FN/FNS/FNSQ)" />
		<xsl:variable name="foundationType">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/FN/FNS/FNSQ">
					<xsl:value-of select="concat($NS, 'FoundationType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />	
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/FN/FNS/FNST and not(record/metadata/schede/*/FN/FNS/FNSQ)">
					<xsl:value-of select="concat($NS, 'FoundationType/', arco-fn:urify($fnst))" />	
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="svcc" select="normalize-space(record/metadata/schede/*/SV/SVC/SVCC)" />
		<xsl:variable name="svcq" select="normalize-space(record/metadata/schede/*/SV/SVC/SVCQ)" />
		-->		
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/SI/CA/USD">
				<arco-con:laysOnSoil>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
					</xsl:attribute>
				</arco-con:laysOnSoil>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/DA/FNS">
				<xsl:choose>	
					<xsl:when test="not(./FNSP) or ./FNSP='intero bene' or ./FNSP='integrale' or ./FNSP='tutta' or ./FNSP='totale' or ./FNSP='carattere generale' or (starts-with(lower-case(normalize-space(./FNSP)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSP)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSP)), 'esemplar'))">
						<arco-con:hasFoundation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasFoundation>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./FNSP">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>				
			<xsl:for-each select="record/metadata/schede/*/DA/ELE">
				<xsl:choose>	
					<xsl:when test="not(./ELEP) or ./ELEP='intero bene' or ./ELEP='integrale' or ./ELEP='tutta' or ./ELEP='totale' or ./ELEP='carattere generale' or (starts-with(lower-case(normalize-space(./ELEP)), 'nr')) or (starts-with(lower-case(normalize-space(./ELEP)), 'n.r')) or (starts-with(lower-case(normalize-space(./ELEP)), 'intero')) or (starts-with(lower-case(normalize-space(./ELEP)), 'intera')) or (starts-with(lower-case(normalize-space(./ELEP)), 'esemplar'))">
						<arco-con:hasVerticalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasVerticalElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./ELEP">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>	
			<xsl:for-each select="record/metadata/schede/*/DA/SOL">
				<xsl:choose>	
					<xsl:when test="not(./SOLP) or ./SOLP='intero bene' or ./SOLP='integrale' or ./SOLP='tutta' or ./SOLP='totale' or ./SOLP='carattere generale' or (starts-with(lower-case(normalize-space(./SOLP)), 'nr')) or (starts-with(lower-case(normalize-space(./SOLP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOLP)), 'intero')) or (starts-with(lower-case(normalize-space(./SOLP)), 'intera')) or (starts-with(lower-case(normalize-space(./SOLP)), 'esemplar'))">
						<arco-con:hasHorizontalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasHorizontalElement>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./SOLP">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/CPU">		
				<xsl:choose>	
					<xsl:when test="not(./CPUP) or ./CPUP='intero bene' or ./CPUP='integrale' or ./CPUP='tutta' or ./CPUP='totale' or ./CPUP='carattere generale' or (starts-with(lower-case(normalize-space(./CPUP)), 'nr')) or (starts-with(lower-case(normalize-space(./CPUP)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPUP)), 'intero')) or (starts-with(lower-case(normalize-space(./CPUP)), 'intera')) or (starts-with(lower-case(normalize-space(./CPUP)), 'esemplar'))">
						<arco-con:hasRoof>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasRoof>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPUP)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/SCA">
				<xsl:choose>	
					<xsl:when test="not(./SCAP) or ./SCAP='intero bene' or ./SCAP='integrale' or ./SCAP='tutta' or ./SCAP='totale' or ./SCAP='carattere generale' or (starts-with(lower-case(normalize-space(./SCAP)), 'nr')) or (starts-with(lower-case(normalize-space(./SCAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCAP)), 'intero')) or (starts-with(lower-case(normalize-space(./SCAP)), 'intera')) or (starts-with(lower-case(normalize-space(./SCAP)), 'esemplar'))">
						<arco-con:hasVerticalConnection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasVerticalConnection>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./SCAP">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/SPA">		
				<xsl:choose>	
					<xsl:when test="not(./SPAP) or ./SPAP='intero bene' or ./SPAP='integrale' or ./SPAP='tutta' or ./SPAP='totale' or ./SPAP='carattere generale' or (starts-with(lower-case(normalize-space(./SPAP)), 'nr')) or (starts-with(lower-case(normalize-space(./SPAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SPAP)), 'intero')) or (starts-with(lower-case(normalize-space(./SPAP)), 'intera')) or (starts-with(lower-case(normalize-space(./SPAP)), 'esemplar'))">
						<arco-con:hasConstructionSpace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpenSpace/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-con:hasConstructionSpace>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SPAP)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/DA/PNT">
				<xsl:choose>	
					<xsl:when test="not(./PNTQ) or ./PNTQ='intero bene' or ./PNTQ='integrale' or ./PNTQ='tutta' or ./PNTQ='totale' or ./PNTQ='carattere generale' or (starts-with(lower-case(normalize-space(./PNTQ)), 'nr')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'intero')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'intera')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'esemplar'))">
						<arco-con:hasLayout>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-con:hasLayout>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="./PNTQ">
							<arco-con:hasConstructionSpace>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Floor/', $itemURI, arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-con:hasConstructionSpace>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</rdf:Description>
		<!-- NaturalEnvironment as individual -->
		<xsl:if test="record/metadata/schede/SI/CA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	    	   		<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
				</xsl:attribute>
				<arco-location:hasNaturalEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasNaturalEnvironment>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironment'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Ambiente naturale relativo al bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Ambiente naturale relativo al bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Natural environment of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Natural environment of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/SI/CA/GEF">
					<arco-location:geographicalDescription>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/SI/CA/GEF/GEFI">
								<xsl:value-of select="concat('Sistema idrico di superficie: ', record/metadata/schede/SI/CA/GEF/GEFI, ' ', record/metadata/schede/SI/CA/GEF/GEFD)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="record/metadata/schede/SI/CA/GEF/GEFD" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-location:geographicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/GEO/GEOD">
					<arco-location:geomorphologicalDescription>
						<xsl:value-of select="record/metadata/schede/SI/CA/GEO/GEOD" />
					</arco-location:geomorphologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/GEL/GELD">
					<arco-location:geologicalDescription>
						<xsl:value-of select="record/metadata/schede/SI/CA/GEL/GELD" />
					</arco-location:geologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/AGR">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/SI/CA/AGR" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/GEL/GELC">
					<arco-location:hasMap>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/GEL/GELC)))" />
						</xsl:attribute>
					</arco-location:hasMap>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/PED">
					<arco-location:pedologicalDescription>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/SI/CA/PED/PEDE">
								<xsl:value-of select="concat(record/metadata/schede/SI/CA/PED/PEDD, '. ', 'Esame dei campioni: ', record/metadata/schede/SI/CA/PED/PEDE)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="record/metadata/schede/SI/CA/PED/PEDD" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-location:pedologicalDescription>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/PED/PEDC">
					<arco-location:hasMap>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PedologicalMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/PED/PEDC)))" />
						</xsl:attribute>
					</arco-location:hasMap>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/CA/CAS">
					<arco-location:historicalEnvironmentContextDescription>
						<xsl:value-of select="concat(record/metadata/schede/SI/CA/CAS/CASD, '. ', record/metadata/schede/SI/CA/CAS/CASF, '. ', record/metadata/schede/SI/CA/CAS/CASA)" />
					</arco-location:historicalEnvironmentContextDescription>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/SI/CA/GEL/GELC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'GeologicalMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/GEL/GELC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalMap'" />
						</xsl:attribute>
					</rdf:type>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/SI/CA/GEL/GELC" />
					</l0:name>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/SI/CA/GEL/GELC" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/SI/CA/PED/PEDC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PedologicalMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/PED/PEDC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/PedologicalMap'" />
						</xsl:attribute>
					</rdf:type>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/SI/CA/PED/PEDC" />
					</l0:name>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/SI/CA/PED/PEDC" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:if>	
		<!-- Soil as individual -->
		<xsl:if test="record/metadata/schede/SI/CA/USD">
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
					<xsl:value-of select="record/metadata/schede/SI/CA/USD/USDT" />
				</arco-core:description>
				<xsl:if test="record/metadata/schede/SI/CA/USD/USDC">
					<arco-location:hasMap>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LandUseMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/USD/USDC)))" />
						</xsl:attribute>
					</arco-location:hasMap>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/SI/CA/USD/USDC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'LandUseMap/', arco-fn:urify(normalize-space(record/metadata/schede/SI/CA/USD/USDC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/location/LanduseMap'" />
						</xsl:attribute>
					</rdf:type>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/SI/CA/USD/USDC" />
					</l0:name>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/SI/CA/USD/USDC" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:if>	
		<!-- Foundation as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/FNS">
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
					<xsl:when test="not(./FNSP) or ./FNSP='intero bene' or ./FNSP='integrale' or ./FNSP='tutta' or ./FNSP='totale' or ./FNSP='carattere generale' or (starts-with(lower-case(normalize-space(./FNSP)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSP)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSP)), 'esemplar'))">
						<arco-con:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$culturalProperty" />
							</xsl:attribute>
						</arco-con:isFoundationOf>
					</xsl:when>
					<xsl:otherwise>
						<arco-con:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSP)))" />
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
	           	<xsl:if test="./FNST">
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
				</xsl:if>
				<xsl:if test="./FNSD">
					<arco-core:description>
						<xsl:value-of select="./FNSD" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./FNSI">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-foundation-measurement-collection-', position())" />
						</xsl:attribute>
	            	</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
		<!-- Measurement collection as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/FNS/FNSI">
			<rdf:Description>
	 			<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-foundation-measurement-collection-', position())" />
	            </xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure delle fondazioni del bene culturale ', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="'Misure delle fondazioni del bene culturale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of foundation of cultural property ', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="'Measuerements of foundation of cultural property ', $itemURI" />
				</l0:name>
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/Foundation/', (.))" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Foundation/', (.))" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of foundation ', position(), ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of foundation ', position(), ': ', (.))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura delle fondazioni ',  position(), ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura delle fondazioni ',  position(), ': ', (.))" />
				</l0:name>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Foundation-', (.))" />
				</arco-dd:hasValue>
			</rdf:Description>	
		</xsl:for-each>
		<!-- Material as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/FNS/FNSM">
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
		<xsl:for-each select="record/metadata/schede/*/DA/FNS/FNSC">
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
		<!-- FoundationType as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/FNS ">
			<xsl:if test="./FNST">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:choose>
						<xsl:when test="./FNSQ">
							<xsl:value-of select="concat($NS, 'FoundationType/', arco-fn:urify(concat(./FNST, '-', ./FNSQ)))" />
						</xsl:when>
						<xsl:otherwise>	
							<xsl:value-of select="concat($NS, 'FoundationType/', arco-fn:urify(normalize-space(./FNST)))" />
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
							<xsl:value-of select="concat(normalize-space(./FNST), ' ', normalize-space(./FNSQ))" />
						</rdfs:label>	
					</xsl:when>
					<xsl:otherwise>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNST)" />
						</rdfs:label>
					</xsl:otherwise>		
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="./FNSQ">
						<l0:name>
							<xsl:value-of select="concat(normalize-space(./FNST), ' ', normalize-space(./FNSQ))" />
						</l0:name>	
					</xsl:when>
					<xsl:otherwise>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNST)" />
						</l0:name>
					</xsl:otherwise>		
				</xsl:choose>
			</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Vertical Element as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE">
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
				<xsl:for-each select="./ELEX">
					<arco-dd:hasMaterial>
	 	                <xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            		</xsl:attribute>
					</arco-dd:hasMaterial>
				</xsl:for-each>
				<xsl:for-each select="./ELEL">
					<arco-dd:hasMaterial>
	 	                <xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            		</xsl:attribute>
					</arco-dd:hasMaterial>
				</xsl:for-each>
				<xsl:for-each select="./ELET">
					<arco-dd:hasTechnique>
	 	                <xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	            		</xsl:attribute>
					</arco-dd:hasTechnique>
				</xsl:for-each>
				<xsl:if test="./ELEN">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of 	select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(./ELEN)))" />
						</xsl:attribute>
	            	</arco-core:hasType>
				</xsl:if>
				<xsl:if test="./ELED">
					<arco-core:description>
						<xsl:value-of select="./ELED" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./ELEA">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-vertical-element-measurement-collection-', position())" />
						</xsl:attribute>
	            	</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>	
		<!-- Measurement collection as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE">
		<xsl:if test="./ELEA">
			<rdf:Description>
	 			<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-vertical-element-measurement-collection-', position())" />
	            </xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure delle strutture verticali del bene culturale ', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="'Misure delle strutture verticali del bene culturale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of vertical element of cultural property ', $itemURI" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="'Measuerements of vertical element of cultural property ', $itemURI" />
				</l0:name>
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/VerticalElement/', (./ELEA))" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/VerticalElement/', (./ELEA))" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of vertical element ', position(), ': ', (./ELEA))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of vertical element ', position(), ': ', (./ELEA))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura delle strutture verticali ',  position(), ': ', (./ELEA))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura delle strutture verticali ',  position(), ': ', (./ELEA))" />
				</l0:name>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/VerticalElement-', (./ELEA))" />
				</arco-dd:hasValue>
			</rdf:Description>
		</xsl:if>	
		</xsl:for-each>
		<!-- Material as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE">
		<xsl:if test="./ELEX">
			<rdf:Description>
	 			<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ELEX)))" />
	            </xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./ELEX)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./ELEX)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            	</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
				<xsl:if test="./ELEC">
					<arco-core:description>
						<xsl:value-of select="./ELEC" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./ELEL">
			<rdf:Description>
	 			<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ELEL)))" />
	            </xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./ELEL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./ELEL)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
	            	</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
				<xsl:if test="./ELEE">
					<arco-core:description>
						<xsl:value-of select="./ELEE" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
		<!-- VerticalElementType as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE/ELEN">
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
		</xsl:for-each>
		<!-- Horizontal Element as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SOL">
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
				<xsl:if test="./SOLO">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(./SOLO))" />
						</xsl:attribute>
					</arco-core:hasType>	
				</xsl:if>
				<xsl:if test="./SOLT">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SOLT)))" />
						</xsl:attribute>
					</arco-dd:hasTechnique>					
				</xsl:if>
				<xsl:if test="./SOLD">
					<arco-core:description>
						<xsl:value-of select="./SOLD" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>	
		<!-- HorizontalElementType as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SOL/SOLO">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(.))" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElementType'" />
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
		<xsl:for-each select="record/metadata/schede/*/DA/SOL/SOLT">
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
		<!-- Roof as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/CPU">
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
				<xsl:if test="./CPUT">
					<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./CPUT)))" />
					</xsl:attribute>
					</arco-core:hasType>	
				</xsl:if>
				<xsl:if test="./CPUC">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./CPUC)))" />
						</xsl:attribute>
					</arco-dd:hasTechnique>					
				</xsl:if>
				<xsl:if test="./CPUD">
					<arco-core:description>
						<xsl:value-of select="./CPUD" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>	
		<!-- RoofType as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/CPU/CPUT ">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofType'" />
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
		<!-- Material as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/CPU/CPUC">
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
		<!-- Stair as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Stair'" />
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
				<xsl:if test="./SCAT">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./SCAT)))" />
						</xsl:attribute>
					</arco-dd:hasTechnique>	
				</xsl:if>
				<xsl:if test="./SCAD">
					<arco-core:description>
						<xsl:value-of 	select="normalize-space(./SCAD)" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>	
		<!-- Technique as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SCA/SCAT">
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
		<!-- Open space as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SPA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'OpenSpace/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/OpenSpace'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./SPAT)" />
				</rdfs:label>
				<l0:name >
					<xsl:value-of select="normalize-space(./SPAT)" />
				</l0:name>
				<xsl:for-each select="./SPAC">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:hasTechnique>	
				</xsl:for-each>
				<xsl:if test="./SPAD">
					<arco-core:description>
						<xsl:value-of 	select="normalize-space(./SPAD)" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>	
		<!-- Technique as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/SPA/SPAC">
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
		<!-- Floor as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/PNT">
			<xsl:if test="./PNTQ and not (./PNTQ='intero bene' or ./PNTQ='integrale' or ./PNTQ='tutta' or ./PNTQ='totale' or ./PNTQ='carattere generale' or (starts-with(lower-case(normalize-space(./PNTQ)), 'nr')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'intero')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'intera')) or (starts-with(lower-case(normalize-space(./PNTQ)), 'esemplar')))" >
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	        			<xsl:value-of select="concat($NS, 'Floor/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Floor'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./PNTQ)" />
					</rdfs:label>
					<l0:name >
						<xsl:value-of select="normalize-space(./PNTQ)" />
					</l0:name>
					<arco-con:hasLayout>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-con:hasLayout>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- Layout as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/PNT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Layout'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Layout ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Layout ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Schema iconografico ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Schema iconografico ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<xsl:for-each select="./PNTD"><!-- e.g.ICCD12003510  -->
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
				<xsl:if test="./PNTO">
					<arco-core:description>
						<xsl:value-of 	select="normalize-space(./PNTO)" />
					</arco-core:description>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>		
		<!-- CulturalPropertyPart when there is SPAP (Open space) -->
		<xsl:for-each select="record/metadata/schede/*/DA/SPA">
			<xsl:if test="./SPAP and not (./SPAP='intero bene' or ./SPAP='integrale' or ./SPAP='tutta' or ./SPAP='totale' or ./SPAP='carattere generale' or (starts-with(lower-case(normalize-space(./SPAP)), 'nr')) or (starts-with(lower-case(normalize-space(./SPAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SPAP)), 'intero')) or (starts-with(lower-case(normalize-space(./SPAP)), 'intera')) or (starts-with(lower-case(normalize-space(./SPAP)), 'esemplar')))" >
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SPAP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SPAP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SPAP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasConstructionSpace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpenSpace/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasConstructionSpace>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is FNSP (Foundation) -->
		<xsl:for-each select="record/metadata/schede/*/DA/FNS">
			<xsl:if test="./FNSP and not (./FNSP='intero bene' or ./FNSP='integrale' or ./FNSP='tutta' or ./FNSP='totale' or ./FNSP='carattere generale' or (starts-with(lower-case(normalize-space(./FNSP)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSP)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSP)), 'esemplar')))" >
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FNSP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FNSP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasFoundation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasFoundation>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is ELEP (VericalElement) -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE">
			<xsl:if test="./ELEP and not(./ELEP='intero bene' or ./ELEP='integrale' or ./ELEP='tutta' or ./ELEP='totale' or ./ELEP='carattere generale' or (starts-with(lower-case(normalize-space(./ELEP)), 'nr')) or (starts-with(lower-case(normalize-space(./ELEP)), 'n.r')) or (starts-with(lower-case(normalize-space(./ELEP)), 'intero')) or (starts-with(lower-case(normalize-space(./ELEP)), 'intera')) or (starts-with(lower-case(normalize-space(./ELEP)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ELEP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ELEP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ELEP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasVerticalElement>
					<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasVerticalElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is SOL (HorizontalElement) -->
		<xsl:for-each select="record/metadata/schede/*/DA/SOL">
			<xsl:if test="./SOLP and not(./SOLP='intero bene' or ./SOLP='integrale' or ./SOLP='tutta' or ./SOLP='totale' or ./SOLP='carattere generale' or (starts-with(lower-case(normalize-space(./SOLP)), 'nr')) or (starts-with(lower-case(normalize-space(./SOLP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOLP)), 'intero')) or (starts-with(lower-case(normalize-space(./SOLP)), 'intera')) or (starts-with(lower-case(normalize-space(./SOLP)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SOLP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SOLP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SOLP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasHorizontalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasHorizontalElement>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is CPU (Roof) -->
		<xsl:for-each select="record/metadata/schede/*/DA/CPU">
			<xsl:if test="./CPUP and not(./CPUP='intero bene' or ./CPUP='integrale' or ./CPUP='tutta' or ./CPUP='totale' or ./CPUP='carattere generale' or (starts-with(lower-case(normalize-space(./CPUP)), 'nr')) or (starts-with(lower-case(normalize-space(./CPUP)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPUP)), 'intero')) or (starts-with(lower-case(normalize-space(./CPUP)), 'intera')) or (starts-with(lower-case(normalize-space(./CPUP)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPUP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CPUP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./CPUP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasRoof>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasRoof>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
		<!-- CulturalPropertyPart when there is SCAP (Stair) -->
		<xsl:for-each select="record/metadata/schede/*/DA/SCA">
			<xsl:if test="./SCAP and not(./SCAP='intero bene' or ./SCAP='integrale' or ./SCAP='tutta' or ./SCAP='totale' or ./SCAP='carattere generale' or (starts-with(lower-case(normalize-space(./SCAP)), 'nr')) or (starts-with(lower-case(normalize-space(./SCAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCAP)), 'intero')) or (starts-with(lower-case(normalize-space(./SCAP)), 'intera')) or (starts-with(lower-case(normalize-space(./SCAP)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SCAP)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/construction-description/ConstructionPart" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyPart" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./SCAP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./SCAP)" />
					</l0:name>
					<arco-core:isPartOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-core:isPartOf>
					<arco-con:hasVerticalConnection>
						<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-con:hasVerticalConnection>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>		
	</xsl:if>					
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>