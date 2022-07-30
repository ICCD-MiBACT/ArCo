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
				<xsl:otherwise>
					<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>	
	<!-- Cultural Property -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
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
	
	
		
	<!-- hasAuthor -->	
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >
		<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$culturalProperty" />
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