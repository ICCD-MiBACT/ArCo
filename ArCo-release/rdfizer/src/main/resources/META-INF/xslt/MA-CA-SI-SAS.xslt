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
					<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/RV/RVE/RVEL)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
				</xsl:otherwise>
			</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="accc-space" select="record/metadata/schede/*/AC/ACC[1]/ACCC" />
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
		<xsl:variable name="culturalProperty" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
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
		-->
		<xsl:variable name="svcc" select="normalize-space(record/metadata/schede/*/SV/SVC/SVCC)" />
		<xsl:variable name="svcq" select="normalize-space(record/metadata/schede/*/SV/SVC/SVCQ)" />
		
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			
			<xsl:for-each select="record/metadata/schede/*/DA/FNS">
				<xsl:choose>	
					<xsl:when test="not(./FNSP) or ./FNSP='intero bene' or ./FNSP='integrale' or ./FNSP='tutta' or ./FNSP='totale' or ./FNSP='carattere generale' or (starts-with(lower-case(normalize-space(./FNSP)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSP)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSP)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSP)), 'esemplar'))">
						<arco-ip:hasFoundation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-ip:hasFoundation>
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
						<arco-ip:hasVerticalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-ip:hasVerticalElement>
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
						<arco-ip:hasHorizontalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-ip:hasHorizontalElement>
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
						<arco-ip:hasRoof>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-ip:hasRoof>
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
						<arco-ip:hasVerticalConnection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
						</arco-ip:hasVerticalConnection>
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
		</rdf:Description>
		
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
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Foundation'" />
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
						<arco-ip:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$culturalProperty" />
							</xsl:attribute>
						</arco-ip:isFoundationOf>
					</xsl:when>
					<xsl:otherwise>
						<arco-ip:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:isFoundationOf>
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
							<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(concat(./FNST, '-', ./FNSQ)))" />
						</xsl:when>
						<xsl:otherwise>	
							<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(normalize-space(./FNST)))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/FoundationType'" />
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
		
		
								<!-- Vertical Element as individual -->
		<xsl:for-each select="record/metadata/schede/*/DA/ELE">
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
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/HorizontalElementType'" />
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
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/RoofType'" />
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
				<xsl:if test="./SCAT">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'StairType/', arco-fn:urify(normalize-space(./SCAT)))" />
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
					<arco-ip:hasFoundation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasFoundation>
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
					<arco-ip:hasVerticalElement>
					<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasVerticalElement>
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
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
					<arco-ip:hasHorizontalElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasHorizontalElement>
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
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
					<arco-ip:hasRoof>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasRoof>
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
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
					<arco-ip:hasVerticalConnection>
						<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Stair/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasVerticalConnection>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>	
	
	</xsl:if>					
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>