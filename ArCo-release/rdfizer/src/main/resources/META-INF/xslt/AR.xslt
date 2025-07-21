<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-mi="https://w3id.org/arco/ontology/musical-instrument/"
	xmlns:arco-clo="https://w3id.org/arco/ontology/clothing-description/"
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
					<xsl:when test="$sheetType='AR'">
						<xsl:value-of select="concat($NS, 'ArchitecturalOrLandscapeHeritage/', $itemURI)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$sheetType='AR'">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="record/metadata/schede/AR/LC/PVZ">
						<arco-location:hasTypeOfContext>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/UrbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto periuburbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/TerritorialContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto rurale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/RuralContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/UnderwaterContext'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(PVZ)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasTypeOfContext>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/US/USO">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
							</xsl:attribute>
						</arco-cd:hasUse>
					</xsl:for-each>
					<!--COSE VECCHIE DA CANCELLARE VEAC-->
					<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTG">
						<arco-clo:intendedUser>
							<xsl:value-of select="record/metadata/schede/VeAC/OG/OGT/OGTG" />
						</arco-clo:intendedUser>
					</xsl:if>
				</rdf:Description>
				<!--Historical Use as individual-->
				<xsl:for-each select="record/metadata/schede/*/US/USO">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Use'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Historical use ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Historical use ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Uso storico ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Uso storico ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<xsl:for-each select=". [not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<!-- allow multiple values eg:ICCD14295730  -->
							<arco-cd:hasUseFunction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-cd:hasUseFunction>
						</xsl:for-each>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalUse'" />
							</xsl:attribute>
						</arco-core:hasType>
					</rdf:Description>
					<!-- usefunction as an individual -->
					<xsl:for-each select=". [not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<!-- allow multiple values eg:ICCD14295730  -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
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
				<!-- NaturalEnvironment as individual -->
				<xsl:if test="record/metadata/schede/*/CA">
					<!--<rdf:Description>
				<xsl:attribute name="rdf:about">
	    	   		<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
				</xsl:attribute>
				<arco-location:hasNaturalEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasNaturalEnvironment>
			</rdf:Description>-->
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
						<xsl:if test="record/metadata/schede/*/CA/CAB">
							<arco-core:hasType>
								<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CA/CAB)))" />
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAA">
							<arco-core:description xml:lang="it">
								<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAS">
							<arco-location:historicalEnvironmentContextDescription>
								<xsl:value-of select="record/metadata/schede/*/CA/CAS" />
							</arco-location:historicalEnvironmentContextDescription>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAD">
							<arco-location:naturalWaterArrangement>
								<xsl:value-of select="record/metadata/schede/*/CA/CAD" />
							</arco-location:naturalWaterArrangement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAN">
							<arco-core:note>
								<xsl:value-of select="record/metadata/schede/*/CA/CAN" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAT">
							<arco-location:hasClimateSituation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasClimateSituation>
						</xsl:if>
						<xsl:for-each select="record/metadata/schede/*/CA/IQA">
							<arco-location:hasEnvironmentalDamage>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/Pollution/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
						</xsl:for-each>
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<arco-location:hasEnvironmentalDamage>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
						</xsl:for-each>
					</rdf:Description>
					<!-- NaturalEnvironmentType as individual-->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(record/metadata/schede/*/CA/CAB))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironmentType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/*/CA/CAB" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/*/CA/CAB" />
						</l0:name>
					</rdf:Description>
					<!-- Climate Situation as individual-->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/ClimateSituation'" />
							</xsl:attribute>
						</rdf:type>
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
						<arco-core:description xml:lang="it">
							<xsl:value-of select="record/metadata/schede/*/CA/CAT" />
						</arco-core:description>
					</rdf:Description>
					<!-- Environmental damage IQA as individual-->
					<xsl:if test="record/metadata/schede/*/CA/IQA">
						<xsl:for-each select="record/metadata/schede/*/CA/IQA">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/Pollution', $itemURI, '-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/EnvironmentalDamage'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Environmental damage - pollution ', position(), ' of cultural property: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Environmental damage - pollution ', position(), ' of cultural property: ', $itemURI)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale - inquinamento ', position(), ' del bene culturale: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale - inquinamento ', position(), ' del bene culturale: ', $itemURI)" />
								</l0:name>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./IQAT))" />
								</arco-core:hasType>
								<xsl:if test="./IQAD">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./IQAD" />
									</arco-core:description>
								</xsl:if>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
					<!-- Environmental damage DSI as individual-->
					<xsl:if test="record/metadata/schede/*/CA/DSI">
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/EnvironmentalDamage'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Environmental damage ', position(), ' of cultural property: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Environmental damage ', position(), ' of cultural property: ', $itemURI)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale ', position(), ' del bene culturale: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale ', position(), ' del bene culturale: ', $itemURI)" />
								</l0:name>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./DSIT))" />
								</arco-core:hasType>
								<xsl:if test="./DSIT">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./DSIT" />
									</arco-core:description>
								</xsl:if>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./DSIT))" />
								</arco-core:hasType>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
				<!-- REGOLE VECCHIE VEAC DA ELIMINARE -->
				<!-- Subject as an individual -->
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTV">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(record/metadata/schede/VeAC/OG/OGT/OGTV))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTV)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTV)" />
							</xsl:call-template>
						</l0:name>
						<arco-core:isClassifiedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(record/metadata/schede/VeAC/OG/OGT/OGTV))" />
							</xsl:attribute>
						</arco-core:isClassifiedBy>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(record/metadata/schede/VeAC/OG/OGT/OGTV))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/Concept'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTV)" />
							</xsl:call-template>
						</rdfs:label>
						<l0:name>
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTV)" />
							</xsl:call-template>
						</l0:name>
						<arco-core:classifies>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(record/metadata/schede/VeAC/OG/OGT/OGTV))" />
							</xsl:attribute>
						</arco-core:classifies>
					</rdf:Description>
				</xsl:if>
				<!-- Circumstance as an individual -->
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(record/metadata/schede/VeAC/OG/OGT/OGTL))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/Circumstance" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTL)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTL)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- decoration -->
				<xsl:for-each select="record/metadata/schede/VeAC/MT/MTC">
					<xsl:if test="./MTCD or ./MTCN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/IconographicOrDecorativeApparatus'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Decorative apparatus ', position(), ' of the cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Decorative apparatus ', position(), ' of the cultural property ', $itemURI)" />
							</l0:name>
							<xsl:if test="./MTCD">
								<arco-core:hasType>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(./MTCD)))" />
									</xsl:attribute>
								</arco-core:hasType>
							</xsl:if>
							<xsl:if test="./MTCN">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-decorative-apparatus-', position())" />
									</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<arco-lite:hasTechnique>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCN)))" />
									</xsl:attribute>
								</arco-lite:hasTechnique>
							</xsl:if>
						</rdf:Description>
						<!-- decorative apparatus type -->
						<xsl:if test="./MTCD">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(./MTCD)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/IconographicOrDecorativeApparatusType'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="./MTCD" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="./MTCD" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<!-- technical status -->
						<xsl:if test="./MTCN">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-decorative-apparatus-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Stato tecnico dell''apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Stato tecnico dell''apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Technical status of decorative apparatus ', position(), ' of cultural property ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Technical status of decorative apparatus ', position(), ' of cultural property ', $itemURI)" />
								</l0:name>
								<arco-core:current>
									<xsl:value-of select="true()" />
								</arco-core:current>
								<arco-dd:includesTechnicalCharacteristic>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCN)))" />
									</xsl:attribute>
								</arco-dd:includesTechnicalCharacteristic>
							</rdf:Description>
							<!-- Technical characteristic as an individual -->
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCN)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./MTCN)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./MTCN)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- decoration -->
				<xsl:if test="record/metadata/schede/VeAC/DA/EDA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/IconographicOrDecorativeApparatus'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Decorative apparatus ', position(), ' of the cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Decorative apparatus ', position(), ' of the cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAT">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/VeAC/DA/EDA/EDAV">
									<arco-core:hasType>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAV)))" />
										</xsl:attribute>
									</arco-core:hasType>
								</xsl:when>
								<xsl:otherwise>
									<arco-core:hasType>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)))" />
										</xsl:attribute>
									</arco-core:hasType>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAM">
							<arco-core:description xml:lang="it">
								<xsl:value-of select="concat('Forma-materia della decorazione: ', normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAM))" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAC">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-decorative-apparatus-', position())" />
								</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-lite:hasTechnique>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAC)))" />
								</xsl:attribute>
							</arco-lite:hasTechnique>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAP">
							<arco-dd:positionOnCulturalProperty>
								<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAP)" />
							</arco-dd:positionOnCulturalProperty>
						</xsl:if>
					</rdf:Description>
					<!-- decorative apparatus type -->
					<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/VeAC/DA/EDA/EDAV">
										<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAV)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatusType/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/IconographicOrDecorativeApparatusType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="record/metadata/schede/VeAC/DA/EDA/EDAV">
										<xsl:value-of select="concat(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT), ' ', normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAV))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="record/metadata/schede/VeAC/DA/EDA/EDAV">
										<xsl:value-of select="concat(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT), ' ', normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAV))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAT)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- technical status -->
					<xsl:if test="record/metadata/schede/VeAC/DA/EDA/EDAC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-decorative-apparatus-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico dell''apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico dell''apparato decorativo ', position(), ' del bene culturale ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Technical status of decorative apparatus ', position(), ' of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Technical status of decorative apparatus ', position(), ' of cultural property ', $itemURI)" />
							</l0:name>
							<arco-core:current>
								<xsl:value-of select="true()" />
							</arco-core:current>
							<arco-dd:includesTechnicalCharacteristic>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAC)))" />
								</xsl:attribute>
							</arco-dd:includesTechnicalCharacteristic>
						</rdf:Description>
						<!-- Technical characteristic as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAC)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/EDA/EDAC)" />
							</l0:name>
							<arco-dd:isCharacteristicClassifiedBy>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
								</xsl:attribute>
							</arco-dd:isCharacteristicClassifiedBy>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<!-- interior element -->
				<xsl:for-each select="record/metadata/schede/VeAC/MT/MTF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'InteriorElement/', $itemURI, position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/InteriorElement'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Elemento interno ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Elemento interno ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Interior element ', position(), ' of the cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Interior element ', position(), ' of the cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./MTFO">
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InteriorElementType/', arco-fn:urify(normalize-space(./MTFO)))" />
								</xsl:attribute>
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="./MTFF">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-interior-element-', position())" />
								</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-lite:hasMaterial>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFF)))" />
								</xsl:attribute>
							</arco-lite:hasMaterial>
						</xsl:if>
						<xsl:if test="./MTFT">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-interior-element-', position())" />
								</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-lite:hasTechnique>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFT)))" />
								</xsl:attribute>
							</arco-lite:hasTechnique>
						</xsl:if>
						<xsl:if test="./MTFC">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-interior-element-', position())" />
								</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-lite:hasColour>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFC)))" />
								</xsl:attribute>
							</arco-lite:hasColour>
						</xsl:if>
						<xsl:if test="./MTFP">
							<arco-dd:positionOnCulturalProperty>
								<xsl:value-of select="normalize-space(./MTFP)" />
							</arco-dd:positionOnCulturalProperty>
						</xsl:if>
					</rdf:Description>
					<!--interior element type -->
					<xsl:if test="./MTFO">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'InteriorElementType/', arco-fn:urify(normalize-space(./MTFO)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/InteriorElementType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="./MTFO" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="./MTFO" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- technical status -->
					<xsl:if test="./MTFF or ./MTFT or ./MTFC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-interior-element-', position())" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico dell''elemento interno ', position(), ' del bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico dell''elemento interno ', position(), ' del bene culturale ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Technical status of interior element ', position(), ' of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Technical status of interior element ', position(), ' of cultural property ', $itemURI)" />
							</l0:name>
							<arco-core:current>
								<xsl:value-of select="true()" />
							</arco-core:current>
							<xsl:if test="./MTFF">
								<arco-dd:includesTechnicalCharacteristic>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFF)))" />
									</xsl:attribute>
								</arco-dd:includesTechnicalCharacteristic>
							</xsl:if>
							<xsl:if test="./MTFT">
								<arco-dd:includesTechnicalCharacteristic>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFT)))" />
									</xsl:attribute>
								</arco-dd:includesTechnicalCharacteristic>
							</xsl:if>
							<xsl:if test="./MTFC">
								<arco-dd:includesTechnicalCharacteristic>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFC)))" />
									</xsl:attribute>
								</arco-dd:includesTechnicalCharacteristic>
							</xsl:if>
						</rdf:Description>
						<!-- Technical characteristic as an individual -->
						<xsl:if test="./MTFF">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFF)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./MTFF)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./MTFF)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./MTFT">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFT)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./MTFT)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./MTFT)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./MTFC">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTFC)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./MTFC)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./MTFC)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- Measurement collection as individual -->
				<xsl:if test="record/metadata/schede/VeAC/MT/MII">
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
							<xsl:value-of select="concat('Misure del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misure del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurements of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurements of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIA">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-maximum-total-length')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIL">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-maximum-total-width')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIP">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-depth-or-height')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIA">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-maximum-total-length')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIA)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIA)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIA)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIA)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MaximumTotalLength')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIA))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIA))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIA" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIA" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIA" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIL">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-maximum-total-width')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIL)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIL)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIL)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIL)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MaximumTotalWidth')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIL))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIL))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIL" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIL" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIL" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MII/MIIP">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-depth-or-height')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIP)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIP)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIP)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MII/MIIP)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'DepthOrHeight')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIP))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MII/MIIP))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIP" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIP" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MII/MIIP" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<!-- Measurement collection as individual -->
				<xsl:if test="record/metadata/schede/VeAC/MT/MIS">
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
							<xsl:value-of select="concat('Misure del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misure del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Measurements of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Measurements of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISR">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-front-total-length')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISD">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-back-total-length')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISS">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-back-width')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISP">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-chest-circumference')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISV">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-waist-circumference')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISF">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-hip-circumference')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISO">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-edge-circumference')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISR">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-front-total-length')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISR)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISR)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISR)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISR)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'FrontTotalLength')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISR))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISR))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISR" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISR" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISR" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISD">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-back-total-length')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISD)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISD)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISD)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISD)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'BackTotalLength')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISD))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISD))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISD" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISD" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISD" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISS">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-back-width')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISS)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISS)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISS)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISS)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'BackWidth')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISS))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISS))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISS" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISS" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISS" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISP">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-chest-circumference')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISP)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISP)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISP)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISP)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'ChestCircumference')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISP))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISP))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISP" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISP" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISP" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISV">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-waist-circumference')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISV)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISV)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISV)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISV)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'WaistCircumference')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISV))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISV))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISV" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISV" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISV" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISF">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-hip-circumference')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISF)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISF)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISF)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISF)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'HipCircumference')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISF))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISF))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISF" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISF" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISF" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIS/MISO">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-edge-circumference')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISO)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISO)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISO)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIS/MISO)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'EdgeCircumference')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISO))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIS/MISO))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISO" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISO" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIS/MISO" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<!-- Sleeve  as individual -->
				<xsl:if test="record/metadata/schede/VeAC/MT/MIM">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Sleeve/', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Sleeve'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Manica del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Manica del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Sleeve of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Sleeve of cultural property ', $itemURI)" />
						</l0:name>
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/Sleeve', $itemURI)" />
							</xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Sleeve', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Misure della manica del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Misure della manica bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Sleeve measurements of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Sleeve measurements of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIM/MIMA">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/Sleeve', $itemURI, '-', position(), '-maximum-total-length')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/MT/MIM/MIML">
							<arco-dd:hasMeasurement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Measurement/Sleeve', $itemURI, '-', position(), '-minimum-total-length')" />
								</xsl:attribute>
							</arco-dd:hasMeasurement>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIM/MIMA">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Sleeve', $itemURI, '-', position(), '-maximum-total-length')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Sleeve measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIMA)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Sleeve measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIMA)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura della manica del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIMA)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura della manica del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIMA)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MaximumTotalLength')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIM/MIMA))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIM/MIMA))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIMA" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIMA" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIMA" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/MT/MIM/MIML">
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Sleeve', $itemURI, '-', position(), '-minimum-total-length')" />
							<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Sleeve measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIML)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Sleeve measurement of cultural property ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIML)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Misura della manica del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIML)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Misura della manica del bene ', $itemURI, ': ', record/metadata/schede/VeAC/MT/MIM/MIML)" />
							</l0:name>
							<arco-dd:hasMeasurementType>
								<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'MinimumTotalLength')" />
							</arco-dd:hasMeasurementType>
							<arco-dd:hasValue>
								<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIM/MIML))" />
							</arco-dd:hasValue>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/VeAC/MT/MIM/MIML))" />
							<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
							<mu:value>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIML" />
							</mu:value>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIML" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/MT/MIM/MIML" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/DA/SRM">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Sleeve/', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Sleeve'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Manica del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Manica del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Sleeve of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Sleeve of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRM/SRMT">
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'SleeveType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRM/SRMT))" />
								</xsl:attribute>
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRM/SRMS">
							<arco-core:description xml:lang="it">
								<xsl:value-of select="concat('Struttura: ', normalize-space(record/metadata/schede/VeAC/DA/SRM/SRMS))" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRM/SRMF">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Cuff/', $itemURI, arco-fn:urify(record/metadata/schede/VeAC/DA/SRM/SRMF))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/DA/SRM/SRMT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'SleeveType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRM/SRMT))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/SleeveType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRM/SRMT" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRM/SRMT" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="record/metadata/schede/VeAC/DA/SRM/SRMF">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Cuff/', $itemURI, arco-fn:urify(record/metadata/schede/VeAC/DA/SRM/SRMF))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Cuff'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRM/SRMF" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRM/SRMF" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<!-- Neck  as individual -->
				<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Neck/', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Neck'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Collo del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Collo del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Neck of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Neck of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'NeckType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREC))" />
							</xsl:attribute>
						</arco-core:hasType>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'NeckType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREC))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/NeckType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREC" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREC" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Pocket  as individual -->
				<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SRET or record/metadata/schede/VeAC/DA/SRE/SREP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Pocket/', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Pocket'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Tasca del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Tasca del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Pocket of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Pocket of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SRET">
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'PocketType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SRET))" />
								</xsl:attribute>
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREP">
							<arco-dd:positionOnCulturalProperty>
								<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/SRE/SREP)" />
							</arco-dd:positionOnCulturalProperty>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SRET">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'PocketType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SRET))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/PocketType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SRET" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SRET" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<!-- Fastener  as individual -->
				<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREA or record/metadata/schede/VeAC/DA/SRE/SREZ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Fastener/', $itemURI, '-allacciatura')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Fastener'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Allacciatura del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Allacciatura del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Fastener of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Fastener of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREA">
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'FastenerType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREA))" />
								</xsl:attribute>
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREZ">
							<arco-dd:positionOnCulturalProperty>
								<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/DA/SRE/SREZ)" />
							</arco-dd:positionOnCulturalProperty>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'FastenerType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREA))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/FastenerType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREA" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREA" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREA or record/metadata/schede/VeAC/DA/SRE/SREZ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Fastener/', $itemURI, '-bottone')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/Fastener'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Bottone del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Bottone del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Button of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Button of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREB">
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'FastenerType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREB))" />
								</xsl:attribute>
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREM">
							<arco-core:description xml:lang="it">
								<xsl:value-of select="concat('Forma-materia del bottone: ', normalize-space(record/metadata/schede/VeAC/DA/SRE/SREM))" />
							</arco-core:description>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="record/metadata/schede/VeAC/DA/SRE/SREB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'FastenerType/', arco-fn:urify(record/metadata/schede/VeAC/DA/SRE/SREB))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/clothing-description/FastenerType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREB" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="record/metadata/schede/VeAC/DA/SRE/SREB" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>