<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-mi="https://w3id.org/arco/ontology/musical-instrument/"
	xmlns:arco-clo="https://w3id.org/arco/ontology/clothing-description/"
	xmlns:arco-con="https://w3id.org/arco/ontology/construction-description/"
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
					<xsl:when test="record/metadata/schede/*/CD/CDM">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CD/CDR">
								<xsl:value-of select="concat(arco-fn:urify(record/metadata/schede/*/CD/CDR), arco-fn:urify(record/metadata/schede/*/CD/CDM))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/CD/CDM)" />
							</xsl:otherwise>
						</xsl:choose>
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
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ArchitecturalOrLandscapeHeritage'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:for-each select="record/metadata/schede/*/US/USO">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
							</xsl:attribute>
						</arco-cd:hasUse>
					</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/CA">
						<arco-location:hasNaturalEnvironment>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
							</xsl:attribute>
						</arco-location:hasNaturalEnvironment>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/CA/CAH/CAHR">
						<arco-location:relationToAppurtenantLand>
							<xsl:value-of select="(record/metadata/schede/*/CA/CAH/CAHR)" />
						</arco-location:relationToAppurtenantLand>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/CA/CAH/CAHS">
						<arco-location:functionalAndVisualRelation>
							<xsl:value-of select="(record/metadata/schede/*/CA/CAH/CAHS)" />
						</arco-location:functionalAndVisualRelation>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/CA/CAH/CAHV">
						<xsl:for-each select="record/metadata/schede/*/CA/CAH/CAHV">
							<arco-location:relationToRoadNetwork>
								<xsl:value-of select="concat('Tipo di strada: ', (./CAHV1), ' - Relazione bene-strada: ', (./CAHV2))" />
							</arco-location:relationToRoadNetwork>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/CA/CAH/CAHA">
						<xsl:for-each select="record/metadata/schede/*/CA/CAH/CAHA">
							<arco-location:tenancyHousingType>
								<xsl:value-of select="." />
							</arco-location:tenancyHousingType>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/CA/CAH/CAHA">
						<xsl:for-each select="record/metadata/schede/*/CA/CAH/CAHA">
							<arco-location:tenancyHousingType>
								<xsl:value-of select="." />
							</arco-location:tenancyHousingType>
						</xsl:for-each>
					</xsl:if>
					<!-- DA - ANALISI DELL'ARCHITETTURA -->
					<xsl:for-each select="record/metadata/schede/*/DA">
						<xsl:if test="./ASR">
							<arco-con:hasConstructionSpace>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ConstructionSpace/', arco-fn:arcofy(concat(normalize-space(./ASR/ASRI), $itemURI)))" />
								</xsl:attribute>
							</arco-con:hasConstructionSpace>
						</xsl:if>
						<!-- properties from CP if ConstructionSpace not present (ASR) -->
						<xsl:if test="not(./ASR)">
							<xsl:if test="./AST">
								<arco-con:hasPositionOnGroundLevel>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', arco-fn:urify(normalize-space(./AST)))" />
									</xsl:attribute>
								</arco-con:hasPositionOnGroundLevel>
							</xsl:if>
							<xsl:if test="./ASF">
								<arco-lite:hasPlanLayout>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PlanLayout/', arco-fn:urify(normalize-space(./ASF)))" />
									</xsl:attribute>
								</arco-lite:hasPlanLayout>
							</xsl:if>
							<xsl:if test="./ASB">
								<arco-dd:hasOrientation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Orientation/', arco-fn:urify(normalize-space(./ASB)))" />
									</xsl:attribute>
								</arco-dd:hasOrientation>
							</xsl:if>
							<xsl:for-each select="./ASL">
								<arco-con:numberOfFloors>
									<xsl:value-of select="normalize-space(ASLN)" />
								</arco-con:numberOfFloors>
							</xsl:for-each>
							<arco-dd:hasMeasurementCollection>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-dd:hasMeasurementCollection>
							<xsl:for-each select="./ASV">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'VerticalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASVI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASO">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'HorizontalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASOI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASC">
								<arco-con:hasRoof>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Roof/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASCI))))" />
									</xsl:attribute>
								</arco-con:hasRoof>
							</xsl:for-each>
							<xsl:for-each select="./ASP">
								<arco-con:hasCovering>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Flooring/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASPI))))" />
									</xsl:attribute>
								</arco-con:hasCovering>
							</xsl:for-each>
							<xsl:for-each select="./ASA">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'OpeningElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASAI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASD">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Construction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASDI))))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
							<xsl:for-each select="./ASZ">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'BarrierElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASZI))))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
							<xsl:for-each select="./ASI">
								<arco-dd:hasAffixedElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AffixedElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASII))))" />
									</xsl:attribute>
								</arco-dd:hasAffixedElement>
							</xsl:for-each>
							<xsl:for-each select="./PRE">
								<arco-con:hasPreviousStructureOrElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreviousConstruction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./PREI))))" />
									</xsl:attribute>
								</arco-con:hasPreviousStructureOrElement>
							</xsl:for-each>
							<xsl:if test="./NRL">
								<arco-cd:informationGatheredOnSite>	
									<xsl:value-of select="(./NRL)" />
								</arco-cd:informationGatheredOnSite>
							</xsl:if>
							<xsl:if test="./NSC">
								<arco-cd:historicalInformation>	
									<xsl:value-of select="(./NSC)" />
								</arco-cd:historicalInformation>
							</xsl:if>
							<xsl:if test="./NAI">
								<arco-core:note>	
									<xsl:value-of select="concat('Considerazioni sugli aspetti di interesse: ', (./NAI))" />
								</arco-core:note>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
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
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CA/CAB)))" />
								</xsl:attribute>
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
									<xsl:value-of select="concat($NS, 'PollutionDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
						</xsl:for-each>
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<arco-location:hasEnvironmentalDamage>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'HydrogeologicalDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
							<!-- Landslide risk assessment DSIF -->
							<xsl:if test="./DSIF and not(lower-case(normalize-space(./DSIF))='altro' or lower-case(normalize-space(./DSIF))='n.d.')">
								<arco-location:hasLandslideRiskAssessment>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="lower-case(normalize-space(./DSIF))='molto elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/VeryHighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/HighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='moderato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/ModerateRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='sito di attenzione'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/AttentionZone'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIF))='nessun rischio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/NoRisk'" />
											</xsl:when>
										</xsl:choose>
									</xsl:attribute>
								</arco-location:hasLandslideRiskAssessment>
							</xsl:if>
							<!-- Avalanche risk assessment DSIV -->
							 <xsl:if test="./DSIV and not(lower-case(normalize-space(./DSIV))='altro' or lower-case(normalize-space(./DSIV))='n.d.')">
								<arco-location:hasAvalancheRiskAssessment>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="lower-case(normalize-space(./DSIV))='molto elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/VeryHighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/HighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='moderato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/ModerateRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='sito di attenzione'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/AttentionZone'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIV))='nessun rischio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/NoRisk'" />
											</xsl:when>
										</xsl:choose>
									</xsl:attribute>
								</arco-location:hasAvalancheRiskAssessment>
							</xsl:if>
							<!-- Flood risk assessment DSIA -->
							 <xsl:if test="./DSIA and not(lower-case(normalize-space(./DSIA))='altro' or lower-case(normalize-space(./DSIA))='n.d.')">
								<arco-location:hasFloodRiskAssessment>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="lower-case(normalize-space(./DSIA))='molto elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/VeryHighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='elevato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/HighRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='moderato'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/ModerateRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='medio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/MediumRisk'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='sito di attenzione'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/AttentionZone'" />
											</xsl:when>
											<xsl:when test="lower-case(normalize-space(./DSIA))='nessun rischio'">
												<xsl:value-of select="'https://w3id.org/arco/ontology/location/NoRisk'" />
											</xsl:when>
										</xsl:choose>
									</xsl:attribute>
								</arco-location:hasFloodRiskAssessment>
							</xsl:if>
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
					<xsl:if test="record/metadata/schede/*/CA/CAT">
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
					<!-- Environmental damage (pollution) IQA as individual-->
					<xsl:if test="record/metadata/schede/*/CA/IQA">
						<xsl:for-each select="record/metadata/schede/*/CA/IQA">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'PollutionDamage/', $itemURI, '-', position())" />
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
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PollutionType/', arco-fn:urify(./IQAT))" />
									</xsl:attribute>
								</arco-core:hasType>
								<xsl:if test="./IQAD">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./IQAD" />
									</arco-core:description>
								</xsl:if>
							</rdf:Description>
							<!-- Pollution type IQAT as individual-->
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'PollutionType/', arco-fn:urify(./IQAT))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/PollutionType'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="./IQAT" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="./IQAT" />
								</l0:name>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
					<!-- Environmental damage (hydrogeological) DSI as individual-->
					<xsl:if test="record/metadata/schede/*/CA/DSI">
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'HydrogeologicalDamage/', $itemURI, '-', position())" />
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
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'HydrogeologicalDamageType/', arco-fn:urify(./DSIT))" />
									</xsl:attribute>
								</arco-core:hasType>
								<xsl:if test="./DSID">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./DSID" />
									</arco-core:description>
								</xsl:if>
							</rdf:Description>
							<!-- Hydrogeological damage type DSIT as individual-->
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'HydrogeologicalDamageType/', arco-fn:urify(./DSIT))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/EnvironmentalDamageType'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="./DSIT" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="./DSIT" />
								</l0:name>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DA">
					<!-- Construction Space as individual-->
					<xsl:if test="./ASR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ConstructionSpace/', arco-fn:arcofy(concat(normalize-space(./ASR/ASRI), $itemURI)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionSpace'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="./ASR/ASRF" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="./ASR/ASRF" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASR/ASRI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ConstructionSpaceType/', arco-fn:urify(normalize-space(./ASR/ASRF)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:for-each select="./ASL/ASLN">
								<arco-con:numberOfFloors>
									<xsl:value-of select="." />
								</arco-con:numberOfFloors>
							</xsl:for-each>
							<xsl:if test="./AST">
								<arco-con:hasPositionOnGroundLevel>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', arco-fn:urify(normalize-space(./AST)))" />
									</xsl:attribute>
								</arco-con:hasPositionOnGroundLevel>
							</xsl:if>
							<xsl:if test="./ASF">
								<arco-lite:hasPlanLayout>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PlanLayout/', arco-fn:urify(normalize-space(./ASF)))" />
									</xsl:attribute>
								</arco-lite:hasPlanLayout>
							</xsl:if>
							<xsl:if test="./ASB">
								<arco-dd:hasOrientation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Orientation/', arco-fn:urify(normalize-space(./ASB)))" />
									</xsl:attribute>
								</arco-dd:hasOrientation>
							</xsl:if>
							<arco-dd:hasMeasurementCollection>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-dd:hasMeasurementCollection>
							<xsl:for-each select="./ASV">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'VerticalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASVI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASO">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'HorizontalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASOI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASC">
								<arco-con:hasRoof>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Roof/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASCI))))" />
									</xsl:attribute>
								</arco-con:hasRoof>
							</xsl:for-each>
							<xsl:for-each select="./ASP">
								<arco-con:hasCovering>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Flooring/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASPI))))" />
									</xsl:attribute>
								</arco-con:hasCovering>
							</xsl:for-each>
							<xsl:for-each select="./ASA">
								<arco-con:hasConstructionElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'OpeningElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASAI))))" />
									</xsl:attribute>
								</arco-con:hasConstructionElement>
							</xsl:for-each>
							<xsl:for-each select="./ASD">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Construction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASDI))))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
							<xsl:for-each select="./ASZ">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'BarrierElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASZI))))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
							<xsl:for-each select="./ASI">
								<arco-dd:hasAffixedElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AffixedElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASII))))" />
									</xsl:attribute>
								</arco-dd:hasAffixedElement>
							</xsl:for-each>
							<xsl:for-each select="./PRE">
								<arco-con:hasPreviousStructureOrElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreviousConstruction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./PREI))))" />
									</xsl:attribute>
								</arco-con:hasPreviousStructureOrElement>
							</xsl:for-each>
							<xsl:if test="./NRL">
								<arco-cd:informationGatheredOnSite>	
									<xsl:value-of select="(./NRL)" />
								</arco-cd:informationGatheredOnSite>
							</xsl:if>
							<xsl:if test="./NSC">
								<arco-cd:historicalInformation>	
									<xsl:value-of select="(./NSC)" />
								</arco-cd:historicalInformation>
							</xsl:if>
							<xsl:if test="./NAI">
								<arco-core:note>	
									<xsl:value-of select="concat('Considerazioni sugli aspetti di interesse: ', (./NAI))" />
								</arco-core:note>
							</xsl:if>
							<xsl:for-each select="ASR">
								<xsl:variable name="asrd" select="normalize-space(ASRD)"/>
								<!-- DCM il cui DCMN coincide con ASRD (path assoluto) -->
								<xsl:variable name="dcm"
									select="/record/metadata/schede/*/DO/DCM[normalize-space(DCMN) = $asrd][1]"/>
								<xsl:if test="$asrd != '' and $dcm">
									<!-- stessa posizione che ha il DCM nel for-each su DO/DCM -->
									<xsl:variable name="docu-position"
										select="count(/record/metadata/schede/*/DO/DCM[. &lt;&lt; $dcm]) + 1"/>
									<xsl:variable name="docURI">
										<xsl:choose>
											<xsl:when test="contains($dcm/DCMP, 'documentazione fotografica')">
												<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
											</xsl:when>
											<xsl:when test="contains($dcm/DCMP, 'documentazione grafica')">
												<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
											</xsl:when>
											<xsl:when test="contains($dcm/DCMP, 'documentazione audio')">
												<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
											</xsl:when>
											<xsl:when test="contains($dcm/DCMP, 'documentazione video')">
												<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', $docu-position)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<arco-cd:hasDocumentation rdf:resource="{$docURI}"/>
								</xsl:if>
							</xsl:for-each>
						</rdf:Description>
						<!-- Construction Space Type as individual-->
						 <xsl:for-each select="./ASR/ASRF">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'ConstructionSpaceType/', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionSpaceType'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="." />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="." />
								</l0:name>
								<xsl:if test="../ASRL">
									<skos:altLabel xml:lang="it">
										<xsl:value-of select="../ASRL" />
									</skos:altLabel>
								</xsl:if>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
					<!-- Position on Ground Level as individual-->
					 <xsl:if test="./AST">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', arco-fn:urify(normalize-space(./AST)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/PositionOnGroundLevel'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="./AST" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="./AST" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- Plan Layout as individual-->
					 <xsl:if test="./ASF">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'PlanLayout/', arco-fn:urify(normalize-space(./ASF)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/PlanLayout'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="./ASF" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="./ASF" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- Orientation as individual-->
					 <xsl:if test="./ASB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Orientation/', arco-fn:urify(normalize-space(./ASB)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Orientation'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="./ASB" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="./ASB" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- VerticalElement as individual-->
					<xsl:for-each select="./ASV">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'VerticalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASVI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalElement'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Vertical element of cultural property ', $itemURI, ': ', ./ASVT)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Vertical element of cultural property ', $itemURI, ': ', ./ASVT)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Elemento verticale del bene culturale ', $itemURI, ': ', ./ASVT)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Elemento verticale del bene culturale ', $itemURI, ': ', ./ASVT)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASVI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(./ASVT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASVP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASVP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASVN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASVN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASVQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASVQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:if test="./ASVS">
								<arco-lite:hasWidth>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Measurement/', arco-fn:arcofy(concat($itemURI, ./ASVI, ./ASVS)))" />
									</xsl:attribute>
								</arco-lite:hasWidth>
							</xsl:if>
							<xsl:if test="./ASVF">
								<arco-con:hasStructuralFunction>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'StructuralFunction/', arco-fn:urify(./ASVF))" />
									</xsl:attribute>
								</arco-con:hasStructuralFunction>
							</xsl:if>
							<xsl:for-each select="./ASVM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:for-each>
							<xsl:if test="./ASVC[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasTechnique>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(./ASVC))" />
									</xsl:attribute>
								</arco-lite:hasTechnique>
							</xsl:if>
							<xsl:if test="./ASVD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASVD)" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./ASVU">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Finiture superficiali: ', ./ASVU)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- VerticalElementType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'VerticalElementType/', arco-fn:urify(normalize-space(./ASVT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/VerticalElementType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASVT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASVT" />
							</l0:name>
						</rdf:Description>
						<!-- Vertical element WIDTH  -->
						<xsl:if test="./ASVS">
							<rdf:Description>
								<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', arco-fn:arcofy(concat($itemURI, ./ASVI, ./ASVS)))" />
								<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Measurement of vertical element ', (./ASVI), ': ', (./ASVS), 'm')" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Measurement of vertical element ', (./ASVI), ': ', (./ASVS), 'm')" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Misura dell''elemento verticale ', (./ASVI), ': ', (./ASVS), 'm')" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Misura dell''elemento verticale ', (./ASVI), ': ', (./ASVS), 'm')" />
								</l0:name>
								<arco-core:hasType>
									<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Width')" />
								</arco-core:hasType>
								<arco-dd:hasValue>
									<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(./ASVS))" />
								</arco-dd:hasValue>
								<mu:hasMeasurementUnit>
									<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/m')" />
								</mu:hasMeasurementUnit>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(./ASVS))" />
								<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
								<rdfs:label>
									<xsl:value-of select="./ASVS" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="./ASVS" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<!-- STRUCTURAL FUNCTION as individual -->
						 <xsl:if test="./ASVF">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'StructuralFunction/', arco-fn:urify(./ASVF))" />
								</xsl:attribute>
								<rdf:type>	
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/StructuralFunction'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="./ASVF" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="./ASVF" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<!-- Material as individual -->
						<xsl:for-each select="./ASVM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
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
						<xsl:if test="./ASVC[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASVC)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASVC)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASVC)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Technique'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<!-- HorizontalElement as individual-->
					<xsl:for-each select="./ASO">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'HorizontalElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASOI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElement'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Horizontal element of cultural property ', $itemURI, ': ', ./ASOT)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Horizontal element of cultural property ', $itemURI, ': ', ./ASOT)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Elemento orizzontale del bene culturale ', $itemURI, ': ', ./ASOT)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Elemento orizzontale del bene culturale ', $itemURI, ': ', ./ASOT)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASOI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(./ASOT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASOP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASVP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASON">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASON" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASOQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASOQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:if test="./ASOM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASOM)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:if>
							<xsl:if test="./ASOD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASVD)" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./ASOU">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Finiture superficiali: ', ./ASVU)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- HorizontalElementType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(./ASOT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/HorizontalElementType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASOT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASOT" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:if test="./ASOM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASOM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASOM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASOM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASOM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASOM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASOM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<!-- Roof Element as individual-->
					<xsl:for-each select="./ASC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Roof/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASCI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Roof'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Roof of cultural property ', $itemURI, ': ', ./ASCT)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Roof of cultural property ', $itemURI, ': ', ./ASCT)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Tetto del bene culturale ', $itemURI, ': ', ./ASCT)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Tetto del bene culturale ', $itemURI, ': ', ./ASCT)" />
							</l0:name>
							<arco-con:hasCovering>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Roofing/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASCU))))" />
								</xsl:attribute>
							</arco-con:hasCovering>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASCI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./ASCT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASCP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASCP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASCN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASCN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASCQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASCQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:if test="./ASCM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASCM)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:if>
							<xsl:if test="./ASCD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASVD)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- RoofType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'RoofType/', arco-fn:urify(normalize-space(./ASCT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASCT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASCT" />
							</l0:name>
						</rdf:Description>
						<!-- Roofing as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Roofing/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASCU))))" />
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
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./ASCU)))" />
								</xsl:attribute>
							</arco-core:hasType>
						</rdf:Description>
						<!-- RoofingType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./ASCU)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/RoofingType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASCU" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASCU" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:if test="./ASCM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASCM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASCM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASCM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASCM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASCM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASCM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<!-- Flooring as individual-->
					<xsl:for-each select="./ASP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Flooring/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASPI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Flooring'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Flooring of cultural property ', $itemURI, ': ', ./ASPT)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Flooring of cultural property ', $itemURI, ': ', ./ASPT)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Pavimentazione del bene culturale ', $itemURI, ': ', ./ASPT)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Pavimentazione del bene culturale ', $itemURI, ': ', ./ASPT)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASPI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'FlooringType/', arco-fn:urify(normalize-space(./ASPT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASPP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASPP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASPN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASPN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASPQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASPQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:for-each select="./ASPM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:for-each>
							<xsl:if test="./ASPD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASVD)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- FlooringType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'FlooringType/', arco-fn:urify(normalize-space(./ASPT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/FlooringType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASPT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASPT" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:for-each select="./ASPM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASPM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASPM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASPM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASPM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASPM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASPM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:for-each>
					</xsl:for-each>
					<!-- OpeningElement as individual-->
					<xsl:for-each select="./ASA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'OpeningElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASAI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/OpeningElement'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Opening element of cultural property ', $itemURI, ': ', ./ASAT)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Opening element of cultural property ', $itemURI, ': ', ./ASAT)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Elemento d''apertura del bene culturale ', $itemURI, ': ', ./ASAT)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Elemento d''apertura del bene culturale ', $itemURI, ': ', ./ASAT)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASAI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'ArchitecturalElementType/', arco-fn:urify(normalize-space(./ASAT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASAP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASAP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASAN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASAN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASAQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASAQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:for-each select="./ASAM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:for-each>
							<xsl:if test="./ASAD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASVD)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- OpeningElementType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ArchitecturalElementType/', arco-fn:urify(normalize-space(./ASAT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ArchitecturalElementType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASAT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASAT" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:for-each select="./ASAM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASAM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASAM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASAM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./ASAM)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ASAM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ASAM)" />
								</l0:name>
								<arco-dd:isCharacteristicClassifiedBy>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Material'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:for-each>
					</xsl:for-each>
					<!-- Construction (ASD - 'elementi architettonici') as individual-->
					<xsl:for-each select="./ASD">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Construction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASDI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Construction of cultural property ', $itemURI, ': ', ./ASDT, ' ', ./ASDI)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Construction of cultural property ', $itemURI, ': ', ./ASDT, ' ', ./ASDI)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Costruzione del bene culturale ', $itemURI, ': ', ./ASDT, ' ', ./ASDI)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Costruzione del bene culturale ', $itemURI, ': ', ./ASDT, ' ', ./ASDI)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASDI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'ConstructionType/', arco-fn:urify(normalize-space(./ASDT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASDP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASDP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASDN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASDN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASDQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASDQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:for-each select="./ASDM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:for-each>
							<xsl:if test="./ASDD">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Tecnica costruttiva: ', ./ASDD)" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./ASDU">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="concat('Finiture superficiali: ', ./ASDU)" />
								</arco-core:description>
							</xsl:if>
						</rdf:Description>
						<!-- ConstructionType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ConstructionType/', arco-fn:urify(normalize-space(./ASDT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASDT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASDT" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:for-each select="./ASDM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
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
						
					</xsl:for-each>
					<!-- BarrierElement as individual-->
					<xsl:for-each select="./ASZ">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'BarrierElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASZI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/BarrierElement'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Barrier element of cultural property ', $itemURI, ': ', ./ASZT, ' ', ./ASZI)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Barrier element of cultural property ', $itemURI, ': ', ./ASZT, ' ', ./ASZI)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Elemento di barriera del bene culturale ', $itemURI, ': ', ./ASZT, ' ', ./ASZI)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Elemento di barriera del bene culturale ', $itemURI, ': ', ./ASZT, ' ', ./ASZI)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASZI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'ArchitecturalElementType/', arco-fn:urify(normalize-space(./ASZT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASZP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASZP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASZN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASZN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASZQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASZQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:for-each select="./ASZM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterial>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterial>
							</xsl:for-each>
						</rdf:Description>
						<!-- ArchitecturalElementType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ArchitecturalElementType/', arco-fn:urify(normalize-space(./ASZT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASZT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASZT" />
							</l0:name>
						</rdf:Description>
						<!-- Material as individual -->
						<xsl:for-each select="./ASZM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
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

					</xsl:for-each>
					<!-- AffixedElement as individual-->
					<xsl:for-each select="./ASI">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'AffixedElement/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./ASII))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AffixedElement'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Affixed element of cultural property ', $itemURI, ': ', ./ASIT, ' ', ./ASII)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Affixed element of cultural property ', $itemURI, ': ', ./ASIT, ' ', ./ASII)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Elemento affisso del bene culturale ', $itemURI, ': ', ./ASIT, ' ', ./ASII)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Elemento affisso del bene culturale ', $itemURI, ': ', ./ASIT, ' ', ./ASII)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./ASII" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./ASIT)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./ASIP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./ASIP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./ASIN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./ASIN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./ASIQ">
								<arco-arco:numberOfElements>
									<xsl:value-of select="./ASIQ" />
								</arco-arco:numberOfElements>
							</xsl:if>
							<xsl:if test="./ASIE">
								<arco-dd:transcript>
									<xsl:value-of select="./ASIE" />
								</arco-dd:transcript>
							</xsl:if>
							<xsl:for-each select="./ASIM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
								<arco-lite:hasMaterialOrTechnique>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasMaterialOrTechnique>
							</xsl:for-each>
						</rdf:Description>
						<!-- AffixedElementType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./ASIT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AffixedElementType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./ASIT" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./ASIT" />
							</l0:name>
						</rdf:Description>
						<!-- MaterialOrTechnique as individual -->
						<xsl:for-each select="./ASIM[not(starts-with(lower-case(normalize-space(.)), 'dato non disponibile'))]">
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
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MaterialOrTechnique'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
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
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MaterialOrTechnique'" />
									</xsl:attribute>
								</arco-dd:isCharacteristicClassifiedBy>
							</rdf:Description>
						</xsl:for-each>

					</xsl:for-each>
					<!-- PreviousConstruction as individual-->
					<xsl:for-each select="./PRE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'PreviousConstruction/', arco-fn:arcofy(concat($itemURI, '-', normalize-space(./PREI))))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="en">
								<xsl:value-of select="concat('Previous construction of cultural property ', $itemURI, ': ', ./PRED, ' ', ./PREE)" />
							</rdfs:label>
							<l0:name  xml:lang="en">
								<xsl:value-of select="concat('Previous construction of cultural property ', $itemURI, ': ', ./PRED, ' ', ./PREE)" />
							</l0:name>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="concat('Preesistenza del bene culturale ', $itemURI, ': ', ./PRED, ' ', ./PREE)" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="concat('Preesistenza del bene culturale ', $itemURI, ': ', ./PRED, ' ', ./PREE)" />
							</l0:name>
							<arco-lite:localIdentifier>
								<xsl:value-of select="./PREI" />
							</arco-lite:localIdentifier>
							<arco-core:hasType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'ConstructionType/', arco-fn:urify(normalize-space(./PRED)))" />
								</xsl:attribute>
							</arco-core:hasType>
							<xsl:if test="./PREP">
								<arco-dd:positionOnCulturalProperty xml:lang="it">
									<xsl:value-of select="./PREP" />
								</arco-dd:positionOnCulturalProperty>
							</xsl:if>
							<xsl:if test="./PREE">
								<arco-lite:currentDesignation xml:lang="it">
									<xsl:value-of select="./PREE" />
								</arco-lite:currentDesignation>
							</xsl:if>
							<xsl:if test="./PRES">
								<arco-core:description xml:lang="it">
									<xsl:value-of select="./PRES" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./PREN">
								<arco-core:note xml:lang="it">
									<xsl:value-of select="./PREN" />
								</arco-core:note>
							</xsl:if>
							<xsl:if test="./PREC">
								<tiapit:hasTemporalEntity>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TemporalEntity/', arco-fn:urify(normalize-space(./PREC)))" />
									</xsl:attribute>
								</tiapit:hasTemporalEntity>
							</xsl:if>
							<xsl:variable name="prer" select="normalize-space(PRER)"/>
							<!-- DCM il cui DCMN coincide con PRER (path assoluto) -->
							<xsl:variable name="dcm"
								select="/record/metadata/schede/*/DO/DCM[normalize-space(DCMN) = $prer][1]"/>
							<xsl:if test="$prer != '' and $dcm">
								<!-- stessa posizione che ha il DCM nel for-each su DO/DCM -->
								<xsl:variable name="docu-position"
									select="count(/record/metadata/schede/*/DO/DCM[. &lt;&lt; $dcm]) + 1"/>
								<xsl:variable name="docURI">
									<xsl:choose>
										<xsl:when test="contains($dcm/DCMP, 'documentazione fotografica')">
											<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
										</xsl:when>
										<xsl:when test="contains($dcm/DCMP, 'documentazione grafica')">
											<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
										</xsl:when>
										<xsl:when test="contains($dcm/DCMP, 'documentazione audio')">
											<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
										</xsl:when>
										<xsl:when test="contains($dcm/DCMP, 'documentazione video')">
											<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-documentation-', $docu-position)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', $docu-position)"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<arco-cd:hasDocumentation rdf:resource="{$docURI}"/>
							</xsl:if>
						</rdf:Description>
						<!-- ConstructionType as individual-->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ConstructionType/', arco-fn:urify(normalize-space(./PRED)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/ConstructionType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label  xml:lang="it">
								<xsl:value-of select="./PRED" />
							</rdfs:label>
							<l0:name  xml:lang="it">
								<xsl:value-of select="./PRED" />
							</l0:name>
						</rdf:Description>
						<!-- TemporalEntity as individual -->
						<xsl:if test="./PREC">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'TemporalEntity/', arco-fn:urify(normalize-space(./PREC)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/italia/onto/TI/TemporalEntity'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./PREC)" />
								</rdfs:label>
								<tiapit:time>
									<xsl:value-of select="normalize-space(./PREC)" />
								</tiapit:time>
							</rdf:Description>
						</xsl:if>

					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>