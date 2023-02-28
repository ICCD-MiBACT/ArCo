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
	xmlns:arco-mp="https://w3id.org/arco/ontology/movable-property/"
	xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
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
	<xsl:template name="address-area">
		<xsl:param name="ctx" />
		<xsl:for-each select="record/metadata/schede/*/LR/LRV">
			<xsl:element name="rdf:Description">
				<xsl:choose>
					<xsl:when test="LRVS[not(lower-case(normalize-space())='italia')]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(LRVK), normalize-space(LRVS), normalize-space(LRVP), normalize-space(LRVR), normalize-space(LRVC), normalize-space(LRVL), normalize-space(LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(LRVP), normalize-space(LRVC), normalize-space(LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space($ctx)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:element>
		</xsl:for-each>
		<xsl:element name="rdf:Description">
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space($ctx)))" />
	            </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="normalize-space($ctx)" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="normalize-space($ctx)" />
				</xsl:call-template>
			</l0:name>
		</xsl:element>
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
			<xsl:when test="$sheetType='SCAN'">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni architettonici e paesaggistici'">
								<xsl:value-of select="concat($NS, 'ArchitecturalOrLandscapeHeritage/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni storici e artistici'">
								<xsl:value-of select="concat($NS, 'HistoricOrArtisticProperty/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni archeologici'">
								<xsl:value-of select="concat($NS, 'ArchaeologicalProperty/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni demoetnoantopologici'">
								<xsl:value-of select="concat($NS, 'DemoEthnoAnthropologicalHeritage/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni fotografici'">
								<xsl:value-of select="concat($NS, 'PhotographicHeritage/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni musicali'">
								<xsl:value-of select="concat($NS, 'MusicHeritage/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni naturalistici'">
								<xsl:value-of select="concat($NS, 'NaturalHeritage/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni numismatici'">
								<xsl:value-of select="concat($NS, 'NumismaticProperty/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni scientifici e tecnologici'">
								<xsl:value-of select="concat($NS, 'ScientificOrTechnologicalHeritage/', $itemURI)" />
							</xsl:when>
						</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="culturalPropertyComponent" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />
	<xsl:variable name="culturalPropertyResidual" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-residual')" />
	<xsl:variable name="objectOfDescription">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:value-of select="$culturalPropertyComponent" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:value-of select="$culturalPropertyResidual" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$culturalProperty" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- Cultural Property -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$objectOfDescription" />
		</xsl:attribute>
		<!-- cultural property address -->
		<xsl:if test="record/metadata/schede/*/LC/PVC/*">
			<arco-location:hasCulturalPropertyAddress>
				<xsl:attribute name="rdf:resource">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/LC/PVC/PVCI">
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVLT)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				</arco-location:hasCulturalPropertyAddress>
		</xsl:if>
		<xsl:if test="record/metadata/schede/MODI/LC/*">
			<arco-location:hasCulturalPropertyAddress>
				<xsl:attribute name="rdf:resource">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/LC/LCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/LCS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCS)), normalize-space(lower-case(record/metadata/schede/*/LC/LCE)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI))))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/LC/LCI">
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCL)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVLT)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</arco-location:hasCulturalPropertyAddress>
		</xsl:if>

		<!-- collection membership -->
		<xsl:for-each select="record/metadata/schede/*/UB/COL">
			<xsl:if test="./*">
				<arco-cd:isMemberOfCollectionOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
					</xsl:attribute>
				</arco-cd:isMemberOfCollectionOf>
			</xsl:if>
		</xsl:for-each>
	</rdf:Description>
	<!-- Acquisition -->
	<xsl:for-each select="record/metadata/schede/*/TU/ACQ">
		<xsl:if test="./ACQT and (not(starts-with(lower-case(normalize-space(./ACQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'n.r.')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'dato non')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'non ')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'ignota')) and not(starts-with(lower-case(normalize-space(./ACQT)), '-')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
            	</xsl:attribute>
				<xsl:for-each select="./ACQN">
					<arco-cd:hasPreviousOwner>
						<xsl:attribute name="rdf:resource">
	    					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasPreviousOwner>
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-', position(), '-previous-owner')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:for-each>
				<arco-cd:hasAcquisitionType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./ACQT)))" />
            		</xsl:attribute>
				</arco-cd:hasAcquisitionType>
			</rdf:Description>
			<!-- transferor of acquisition as an individual -->
			<xsl:for-each select="./ACQN">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-', position(), '-previous-owner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Precedente proprietario ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Previous owner ', position(), 'of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/PreviousOwner')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Proprietario precedente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Previous owner'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
	<!-- Affixed element -->
	<!-- affixed element (DA/STM) -->
	<xsl:if test="record/metadata/schede/*/DA/STM/*">
		<xsl:for-each select="record/metadata/schede/*/DA/STM">
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="lower-case(normalize-space(./STMC))='timbro'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./STMC))='stemma'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./STMC))='emblema'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./STMC))='marchio'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./STMC))='logo'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./STMC))='timbro'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Stamp'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='stemma'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CoatOfArms'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='emblema'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Emblem'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='marchio'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Brand'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='logo'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Logo'" />
							</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./STMC))='timbro'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': stamp')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='stemma'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': coat of arms')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='emblema'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': emblem')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='marchio'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': brand')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='logo'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': logo')" />
						</xsl:when>
					</xsl:choose>
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./STMC))='timbro'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': timbro')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='stemma'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': stemma')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='emblema'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': emblema')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='marchio'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': marchio')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./STMC))='logo'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': logo')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': ', normalize-space(./STMC))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<xsl:if test="./STMD and (not(starts-with(lower-case(normalize-space(./STMD)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMD)), 'n.r')))">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./STMD)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./STMU and (not(starts-with(lower-case(normalize-space(./STMU)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMU)), 'n.r')))">
					<arco-dd:occurrences>
						<xsl:value-of select="normalize-space(./STMU)" />
					</arco-dd:occurrences>
				</xsl:if>
				<xsl:if test="./STMP and (not(starts-with(lower-case(normalize-space(./STMP)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMP)), 'n.r')))">
					<arco-dd:positionOnCulturalProperty>
						<xsl:value-of select="normalize-space(./STMP)" />
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
				<xsl:if test="./STMQ and (not(starts-with(lower-case(normalize-space(./STMQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMQ)), 'n.r')))">
					<arco-dd:hasAffixedElementType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./STMQ)))" />
						</xsl:attribute>
					</arco-dd:hasAffixedElementType>
				</xsl:if>
				<xsl:if test="./STMI and (not(starts-with(lower-case(normalize-space(./STMI)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMI)), 'n.r')))">
					<arco-dd:refersToAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./STMI))" />
						</xsl:attribute>
					</arco-dd:refersToAgent>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./STMQ and (not(starts-with(lower-case(normalize-space(./STMQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMQ)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./STMQ)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/AffixedElementType" />
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./STMQ)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./STMQ)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<!-- affixed element (*/LSI) -->
	<xsl:if test="record/metadata/schede/*/*/LSI/*">
		<xsl:for-each select="record/metadata/schede/*/*/LSI">
			<xsl:variable name="parentPosition">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="lower-case(normalize-space(./LSIG))='timbro'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./LSIG))='stemma'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./LSIG))='emblema'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./LSIG))='marchio'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./LSIG))='logo'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./LSIG))='lapide'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'HistoricalPlaque/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<rdf:type>
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./LSIG))='timbro'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Stamp'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='stemma'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CoatOfArms'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='emblema'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Emblem'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='marchio'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Brand'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='logo'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Logo'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='lapide'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/HistoricalPlaque'" />
							</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</rdf:type>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./LSIG))='timbro'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': stamp')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='stemma'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': coat of arms')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='emblema'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': emblem')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='marchio'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': brand')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='logo'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': logo')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='lapide'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': historical plaque')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': ', normalize-space(./LSIG))" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./LSIG))='timbro'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': timbro')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='stemma'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': stemma')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='emblema'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': emblema')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='marchio'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': marchio')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='logo'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': logo')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./LSIG))='lapide'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': lapide')" />
						</xsl:when>
					</xsl:choose>
				</rdfs:label>
				<xsl:if test="./LSIT and (not(starts-with(lower-case(normalize-space(./LSIT)), 'nr')) and not(starts-with(lower-case(normalize-space(./LSIT)), 'n.r')))">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./LSIT)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./LSIU and (not(starts-with(lower-case(normalize-space(./LSIU)), 'nr')) and not(starts-with(lower-case(normalize-space(./LSIU)), 'n.r')))">
					<arco-dd:positionOnCulturalProperty>
						<xsl:value-of select="normalize-space(./LSIU)" />
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
				<xsl:if test="./LSII and (not(starts-with(lower-case(normalize-space(./LSII)), 'nr')) and not(starts-with(lower-case(normalize-space(./LSII)), 'n.r')))">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(./LSII)" />
					</arco-dd:transcript>
				</xsl:if>
				<xsl:if test="./LSIM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] or ./LSIC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
			              		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-affixed-element-', $parentPosition)" />
		 	              	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
				<xsl:for-each select="./LSIC">
					<arco-dd:hasTechnique>
						<xsl:attribute name="rdf:resource">
	              				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	              		</xsl:attribute>
					</arco-dd:hasTechnique>
				</xsl:for-each>
				<xsl:for-each select="./LSIM">
					<arco-dd:hasMaterial>
						<xsl:attribute name="rdf:resource">
	              				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
	              		</xsl:attribute>
					</arco-dd:hasMaterial>
				</xsl:for-each>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<!-- affixed element (DA/ISE) -->
	<xsl:if test="record/metadata/schede/*/DA/ISE/*">
		<xsl:for-each select="record/metadata/schede/*/DA/ISE">
			<xsl:variable name="parentPosition">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Inscription/', $itemURI, '-affixed-element-', position())" />
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Stamp'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CoatOfArms'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Emblem'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Brand'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Logo'" />
							</xsl:attribute>
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Inscription'" />
							</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': stamp')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': coat of arms')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': emblem')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': brand')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': logo')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
							<xsl:value-of select="concat('Element ', position(), ' affixed to cultural property ', $itemURI, ': inscription')" />
						</xsl:when>	
					</xsl:choose>
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': timbro')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': stemma')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': emblema')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': marchio')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': logo')" />
						</xsl:when>
						<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
							<xsl:value-of select="concat('Elemento ', position(), ' apposto sul bene ', $itemURI, ': iscrizione')" />
						</xsl:when>
					</xsl:choose>
				</rdfs:label>
				<xsl:if test="./ISEN and (not(starts-with(lower-case(normalize-space(./ISEN)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEN)), 'n.r')))">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./ISEN)" />
					</arco-core:description>
				</xsl:if> 
				<xsl:if test="./ISEZ and (not(starts-with(lower-case(normalize-space(./ISEZ)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEZ)), 'n.r')))">
					<arco-core:description>
						<xsl:value-of select="normalize-space(./ISEZ)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="./ISEQ and (not(starts-with(lower-case(normalize-space(./ISEQ)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEQ)), 'n.r')))">
					<arco-dd:occurrences>
						<xsl:value-of select="normalize-space(./ISEQ)" />
					</arco-dd:occurrences>
				</xsl:if>
				<xsl:if test="./ISEI and (not(starts-with(lower-case(normalize-space(./ISEI)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEI)), 'n.r')))">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(./ISEI)" />
					</arco-dd:transcript>
				</xsl:if>
				<xsl:if test="./ISEB and (not(starts-with(lower-case(normalize-space(./ISEB)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEB)), 'n.r')))">
					<arco-dd:italianTranslation>
						<xsl:value-of select="normalize-space(./ISEB)" />
					</arco-dd:italianTranslation>
				</xsl:if>
				<xsl:if test="./ISEP and (not(starts-with(lower-case(normalize-space(./ISEP)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEP)), 'n.r')))">
					<arco-dd:positionOnCulturalProperty>
						<xsl:value-of select="normalize-space(./ISEP)" />
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
				<xsl:if test="./ISEE and (not(starts-with(lower-case(normalize-space(./ISEE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEE)), 'n.r')))">
					<arco-dd:hasAffixedElementType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./ISEE)))" />
						</xsl:attribute>
					</arco-dd:hasAffixedElementType>
				</xsl:if>
				<xsl:if test="./ISEO and (not(starts-with(lower-case(normalize-space(./ISEO)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEO)), 'n.r')))">
					<arco-dd:refersToAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ISEO))" />
						</xsl:attribute>
					</arco-dd:refersToAgent>
				</xsl:if>
				<xsl:for-each select="./ISEL[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<language:hasLanguage>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</language:hasLanguage>
				</xsl:for-each>
				<xsl:if test="./ISEA and (not(starts-with(lower-case(normalize-space(./ISEA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEA)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ISEA))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
				<xsl:for-each select="./ISEF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
				<arco-dd:hasWritingSystem>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'WritingSystem/', arco-fn:urify(normalize-space()))" />
						</xsl:attribute>
					</arco-dd:hasWritingSystem>
				</xsl:for-each>
				<xsl:for-each select="./ISET[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-dd:hasFontStyle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:hasFontStyle>
				</xsl:for-each>
				<xsl:if test="./ISES and (not(starts-with(lower-case(normalize-space(./ISES)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISES)), 'n.r')))">
					<arco-dd:hasSupport>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Support/', arco-fn:urify(normalize-space(./ISES)))" />
						</xsl:attribute>
					</arco-dd:hasSupport>
				</xsl:if>
				<xsl:if test="./ISEM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- xslt2 normalize-space more than one item es: ICCD12375601 -->
					<xsl:if test="./ISEM">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
		               			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-affixed-element-', $parentPosition)" />
		                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<xsl:for-each select="./ISEM">
							<arco-dd:hasMaterialOrTechnique>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-dd:hasMaterialOrTechnique>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="./ISEC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-dd:hasFunctionalPurpose>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FunctionalPurpose/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-dd:hasFunctionalPurpose>
				</xsl:for-each>
			</rdf:Description>
			<!-- affixed element type as an individual -->
			<xsl:if test="./ISEE and (not(starts-with(lower-case(normalize-space(./ISEE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISEE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AffixedElementType/', arco-fn:urify(normalize-space(./ISEE)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/AffixedElementType" />
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ISEE)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ISEE)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- functional purpose as an individual -->
			<xsl:for-each select="./ISEC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'FunctionalPurpose/', arco-fn:urify(normalize-space()))" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/FunctionalPurpose" />
					<rdfs:label>
						<xsl:value-of select="normalize-space()" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space()" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:if>
	<!-- affixed element (DA/ISR) -->
	<xsl:if test="record/metadata/schede/*/DA/ISR/*">
		<xsl:for-each select="record/metadata/schede/*/DA/ISR">
			<xsl:variable name="parentPosition">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Inscription/', $itemURI, '-inscription-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-inscription-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Inscription'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Inscription ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Iscrizione ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<xsl:if test="./ISRI and (not(starts-with(lower-case(normalize-space(./ISRI)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISRI)), 'n.r')))">
					<arco-dd:transcript>
						<xsl:value-of select="normalize-space(./ISRI)" />
					</arco-dd:transcript>
				</xsl:if>
				<xsl:if test="./ISRL and (not(starts-with(lower-case(normalize-space(./ISRL)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISRL)), 'n.r')))">
					<xsl:for-each select="./ISRL">
						<language:hasLanguage>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</language:hasLanguage>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="./ISRA and (not(starts-with(lower-case(normalize-space(./ISRA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISRA)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ISRA))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
				<xsl:if test="./ISRT and (not(starts-with(lower-case(normalize-space(./ISRT)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISRT)), 'n.r')))">
					<xsl:for-each select="./ISRT">
						<arco-dd:hasFontStyle>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-dd:hasFontStyle>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="./ISRM">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
			 	   			<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-inscription-measurement-collection-', position())" />
						</xsl:attribute>
	            	</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="./ISRP">
					<arco-dd:positionOnCulturalProperty>
		 	   			<xsl:value-of select="./ISRP" />
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
				<xsl:if test="./ISRS and (not(starts-with(lower-case(normalize-space(./ISRS)), 'nr')) and not(starts-with(lower-case(normalize-space(ISRS)), 'n.r')))">
					<xsl:if test="./ISRS">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-inscription-', $parentPosition)" />
							</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<xsl:for-each select="./ISRS">
							<arco-dd:hasTechnique>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-dd:hasTechnique>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<!-- numismatic property counterstamp -->
	<xsl:for-each select="record/metadata/schede/NU/DA/CON">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Counterstamp/', $itemURI, '-counterstamp-', position())" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-counterstamp-', position())" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Counterstamp" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Counterstamp of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Counterstamp of cultural property ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contromarca del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contromarca del bene culturale ', $itemURI)" />
			</l0:name>
			<xsl:if test="./CONA or ./CONC">
				<xsl:if test="(not(starts-with(lower-case(normalize-space(./CONA)), 'nr')) and not(starts-with(lower-case(normalize-space(./CONA)), 'n.r')))">
					<arco-cd:hasCoinIssuance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CoinIssuance/', $itemURI, '-counterstamp-', position())" />
						</xsl:attribute>
					</arco-cd:hasCoinIssuance>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./COND">
				<arco-core:description>
					<xsl:value-of select="concat('Dritto: ', ./COND)" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="./CONR">
				<arco-core:description>
					<xsl:value-of select="concat('Rovescio: ', ./CONR)" />
				</arco-core:description>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
	<!-- affixed element (dedication) -->
	<xsl:if test="record/metadata/schede/*/AU/DDC/*">
		<xsl:for-each select="record/metadata/schede/*/AU/DDC">
			<xsl:variable name="parentPosition">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Dedication/', $itemURI, '-dedication-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-dedication-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Dedication'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Dedication ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Dedica ', position(), ' sul bene culturale ', $itemURI)" />
				</rdfs:label>
				<xsl:for-each select="./DDCN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
					<dc:creator>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</dc:creator>
					<pico:author>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</pico:author>
				</xsl:for-each>
				<xsl:for-each select="./DDCM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-dd:hasDedicatee>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-dd:hasDedicatee>
				</xsl:for-each>
				<xsl:if test="./DDCF and (not(starts-with(lower-case(normalize-space(./DDCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./DDCF)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DDCF)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
				<xsl:if test="./DDCC and (not(starts-with(lower-case(normalize-space(./DDCC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DDCC)), 'n.r')))">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./DDCC)))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="./DDCD and (not(starts-with(lower-case(normalize-space(./DDCD)), 'nr')) and not(starts-with(lower-case(normalize-space(./DDCD)), 'n.r')))">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DDCD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
			</rdf:Description>
			<!-- source as an individual -->
			<xsl:if test="./DDCF and (not(starts-with(lower-case(normalize-space(./DDCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./DDCF)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DDCF)))" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/InterpretationCriterion" />
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DDCF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DDCF)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<!-- coin design -->
	<xsl:if test="record/metadata/schede/NU/DA/DES/DESM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CoinDesign/', $itemURI, '-reverse-design')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/CoinDesign" />
		</rdf:Description>
	</xsl:if>
	<!-- coin legend -->
	<xsl:if test="record/metadata/schede/NU/DA/DES/DESG or record/metadata/schede/NU/DA/DES/DESR or record/metadata/schede/NU/DA/DES/DEST">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CoinLegend/', $itemURI, '-reverse-legend')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/CoinLegend" />
		</rdf:Description>
	</xsl:if>
		
	<!-- hasAuthor -->	
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >
		<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$objectOfDescription" />
				</xsl:attribute>
				<!-- AU/AUT -->
				<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
					<xsl:for-each select="record/metadata/schede/*/AU/AUT">
						<xsl:if test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTN)), '-')))">
							<xsl:choose>
								<xsl:when test="./* and (not(./AUTW) or ./AUTW='intero bene' or ./AUTW='integrale' or ./AUTW='tutta' or ./AUTW='totale') or (starts-with(lower-case(normalize-space(./AUTW)), 'nr')) or (starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intero')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intera')) or (starts-with(lower-case(normalize-space(./AUTW)), 'esemplar'))">
									<arco-cd:hasAuthor>
										<xsl:attribute name="rdf:resource">
				                    		<xsl:variable name="author">
					                            <xsl:choose>
					                                <xsl:when test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
					                                </xsl:when>
					                                <xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
					                                </xsl:when>
					                                <xsl:when test="./AUTB and (not(starts-with(lower-case(normalize-space(./AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTB)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTB)))" />
					                                </xsl:when>
					                                <xsl:otherwise>
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
					                                </xsl:otherwise>
					                            </xsl:choose>
				                            </xsl:variable>
				                            <xsl:value-of select="$author" />
				                    	</xsl:attribute>
									</arco-cd:hasAuthor>
									<arco-cd:hasPreferredAuthor>
										<xsl:attribute name="rdf:resource">
				                    		<xsl:variable name="author">
					                            <xsl:choose>
					                                <xsl:when test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
					                                </xsl:when>
					                                <xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
					                                </xsl:when>
					                                <xsl:when test="./AUTB and (not(starts-with(lower-case(normalize-space(./AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTB)), 'n.r')))">
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTB)))" />
					                                </xsl:when>
					                                <xsl:otherwise>
					                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
					                                </xsl:otherwise>
					                            </xsl:choose>
				                            </xsl:variable>
				                            <xsl:value-of select="$author" />
				                    	</xsl:attribute>
									</arco-cd:hasPreferredAuthor>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="./AUTW">
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
				</xsl:if>
				<!--  AU/AAU -->
				<xsl:for-each select="record/metadata/schede/*/AU/AAU">
					<xsl:if test="./AAUN and (not(starts-with(lower-case(normalize-space(./AAUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AAUN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AAUN)), '-')))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-cd:hasAuthor>
						<arco-cd:hasPreferredAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-cd:hasPreferredAuthor>
					</xsl:if>
				</xsl:for-each>
				<!--  AU/AUF (F version 2.00, 3.00 and BDM) -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUF">
					<xsl:if test="./* and ./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
		                    	<xsl:variable name="author">
									<xsl:choose>
										<xsl:when test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
										</xsl:when>
										<xsl:when test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
										</xsl:when>
										<xsl:when test="./AUFB">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="./AUFS">
										<xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AUFS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$author" />
									</xsl:otherwise>
								</xsl:choose>
		                    </xsl:attribute>
						</arco-cd:hasAuthor>
						<arco-cd:hasPreferredAuthor>
							<xsl:attribute name="rdf:resource">
		                    	<xsl:variable name="author">
									<xsl:choose>
										<xsl:when test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
										</xsl:when>
										<xsl:when test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
										</xsl:when>
										<xsl:when test="./AUFB">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="./AUFS">
										<xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AUFS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$author" />
									</xsl:otherwise>
								</xsl:choose>
		                    </xsl:attribute>
						</arco-cd:hasPreferredAuthor>
					</xsl:if>
				</xsl:for-each>
				<!-- AU/AUI -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUI">
					<xsl:if test="./AUIN and (not(starts-with(lower-case(normalize-space(./AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIN)), '-')))">
						<xsl:choose>
							<xsl:when test="./* and (not(./AUIY) or ./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale') or (starts-with(lower-case(normalize-space(./AUIY)), 'nr')) or (starts-with(lower-case(normalize-space(./AUIY)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intero')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intera')) or (starts-with(lower-case(normalize-space(./AUIY)), 'esemplar'))">
								<arco-cd:hasAuthor>
									<xsl:attribute name="rdf:resource">
				                   		<xsl:variable name="author">
											<xsl:choose>
												<xsl:when test="./AUIA and (not(starts-with(lower-case(normalize-space(./AUIA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIA)), 'n.r')))">
													<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUIN, '-', ./AUIA)))" />
												</xsl:when>
												<xsl:when test="./AUIB and (not(starts-with(lower-case(normalize-space(./AUIB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIB)), 'n.r')))">
													<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIB))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIN))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<xsl:value-of select="$author" />
				                    </xsl:attribute>
								</arco-cd:hasAuthor>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./AUIY">
									<arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
					               			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
					               		</xsl:attribute>
									</arco-core:hasPart>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="./AUIB and (not(starts-with(lower-case(normalize-space(./AUIB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIB)), '-')))">
						<xsl:choose>
							<xsl:when test="./* and (not(./AUIY) or ./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale') or (starts-with(lower-case(normalize-space(./AUIY)), 'nr')) or (starts-with(lower-case(normalize-space(./AUIY)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intero')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intera')) or (starts-with(lower-case(normalize-space(./AUIY)), 'esemplar'))">
								<arco-cd:hasAuthor>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIB))" />
				                    </xsl:attribute>
								</arco-cd:hasAuthor>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./AUIY">
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
			</rdf:Description>
	</xsl:if>
		<!-- part of cultural property when there is AUTW (author) -->
		<xsl:for-each select="record/metadata/schede/*/AU/AUT">
			<xsl:if test="./AUTW and not(lower-case(normalize-space(./AUTW))='intero bene') and not(lower-case(normalize-space(./AUTW))='integrale') and not(lower-case(normalize-space(./AUTW))='tutta') and not(lower-case(normalize-space(./AUTW))='totale') and (not(starts-with(lower-case(normalize-space(./AUTW)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intero')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intera')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'esemplar')))">
				<xsl:variable name="part">
					<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AUTW)))" />
				</xsl:variable>
				<xsl:variable name="author">
					<xsl:choose>
						<xsl:when test="./AUTA">
							<xsl:value-of select="concat(./AUTN, '-', ./AUTA)" />
						</xsl:when>
						<xsl:when test="../AUF/AUFA and ../AUF/AUFN">
							<xsl:value-of select="concat(../AUF/AUFN, '-', ../AUF/AUFA)" />
						</xsl:when>
						<xsl:when test="../AUF/AUFA and ../AUF/AUFB">
							<xsl:value-of select="concat(../AUF/AUFB, '-', ../AUF/AUFA)" />
						</xsl:when>
						<xsl:when test="../AUF/AUFB">
							<xsl:value-of select="../AUF/AUFB" />
						</xsl:when>
						<xsl:when test="../AUF/AUFN">
							<xsl:value-of select="../AUF/AUFN" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="./AUTN" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$part" />
					</xsl:attribute>
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
                           <xsl:choose>
                                <xsl:when test="./AUTS">
                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat($author, '-', ./AUTS)))" />
                                </xsl:when>
                                <xsl:when test="../AUF/AUFS">
                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat($author, '-', ../AUF/AUFS)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy($author))" />
                                </xsl:otherwise>
                            </xsl:choose>
                    	</xsl:attribute>
					</arco-cd:hasAuthor>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- part of cultural property when there is AUIY (author) -->
		<xsl:for-each select="record/metadata/schede/*/AU/AUI">
			<xsl:if test="./AUIY and not(lower-case(normalize-space(./AUIY))='intero bene') and not(lower-case(normalize-space(./AUIY))='integrale') and not(lower-case(normalize-space(./AUIY))='tutta') and not(lower-case(normalize-space(./AUIY))='totale') and (not(starts-with(lower-case(normalize-space(./AUIY)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIY)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIY)), 'intero')) and not(starts-with(lower-case(normalize-space(./AUIY)), 'intera')) and not(starts-with(lower-case(normalize-space(./AUIY)), 'esemplar')))">
				<xsl:if test="./AUIN and (not(starts-with(lower-case(normalize-space(./AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIN)), '-')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:variable name="author">
								<xsl:choose>
									<xsl:when test="./AUIA and (not(starts-with(lower-case(normalize-space(./AUIA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIA)), 'n.r')))">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUIN, '-', ./AUIA)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIN))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="$author" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
				<xsl:if test="./AUIB and (not(starts-with(lower-case(normalize-space(./AUIB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIB)), '-')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIB))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	<!-- related work author -->
	<xsl:if test="record/metadata/schede/*/RO/ROF">
		<xsl:for-each select="record/metadata/schede/*/RO/ROF">
			<xsl:choose>
			<!-- preparatory work as an individual -->
			<xsl:when test="lower-case(normalize-space(./ROFF))='calco' or lower-case(normalize-space(./ROFF))='calco parziale' or lower-case(normalize-space(./ROFF))='copia' or lower-case(normalize-space(./ROFF))='copia con varianti' or lower-case(normalize-space(./ROFF))='copia parziale' or lower-case(normalize-space(./ROFF))='derivazione' or lower-case(normalize-space(./ROFF))='derivazione con varianti' or lower-case(normalize-space(./ROFF))='derivazione parziale' or lower-case(normalize-space(./ROFF))='imitazione' or lower-case(normalize-space(./ROFF))='remake' or lower-case(normalize-space(./ROFF))='replica' or lower-case(normalize-space(./ROFF))='replica parziale' or lower-case(normalize-space(./ROFF))='replica con varianti' or lower-case(normalize-space(./ROFF))='positivo' or lower-case(normalize-space(./ROFF))='particolare' or lower-case(normalize-space(./ROFF))='fotomontaggio'">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PreparatoryWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
					</xsl:attribute>
					<xsl:if test="./ROFA and (not(starts-with(lower-case(normalize-space(./ROFA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFA)), 'n.r')))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ROFA))" />
							</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
				</rdf:Description>
			</xsl:when>
			<!-- final work as an individual -->
			<xsl:when test="lower-case(normalize-space(./ROFF))='bozzetto' or lower-case(normalize-space(./ROFF))='bozzetto parziale' or lower-case(normalize-space(./ROFF))='cartone' or lower-case(normalize-space(./ROFF))='cartone parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio' or lower-case(normalize-space(./ROFF))='matrice' or lower-case(normalize-space(./ROFF))='matrice parziale' or lower-case(normalize-space(./ROFF))='modellino' or lower-case(normalize-space(./ROFF))='modellino parziale' or lower-case(normalize-space(./ROFF))='modello' or lower-case(normalize-space(./ROFF))='modello parziale' or lower-case(normalize-space(./ROFF))='modello in cera' or lower-case(normalize-space(./ROFF))='progetto' or lower-case(normalize-space(./ROFF))='prototipo' or lower-case(normalize-space(./ROFF))='prova' or lower-case(normalize-space(./ROFF))='schizzo' or lower-case(normalize-space(./ROFF))='sinopia' or lower-case(normalize-space(./ROFF))='sinopia parziale' or lower-case(normalize-space(./ROFF))='negativo' or lower-case(normalize-space(./ROFF))='internegativo' or lower-case(normalize-space(./ROFF))='prova a contatto' or lower-case(normalize-space(./ROFF))='prova di stampa' or lower-case(normalize-space(./ROFF))='prova intermedia' or lower-case(normalize-space(./ROFF))='prova in controparte' or lower-case(normalize-space(./ROFF))='prova finale' or lower-case(normalize-space(./ROFF))='provino' or lower-case(normalize-space(./ROFF))='maquette'">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'FinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
					</xsl:attribute>
					<xsl:if test="./ROFA and (not(starts-with(lower-case(normalize-space(./ROFA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFA)), 'n.r')))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ROFA))" />
							</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
				</rdf:Description>
			</xsl:when>
			<!-- related work as an individual -->
			<xsl:otherwise>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PreparatoryOrFinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
					</xsl:attribute>
					<xsl:if test="./ROFA and (not(starts-with(lower-case(normalize-space(./ROFA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFA)), 'n.r')))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ROFA))" />
		    				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
				</rdf:Description>
			</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:if>
	<!-- relation with copy (RO/COP) -->
	<xsl:for-each select="record/metadata/schede/*/RO/COP">
		<xsl:if test="record/metadata/schede/*/RO/COP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Copy/', $itemURI, '-copy-', position())" />
				</xsl:attribute>
				<xsl:if test="./COPA and (not(starts-with(lower-case(normalize-space(./COPA)), 'nr')) and not(starts-with(lower-case(normalize-space(./COPA)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
			    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./COPA))" />
			    		</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test="./CRFT='copia'">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Copy/', $itemURI, '-copy-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
			        		<xsl:choose>
								<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- relation with a generic derivated work (if RO/CRF/CRFT != 'replica' 
				or 'contraffazione' or 'controtipo' or 'reimpiego' or 'copia') -->
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test=". and not(./CRFT='copia' or ./CRFT='contraffazione' or ./CRFT='controtipo' or ./CRFT='replica' or ./CRFT='reimpiego')">		
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'DerivatedWork/', $itemURI, '-derivated-work-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test="./CRFT='contraffazione'">
			<!-- forgery as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Forgery/', $itemURI, '-forgery-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
		        				<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test="./CRFT='controtipo'">
			<!-- facsimile as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Facsimile/', $itemURI, '-facsimile-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
		        				<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test="./CRFT='replica'">
		<!-- facsimile as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SameAuthorCopy/', $itemURI, '-same-author-copy-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
		        				<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
	<xsl:for-each select="record/metadata/schede/*/RO/CRF">
		<xsl:if test="./CRFT='reimpiego'">
		<!-- reuse as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Reuse/', $itemURI, '-reuse-', position())" />
				</xsl:attribute>
				<xsl:if test="./CRFN or ./CRFB and (not(starts-with(lower-case(normalize-space(./CRFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./CRFB)), 'n.r')))">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
		        				<xsl:when test="./CRFN">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CRFB))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- relation with a particular type of derivated work: print in publication  (S) -->
	<xsl:for-each select="record/metadata/schede/*/RO/ADL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'PrintInPublication/', $itemURI, '-print-in-publication-', position())" />
			</xsl:attribute>
			<xsl:if test="./ADLA and (not(starts-with(lower-case(normalize-space(./ADLA)), 'nr')) and not(starts-with(lower-case(normalize-space(./ADLA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ADLA))" />
					</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>