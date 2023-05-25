<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-spe="https://w3id.org/arco/ontology/natural-specimen-description/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:cpv="https://w3id.org/italia/onto/CPV/"
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
	<xsl:param name="item" />
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
	<xsl:variable name="ldcm"><xsl:for-each select="record/metadata/schede/*/LC/LDC/LDCM"><xsl:value-of select="arco-fn:urify(.)"/></xsl:for-each></xsl:variable>
			<xsl:variable name="pvcc"><xsl:for-each select="record/metadata/schede/*/LC/PVC/PVCC"><xsl:value-of select="arco-fn:urify(.)"/></xsl:for-each></xsl:variable>
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >
	<!-- Cultural Property -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$objectOfDescription" />
		</xsl:attribute>
		<arco-catalogue:isDescribedByCatalogueRecord>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
			</xsl:attribute>
		</arco-catalogue:isDescribedByCatalogueRecord>
		<xsl:for-each select="record/metadata/schede/*/CD/ESC">
			<xsl:if test=".">
				<arco-arco:hasCataloguingAgency>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-arco:hasCataloguingAgency>
			</xsl:if>
		</xsl:for-each>
		<!-- heritage protection agency -->
		<xsl:choose>
			<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
				<arco-arco:hasHeritageProtectionAgency>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
					</xsl:attribute>
				</arco-arco:hasHeritageProtectionAgency>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="record/metadata/schede/*/CD/ECP">
					<xsl:if test=".">
						<arco-arco:hasHeritageProtectionAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-arco:hasHeritageProtectionAgency>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
		<xsl:if test="record/metadata/schede/*/UB/UBF/*">
			<arco-cd:isMemberOfArchivalRecordSetOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isMemberOfArchivalRecordSetOf>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'n.r')))">
				<arco-cd:isArchivalUnitMemberOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalFonds/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
					</xsl:attribute>
				</arco-cd:isArchivalUnitMemberOf>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'n.r')))">
				<arco-cd:isArchivalUnitMemberOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
					</xsl:attribute>
				</arco-cd:isArchivalUnitMemberOf>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'n.r')))">
				<arco-cd:isArchivalUnitMemberOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSubseries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
					</xsl:attribute>
				</arco-cd:isArchivalUnitMemberOf>
			</xsl:if>
		</xsl:if>
		<!-- photographicseries membership -->
		<xsl:if test="record/metadata/schede/F/PD/SFI/*">
			<xsl:for-each select="record/metadata/schede/F/PD/SFI">
				<arco-cd:isMemberOfPhotographicSeriesIn>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicSeriesMembership/', $itemURI, position())" />
					</xsl:attribute>
				</arco-cd:isMemberOfPhotographicSeriesIn>
				<arco-cd:isPhotoMemberOf>
					<xsl:choose>
						<xsl:when test="./SFIT">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeries/', $itemURI, '-', arco-fn:urify(normalize-space(./SFIT)))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeries/', $itemURI, '-', position())" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-cd:isPhotoMemberOf>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="record/metadata/schede/F/PD/SSI/*">
			<xsl:for-each select="record/metadata/schede/F/PD/SSI">
				<arco-cd:isMemberOfPhotographicSeriesIn>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicSubseriesMembership/', $itemURI, position())" />
					</xsl:attribute>
				</arco-cd:isMemberOfPhotographicSeriesIn>
				<arco-cd:isPhotoMemberOf>
					<xsl:choose>
						<xsl:when test="./SSIT">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSubseries/', $itemURI, '-', arco-fn:urify(normalize-space(./SSIT)))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicSubseries/', $itemURI, '-', position())" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-cd:isPhotoMemberOf>
			</xsl:for-each>
		</xsl:if>
		<!-- Numismatic property member -->
		<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTR">
			<arco-cd:isMemberOfNumismaticSeriesOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'NumismaticSeriesMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isMemberOfNumismaticSeriesOf>
			<arco-cd:isCoinMemberOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'NumismaticSeries/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTR)))" />
				</xsl:attribute>
			</arco-cd:isCoinMemberOf>
		</xsl:if>
		<!-- Printing plate member -->
		<xsl:if test="record/metadata/schede/MI/OG/SGT/SGTS">
			<arco-cd:isMemberOfPrintingPlatesSeriesOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeriesMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isMemberOfPrintingPlatesSeriesOf>
			<arco-cd:isPrintingPlateMemberOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/MI/OG/SGT/SGTS)))" />
				</xsl:attribute>
			</arco-cd:isPrintingPlateMemberOf>
		</xsl:if>
		<xsl:if test="record/metadata/schede/S/OG/SGT/SGTS">
			<arco-cd:isMemberOfPrintingPlatesSeriesOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeriesMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isMemberOfPrintingPlatesSeriesOf>
			<arco-cd:isPrintingPlateMemberOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/S/OG/SGT/SGTS)))" />
				</xsl:attribute>
			</arco-cd:isPrintingPlateMemberOf>
		</xsl:if>
		<!-- cultural property classification based on inventory -->
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTS and not($sheetType='NU' or $sheetType='VeAC' or $sheetType='F' or $sheetType='BNB')">
			<arco-arco:hasCulturalPropertyInventoryCategory>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CulturalPropertyInventoryCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTS)))" />
				</xsl:attribute>
			</arco-arco:hasCulturalPropertyInventoryCategory>
		</xsl:if>
		<xsl:if test="record/metadata/schede/MODI/OG/OGS">
			<arco-arco:hasCulturalPropertyInventoryCategory>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CulturalPropertyInventoryCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGS)))" />
				</xsl:attribute>
			</arco-arco:hasCulturalPropertyInventoryCategory>
		</xsl:if>
		<!-- alternative photographic heritage classification -->
		<xsl:if test="record/metadata/schede/*/SG/CLF/*">
			<xsl:for-each select="record/metadata/schede/*/SG/CLF">
				<arco-arco:hasPhotographicHeritageClassification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PhotographicHeritageClassification/', $itemURI, '-alternative-classification-', position())" />
					</xsl:attribute>
				</arco-arco:hasPhotographicHeritageClassification>
			</xsl:for-each>
		</xsl:if>
		<!-- numismatic property functional classification -->
		<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTH">
			<arco-arco:hasNumismaticPropertyCategory>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'NumismaticPropertyFunctionalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTH)))" />
				</xsl:attribute>
			</arco-arco:hasNumismaticPropertyCategory>
		</xsl:if>
		<!-- numismatic property typological classification -->
		<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTT">
			<arco-arco:hasNumismaticPropertyCategory>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'NumismaticPropertyTypologicalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)))" />
				</xsl:attribute>
			</arco-arco:hasNumismaticPropertyCategory>
		</xsl:if>
		<!-- designation in time -->
		<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />                      	                            
                      </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/*/OG/OGD">
			<xsl:if test="not($sheetType='MODI')">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                      		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                      	</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGN">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
                       </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGA">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(string-join(./OGAD,'-'))))" />                      	                            
                     </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTN">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />   	                            
                      </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTU">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space()))" />                      	                            
                      </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTY">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
                      	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/SI/OG/OGT/OGTY)))" />                      	                            
                      </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD and $sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
			<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                      		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)))" />   	                            
                       	</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTE">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario')">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                      			<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTE)))" />   	                            
                      		</xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTC">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione')">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                      			<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTC)))" />   	                            
                      		</xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
			<xsl:for-each select="record/metadata/schede/*/AU/ATB">
				<xsl:if test="(not(starts-with(lower-case(normalize-space(./ATBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATBD)), 'n.r')))">
					<arco-cd:hasAuthorshipAttribution>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
						</xsl:attribute>
					</arco-cd:hasAuthorshipAttribution>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!-- authorship attribution (AAT)-->
		<xsl:for-each select="record/metadata/schede/*/AU/AAT">
			<arco-cd:hasAuthorshipAttribution>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-cd:hasAuthorshipAttribution>
		</xsl:for-each>
		<!-- authorship attribution AU/AUT -->
		<!-- AU/AUT -->
		<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
			<xsl:for-each select="record/metadata/schede/*/AU/AUT">
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
				<xsl:if test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTN)), '-')))">
					<xsl:choose>
						<xsl:when test="./* and (not(./AUTW) or ./AUTW='intero bene' or ./AUTW='integrale' or ./AUTW='tutta' or ./AUTW='totale') or (starts-with(lower-case(normalize-space(./AUTW)), 'nr')) or (starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intero')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intera')) or (starts-with(lower-case(normalize-space(./AUTW)), 'esemplar'))">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="$author" />
		                    	</xsl:attribute>
							</arco-cd:hasAuthor>
							<arco-cd:hasPreferredAuthor>
								<xsl:attribute name="rdf:resource">
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
		<!--  authorship attribution AU/AAU -->
		<xsl:for-each select="record/metadata/schede/*/AU/AAU">
			<xsl:if test="./AAUN and (not(starts-with(lower-case(normalize-space(./AAUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AAUN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AAUN)), '-')))">
				<arco-cd:hasAuthorshipAttribution>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-cd:hasAuthorshipAttribution>
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
		<!--  authorship attribution AU/AUF (F version 2.00, 3.00 and BDM) -->
		<xsl:for-each select="record/metadata/schede/*/AU/AUF">
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
			<xsl:if test="./* and ./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
				<arco-cd:hasAuthorshipAttribution>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-photographer-', position())" />
					</xsl:attribute>
				</arco-cd:hasAuthorshipAttribution>
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$author" />
					</xsl:attribute>
				</arco-cd:hasAuthor>
				<arco-cd:hasPreferredAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$author" />
					</xsl:attribute>
				</arco-cd:hasPreferredAuthor>
			</xsl:if>
		</xsl:for-each>
		<!-- authorship attribution  AU/AFB (F version 2.00, 3.00) -->
		<xsl:for-each select="record/metadata/schede/*/AU/AFB">
			<xsl:if test="(not(starts-with(lower-case(normalize-space(./AFBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./AFBD)), 'n.r')))">
				<arco-cd:hasAuthorshipAttribution>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
					</xsl:attribute>
				</arco-cd:hasAuthorshipAttribution>
			</xsl:if>
		</xsl:for-each>
		<!-- authorship attribution  AU/AAF (F version 2.00, 3.00) -->
		<xsl:for-each select="record/metadata/schede/*/AU/AAF">
			<arco-cd:hasAuthorshipAttribution>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-cd:hasAuthorshipAttribution>
		</xsl:for-each>
		<!--  authorship attribution for BDM < 4.00 -->
		<xsl:for-each select="record/metadata/schede/BDM/AU/AUF">
			<xsl:if test="./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
				<arco-cd:hasAuthorshipAttribution>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, position())" />
					</xsl:attribute>
				</arco-cd:hasAuthorshipAttribution>
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./AUFN and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
							</xsl:when>
							<xsl:when test="./AUFN">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
							</xsl:when>
							<xsl:when test="./AUFB and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
							</xsl:when>
							<xsl:otherwise> 
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-cd:hasAuthor>
				<arco-cd:hasPreferredAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./AUFN and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
							</xsl:when>
							<xsl:when test="./AUFN">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
							</xsl:when>
							<xsl:when test="./AUFB and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
							</xsl:when>
							<xsl:otherwise> 
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-cd:hasPreferredAuthor>
			</xsl:if>
		</xsl:for-each>
		<!-- AU/AUI -->
		<xsl:for-each select="record/metadata/schede/*/AU/AUI">
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
			<xsl:if test="./AUIN and (not(starts-with(lower-case(normalize-space(./AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIN)), '-')))">
				<xsl:choose>
					<xsl:when test="./* and (not(./AUIY) or ./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale') or (starts-with(lower-case(normalize-space(./AUIY)), 'nr')) or (starts-with(lower-case(normalize-space(./AUIY)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intero')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intera')) or (starts-with(lower-case(normalize-space(./AUIY)), 'esemplar'))">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
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
		<!-- sex interpretation -->
		<xsl:if test="record/metadata/schede/AT/DA/STS">
			<arco-cd:hasSexInterpretation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'SexInterpretation/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:hasSexInterpretation>
		</xsl:if>
		<!-- age of death estimate -->
		<xsl:if test="record/metadata/schede/AT/DA/SEM">
			<arco-cd:hasAgeOfDeathInterpretation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'AgeOfDeathInterpretation/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:hasAgeOfDeathInterpretation>
		</xsl:if>
		<!-- subject -->
		<xsl:for-each select="record/metadata/schede/*/*/SGT/SGTI">
			<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
				<arco-cd:subject>
					<xsl:value-of select="normalize-space(.)" />
				</arco-cd:subject>
				<arco-cd:hasSubject>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-cd:hasSubject>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/*/THS/THSD">
			<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
				<arco-cd:subject>
					<xsl:value-of select="normalize-space(.)" />
				</arco-cd:subject>
				<arco-cd:hasSubject>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-cd:hasSubject>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/NU/DA/DES/DESU">
			<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
				<arco-cd:subject>
					<xsl:value-of select="normalize-space(.)" />
				</arco-cd:subject>
				<arco-cd:hasSubject>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-cd:hasSubject>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/DA/AID/AIDI">
			<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
				<arco-cd:subject>
					<xsl:value-of select="normalize-space(.)" />
				</arco-cd:subject>
				<arco-cd:hasSubject>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-cd:hasSubject>
			</xsl:if>
		</xsl:for-each>
		<!-- technical characteristic of cultural property (version 4.00) -->
		<xsl:if test="record/metadata/schede/*/MT/MTC/*">
			<xsl:for-each select="record/metadata/schede/*/MT/MTC">
				<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCM)), 'n.r'))">
					<xsl:if test="./MTCM">
						<xsl:if test="(not(./MTCP) or ./MTCP='intero bene' or ./MTCP='integrale' or ./MTCP='tutta' or ./MTCP='totale') or (starts-with(lower-case(normalize-space(./MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTCP)), 'esemplar'))">
							<arco-dd:hasMaterial>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCM)))" />
								</xsl:attribute>
							</arco-dd:hasMaterial>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!-- technique of cultural property  -->
		<xsl:if test="not($sheetType='VeAC')" >
			<xsl:for-each select="record/metadata/schede/*/MT/MTC">
				<xsl:if test="not(./MTCT[starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r')])"><!-- allow multiple values es: ICCD13661286 -->
					<xsl:if test="./MTCT">
						<xsl:if test="not(./MTCP) or ./MTCP[.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')]">
							<xsl:for-each select="./MTCT"><!-- allow multiple values es: ICCD13661286 -->
								<arco-dd:hasTechnique>
									<xsl:attribute name="rdf:resource">
            							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
            						</xsl:attribute>
								</arco-dd:hasTechnique>
							</xsl:for-each>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!-- materialOrTechnique of cultural property (OAC) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="not(./MTCI[starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r')])">
				<xsl:if test="./MTCI">
					<xsl:if test="not(./MTCP) or ./MTCP[.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')]">
						<xsl:for-each select="./MTCI"><!-- allow multiple values es: ICCD11324966 -->
							<arco-dd:hasMaterialOrTechnique>
								<xsl:attribute name="rdf:resource">
            						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
            					</xsl:attribute>
							</arco-dd:hasMaterialOrTechnique>
						</xsl:for-each>
					</xsl:if>	
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- material of cultural property (VeAC) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="$sheetType='VeAC'" >
				<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCF)), 'n.r'))">
					<xsl:if test="./MTCF">
						<arco-dd:hasMaterial>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCF)))" />
            				</xsl:attribute>
						</arco-dd:hasMaterial>
					</xsl:if>	
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- technique of cultural property (VeAC) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="$sheetType='VeAC'" >
				<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCT)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCT)), 'n.r'))">
					<xsl:if test="./MTCT">
						<arco-dd:hasTechnique>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCT)))" />
            				</xsl:attribute>
						</arco-dd:hasTechnique>
					</xsl:if>	
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- colour of garment (VeAC) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="$sheetType='VeAC'" >
				<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCC)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCC)), 'n.r'))">
					<xsl:if test="./MTCC">
						<arco-dd:hasGarmentColour>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCC)))" />
							</xsl:attribute>
						</arco-dd:hasGarmentColour>
					</xsl:if>	
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- analysis of garment (VeAC) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="$sheetType='VeAC'" >
				<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCA)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCA)), 'n.r'))">
					<xsl:if test="./MTCA">
						<arco-dd:hasGarmentAnalysis>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCA)))" />
            				</xsl:attribute>
						</arco-dd:hasGarmentAnalysis>
					</xsl:if>	
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- technical status - materialOrTechnique of cultural property (previous versions) -->
		<xsl:for-each select="record/metadata/schede/*/MT/MTC">
			<xsl:if test="not(./*) and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
				<arco-dd:hasMaterialOrTechnique>
					<xsl:attribute name="rdf:resource">
		 				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
		           	</xsl:attribute>
				</arco-dd:hasMaterialOrTechnique>
			</xsl:if>
		</xsl:for-each>
		<!-- technical status - shape of cultural property -->
		<xsl:if test="record/metadata/schede/*/MT/FRM and not(record/metadata/schede/F/MT/FRM)">
			<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'n.r'))">
				<xsl:if test="record/metadata/schede/*/MT/FRM">
					<arco-dd:hasShape>
						<xsl:attribute name="rdf:resource">
		 					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FRM)))" />
		           		</xsl:attribute>
					</arco-dd:hasShape>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<!-- technical status - filigree of cultural property -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'n.r'))">
			<xsl:if test="record/metadata/schede/*/MT/FIL">
				<arco-dd:hasFiligree>
					<xsl:attribute name="rdf:resource">
		 				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FIL)))" />
					</xsl:attribute>
				</arco-dd:hasFiligree>
			</xsl:if>
		</xsl:if>
		<!-- technical status - file format of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FVC/FVCF">
				<arco-dd:hasFileFormat>
					<xsl:attribute name="rdf:resource">
		 				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)))" />
		           	</xsl:attribute>
				</arco-dd:hasFileFormat>
			</xsl:if>
		</xsl:if>
		<!-- technical status - photo size of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FRM">
				<arco-dd:hasPhotoSize>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FRM)))" />
            		</xsl:attribute>
				</arco-dd:hasPhotoSize>
			</xsl:if>
		</xsl:if>
		<!-- technical status -  photo program of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FVC/FVCP">
				<arco-dd:hasPhotoProgram>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)))" />
					</xsl:attribute>
				</arco-dd:hasPhotoProgram>
			</xsl:if>
		</xsl:if>
		<!-- technical status - storage method and colour depth of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FVC/FVCC">
				<arco-dd:hasStorageMethodOrColourDepth>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)))" />
					</xsl:attribute>
				</arco-dd:hasStorageMethodOrColourDepth>
			</xsl:if>
		</xsl:if>
		<!-- technical status - resolution of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FVC/FVCU">
				<arco-dd:hasResolution>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)))" />
					</xsl:attribute>
				</arco-dd:hasResolution>
			</xsl:if>
		</xsl:if>
		<!-- technical status - pixel dimension of photograph (F) -->
		<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'n.r'))">
			<xsl:if test="record/metadata/schede/F/MT/FVC/FVCM">
				<arco-dd:hasPixelDimension>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)))" />
            		</xsl:attribute>
				</arco-dd:hasPixelDimension>
			</xsl:if>
		</xsl:if>
		<!-- technical status - mass storage of photograph (F) -->
		<xsl:if test="record/metadata/schede/F/MT/FVM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'n.r')))">
			<arco-dd:hasMassStorage>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVM)))" />
				</xsl:attribute>
			</arco-dd:hasMassStorage>
		</xsl:if>
		<!-- technical status - colour of photograph (F) -->
		<xsl:if test="record/metadata/schede/F/MT/MTX and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'n.r')))">
			<arco-dd:hasPhotoColour>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/MTX)))" />
				</xsl:attribute>
			</arco-dd:hasPhotoColour>
		</xsl:if>
		<!-- name in time -->
		<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />                      	                            
				</xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/*/OG/OGD">
			<xsl:if test="not($sheetType='MODI')">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGN">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
				</xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGA">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(string-join(./OGAD,'-'))))" />                      	                            
		        </xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTN">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />   	                            
				</xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTU">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space()))" />                      	                            
				</xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTY">
			<arco-dd:hasDesignationInTime>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/SI/OG/OGT/OGTY)))" />                      	                            
				</xsl:attribute>
			</arco-dd:hasDesignationInTime>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD and $sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
			<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)))" />   	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTE">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario')">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTE)))" />   	                            
						</xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTC">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione')">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTC)))" />   	                            
						</xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/AU/FRU">
			<xsl:for-each select="record/metadata/schede/*/AU/FRU">
				<arco-cd:hasFruition>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-cd:hasFruition>
			</xsl:for-each>
		</xsl:if>
		<!--  functional purpose -->
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTF and ($sheetType='CA' or $sheetType='MA')">
			<arco-dd:hasFunctionalPurpose>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'FunctionalPurpose/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)))" />
				</xsl:attribute>
			</arco-dd:hasFunctionalPurpose>
		</xsl:if>
	</rdf:Description>
	</xsl:if>
	<!-- AUT -->
	<xsl:if test="$sheetType='AUT' and record/metadata/schede/*/AU/AUT/AUTN" >
		<xsl:variable name="sex">
			 <xsl:choose>
				<xsl:when test="$sheetVersion='4.00_ICCD0'"><xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTE"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTZ"/></xsl:otherwise>
			 </xsl:choose>
		</xsl:variable>
		<xsl:variable name="nameAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTN, ' - ', record/metadata/schede/*/AU/AUT/AUTA)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTN, ' ', record/metadata/schede/*/AU/AUT/AUTB)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTN" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="idAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTN, '-', record/metadata/schede/*/AU/AUT/AUTA))" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTN, '-', record/metadata/schede/*/AU/AUT/AUTB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTN)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="author" select="concat($NS, 'Agent/', $idAuthor)"/>
		<xsl:if test="string-length($sex) and contains('MF',translate(normalize-space($sex),'mf','MF'))">
			<!-- Author -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$author" />
				</xsl:attribute>
				<cpv:hasSex>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Sex/', $idAuthor)" />
					</xsl:attribute>
				</cpv:hasSex>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Acquisition -->
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >
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
	<!-- cadastral identity -->
	<xsl:for-each select="record/metadata/schede/*/CS">
		<xsl:variable name="parentPosition">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
			</xsl:attribute>
			<xsl:for-each select="./CTS">
				<xsl:if test="./CTST and (not(starts-with(lower-case(normalize-space(./CTST)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTST)), 'n.r')))">
					<arco-location:hasCadastreType>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto terreni'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/LandCadastre'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto fabbricati'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingCadastre'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto misto'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingAndLandCadastre'" />
								</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasCadastreType>
				</xsl:if>
			</xsl:for-each>
		</rdf:Description>
	</xsl:for-each>
	<xsl:if test="record/metadata/schede/*/LS/CSS/*">
		<xsl:for-each select="record/metadata/schede/*/LS/CSS">
			<xsl:variable name="parentPosition">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-historical-', position())" />
				</xsl:attribute>
				<xsl:if test="./CSST">
					<tiapit:time>
						<xsl:value-of select="normalize-space(./CSST)" />
					</tiapit:time>
				</xsl:if>
				<xsl:if test="./CSSD">
					<arco-location:cadastreName>
						<xsl:value-of select="normalize-space(./CSSD)" />
					</arco-location:cadastreName>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<!-- membership -->
	<!-- archivalrecordset membership -->
	<xsl:if test="record/metadata/schede/*/UB/UBF/*">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
			</xsl:attribute>
			<arco-cd:hasMemberOfArchivalRecordSet>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="$culturalProperty" />
				</xsl:attribute>
			</arco-cd:hasMemberOfArchivalRecordSet>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFC">
				<arco-cd:archivalRecordLocation>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFC)" />
				</arco-cd:archivalRecordLocation>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'n.r')))">
				<arco-cd:hasCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalFonds/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
					</xsl:attribute>
				</arco-cd:hasCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'n.r')))">
				<arco-cd:hasCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
					</xsl:attribute>
				</arco-cd:hasCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'n.r')))">
				<arco-cd:hasCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSubseries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
					</xsl:attribute>
				</arco-cd:hasCollection>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/UB/UBF/UBFP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'ArchivalFonds/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchivalFonds'" />
				</xsl:attribute>
			</rdf:type>
			<arco-cd:isCollectionIn>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isCollectionIn>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFP)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'n.r')))">
				<arco-core:hasComponent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
					</xsl:attribute>
				</arco-core:hasComponent>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/UB/UBF/UBFS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'ArchivalSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchivalSeries'" />
				</xsl:attribute>
			</rdf:type>
			<arco-cd:isCollectionIn>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isCollectionIn>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFS)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'n.r')))">
				<arco-core:hasComponent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSubseries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
					</xsl:attribute>
				</arco-core:hasComponent>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)), 'n.r')))">
				<arco-core:isComponentOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalFonds/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
					</xsl:attribute>
				</arco-core:isComponentOf>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/UB/UBF/UBFT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'ArchivalSubseries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchivalSubseries'" />
				</xsl:attribute>
			</rdf:type>
			<arco-cd:isCollectionIn>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isCollectionIn>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFT)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/UBF/UBFT)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/UB/UBF/UBFS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)), 'n.r')))">
				<arco-core:isComponentOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'ArchivalSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
					</xsl:attribute>
				</arco-core:isComponentOf>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<!-- photographicseries membership -->
	<xsl:if test="record/metadata/schede/F/PD/SFI/*">
		<xsl:for-each select="record/metadata/schede/F/PD/SFI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PhotographicSeriesMembership/', $itemURI, position())" />
				</xsl:attribute>
				<xsl:if test="./SFIN">
					<arco-cd:photographicSeriesItemNumber>
						<xsl:value-of select="normalize-space(./SFIN)" />
					</arco-cd:photographicSeriesItemNumber>
				</xsl:if>
				<arco-cd:hasCollection>
					<xsl:choose>
						<xsl:when test="./SFIT">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./SFIT)))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeries/', $ldcm, '-', $pvcc, '-', position())" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-cd:hasCollection>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/F/PD/SSI/*">
		<xsl:for-each select="record/metadata/schede/F/PD/SSI">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PhotographicSubseriesMembership/', $itemURI, position())" />
				</xsl:attribute>
				<arco-cd:hasCollection>
					<xsl:choose>
						<xsl:when test="./SSIT">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSubseries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./SSIT)))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSubseries/', $ldcm, '-', $pvcc, '-', position())" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-cd:hasCollection>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<!-- collection membership -->
	<xsl:for-each select="record/metadata/schede/*/UB/COL">
		<xsl:if test="./*">
			<xsl:variable name="collection-membership-position">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Appartenenza a collezione ', position(), ' del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Appartenenza a collezione ', position(), ' del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Collection membership ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Collection membership ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-cd:hasMemberOfCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
				</arco-cd:hasMemberOfCollection>
				<arco-cd:hasCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./COLD and (not(starts-with(lower-case(normalize-space(./COLD)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLD)), 'n.r')))">
								<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./COLD)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-',  $collection-membership-position)" />
							</xsl:otherwise>
						</xsl:choose>
                   	</xsl:attribute>
				</arco-cd:hasCollection>
				<xsl:if test="./COLM and (not(starts-with(lower-case(normalize-space(./COLM)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLM)), 'n.r')))">
					<arco-cd:collectionLeavingReason>
						<xsl:value-of select="normalize-space(./COLM)" />
					</arco-cd:collectionLeavingReason>
				</xsl:if>
				<xsl:if test="./COLI and (not(starts-with(lower-case(normalize-space(./COLI)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLI)), 'n.r')))">
					<arco-cd:collectionUnitIdentifier>
						<xsl:value-of select="normalize-space(./COLI)" />
					</arco-cd:collectionUnitIdentifier>
				</xsl:if>
				<xsl:if test="./COLU or ./COLA and (not(starts-with(lower-case(normalize-space(./COLU)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLU)), 'n.r')) and not(starts-with(lower-case(normalize-space(./COLA)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLA)), 'n.r')))">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
                      		<xsl:choose>
                      			<xsl:when test="./COLU and ./COLA">
                       				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)), '-', arco-fn:urify(normalize-space(./COLU)))" />
                       			</xsl:when>
                       			<xsl:when test="./COLU">
                       				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLU)))" />
                       			</xsl:when>
                       			<xsl:when test="./COLA">
                       				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)))" />
                       			</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./COLD and (not(starts-with(lower-case(normalize-space(./COLD)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLD)), 'n.r')))">
							<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./COLD)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-', $collection-membership-position)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:if test="$sheetVersion='4.00' or $sheetVersion='4.00_ICCD0'">
					<xsl:if test="./COLN">
						<arco-cd:hasCollector>
							<xsl:attribute name="rdf:resource">
                    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./COLN))" />
							</xsl:attribute>
						</arco-cd:hasCollector>
					</xsl:if>
				</xsl:if>
				<xsl:if test="not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<xsl:if test="./COLC">
						<arco-cd:hasCollector>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./COLC))" />
		           			</xsl:attribute>
						</arco-cd:hasCollector>
					</xsl:if>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Printing Plates Series -->
	<xsl:if test="$sheetType='MI' or 'S'">
		<xsl:if test="record/metadata/schede/*/OG/SGT/SGTS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeriesMembership/', $itemURI)" />
				</xsl:attribute>
				<arco-cd:hasCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/SGT/SGTS)))" />
					</xsl:attribute>
				</arco-cd:hasCollection>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/SGT/SGTS)))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/MI/OG/SGT/SGTS)))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/PrintingPlatesSeries" />
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTS)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Numismatic property member -->
	<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'NumismaticSeriesMembership/', $itemURI)" />
			</xsl:attribute>
			<arco-cd:hasCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'NumismaticSeries/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTR)))" />
				</xsl:attribute>
			</arco-cd:hasCollection>
		</rdf:Description>
	</xsl:if>
	<!-- Commission -->
	<xsl:for-each select="record/metadata/schede/*/AU/CMM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Commission/', $itemURI, '-', position())" />
			</xsl:attribute>
			<xsl:for-each select="./CMMN">
				<xsl:if test=".">
					<arco-cd:hasCommittent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasCommittent>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="./CMMF[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]">
				<arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</xsl:for-each>
		</rdf:Description>
		<xsl:for-each select="./CMMF[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space()" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space()" />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<!-- conservation status -->
	<xsl:for-each select="record/metadata/schede/*/CO/STC">
		<xsl:if test="./*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
				</xsl:attribute>
				<xsl:if test="./STCC and not(lower-case(normalize-space(./STCC))='nr' or lower-case(normalize-space(./STCC))='n.r.' or lower-case(normalize-space(./STCC))='nr (recupero pregresso)')">
					<arco-dd:hasConservationStatusType>
						<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='ottimo' or lower-case(normalize-space(./STCC))='ottima' or lower-case(normalize-space(./STCC))='eccellente'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/ExcellentConservationStatus'" />
									</xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/GoodConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='mediocre'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MediocreConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta' or lower-case(normalize-space(./STCC))='sufficiente'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DecentConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/BadConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='pessimo' or lower-case(normalize-space(./STCC))='pessima' or lower-case(normalize-space(./STCC))='pessomo' or lower-case(normalize-space(./STCC))='immediato pericolo'">
                                    	<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/VeryBadConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='dato non disponibile'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/UnavailableConservationStatus'" />
                                    </xsl:when>
                                    <xsl:when test="./STCC">
                                        <xsl:value-of select="concat($NS, 'ConservationStatusType/', arco-fn:urify(normalize-space(./STCC)))" />
                                    </xsl:when>
                                </xsl:choose>
						</xsl:attribute>
					</arco-dd:hasConservationStatusType>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- documentation of cultural property as an individual -->
	<xsl:for-each select="record/metadata/schede/*/*/FTA">
		<xsl:variable name="photodocu-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
			</xsl:attribute>
			<xsl:if test="./FTAY and (not(starts-with(lower-case(normalize-space(./FTAY)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAY)), 'n.r')))">
				<arco-cd:rights>
					<xsl:value-of select="normalize-space(./FTAY)" />
				</arco-cd:rights>
			</xsl:if>
			<xsl:if test="./FTAN and (not(starts-with(lower-case(normalize-space(./FTAN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAN)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./FTAN)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./FTAD and (not(starts-with(lower-case(normalize-space(./FTAD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAD)), 'n.r')))">
				<tiapit:time>
					<xsl:value-of select="normalize-space(./FTAD)" />
				</tiapit:time>
			</xsl:if>
			<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
				<arco-core:hasCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
							</xsl:when>
							<xsl:when test="./FTAX">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
							</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</arco-core:hasCategory>
			</xsl:if>
			<xsl:if test="./FTAP and (not(starts-with(lower-case(normalize-space(./FTAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAP)), 'n.r')))">
				<arco-cd:hasDocumentationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            		</xsl:attribute>
				</arco-cd:hasDocumentationType>
			</xsl:if>
			<xsl:if test="./FTAF and (not(starts-with(lower-case(normalize-space(./FTAF)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAF)), 'n.r')))">
				<arco-cd:hasFormat>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FTAF)))" />
            		</xsl:attribute>
				</arco-cd:hasFormat>
			</xsl:if>
			<xsl:if test="./FTAA and (not(starts-with(lower-case(normalize-space(./FTAA)), 'nr')) and not(starts-with(lower-case(normalize-space(./FTAA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FTAA))" />
            		</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
		<!-- documentation category of photographic documentation as an individual -->
		<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'" />
				<xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'" />
				<xsl:when test="./FTAX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FTAX)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FTAX)" />
						</l0:name>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/DO/DRA">
		<xsl:variable name="photodocu-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
			</xsl:attribute>
			<xsl:if test="./DRAY and (not(starts-with(lower-case(normalize-space(./DRAY)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAY)), 'n.r')))">
				<arco-cd:rights>
					<xsl:value-of select="normalize-space(./DRAY)" />
				</arco-cd:rights>
			</xsl:if>
			<xsl:if test="./DRAN and (not(starts-with(lower-case(normalize-space(./DRAN)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAN)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./DRAN)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./DRAD and (not(starts-with(lower-case(normalize-space(./DRAD)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAD)), 'n.r')))">
				<tiapit:time>
					<xsl:value-of select="normalize-space(./DRAD)" />
				</tiapit:time>
			</xsl:if>
			<xsl:if test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
				<arco-core:hasCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./DRAX))='documentazione esistente'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./DRAX))='documentazione allegata'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
							</xsl:when>
							<xsl:when test="./DRAX">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
							</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</arco-core:hasCategory>
			</xsl:if>
			<xsl:if test="./DRAP and (not(starts-with(lower-case(normalize-space(./DRAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAP)), 'n.r')))">
				<arco-cd:hasDocumentationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./DRAP)))" />
            		</xsl:attribute>
				</arco-cd:hasDocumentationType>
			</xsl:if>
			<xsl:if test="./DRAF and (not(starts-with(lower-case(normalize-space(./DRAF)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAF)), 'n.r')))">
				<arco-cd:hasFormat>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./DRAF)))" />
            		</xsl:attribute>
				</arco-cd:hasFormat>
			</xsl:if>
			<xsl:if test="./DRAA and (not(starts-with(lower-case(normalize-space(./DRAA)), 'nr')) and not(starts-with(lower-case(normalize-space(./DRAA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./DRAA))" />
            		</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
		<!-- documentation category of photographic documentation as an individual -->
		<xsl:if test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./DRAX))='documentazione esistente'" />
				<xsl:when test="lower-case(normalize-space(./DRAX))='documentazione allegata'" />
				<xsl:when test="./DRAX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAX)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAX)" />
						</l0:name>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/DO/VDC">
		<xsl:variable name="photodocu-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
			</xsl:attribute>
			<xsl:if test="./VDCY and (not(starts-with(lower-case(normalize-space(./VDCY)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCY)), 'n.r')))">
				<arco-cd:rights>
					<xsl:value-of select="normalize-space(./VDCY)" />
				</arco-cd:rights>
			</xsl:if>
		<xsl:if test="./VDCN and (not(starts-with(lower-case(normalize-space(./VDCN)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCN)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./VDCN)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./VDCD and (not(starts-with(lower-case(normalize-space(./VDCD)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCD)), 'n.r')))">
				<tiapit:time>
					<xsl:value-of select="normalize-space(./VDCD)" />
				</tiapit:time>
			</xsl:if>
			<xsl:if test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
				<arco-core:hasCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./VDCX))='documentazione esistente'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./VDCX))='documentazione allegata'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
							</xsl:when>
							<xsl:when test="./VDCX">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
							</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</arco-core:hasCategory>
			</xsl:if>
			<xsl:if test="./VDCP and (not(starts-with(lower-case(normalize-space(./VDCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCP)), 'n.r')))">
				<arco-cd:hasDocumentationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./VDCP)))" />
            		</xsl:attribute>
				</arco-cd:hasDocumentationType>
			</xsl:if>
			<xsl:if test="./VDCF and (not(starts-with(lower-case(normalize-space(./VDCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCF)), 'n.r')))">
				<arco-cd:hasFormat>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./VDCF)))" />
            		</xsl:attribute>
				</arco-cd:hasFormat>
			</xsl:if>
			<xsl:if test="./VDCA and (not(starts-with(lower-case(normalize-space(./VDCA)), 'nr')) and not(starts-with(lower-case(normalize-space(./VDCA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./VDCA))" />
            		</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
		<!-- documentation category of photographic documentation as an individual -->
		<xsl:if test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./VDCX))='documentazione esistente'" />
				<xsl:when test="lower-case(normalize-space(./VDCX))='documentazione allegata'" />
				<xsl:when test="./VDCX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VDCX)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VDCX)" />
						</l0:name>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/DO/REG">
		<xsl:variable name="photodocu-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
			</xsl:attribute>
			<xsl:if test="./REGN and (not(starts-with(lower-case(normalize-space(./REGN)), 'nr')) and not(starts-with(lower-case(normalize-space(./REGN)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./REGN)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./REGD and (not(starts-with(lower-case(normalize-space(./REGD)), 'nr')) and not(starts-with(lower-case(normalize-space(./REGD)), 'n.r')))">
				<tiapit:time>
					<xsl:value-of select="normalize-space(./REGD)" />
				</tiapit:time>
			</xsl:if>
			<xsl:if test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
				<arco-core:hasCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./REGX))='documentazione esistente'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./REGX))='documentazione allegata'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
							</xsl:when>
							<xsl:when test="./REGX">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
							</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</arco-core:hasCategory>
			</xsl:if>
			<xsl:if test="./REGP and (not(starts-with(lower-case(normalize-space(./REGP)), 'nr')) and not(starts-with(lower-case(normalize-space(./REGP)), 'n.r')))">
				<arco-cd:hasDocumentationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./REGP)))" />
            		</xsl:attribute>
				</arco-cd:hasDocumentationType>
			</xsl:if>
			<xsl:if test="./REGF and (not(starts-with(lower-case(normalize-space(./REGF)), 'nr')) and not(starts-with(lower-case(normalize-space(./REGF)), 'n.r')))">
				<arco-cd:hasFormat>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./REGF)))" />
            		</xsl:attribute>
				</arco-cd:hasFormat>
			</xsl:if>
			<xsl:if test="./REGA and (not(starts-with(lower-case(normalize-space(./REGA)), 'nr')) and not(starts-with(lower-case(normalize-space(./REGA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./REGA))" />
            		</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
		<!-- documentation category of photographic documentation as an individual -->
		<xsl:if test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./REGX))='documentazione esistente'" />
				<xsl:when test="lower-case(normalize-space(./REGX))='documentazione allegata'" />
				<xsl:when test="./REGX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./REGX)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./REGX)" />
						</l0:name>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/DO/FNT">
		<xsl:variable name="photodocu-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
			</xsl:attribute>
			<xsl:if test="./FNTY and (not(starts-with(lower-case(normalize-space(./FNTY)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTY)), 'n.r')))">
				<arco-cd:rights>
					<xsl:value-of select="normalize-space(./FNTY)" />
				</arco-cd:rights>
			</xsl:if>
			<xsl:if test="./FNTI and (not(starts-with(lower-case(normalize-space(./FNTI)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTI)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./FNTI)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./FNTH and (not(starts-with(lower-case(normalize-space(./FNTH)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTH)), 'n.r')))">
				<arco-cd:documentationIdentifier>
					<xsl:value-of select="normalize-space(./FNTH)" />
				</arco-cd:documentationIdentifier>
			</xsl:if>
			<xsl:if test="./FNTD and (not(starts-with(lower-case(normalize-space(./FNTD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTD)), 'n.r')))">
				<xsl:choose>
					<xsl:when test="$sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
						<arco-cd:documentationTitle>
							<xsl:value-of select="normalize-space(./FNTD)" />
						</arco-cd:documentationTitle>
					</xsl:when>
					<xsl:otherwise>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./FNTD)" />
						</tiapit:time>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
				<arco-core:hasCategory>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./FNTX))='documentazione esistente'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ExistingDocumentation'" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./FNTX))='documentazione allegata'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AttachedDocumentation'" />
							</xsl:when>
							<xsl:when test="./FNTX">
								<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
							</xsl:when>
						</xsl:choose>
					</xsl:attribute>
				</arco-core:hasCategory>
			</xsl:if>
			<xsl:if test="./FNTT and (not(starts-with(lower-case(normalize-space(./FNTT)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTT)), 'n.r')))">
				<xsl:choose>
					<xsl:when test="$sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
           						<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTT)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:when>
					<xsl:otherwise>
						<arco-cd:documentationTitle>
							<xsl:value-of select="normalize-space(./FNTT)" />
						</arco-cd:documentationTitle>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="./FNTP and (not(starts-with(lower-case(normalize-space(./FNTP)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTP)), 'n.r')))">
				<arco-cd:hasDocumentationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTP)))" />
            		</xsl:attribute>
				</arco-cd:hasDocumentationType>
			</xsl:if>
			<xsl:if test="./FNTR and (not(starts-with(lower-case(normalize-space(./FNTR)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTR)), 'n.r')))">
				<arco-cd:hasFormat>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FNTR)))" />
            		</xsl:attribute>
				</arco-cd:hasFormat>
			</xsl:if>
			<xsl:if test="./FNTA and (not(starts-with(lower-case(normalize-space(./FNTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./FNTA)), 'n.r')))">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FNTA))" />
            		</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
		<!-- documentation category of photographic documentation as an individual -->
		<xsl:if test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./FNTX))='documentazione esistente'" />
				<xsl:when test="lower-case(normalize-space(./FNTX))='documentazione allegata'" />
				<xsl:when test="./FNTX">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/DocumentationCategory" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTX)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTX)" />
						</l0:name>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<!-- copyright -->
	<xsl:for-each select="record/metadata/schede/*/TU/CPR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Copyright/', $itemURI, '-copyright-', position())" />
			</xsl:attribute>
			<xsl:if test="./CPRN">
				<arco-cd:hasCopyrightHolder>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CPRN))" />
					</xsl:attribute>
				</arco-cd:hasCopyrightHolder>
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-copyright-holder')" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./CPRN">
			<!-- agent role as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-copyright-holder')" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-rights-holder')" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Detentore dei diritti sul bene culturale ', $itemURI, ': ', normalize-space(./CPRN))" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Copyright holder on cultural property ', $itemURI, ': ', normalize-space(./CPRN))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Detentore dei diritti sul bene culturale ', $itemURI, ': ', normalize-space(./CPRN))" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Copyright holder on cultural property ', $itemURI, ': ', normalize-space(./CPRN))" />
				</l0:name>
				<arco-core:hasRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/CopyrightHolder')" />
					</xsl:attribute>
				</arco-core:hasRole>
				<arco-core:hasAgent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CPRN))" />
					</xsl:attribute>
				</arco-core:hasAgent>
			</rdf:Description>
			<!-- role as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Role/CopyrightHolder')" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/RightsHolder')" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Detentore dei diritti'" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Copyright Holder'" />
				</rdfs:label>
				<arco-core:isRoleOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CPRN))" />
					</xsl:attribute>
				</arco-core:isRoleOf>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- edition as individual -->
	<xsl:for-each select="record/metadata/schede/*/AU/EDT">
		<xsl:if test="$sheetType='OAC' or $sheetType='S' or $sheetType='MI'">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./EDTE and ./EDTL">
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)), '-', arco-fn:urify(normalize-space(./EDTL)))" />
						</xsl:when>
						<xsl:when test="./EDTE">
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)))" />
						</xsl:when>
						<xsl:when test="./EDTL">
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTL)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', position())" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:if test="./EDTE and (not(starts-with(lower-case(normalize-space(./EDTE)), 'nr')) and not(starts-with(lower-case(normalize-space(./EDTE)), 'n.r')))">
					<tiapit:time>
						<xsl:value-of select="normalize-space(./EDTE)" />
					</tiapit:time>
				</xsl:if>
				<xsl:if test="./EDTL and (not(starts-with(lower-case(normalize-space(./EDTL)), 'nr')) and not(starts-with(lower-case(normalize-space(./EDTL)), 'n.r')))">
					<arco-cd:editionLocation>
						<xsl:value-of select="normalize-space(./EDTL)" />
					</arco-cd:editionLocation>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Estimate -->
	<xsl:if test="record/metadata/schede/*/UB/INP/INPA  and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/INP/INPA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/INP/INPA)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Estimate/', $itemURI)" />
			</xsl:attribute>
			<arco-cd:hasInterpretationCriterion>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/inventario-patrimoniale')" />
				</xsl:attribute>
			</arco-cd:hasInterpretationCriterion>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'InterpretationCriterion/inventario-patrimoniale')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Inventario patrimoniale'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Asset inventory'" />
			</l0:name>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Inventario patrimoniale'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Asset inventory'" />
			</rdfs:label>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="$sheetVersion='1.00' or $sheetVersion='1.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0'">
		<xsl:for-each select="record/metadata/schede/*/UB/INV/INVS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Estimate/', $itemURI, '-', position())" />
           	     </xsl:attribute>
           	     <arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/inventario-patrimoniale')" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/inventario-patrimoniale')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
    					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
        			</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Inventario patrimoniale'" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Asset inventory'" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Inventario patrimoniale'" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Asset inventory'" />
				</rdfs:label>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/UB/STI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Estimate/', $itemURI, '-', position())" />
			</xsl:attribute>
			<xsl:if test="./STIM">
				<arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./STIM)))" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</xsl:if>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./STIM)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./STIM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./STIM)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<!-- Catalogue record - Alternative identifier -->
	<xsl:if test="record/metadata/schede/*/*/ACC">
		<xsl:for-each select="record/metadata/schede/*/*/ACC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
				</xsl:attribute>
        		<arco-catalogue:hasAlternativeIdentifier>
					<xsl:attribute name="rdf:resource">
		     			<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-catalogue:hasAlternativeIdentifier>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                   	<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
								<xsl:when test="./*">
									<xsl:value-of select="concat($NS, 'Identifier/', $itemURI, arco-fn:arcofy(./ACCC))" />
								</xsl:when>
								<xsl:otherwise> 
									<xsl:value-of select="concat($NS, 'Identifier/', $itemURI, arco-fn:arcofy(.))" />
								</xsl:otherwise>
							</xsl:choose>
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AlternativeIdentifier'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
						</xsl:when>
						<xsl:otherwise> 
							<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<l0:identifier>
					<xsl:choose>
						<xsl:when test="./*">
							<xsl:value-of select="./ACCC" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(.)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:identifier>
				<xsl:if test="./ACCS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(./ACCS)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ACCP and (not(starts-with(lower-case(normalize-space(./ACCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCP)), 'n.r')))">
					<arco-catalogue:referenceProject>
						<xsl:value-of select="normalize-space(./ACCP)" />
					</arco-catalogue:referenceProject>
				</xsl:if>
				<xsl:if test="./ACCW and (not(starts-with(lower-case(normalize-space(./ACCW)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCW)), 'n.r')))">
					<smapit:URL>
						<xsl:value-of select="normalize-space(./ACCW)" />
					</smapit:URL>
				</xsl:if>
				<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
				</xsl:if>
			</rdf:Description>  
			<xsl:if test="./ACCE and (not(starts-with(lower-case(normalize-space(./ACCE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACCE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
					</l0:name>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACCE))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente responsabile della scheda catalografica'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible agency for catalogue record'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
						</xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
			</xsl:if>   
		</xsl:for-each>
	</xsl:if>
	<!-- sec category identifier -->
	<xsl:for-each select="record/metadata/schede/*/UB/INP">
		<xsl:if test="./INPZ and (not(starts-with(lower-case(normalize-space(./INPZ)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPZ)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SECCategory/', arco-fn:urify(normalize-space(./INPZ)))" />
				</xsl:attribute>
				<xsl:if test="./INPS and (not(starts-with(lower-case(normalize-space(./INPS)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPS)), 'n.r')))">
					<l0:identifier>
						<xsl:value-of select="normalize-space(./INPS)" />
					</l0:identifier>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	                    
	</xsl:for-each>
	<!-- intervention (*/RST) -->
	<xsl:for-each select="record/metadata/schede/*/*/RST">
		<xsl:if test="not($sheetType='A' or $sheetType='PG')">
			<xsl:if test="./*">
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="contains(normalize-space(lower-case(./RSTI)), 'restaur') or contains(normalize-space(lower-case(./RSTI)), 'conservativi') or contains(normalize-space(lower-case(./RSTI)), 'conservative') or contains(normalize-space(lower-case(./RSTI)), 'conservativa') or contains(normalize-space(lower-case(./RSTI)), 'conservativo') or contains(normalize-space(lower-case(./RSTI)), 'consolidamento') or contains(normalize-space(lower-case(./RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(./RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(./RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(./RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(./RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(./RSTI)), 'protezione finale') or contains(normalize-space(lower-case(./RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(./RSTI)), 'trattamento parti metalliche')">
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-intervention-', position())" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="./RSTI and (not(starts-with(lower-case(normalize-space(./RSTI)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSTI)), 'n.r')))">
						<arco-cd:hasInterventionType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./RSTI)))" />
							</xsl:attribute>
						</arco-cd:hasInterventionType>
					</xsl:if>
					<xsl:for-each select="./RSTE">
						<arco-cd:hasActivityResponsible>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	               			</xsl:attribute>
						</arco-cd:hasActivityResponsible>
					</xsl:for-each>
					<xsl:for-each select="./RSTR">
						<arco-cd:hasActivitySponsor>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	               			</xsl:attribute>
						</arco-cd:hasActivitySponsor>
					</xsl:for-each>
					<xsl:for-each select="./RSTN">
						<arco-cd:hasActivityOperator>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	               			</xsl:attribute>
						</arco-cd:hasActivityOperator>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RS/RST">
		<xsl:if test="$sheetType='A' or $sheetType='PG'">
			<xsl:if test="./*">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
					</xsl:attribute>
					<xsl:for-each select="./RSTT">
						<arco-cd:hasInterventionType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-cd:hasInterventionType>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/RO/RIS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, 'intervention-', position())" />
			</xsl:attribute>
			<xsl:if test="./RIST and (not(starts-with(lower-case(normalize-space(./RIST)), 'nr')) and not(starts-with(lower-case(normalize-space(./RIST)), 'n.r')))">
				<arco-cd:hasInterventionType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./RIST)))" />
					</xsl:attribute>
				</arco-cd:hasInterventionType>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
	<!-- cultural property classification based on inventory -->
	<xsl:if test="record/metadata/schede/*/OG/OGT/OGTS and not($sheetType='NU' or $sheetType='VeAC' or $sheetType='F' or $sheetType='BNB')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CulturalPropertyInventoryCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTS)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTS)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/CulturalPropertyInventoryCategory'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/MODI/OG/OGS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CulturalPropertyInventoryCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGS)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGS)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/CulturalPropertyInventoryCategory'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- alternative photographic heritage classification -->
	<xsl:if test="record/metadata/schede/*/SG/CLF/*">
		<xsl:for-each select="record/metadata/schede/*/SG/CLF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PhotographicHeritageClassification/', $itemURI, '-alternative-classification-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PhotographicHeritageClassification'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Alternative classification ', position(), ' of photographic heritage ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Classificazione alternativa ', position(), ' del bene fotografico ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Alternative classification ', position(), ' of photographic heritage ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Classificazione alternativa ', position(), ' del bene fotografico ', $itemURI)" />
				</l0:name>
				<xsl:if test="./CLFS">
					<arco-arco:classifiedSubject>
						<xsl:value-of select="normalize-space(./CLFS)" />
					</arco-arco:classifiedSubject>
				</xsl:if>
				<xsl:if test="./CLFT">
					<arco-arco:hasPhotographicHeritageClassificationType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhotographicHeritageClassificationType/', arco-fn:urify(normalize-space(./CLFT)))" />
						</xsl:attribute>
					</arco-arco:hasPhotographicHeritageClassificationType>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./CLFT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'PhotographicHeritageClassificationType/', arco-fn:urify(normalize-space(./CLFT)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PhotographicHeritageClassificationType'" />
						</xsl:attribute>
					</rdf:type>
					<l0:name>
						<xsl:value-of select="normalize-space(./CLFT)" />
					</l0:name>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./CLFT)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<!-- numismatic property category -->
	<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'NumismaticPropertyFunctionalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTH)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NumismaticPropertyFunctionalCategory'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTH)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTH)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'NumismaticPropertyTypologicalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)))" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)))" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NumismaticPropertyTypologicalCategory'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- inventory situation -->
	<xsl:for-each select="record/metadata/schede/*/UB/INP">
		<xsl:if test="./*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InventorySistuation/', $itemURI, '-current')" />
				</xsl:attribute>
				<xsl:if test="./INPD and (not(starts-with(lower-case(normalize-space(./INPD)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPD)), 'n.r')))">
					<arco-cd:culturalPropertyInventoryDescription>
						<xsl:value-of select="normalize-space(./INPD)" />
					</arco-cd:culturalPropertyInventoryDescription>
				</xsl:if>
				<xsl:if test="./INPC and (not(starts-with(lower-case(normalize-space(./INPC)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPC)), 'n.r')))">
					<arco-cd:inventoryIdentifier>
						<xsl:value-of select="normalize-space(./INPC)" />
					</arco-cd:inventoryIdentifier>
				</xsl:if>
				<!-- responsible of inventory identifier -->
				<xsl:if test="./INPE and (not(starts-with(lower-case(normalize-space(./INPE)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPE)), 'n.r')))">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
					<arco-cd:hasInventoryIdentifierResponsible>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./INPE))" />
						</xsl:attribute>
					</arco-cd:hasInventoryIdentifierResponsible>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./INPE and (not(starts-with(lower-case(normalize-space(./INPE)), 'nr')) and not(starts-with(lower-case(normalize-space(./INPE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-number-responsible')" />
						</xsl:attribute>
					</owl:sameAs>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Responsabile del numero di inventario del bene ', $itemURI, ': ', normalize-space(./INPE))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Responsible for inventory identifier of cultural property ', $itemURI, ': ', normalize-space(./INPE))" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
						</xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./INPE))" />
						</xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
						</xsl:attribute>
					</owl:sameAs>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Responsabile del numero di inventario'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Inventory Identifier Responsible'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
						</xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/UB/INV">
		<xsl:if test="./*">
			<xsl:if test="not(./INVP) or (starts-with(lower-case(normalize-space(./INVP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./INVP)), 'nr')) or (starts-with(lower-case(normalize-space(./INVP)), 'n.r')) or (starts-with(lower-case(normalize-space(./INVP)), 'intero')) or (starts-with(lower-case(normalize-space(./INVP)), 'intera'))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InventorySituation/', $itemURI, '-', position())" />
					</xsl:attribute>
					<arco-cd:inventoryIdentifier>
						<xsl:value-of select="normalize-space(./INVN)" />
					</arco-cd:inventoryIdentifier>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<!-- Laboratory test -->
	<xsl:for-each select="record/metadata/schede/*/*/ALB">
		<xsl:variable name="test-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
			</xsl:attribute>
			<xsl:if test="./ALBO">
				<arco-cd:hasActivityOperator>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ALBO))" />
					</xsl:attribute>
				</arco-cd:hasActivityOperator>
			</xsl:if>
			<xsl:if test="./ALBE">
				<arco-cd:hasActivityResponsible>
					<xsl:attribute name="rdf:resource">
	   	    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ALBE))" />
					</xsl:attribute>
				</arco-cd:hasActivityResponsible>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>	          
	<!-- Legal situation of cultural property as an individual -->
	<xsl:if test="record/metadata/schede/*/TU/CDG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/TU/CDG/CDGG)))" />
			</xsl:attribute>
			<xsl:for-each select="record/metadata/schede/*/TU/CDG/CDGS">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		          		</xsl:attribute>
					</arco-cd:hasOwner>
				</xsl:if>
			</xsl:for-each>
		</rdf:Description>
	</xsl:if>
	<!-- catalogue record -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
			<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
		</xsl:attribute>
		<xsl:if test="record/metadata/schede/*/CD/NCT/NCTN">
			<arco-catalogue:catalogueRecordIdentifier>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/RV/RVE/RVEL">
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', record/metadata/schede/*/RV/RVE/RVEL)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
					</xsl:otherwise>
				</xsl:choose>
			</arco-catalogue:catalogueRecordIdentifier>
		</xsl:if>
		<!-- system record code -->
		<arco-catalogue:systemRecordCode>
			<xsl:value-of select="$item" />
		</arco-catalogue:systemRecordCode>
		<!-- catalogue record version -->
				<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR or record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/CMC">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CM/CMR">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CM/RVM">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/CM/AGG">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:for-each>
	</rdf:Description>
	<xsl:if test="record/metadata/schede/*/CM/CMR or record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR  or record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/CMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
			</xsl:attribute>
			<arco-catalogue:isCatalogueRecordVersionOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
				</xsl:attribute>
			</arco-catalogue:isCatalogueRecordVersionOf>
			<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<arco-catalogue:hasCatalogueRecordVersionRiT>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-compilation-', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersionRiT>
					<arco-catalogue:hasResponsibleResearchAndCompilation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-catalogue:hasResponsibleResearchAndCompilation>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/CM/RSR">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<arco-catalogue:hasCatalogueRecordVersionRiT>
						<xsl:attribute name="rdf:resource">
	                              <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                           </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasScientificDirector>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasScientificDirector>
						</xsl:if>
					</xsl:for-each>
					<!-- Funzionario responsabile -->
					<xsl:for-each select="record/metadata/schede/*/CM/FUR">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasOfficialInCharge>
								<xsl:attribute name="rdf:resource">	
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-catalogue:hasOfficialInCharge>
						</xsl:if>
					</xsl:for-each>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/CM/RVM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
			</xsl:attribute>
			<arco-catalogue:isCatalogueRecordVersionOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
				</xsl:attribute>
			</arco-catalogue:isCatalogueRecordVersionOf>
			<xsl:for-each select="record/metadata/schede/*/CM/RVM/RVMN[not(starts-with(lower-case(normalize-space(.)), 'nr') or starts-with(lower-case(normalize-space(.)), 'n.r'))]">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:arcofy(.))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordVersionRiT>
						<arco-catalogue:hasDigitalTranscriptionOperator>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                            </xsl:attribute>
						</arco-catalogue:hasDigitalTranscriptionOperator>
					</xsl:for-each>
					<!-- Catalogue record version Role in Time -->
					<xsl:if test="record/metadata/schede/*/CM/RVM/RVME">
						<arco-catalogue:hasCatalogueRecordVersionRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:arcofy(record/metadata/schede/*/CM/RVM/RVME))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordVersionRiT>
						<arco-catalogue:hasDigitalTranscriptionResponsibleAgent>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/*/CM/RVM/RVME))" />
                            </xsl:attribute>
						</arco-catalogue:hasDigitalTranscriptionResponsibleAgent>
					</xsl:if>
					<!-- Referente verifica scientifica -->
					<xsl:for-each select="record/metadata/schede/*/CM/RSR">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasScientificDirector>
								<xsl:attribute name="rdf:resource">
                        	        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                            	</xsl:attribute>
							</arco-catalogue:hasScientificDirector>
						</xsl:if>
					</xsl:for-each>
					<!-- Funzionario responsabile -->
					<xsl:for-each select="record/metadata/schede/*/CM/FUR">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasOfficialInCharge>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasOfficialInCharge>
						</xsl:if>
					</xsl:for-each>
		</rdf:Description>
	</xsl:if>
	<!-- Catalogue record version AGG and individuals-->
	<xsl:for-each select="record/metadata/schede/*/CM/AGG">
		<!-- Catalogue record version as individual -->
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
			</xsl:attribute>
			<arco-catalogue:isCatalogueRecordVersionOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
				</xsl:attribute>
			</arco-catalogue:isCatalogueRecordVersionOf>
			<xsl:for-each select="./AGGN">
						<xsl:if test=".">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasUpdateResponsibleResearchAndCompilation>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasUpdateResponsibleResearchAndCompilation>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="./AGGR">
						<xsl:if test=".">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:arcofy(normalize-space(.)))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasUpdateScientificRevisor>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasUpdateScientificRevisor>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="./AGGE">
						<xsl:if test=".">
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-catalogue:hasUpdateResponsibleAgent>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-catalogue:hasUpdateResponsibleAgent>
						</xsl:if>
					</xsl:for-each>
		</rdf:Description>
	</xsl:for-each>
	<!-- other cultural property records -->
	<xsl:for-each select="record/metadata/schede/*/AC/ACS">
		<xsl:if test="./*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalPropertyRecord/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/catalogue/CulturalPropertyRecord" />
				<xsl:if test="./ACSC">
					<arco-catalogue:culturalPropertyRecordIdentifier>
						<xsl:value-of select="normalize-space(./ACSC)" />
					</arco-catalogue:culturalPropertyRecordIdentifier>
				</xsl:if>
				<xsl:if test="./ACSE and (not(starts-with(lower-case(normalize-space(./ACSE)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACSE)), 'n.r')))">
					<arco-cd:hasCulturalPropertyRecordResponsibleAgent>
						<xsl:attribute name="rdf:resource">
			              		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./ACSE))" />
			              	</xsl:attribute>
					</arco-cd:hasCulturalPropertyRecordResponsibleAgent>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Authorship -->
	<!-- authorship attribution as an individual -->
	<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
		<!-- We add the cultural scope attribution as an individual. -->
		<xsl:for-each select="record/metadata/schede/*/AU/ATB">
			<xsl:if test="(not(starts-with(lower-case(normalize-space(./ATBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATBD)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
              	        <xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Responsibility/', $itemURI, '-cultural-scope-', position())" />
						</xsl:attribute>
					</owl:sameAs>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                           	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalScopeAttribution'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-cd:isAuthorshipAttributionOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-cd:isAuthorshipAttributionOf>
					<xsl:if test="./ATBD and not(lower-case(normalize-space(./ATBD))='nr' or lower-case(normalize-space(./ATBD))='n.r.' or lower-case(normalize-space(./ATBD))='nr (recupero pregresso)')">
						<arco-cd:hasCulturalScope>
							<xsl:attribute name="rdf:resource">
                               	<xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./ATBD)))" />
							</xsl:attribute>
						</arco-cd:hasCulturalScope>
					</xsl:if>
					<xsl:if test="./ATBR and (not(starts-with(lower-case(normalize-space(./ATBR)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATBR)), 'n.r')))">
						<arco-cd:hasInterventionRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./ATBR)))" />
							</xsl:attribute>
						</arco-cd:hasInterventionRole>
					</xsl:if>
					<xsl:if test="./ATBS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./ATBS)" />
						</arco-core:note>
					</xsl:if>
					<xsl:for-each select="./ATBM[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]"><!-- allow multiple values es: ICCD11268160 -->
						<arco-cd:hasInterpretationCriterion>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
							</xsl:attribute>
						</arco-cd:hasInterpretationCriterion>
					</xsl:for-each>
					<xsl:if test="contains((./ATBD), '?')">
						<arco-cd:uncertainAuthorshipAttribution>
							<xsl:value-of select="true()" />
						</arco-cd:uncertainAuthorshipAttribution>
					</xsl:if>
				</rdf:Description>
				<!-- We add the cultural scope attribution source as an individual. -->
				<xsl:for-each select="./ATBM[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]"><!-- allow multiple values es: ICCD11268160 -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/InterpretationCriterion" />
						<rdfs:label>
							<xsl:value-of select="normalize-space()" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space()" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
		<!-- AU/AUT -->
		<xsl:for-each select="record/metadata/schede/*/AU/AUT">
			<xsl:if test="(not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTN)), '-')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				   		<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
						</xsl:attribute>
					</owl:sameAs>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	         	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PreferredAuthorshipAttribution'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-cd:isAuthorshipAttributionOf>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$culturalProperty" /> 
						</xsl:attribute>
					</arco-cd:isAuthorshipAttributionOf>
					<xsl:if test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')))">
						<arco-cd:hasAttributedAuthor>
							<xsl:attribute name="rdf:resource">
                	          	<xsl:variable name="author">
									<xsl:choose>
										<xsl:when test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
										</xsl:when>
										<xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:value-of select="$author" />     
							</xsl:attribute>
						</arco-cd:hasAttributedAuthor>
					</xsl:if>
					<xsl:if test="contains((./AUTN), '?')">
						<arco-cd:uncertainAuthorshipAttribution>
							<xsl:value-of select="true()" />
						</arco-cd:uncertainAuthorshipAttribution>
					</xsl:if>
					<xsl:if test="./AUTR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.' or lower-case(normalize-space(./AUTR))='nr [non rilevabile]' or lower-case(normalize-space(./AUTR))='n.r. (non rilevabile)')">
						<arco-cd:hasInterventionRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
							</xsl:attribute>
						</arco-cd:hasInterventionRole>
					</xsl:if>
					<xsl:if test="./AUTY and (not(starts-with(lower-case(normalize-space(./AUTY)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTY)), 'n.r')))">
						<arco-cd:authorIntervention>
							<xsl:value-of select="normalize-space(./AUTY)" />
						</arco-cd:authorIntervention>
					</xsl:if>
					<xsl:if test="./AUTZ">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AUTZ)" />
						</arco-core:note>
					</xsl:if>
					<xsl:for-each select="./AUTM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD13074493 -->
						<arco-cd:hasInterpretationCriterion>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
							</xsl:attribute>
						</arco-cd:hasInterpretationCriterion>
					</xsl:for-each>
				</rdf:Description>
				<xsl:for-each select="./AUTM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD13074493 -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
						</xsl:attribute>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space()" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space()" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<!-- AU/AAU -->
	<xsl:for-each select="record/metadata/schede/*/AU/AAU">
		<xsl:if test="./AAUN and (not(starts-with(lower-case(normalize-space(./AAUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AAUN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AAUN)), '-')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PreferredAuthorshipAttribution'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-cd:isAuthorshipAttributionOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-cd:isAuthorshipAttributionOf>
				<xsl:if test="./AAUN and (not(starts-with(lower-case(normalize-space(./AAUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AAUN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AAUN)), '-')))">
					<arco-cd:hasAttributedAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
						</xsl:attribute>
					</arco-cd:hasAttributedAuthor>
				</xsl:if>
				<xsl:if test="contains((./AUUN), '?')">
					<arco-cd:uncertainAuthorshipAttribution>
						<xsl:value-of select="true()" />
					</arco-cd:uncertainAuthorshipAttribution>
				</xsl:if>
				<xsl:if test="./AAUR and not(lower-case(normalize-space(./AAUR))='nr' or lower-case(normalize-space(./AAUR))='nr (recupero pregresso)' or lower-case(normalize-space(./AAUR))='n.r.' or lower-case(normalize-space(./AAUR))='nr [non rilevabile]' or lower-case(normalize-space(./AAUR))='n.r. (non rilevabile)')">
					<arco-cd:hasInterventionRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AAUR)))" />
						</xsl:attribute>
					</arco-cd:hasInterventionRole>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- AU/AUF (F version 2.00, 3.00 and BDM) -->
	<xsl:for-each select="record/metadata/schede/*/AU/AUF">
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
		<xsl:if test="./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-photographer-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PreferredAuthorshipAttribution'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di autore di fotografia preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di autore di fotografia preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Preferred photograph authorship attribution of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Preferred photograph authorship attribution of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-cd:isAuthorshipAttributionOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-cd:isAuthorshipAttributionOf>
				<xsl:if test="./AUFK">
					<arco-core:specifications>
						<xsl:value-of select="./AUFK" />
					</arco-core:specifications>
				</xsl:if>
				<xsl:if test="(./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r'))) 
				or (./AUFB and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')))">
					<arco-cd:hasAttributedAuthor>
						<xsl:attribute name="rdf:resource">
	    					<xsl:value-of select="$author" />
						</xsl:attribute>
					</arco-cd:hasAttributedAuthor>
				</xsl:if>
				<xsl:if test="contains((./AUFN), '?')">
					<arco-cd:uncertainAuthorshipAttribution>
						<xsl:value-of select="true()" />
					</arco-cd:uncertainAuthorshipAttribution>
				</xsl:if>
				<xsl:if test="./AUFR and not(lower-case(normalize-space(./AUFR))='nr' or lower-case(normalize-space(./AUFR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUFR))='n.r.' or lower-case(normalize-space(./AUFR))='nr [non rilevabile]' or lower-case(normalize-space(./AUFR))='n.r. (non rilevabile)')">
					<arco-cd:hasInterventionRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUFR)))" />
						</xsl:attribute>
					</arco-cd:hasInterventionRole>
				</xsl:if>
				<xsl:for-each select="./AUFM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />  
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:for-each>
			</rdf:Description>
			<xsl:for-each select="./AUFM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />                         	
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space()" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space()" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
	<!-- AU/AFB (F version 2.00, 3.00) -->
	<xsl:for-each select="record/metadata/schede/*/AU/AFB">
		<xsl:if test="(not(starts-with(lower-case(normalize-space(./AFBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./AFBD)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Responsibility'" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
				       <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalScopeAttribution'" />
				   </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-cd:isAuthorshipAttributionOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-cd:isAuthorshipAttributionOf>
				<xsl:if test="./AFBD and not(lower-case(normalize-space(./AFBD))='nr' or lower-case(normalize-space(./AFBD))='n.r.' or lower-case(normalize-space(./AFBD))='nr (recupero pregresso)')">
					<arco-cd:hasCulturalScope>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./AFBD)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalScope>
				</xsl:if>
				<xsl:if test="contains((./AFBD), '?')">
					<arco-cd:uncertainAuthorshipAttribution>
						<xsl:value-of select="true()" />
					</arco-cd:uncertainAuthorshipAttribution>
				</xsl:if>
				<xsl:for-each select="./AFBM[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:for-each>
				<xsl:if test="contains((./AFBD), '?')">
					<arco-cd:dubiuosAuthorshipAttribution>
						<xsl:value-of select="true()" />
					</arco-cd:dubiuosAuthorshipAttribution>
				</xsl:if>
			</rdf:Description>
			<!-- We add the cultural scope attribution source as an individual. -->
			<xsl:for-each select="./AFBM[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='nr (recupero pregresso)' or lower-case(normalize-space())='n.r.')]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/context-description/InterpretationCriterion" />
					<rdfs:label>
						<xsl:value-of select="normalize-space()" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space()" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
	<!-- AU/AAF (F version 2.00, 3.00) -->
	<xsl:for-each select="record/metadata/schede/*/AU/AAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
     			<xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'AlternativeResponsibility/', $itemURI, '-', position())" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AlternativeAuthorshipAttribution'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
			</l0:name>
			<arco-cd:isAuthorshipAttributionOf>
				<xsl:attribute name="rdf:resource"> 
					<xsl:value-of select="$culturalProperty" /> 
				</xsl:attribute>
			</arco-cd:isAuthorshipAttributionOf>
			<arco-cd:hasAttributedAuthor>
				<xsl:attribute name="rdf:resource">
	               	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
			</arco-cd:hasAttributedAuthor>
			<xsl:if test="contains((./AAF), '?')">
				<arco-cd:uncertainAuthorshipAttribution>
					<xsl:value-of select="true()" />
				</arco-cd:uncertainAuthorshipAttribution>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
	<!--alternative authorship -->
	<xsl:for-each select="record/metadata/schede/*/AU/AAT">
		<xsl:if test="not(record/metadata/schede/*/AU/AAT/*)">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
        		</xsl:attribute>
        		<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AlternativeResponsibility/', $itemURI, '-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AlternativeAuthorshipAttribution'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-cd:isAuthorshipAttributionOf>
					<xsl:attribute name="rdf:resource"> 
						<xsl:value-of select="$culturalProperty" /> 
					</xsl:attribute>
				</arco-cd:isAuthorshipAttributionOf>
				<arco-cd:hasAttributedAuthor>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            </xsl:attribute>
				</arco-cd:hasAttributedAuthor>
				<xsl:if test="contains((.), '?')">
					<arco-cd:uncertainAuthorshipAttribution>
						<xsl:value-of select="true()" />
					</arco-cd:uncertainAuthorshipAttribution>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- sex estimate -->
	<xsl:if test="record/metadata/schede/AT/DA/STS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'SexInterpretation/', $itemURI)" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Sex/', $itemURI)" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SexInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Stima del sesso della morte del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/STS/STSS))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Stima del sesso del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/STS/STSS))" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sex interpretation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/STS/STSS))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Sex interpretation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/STS/STSS))" />
			</l0:name>
			<arco-cd:sex>
				<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS/STSS)" />
			</arco-cd:sex>
			<xsl:if test="record/metadata/schede/AT/DA/STS/STSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'n.r')) and not(record/metadata/schede/AT/DA/STS/STSC='-'))">
				<arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/STS/STSC)))" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/AT/DA/STS/STSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/STS/STSC)), 'n.r')) and not(record/metadata/schede/AT/DA/STS/STSC='-'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/STS/STSC)))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS/STSC)" />
				</rdfs:label>
				<l0:name> 
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/STS/STSC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- age of death estimate -->
	<xsl:if test="record/metadata/schede/AT/DA/SEM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeOfDeathInterpretation/', $itemURI)" />
			</xsl:attribute>
			<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			<owl:sameAs>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Age/', $itemURI)" />
				</xsl:attribute>
			</owl:sameAs>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AgeOfDeathInterpretation'" />
                </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Stima dell''età della morte del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/SEM/SEME))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Stima dell''età della morte del bene culturale ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/SEM/SEME))" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age of death interpretation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/SEM/SEME))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age of death interpretation of cultural property ', $itemURI, ': ', normalize-space(record/metadata/schede/AT/DA/SEM/SEME))" />
			</l0:name>
			<arco-cd:ageOfDeath>
				<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEME)" />
			</arco-cd:ageOfDeath>
			<xsl:if test="record/metadata/schede/AT/DA/SEM/SEMC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)), 'n.r')) and not(record/metadata/schede/AT/DA/SEM/SEMC='-'))">
				<arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)))" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/AT/DA/SEM/SEMC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)), 'n.r')) and not(record/metadata/schede/AT/DA/SEM/SEMC='-'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)))" />
                </xsl:attribute>
                <owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/AT/DA/SEM/SEMC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- subject -->
	<xsl:for-each select="record/metadata/schede/*/*/SGT">
		<xsl:if test="$sheetType='PST' or 'SMO'">
			<xsl:for-each select="./SGTI[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD13074493 -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	           			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<owl:sameAs>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</owl:sameAs>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
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
					<arco-cd:isSubjectOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-cd:isSubjectOf>
					<xsl:if test="../SGTP">
						<arco-dd:positionOnCulturalProperty>
							<xsl:value-of select="../SGTP" />
						</arco-dd:positionOnCulturalProperty>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/*/THS/THSD">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
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
				<arco-cd:isSubjectOf>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
				</arco-cd:isSubjectOf>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/NU/DA/DES/DESU">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
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
				<arco-cd:isSubjectOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
				</arco-cd:isSubjectOf>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/DA/AID/AIDI">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Subject'" />
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
				<arco-cd:isSubjectOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
				</arco-cd:isSubjectOf>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Technical characteristic of cultural property as an individual -->
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'n.r'))">
		<xsl:if test="record/metadata/schede/*/MT/FIL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FIL)))" />
            	</xsl:attribute>
            	<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Filigree/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FIL)))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/MT/FIL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/MT/FIL)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Filigree'" />
            		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'n.r'))">
		<xsl:if test="record/metadata/schede/F/MT/FVC/FVCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)))" />
            	</xsl:attribute>
            	<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCF)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/FileFormat'" />
            		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'n.r'))">
		<xsl:if test="record/metadata/schede/F/MT/FVC/FVCP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)))" />
            	</xsl:attribute>
            	<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Software/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCP)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhotoProgram'" />
            		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'n.r'))">
		<xsl:if test="record/metadata/schede/F/MT/FVC/FVCU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)))" />
            	</xsl:attribute>
            	<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-resolution')" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCU)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCU)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Resolution'" />
            		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'n.r'))">
		<xsl:if test="record/metadata/schede/F/MT/FVC/FVCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)))" />
            	</xsl:attribute>
            	<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-pixel-dimension')" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/F/MT/FVC/FVCM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PixelDimension'" />
            		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- urban planning instrument -->
	<xsl:for-each select="record/metadata/schede/*/TU/STU">
		<xsl:variable name="upinstrument-position">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'UrbanPlanningInstrument/', $itemURI, '-urban-planning-instrument-', position())" />
			</xsl:attribute>
			<xsl:if test="./STUE and (not(starts-with(lower-case(normalize-space(./STUE)), 'nr')) and not(starts-with(lower-case(normalize-space(./STUE)), 'n.r')))">
				<arco-cd:hasIssuingAgency>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./STUE))" />
					</xsl:attribute>
				</arco-cd:hasIssuingAgency>
			</xsl:if>
			<xsl:if test="./STUN and (not(starts-with(lower-case(normalize-space(./STUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./STUN)), 'n.r')))">
				<arco-cd:hasEligibleIntervention>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'EligibleIntervention/', arco-fn:urify(normalize-space(./STUN)))" />
					</xsl:attribute>
				</arco-cd:hasEligibleIntervention>
			</xsl:if>
		</rdf:Description>
		<!-- eligible intervention of u.p.instrument as an individual -->
		<xsl:if test="./STUN and (not(starts-with(lower-case(normalize-space(./STUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./STUN)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'EligibleIntervention/', arco-fn:urify(normalize-space(./STUN)))" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./STUN)))" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/EligibleIntervention'" />
				</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./STUN)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./STUN)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- Use of cultural property -->
	<xsl:if test="not(record/metadata/schede/A/UT or record/metadata/schede/PG/UT)">
		<xsl:for-each select="record/metadata/schede/*/UT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
				</xsl:attribute>
				<xsl:if test="./UTA and (not(starts-with(lower-case(normalize-space(./UTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./UTA)), 'n.r')))">
					<arco-cd:isKeptIn>
						<xsl:value-of select="normalize-space(./UTA)" />
					</arco-cd:isKeptIn>
				</xsl:if>
				<xsl:for-each select="(./UTU/UTUD|./UTS)[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<tiapit:time>
						<xsl:value-of select="normalize-space()"/>
					</tiapit:time>
				</xsl:for-each>
				<xsl:for-each select="(./UTU/UTUF|./UTF)[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-cd:useFunction>
						<xsl:value-of select="normalize-space()"/>
					</arco-cd:useFunction>
				</xsl:for-each>
				<xsl:for-each select="./UTU/UTUT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or .='.' or .='-' or .='/')]"><!-- allow multiple values eg:ICCD14298501 (context is lost) -->
					<arco-cd:hasUseType>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space())='attuale'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CurrentUse'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space())='precedente'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PreviousUse'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space())='storico'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalUse'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space())='dato non disponibile'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseTypeUnavailable'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'UseType/', arco-fn:urify(normalize-space()))" />
								</xsl:otherwise>
							</xsl:choose>
	                	</xsl:attribute>
					</arco-cd:hasUseType>
				</xsl:for-each>
				<xsl:if test="./UTU/UTUS and (not(starts-with(lower-case(normalize-space(./UTU/UTUS)), 'nr')) and not(starts-with(lower-case(normalize-space(./UTU/UTUS)), 'n.r')))">
					<arco-cd:hasUseTypeSpecification>
						<xsl:attribute name="rdf:resource">
	                		<xsl:if test="./UTU/UTUS and not(./UTU/UTUS='.' or ./UTU/UTUS='-' or ./UTU/UTUS='/')">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='edilizio'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/BuildingUse'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='epigrafico'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/EpigraphicUse'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='strutturale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/StructuralUse'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='ornamentale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/OrnamentalUse'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='strumentale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InstrumentalUse'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='reimpiego'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Reuse'" />
									</xsl:when>
									<xsl:when test="./UTU/UTUS">
										<xsl:value-of select="concat($NS, 'UseTypeSpecification/', arco-fn:urify(normalize-space(./UTU/UTUS)))" />
									</xsl:when>
								</xsl:choose>
                    		</xsl:if>
	                	</xsl:attribute>
					</arco-cd:hasUseTypeSpecification>
				</xsl:if>
				<xsl:for-each select="./UTN">
					<xsl:if test=".">
						<arco-cd:hasUser>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./UTNN">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./UTNN))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'Agent/', $itemURI, '-user-', position())" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-cd:hasUser>
					</xsl:if>
				</xsl:for-each>	
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/DA/UTM or record/metadata/schede/*/DA/UTF or record/metadata/schede/*/DA/UTS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use')" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/*/DA/UTF">
				<arco-cd:useFunction>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/UTF)" />
				</arco-cd:useFunction>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DA/UTM">
				<arco-cd:useConditions>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/UTM)" />
				</arco-cd:useConditions>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/US/USO">
		<xsl:if test="./*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
           			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
           		</xsl:attribute>
           		<xsl:for-each select="./USOD[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"> <!-- allow multiple values eg:ICCD14295730  -->
					<arco-cd:useFunction>
						<xsl:value-of select="normalize-space()" />
					</arco-cd:useFunction>
				</xsl:for-each>
				<xsl:if test="./USOC and (not(starts-with(lower-case(normalize-space(./USOC)), 'nr')) and not(starts-with(lower-case(normalize-space(./USOC)), 'n.r')))">
					<tiapit:time>
						<xsl:value-of select="normalize-space(./USOC)" />
					</tiapit:time>
				</xsl:if>
				<arco-cd:hasUseType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalUse'" />
					</xsl:attribute>
				</arco-cd:hasUseType>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/US/USA">
		<xsl:if test="./*">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-current-use-', position())" />
				</xsl:attribute>
				<xsl:if test="./USAD and (not(starts-with(lower-case(normalize-space(./USAD)), 'nr')) and not(starts-with(lower-case(normalize-space(./USAD)), 'n.r')))">
					<arco-cd:useFunction>
						<xsl:value-of select="normalize-space(./USAD)" />
					</arco-cd:useFunction>
				</xsl:if>
				<arco-cd:hasUseType>
					<xsl:attribute name="rdf:resource">
				       <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CurrentUse'" />
					</xsl:attribute>
				</arco-cd:hasUseType>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<!-- fruition (VeAC) as an individual -->
	<xsl:if test="record/metadata/schede/*/AU/FRU">
		<xsl:for-each select="record/metadata/schede/*/AU/FRU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
				</xsl:attribute>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
				<owl:sameAs>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-clothing-use-', position())" />
					</xsl:attribute>
				</owl:sameAs>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Fruition'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<xsl:if test="./FRUD and (not(starts-with(lower-case(normalize-space(./FRUD)), 'nr')) and not(starts-with(lower-case(normalize-space(./FRUD)), 'n.r')))">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./FRUD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="./FRUN and (not(starts-with(lower-case(normalize-space(./FRUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./FRUN)), 'n.r')))">
					<arco-cd:hasUser>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FRUN))" />
						</xsl:attribute>
					</arco-cd:hasUser>
				</xsl:if>
				<xsl:if test="./FRUC and (not(starts-with(lower-case(normalize-space(./FRUC)), 'nr')) and not(starts-with(lower-case(normalize-space(./FRUC)), 'n.r')))">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./FRUC)))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:if>
				<xsl:if test="./FRUF and (not(starts-with(lower-case(normalize-space(./FRUF)), 'nr')) and not(starts-with(lower-case(normalize-space(./FRUF)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./FRUF)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./FRUF and (not(starts-with(lower-case(normalize-space(./FRUF)), 'nr')) and not(starts-with(lower-case(normalize-space(./FRUF)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./FRUF)))" />
					</xsl:attribute>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./FRUF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./FRUF)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/LC/LDC/*">
		<xsl:variable name="site">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
					<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)))))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/LC/LDC/LDCK">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCK)))))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/*/LC/LDC/LDCN and starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), 'nr') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '-') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '(*)') and starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '(?)') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '(denominazione assente)') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '?') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '.') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '590977') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), '63904') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), 'non id.') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), 'non identificabile') or starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCN)), 'n.r')">
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCT)))))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCN)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$site" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/*/LC/LDC/LDCF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)), 'n.r')))">
				<arco-cd:hasUseFunction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)))" />
					</xsl:attribute>
				</arco-cd:hasUseFunction>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/LC/LDC/LDCF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(record/metadata/schede/*/LC/LDC/LDCF)))" />
				</xsl:attribute>
				<arco-cd:useFunction>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LC/LDC/LDCF)" />
				</arco-cd:useFunction>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/LA">
		<xsl:if test="./PRC/*">
			<xsl:variable name="site">
				<xsl:choose>
					<xsl:when test="./PRV/PRVG and not(lower-case(normalize-space(./PRV/PRVG))='europa')">
						<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(./PRV/PRVG), normalize-space(./PRV/PRVA), normalize-space(./PRV/PRVS), normalize-space(./PRV/PRVR), normalize-space(./PRV/PRVE), normalize-space(./PRL))))" />
					</xsl:when>
					<xsl:when test="./PRV/PRVS and not(lower-case(normalize-space(./PRV/PRVS))='italia')">
						<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(./PRV/PRVS), normalize-space(./PRV/PRVE), normalize-space(./PRL))))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="./PRC/PRCK">
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./PRV/PRVP)), normalize-space(lower-case(./PRV/PRVC)), normalize-space(lower-case(./PRV/PRVF)), normalize-space(lower-case(./PRV/PRVL)), normalize-space(lower-case(./PRC/PRCU)), normalize-space(lower-case(./PRC/PRCK)), normalize-space(lower-case(./PRC/PRCT)))))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Site/', arco-fn:arcofy(concat(normalize-space(lower-case(./PRV/PRVP)), normalize-space(lower-case(./PRV/PRVC)), normalize-space(lower-case(./PRV/PRVF)), normalize-space(lower-case(./PRV/PRVL)), normalize-space(lower-case(./PRC/PRCU)), normalize-space(lower-case(./PRC/PRCD)), normalize-space(lower-case(./PRC/PRCN)), normalize-space(lower-case(./PRC/PRCT)))))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$site" />
				</xsl:attribute>
				<xsl:if test="./PRC/PRCF and (not(starts-with(lower-case(normalize-space(./PRC/PRCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./PRC/PRCF)), 'n.r')))">
					<arco-cd:hasUseFunction>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./PRC/PRCF)))" />
						</xsl:attribute>
					</arco-cd:hasUseFunction>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./PRC/PRCF and (not(starts-with(lower-case(normalize-space(./PRC/PRCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./PRC/PRCF)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(./PRC/PRCF)))" />
					</xsl:attribute>
					<arco-cd:useFunction>
						<xsl:value-of select="normalize-space(./PRC/PRCF)" />
					</arco-cd:useFunction>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
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
					<xsl:if test="./ROFI and (not(starts-with(lower-case(normalize-space(./ROFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFI)), 'n.r')))">
						<arco-cd:inventoryIdentifier>
							<xsl:value-of select="normalize-space(./ROFI)" />
						</arco-cd:inventoryIdentifier>
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
					<xsl:if test="./ROFI and (not(starts-with(lower-case(normalize-space(./ROFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFI)), 'n.r')))">
						<arco-cd:inventoryIdentifier>
							<xsl:value-of select="normalize-space(./ROFI)" />
						</arco-cd:inventoryIdentifier>
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
					<xsl:if test="./ROFI and (not(starts-with(lower-case(normalize-space(./ROFI)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFI)), 'n.r')))">
						<arco-cd:inventoryIdentifier>
							<xsl:value-of select="normalize-space(./ROFI)" />
						</arco-cd:inventoryIdentifier>
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
	<!-- archaeological excavation -->
	<xsl:if test="not(record/metadata/schede/*/*/DSC/DSCD='0000/00/00' or record/metadata/schede/*/*/DSC/DSCD='/') and record/metadata/schede/*/*/DSC/*">
		<xsl:for-each select="record/metadata/schede/*/*/DSC">
			<xsl:variable name="survey-position">
				<xsl:value-of select="position()" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ArchaeologicalExcavation/', $itemURI, '-survey-', position())" />
				</xsl:attribute>
				<xsl:if test="./DSCI and (not(starts-with(lower-case(normalize-space(./DSCI)), 'nr')) and not(starts-with(lower-case(normalize-space(./DSCI)), 'n.r')))">
					<arco-cd:inventoryIdentifier>
						<xsl:value-of select="normalize-space(./DSCI)" />
					</arco-cd:inventoryIdentifier>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<!-- cadastral identity -->
	<xsl:for-each select="record/metadata/schede/*/CS">
		<xsl:variable name="parentPosition">
			<xsl:value-of select="position()" />
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
			</xsl:attribute>
			<xsl:for-each select="./CTS">
				<xsl:if test="./CTST and (not(starts-with(lower-case(normalize-space(./CTST)), 'nr')) and not(starts-with(lower-case(normalize-space(./CTST)), 'n.r')))">
					<arco-location:hasCadastreType>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto terreni'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/LandCadastre'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto fabbricati'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingCadastre'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./CTST))='catasto misto'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/BuildingAndLandCadastre'" />
								</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasCadastreType>
				</xsl:if>
			</xsl:for-each>
		</rdf:Description>
	</xsl:for-each>
	<!-- dating of cultural property -->
	<xsl:for-each select="record/metadata/schede/*/DT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			</xsl:attribute>
			<!-- Source of dating -->
			<xsl:for-each select="./DTM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!--  allow multiple sources es:ICCD11574733 -->
				<arco-cd:hasInterpretationCriterion>
					<xsl:choose>
						<xsl:when test="./DTMM">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DTMM)))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-cd:hasInterpretationCriterion>
			</xsl:for-each>
		</rdf:Description>
		<!-- Source of dating as individual -->
		<xsl:for-each select="./DTM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!--  allow multiple sources es:ICCD11574733 -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./DTMM">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./DTMM)))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./DTMM">
							<xsl:value-of select="normalize-space(./DTMM)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space()" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./DTMM">
							<xsl:value-of select="normalize-space(./DTMM)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space()" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<xsl:if test="./DTMS">
					<arco-core:specifications>
						<xsl:value-of select="normalize-space(./DTMS)" />
					</arco-core:specifications>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<!-- dating of cultural property for A norm -->
	<xsl:for-each select="record/metadata/schede/A/RE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			</xsl:attribute>
			<!-- Source of dating -->
			<xsl:for-each select="./REN/RENF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
				<arco-cd:hasInterpretationCriterion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
					</xsl:attribute>
				</arco-cd:hasInterpretationCriterion>
			</xsl:for-each>
		</rdf:Description>
		<!-- Source of dating as individual -->
		<xsl:for-each select="./REN/RENF[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space()" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space()" />
				</l0:name>
				<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>	
	<!-- dating for related work -->
	<xsl:if test="./ROFD and (not(starts-with(lower-case(normalize-space(./ROFD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFD)), 'n.r')))">
		<xsl:if test="./ROFD and (not(starts-with(lower-case(normalize-space(./ROFD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ROFD)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
				</xsl:attribute>
				<!-- Source of dating -->
				<xsl:for-each select="./ROFM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:for-each>
			</rdf:Description>
			<!-- Source of dating as individual -->
			<xsl:for-each select="./ROFM[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space()))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdfs:label>
						<xsl:value-of select="normalize-space()" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space()" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/OG/SGT/SGTT">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
				<xsl:if test="../SGTL and (not(starts-with(lower-case(normalize-space(../SGTL)), 'nr')) and not(starts-with(lower-case(normalize-space(../SGTL)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(../SGTL)))" />
	            		</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<!-- Title source as an individual -->
			<xsl:if test="../SGTL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
              			<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(../SGTL)))" />
                	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					<rdfs:label>
						<xsl:value-of select="normalize-space(../SGTL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(../SGTL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/OG/SGT/SGTR">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
				<xsl:if test="../SGTL and (not(starts-with(lower-case(normalize-space(../SGTL)), 'nr')) and not(starts-with(lower-case(normalize-space(../SGTL)), 'n.r')))">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(../SGTL)))" />
	       				</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<!-- Title source as an individual -->
			<xsl:if test="../SGTL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(../SGTL)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(../SGTL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(../SGTL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<!-- designation in time -->
	<xsl:if test="not($sheetType='MODI')">
		<xsl:for-each select="record/metadata/schede/*/OG/OGD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
					</xsl:attribute>
				</rdf:type>
				<xsl:if test="./OGDT and (not(starts-with(lower-case(normalize-space(./OGDT)), 'nr')) and not(starts-with(lower-case(normalize-space(./OGDT)), 'n.r')))">
					<arco-dd:hasDesignationType>
						<xsl:attribute name="rdf:resource">
		                     <xsl:choose>
		                     		<xsl:when test="lower-case(normalize-space(./OGDT))='attuale' or lower-case(normalize-space(./OGDT))='attuale di uso corrente' or lower-case(normalize-space(./OGDT))='attuale ufficiale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CurrentDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGDT)), 'attribuita')">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AssignedDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='altra lingua'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AlternativeDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='consuetudinaria'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CustomaryDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='dialettale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DialectalDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='gergale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SlangDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='idiomatica'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IdiomaticDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGDT))='locale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LocalDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGDT)), 'originaria')"> 
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/OriginalDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGDT)), 'storica')"> 
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalDesignation'" />
									</xsl:when>
									<xsl:when test="./OGDT">
										<xsl:value-of select="concat($NS, 'DesignationType/', arco-fn:urify(normalize-space(./OGDT)))" />
									</xsl:when>
							</xsl:choose>
	            		</xsl:attribute>
					</arco-dd:hasDesignationType>
				</xsl:if>
			</rdf:Description>
			<!-- designation type as an individual -->
			<xsl:if test="./OGDT and (not(starts-with(lower-case(normalize-space(./OGDT)), 'nr')) and not(starts-with(lower-case(normalize-space(./OGDT)), 'n.r')))">
				<xsl:choose>
					<xsl:when test="lower-case(normalize-space(./OGDT))='attuale'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='attuale ufficiale'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='attuale di uso corrente'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='idiomatica'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='gergale'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='dialettale'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='consuetudinaria'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='altra lingua'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='locale'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='storica'" />
					<xsl:when test="lower-case(normalize-space(./OGDT))='originaria'" />
					<xsl:when test="./OGDT and not(./OGDT='.' or ./OGDT='-' or ./OGDT='/')">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS,'DesignationType/', arco-fn:urify(normalize-space(./OGDT)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationType'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./OGDT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./OGDT)" />
							</l0:name>
							<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
						</rdf:Description>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/OG/OGA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(string-join(./OGAD,'-'))))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:if test="./OGAG and (not(starts-with(lower-case(normalize-space(./OGAG)), 'nr')) and not(starts-with(lower-case(normalize-space(./OGAG)), 'n.r')))">
				<arco-dd:hasDesignationType>
					<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(./OGAG))='attuale' or lower-case(normalize-space(./OGAG))='attuale di uso corrente' or lower-case(normalize-space(./OGAG))='attuale ufficiale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CurrentDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGAG)), 'attribuita')">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AssignedDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='altra lingua'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/AlternativeDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='consuetudinaria'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CustomaryDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='dialettale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/DialectalDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='gergale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SlangDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='idiomatica'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IdiomaticDesignation'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./OGAG))='locale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LocalDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGAG)), 'originaria')"> 
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/OriginalDesignation'" />
									</xsl:when>
									<xsl:when test="contains(normalize-space(lower-case(./OGAG)), 'storica')"> 
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalDesignation'" />
									</xsl:when>
									 <xsl:otherwise>
										<xsl:value-of select="concat($NS, 'DesignationType/', arco-fn:urify(normalize-space(./OGAG)))" />
									</xsl:otherwise>
								</xsl:choose>
	                </xsl:attribute>
				</arco-dd:hasDesignationType>
			</xsl:if>
		</rdf:Description>
		<!-- designation type as an individual -->
		<xsl:if test="./OGAG and (not(starts-with(lower-case(normalize-space(./OGAG)), 'nr')) and not(starts-with(lower-case(normalize-space(./OGAG)), 'n.r')))">
			<xsl:choose>
				<xsl:when test="lower-case(normalize-space(./OGAG))='attuale'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='attuale ufficiale'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='attuale di uso corrente'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='idiomatica'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='gergale'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='dialettale'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='consuetudinaria'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='altra lingua'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='locale'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='storica'" />
				<xsl:when test="lower-case(normalize-space(./OGAG))='originaria'" />
				<xsl:when test="./OGAG and not(./OGAG='.' or ./OGAG='-' or ./OGAG='/')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS,'DesignationType/', arco-fn:urify(normalize-space(./OGAG)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./OGAG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./OGAG)" />
						</l0:name>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">true</owl:deprecated>
					</rdf:Description>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>
	<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
         		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
				</xsl:attribute>
			</rdf:type>
			<arco-dd:hasDesignationInTimeType>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Original'" />
				</xsl:attribute>
			</arco-dd:hasDesignationInTimeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                      <xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(rrecord/metadata/schede/VeAC/OG/OGT/OGTS)))" />
                  </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
                      </xsl:attribute>
			</rdf:type>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="($sheetType='A' or $sheetType='PG') and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)))" />
			    </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
					</xsl:attribute>
				</rdf:type>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTU">
		<xsl:if test="not($sheetType='FF')">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space()))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                           <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
                       </xsl:attribute>
				</rdf:type>
				<arco-dd:hasDesignationType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalDesignation'" />
					</xsl:attribute>
				</arco-dd:hasDesignationType>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTY">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTY)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
                      </xsl:attribute>
			</rdf:type>
			<arco-dd:hasDesignationType>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalDesignation'" />
				</xsl:attribute>
			</arco-dd:hasDesignationType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
				</xsl:attribute>
			</rdf:type>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                      <xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTC)))" />
                  </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/DesignationInTime'" />
                      </xsl:attribute>
			</rdf:type>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="$sheetType='BNM'">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAO">
				<arco-spe:hasHostRock>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAO))" />
					</xsl:attribute>
				</arco-spe:hasHostRock>
			</xsl:if>
		</rdf:Description>
		<!-- Host rock as individual -->							
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAO">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/HostRock'" />
            		</xsl:attribute>
				</rdf:type>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:if>	
	
	<xsl:if test="$sheetType='CF'" >
		<xsl:variable name="idCF">
			<xsl:choose>
   				<xsl:when test="record/metadata/schede/*/CD/CCF and contains(record/metadata/schede/*/CD/CCF, 'DBunico')">
   					<xsl:value-of select="substring-after(record/metadata/schede/*/CD/CCF, 'DBunico')"/>
   				</xsl:when>
	  			<xsl:otherwise>
  					<xsl:value-of select="record/metadata/schede/*/CD/CCF"/>
  				</xsl:otherwise>
	  		</xsl:choose>
 		</xsl:variable>
		<xsl:variable name="contenitoreFisico" select="concat('http://dati.beniculturali.it/iccd/cf/resource/CulturalInstituteOrSite/', $idCF)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCF)" />
			</xsl:attribute>
			<!-- proprietà da deprecare -->
			<xsl:if test="record/metadata/schede/CF/CD/CCF">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="record/metadata/schede/CF/CD/CCF" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$contenitoreFisico" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
				</xsl:attribute>
			</rdf:type>
			<arco-catalogue:isDescribedByCatalogueRecord>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCF)" />
                </xsl:attribute>
			</arco-catalogue:isDescribedByCatalogueRecord>
			<xsl:if test="record/metadata/schede/*/CF/CFT">
				<arco-location:hasSiteType>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CF/CFQ">
								<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFQ)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFT)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-location:hasSiteType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CD/CFF">
				<arco-location:siteIdentifier>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CD/CFF)" />
				</arco-location:siteIdentifier>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/CF/CFN">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CF/CFN)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CF/CFA">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCF, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:for-each>	
		</rdf:Description>
	</xsl:if>
	<xsl:if test="$sheetType='CG'" >
		<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
		<xsl:variable name="contenitoreGiuridico" select="concat($NS, 'CulturalInstituteOrSite/', $idCG)" />
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$contenitoreGiuridico" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/*/CG/CGN">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGN)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/CG/CGA">
				<arco-dd:hasDesignationInTime>
					<xsl:attribute name="rdf:resource">
                       	<xsl:value-of select="concat($NS,'DesignationInTime/', $idCG, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
					</xsl:attribute>
				</arco-dd:hasDesignationInTime>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/CD/CCG">
				<arco-location:culturalInstituteOrSiteIdentifier>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/CD/CCG)" />
				</arco-location:culturalInstituteOrSiteIdentifier>
			</xsl:if>
							<!-- CIS Type -->
			<xsl:if test="record/metadata/schede/*/CG/CGT">
				<arco-location:hasCulturalInstituteOrSiteType>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CG/CGQ">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)), '-', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGQ)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSiteType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CG/CGT)))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</arco-location:hasCulturalInstituteOrSiteType>
			</xsl:if>
			<arco-catalogue:isDescribedByCatalogueRecord>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idCG)" />
                </xsl:attribute>
			</arco-catalogue:isDescribedByCatalogueRecord>
		</rdf:Description>	
	</xsl:if>  
	           
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>