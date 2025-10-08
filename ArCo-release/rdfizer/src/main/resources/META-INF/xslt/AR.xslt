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
	xmlns:ar-SourceOrDocument="https://w3id.org/arco/resource/SourceOrDocument/"
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
			</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>