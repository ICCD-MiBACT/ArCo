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
	
	<xsl:if test="$sheetType='A' or $sheetType='PG'" >	
							<!-- Properties of ArchitecturalHeritage -->									
		<!-- 
		<xsl:variable name="fnst" select="normalize-space(record/metadata/schede/A/FN/FNS/FNST)" />
		<xsl:variable name="fnsq" select="normalize-space(record/metadata/schede/A/FN/FNS/FNSQ)" />
		<xsl:variable name="foundationType">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/A/FN/FNS/FNSQ">
					<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify(concat($fnst, '-', $fnsq)))" />	
				</xsl:when>
				<xsl:when test="record/metadata/schede/A/FN/FNS/FNST and not(record/metadata/schede/A/FN/FNS/FNSQ)">
					<xsl:value-of 	select="concat($NS, 'FoundationType/', arco-fn:urify($fnst))" />	
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		-->
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="$sheetType='A'">
				<rdf:type>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/A/SI/SII/SIIN or record/metadata/schede/A/SI/SII/SIIP">
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
			<xsl:if test="$sheetType='PG'">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/OpenSpace'" />
					</xsl:attribute>
				</rdf:type>
			</xsl:if>
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
			<xsl:for-each select="record/metadata/schede/A/SI/SII">
				<xsl:if test="./SIIN">
				<xsl:choose>
					<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
						<arco-ip:numberOfFloors>
							<xsl:value-of select="normalize-space(./SIIN)" />
						</arco-ip:numberOfFloors>
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
				<xsl:if test="./SIIV">
				<xsl:choose>
					<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
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
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
				<xsl:if test="./SIIP">
				<xsl:variable name="siip-virgola" select="./SIIP" />
				<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
				<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
				<xsl:choose>
					<xsl:when test="not(./SIIR) or ./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar'))">
						<xsl:for-each select="$floorssplit">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
    		    				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-core:hasPart>
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
			<xsl:for-each select="record/metadata/schede/A/PN">
				<xsl:if test="./PNT/PNTS or ./PNT/PNTF">
					<xsl:choose>	
						<xsl:when test="not(./PNR) or ./PNR='intero bene' or ./PNR='integrale' or ./PNR='tutta' or ./PNR='totale' or ./PNR='carattere generale' or (starts-with(lower-case(normalize-space(./PNR)), 'nr')) or (starts-with(lower-case(normalize-space(./PNR)), 'n.r')) or (starts-with(lower-case(normalize-space(./PNR)), 'intero')) or (starts-with(lower-case(normalize-space(./PNR)), 'intera')) or (starts-with(lower-case(normalize-space(./PNR)), 'esemplar'))">
						<xsl:variable name="layout"> 		
							<xsl:choose>
								<xsl:when test="./PNT/PNTS and ./PNT/PNTF">
									<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), '-', normalize-space(./PNT/PNTF))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), normalize-space(./PNT/PNTF))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
							<arco-ip:hasLayout>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$layout" />
								</xsl:attribute>
							</arco-ip:hasLayout>
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
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/A/FN/FNS">
				<xsl:choose>	
					<xsl:when test="not(./FNSU) or ./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or ./FNSU='carattere generale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
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
			<xsl:for-each select="record/metadata/schede/A/SV/SVC">
				<xsl:choose>	
					<xsl:when test="not(./SVCU) or ./SVCU='intero bene' or ./SVCU='integrale' or ./SVCU='tutta' or ./SVCU='totale' or ./SVCU='carattere generale' or (starts-with(lower-case(normalize-space(./SVCU)), 'nr')) or (starts-with(lower-case(normalize-space(./SVCU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intero')) or (starts-with(lower-case(normalize-space(./SVCU)), 'intera')) or (starts-with(lower-case(normalize-space(./SVCU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
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
			<xsl:for-each select="record/metadata/schede/A/SO">
				<xsl:choose>	
					<xsl:when test="not(./SOU) or ./SOU='intero bene' or ./SOU='integrale' or ./SOU='tutta' or ./SOU='totale' or ./SOU='carattere generale' or (starts-with(lower-case(normalize-space(./SOU)), 'nr')) or (starts-with(lower-case(normalize-space(./SOU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOU)), 'intero')) or (starts-with(lower-case(normalize-space(./SOU)), 'intera')) or (starts-with(lower-case(normalize-space(./SOU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
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
			<xsl:for-each select="record/metadata/schede/A/CP">
				<xsl:if test="./CPF/* or ./CPC/*">		
				<xsl:choose>	
					<xsl:when test="not(./CPU) or ./CPU='intero bene' or ./CPU='integrale' or ./CPU='tutta' or ./CPU='totale' or ./CPU='carattere generale' or (starts-with(lower-case(normalize-space(./CPU)), 'nr')) or (starts-with(lower-case(normalize-space(./CPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPU)), 'intero')) or (starts-with(lower-case(normalize-space(./CPU)), 'intera')) or (starts-with(lower-case(normalize-space(./CPU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
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
								<arco-ip:hasCovering>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
									</xsl:attribute>
								</arco-ip:hasCovering>
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
			<xsl:for-each select="record/metadata/schede/*/PV/PVM">
				<xsl:choose>	
					<xsl:when test="not(./PVMU) or ./PVMU='intero bene' or ./PVMU='integrale' or ./PVMU='tutta' or ./PVMU='totale' or ./PVMU='carattere generale' or (starts-with(lower-case(normalize-space(./PVMU)), 'nr')) or (starts-with(lower-case(normalize-space(./PVMU)), 'n.r')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intero')) or (starts-with(lower-case(normalize-space(./PVMU)), 'intera')) or (starts-with(lower-case(normalize-space(./PVMU)), 'esemplar'))">
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
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/SC">
				<xsl:choose>	
					<xsl:when test="not(./SCL/SCLU) or ./SCL/SCLU='intero bene' or ./SCL/SCLU='integrale' or ./SCL/SCLU='tutta' or ./SCL/SCLU='totale' or ./SCL/SCLU='carattere generale' or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'nr')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intero')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'intera')) or (starts-with(lower-case(normalize-space(./SCL/SCLU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
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
	
								<!-- Vertical subdivision as individual -->
		<xsl:for-each select="record/metadata/schede/A/SI/SII/SIIV">
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
		<xsl:for-each select="record/metadata/schede/A/SI/SII/SIIO">
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
		<xsl:for-each select="record/metadata/schede/A/SI/SII">
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
									<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Floor'" />
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
			</xsl:if>
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
					<xsl:when test="not(./FNSU) or ./FNSU='intero bene' or ./FNSU='integrale' or ./FNSU='tutta' or ./FNSU='totale' or ./FNSU='carattere generale' or (starts-with(lower-case(normalize-space(./FNSU)), 'nr')) or (starts-with(lower-case(normalize-space(./FNSU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intero')) or (starts-with(lower-case(normalize-space(./FNSU)), 'intera')) or (starts-with(lower-case(normalize-space(./FNSU)), 'esemplar'))">
						<arco-ip:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$culturalProperty" />
							</xsl:attribute>
						</arco-ip:isFoundationOf>
					</xsl:when>
					<xsl:otherwise>
						<arco-ip:isFoundationOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FNSU)))" />
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
				<xsl:if test="../FNA">
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
		</xsl:for-each>
										<!-- Material as individual -->
		<xsl:for-each select="record/metadata/schede/A/FN/FNS/FNSM">
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
		<xsl:for-each select="record/metadata/schede/A/FN/FNS/FNSC">
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
		<xsl:for-each select="record/metadata/schede/A/FN/FNS ">
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
		
		<xsl:if test="record/metadata/schede/A/FN[FNA and FNS]">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Soil'" />
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
		</xsl:for-each>	
												<!-- Material as individual -->
		<xsl:for-each select="record/metadata/schede/A/SV/SVC/SVCM">
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
		<xsl:for-each select="record/metadata/schede/A/SV/SVC">
		
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
		</xsl:for-each>
										<!-- VerticalElementType as individual -->
		<xsl:for-each select="record/metadata/schede/A/SV/SVC/SVCT">
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
		</xsl:for-each>	
		
										<!-- SOER part as individual -->
		<xsl:for-each select="record/metadata/schede/A/SO"> 
			<xsl:if test="./SOE/SOER  and not(./SOE/SOER='intero bene' or ./SOE/SOER='integrale' or ./SOE/SOER='tutta' or ./SOE/SOER='totale' or ./SOE/SOER='carattere generale' or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'nr')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'n.r')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intero')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'intera')) or (starts-with(lower-case(normalize-space(./SOE/SOER)), 'esemplar')))">
			<xsl:if test="./SOE/SOEC"> 
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'HorizontalElementPart/', $itemURI, '-part-', arco-fn:arcofy(normalize-space(./SOE)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/HorizontalElement'" />
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
		</xsl:for-each>								
											
										<!-- HorizontalElementShape as individual -->
		<xsl:for-each select="record/metadata/schede/A/SO/SOF">
		<xsl:if test="./SOFF">
			<rdf:Description>
	 			<xsl:attribute name="rdf:about">
	 				<xsl:choose>
						<xsl:when test="./SOFQ">
							<xsl:value-of 	select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(concat(normalize-space(./SOFF), '-', normalize-space(string-join(./SOFQ,'-')))))" />
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
							<xsl:value-of 	select="concat(normalize-space(./SOFF), ' ', normalize-space(string-join(./SOFQ,', ')))" />
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
							<xsl:value-of 	select="concat(normalize-space(./SOFF), ' ', normalize-space(string-join(./SOFQ,', ')))" />
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
		<xsl:for-each select="record/metadata/schede/A/SO/SOF">
			<xsl:if test="./SOFG">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:choose>
						<xsl:when test="./SOFP">
							<xsl:value-of 	select="concat($NS, 'HorizontalElementType/', arco-fn:urify(normalize-space(concat(./SOFG, '-', string-join(./SOFP,'-')))))" />
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
							<xsl:value-of 	select="concat(normalize-space(./SOFG), ' ', normalize-space(string-join(./SOFP,', ')))" />
						</rdfs:label>	
					</xsl:when>
					<xsl:otherwise>
						<rdfs:label>
							<xsl:value-of 	select="normalize-space(./SOFG)" />
						</rdfs:label>
					</xsl:otherwise>		
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="./SOFP">
						<l0:name>
							<xsl:value-of 	select="concat(normalize-space(./SOFG), ' ', normalize-space(string-join(./SOFP,', ')))" />
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
		<xsl:for-each select="record/metadata/schede/A/SO/SOE[SOEC]">
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
										
										<!-- Roof as individual -->
		<xsl:for-each select="record/metadata/schede/A/CP">
		<xsl:if test="./CPF/* or ./CPC/* ">
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
				<xsl:if test="./CPC/CPCT">
					<xsl:choose>	
					<xsl:when test="not(./CPC/CPCR) or ./CPC/CPCR='intero bene' or ./CPC/CPCR='integrale' or ./CPC/CPCR='tutta' or ./CPC/CPCR='carattere generale' or ./CPC/CPCR='totale' or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'esemplar')) or ((lower-case(normalize-space(./CPC/CPCR)))=(lower-case(normalize-space(./CPU))))">	
						<arco-ip:hasRoofStructure>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
						</xsl:attribute>
						</arco-ip:hasRoofStructure>
					</xsl:when>
					<xsl:otherwise>
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RoofPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPC)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>	
	
		<xsl:for-each select="record/metadata/schede/A/CP">
		<xsl:if test="./CPC/CPCT">
		<xsl:if test="./CPC/CPCR  and not (./CPC/CPCR='intero bene' or ./CPC/CPCR='integrale' or ./CPC/CPCR='tutta' or ./CPC/CPCR='totale' or ./CPC/CPCR='carattere generale' or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPC/CPCR)), 'esemplar')) or ((lower-case(normalize-space(./CPC/CPCR)))=(lower-case(normalize-space(./CPU)))))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="concat($NS, 'RoofPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./CPC)))" />
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
				<xsl:if test="./CPC/CPCT">	
					<arco-ip:hasRoofStructure>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RoofStructure/', $itemURI, '-', arco-fn:urify(normalize-space(./CPC/CPCT)))" />
						</xsl:attribute>
					</arco-ip:hasRoofStructure>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		</xsl:if>
		</xsl:for-each>	
	
										<!-- RoofShape as individual -->
		<xsl:for-each select="record/metadata/schede/A/CP/CPF">
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
		<xsl:for-each select="record/metadata/schede/A/CP/CPF ">
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
		<xsl:for-each select="record/metadata/schede/A/CP/CPC/CPCT">
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
		<xsl:for-each select="record/metadata/schede/A/CP/CPM">
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
								<xsl:value-of 	select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPMT), '-', normalize-space(string-join(./CPMQ,'-')))))" />
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
		<xsl:for-each select="record/metadata/schede/A/CP/CPM">
			<xsl:if test="./CPMT">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 
				<xsl:choose>	
						<xsl:when test="./CPMQ">
								<xsl:value-of select="concat($NS, 'RoofingType/', arco-fn:urify(concat(normalize-space(./CPMT), '-', normalize-space(string-join(./CPMQ,'-')))))" />	
						</xsl:when>
						<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'RoofingType/', arco-fn:urify(normalize-space(./CPMT)))" />
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
								<xsl:value-of 	select="concat(normalize-space(./CPMT), ' ', normalize-space(string-join(./CPMQ,', ')))" />	
						</xsl:when>
						<xsl:otherwise>
								<xsl:value-of 	select="normalize-space(./CPMT)" />
						</xsl:otherwise>		
					</xsl:choose>
				</rdfs:label>	
				<l0:name>
					<xsl:choose>	
						<xsl:when test="./CPMQ">
								<xsl:value-of 	select="concat(normalize-space(./CPMT), ' ', normalize-space(string-join(./CPMQ,', ')))" />	
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
																		
										
										
										<!-- Flooring as individual -->	
		<xsl:for-each select="record/metadata/schede/*/PV/PVM">	
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
					<arco-ip:hasFlooringLayout>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'FlooringLayout/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					</arco-ip:hasFlooringLayout>
				</xsl:for-each>
			</rdf:Description>
		</xsl:for-each>										
												<!-- FlooringType as individual -->
		<xsl:for-each select="record/metadata/schede/*/PV/PVM/PVMG ">
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
										
										<!-- FlooringLayout as individual -->
		<xsl:for-each select="record/metadata/schede/*/PV/PVM/PVMS ">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 			
	 				<xsl:value-of 	select="concat($NS, 'FlooringLayout/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/FlooringLayout'" />
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
		
									<!-- Stairs as individual -->
		<xsl:for-each select="record/metadata/schede/*/SC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Stairs'" />
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
					<arco-ip:spatialLocation>
						<xsl:value-of 	select="normalize-space(./SCL/SCLL)" />
					</arco-ip:spatialLocation>
				</xsl:if>
				<xsl:if test="./SCL/SCLN">
					<arco-ip:numberOfFlights>
						<xsl:value-of 	select="normalize-space(./SCL/SCLN)" />
					</arco-ip:numberOfFlights>
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
			<xsl:if test="./SCS/SCSR and not(./SCS/SCSR='intero bene' or ./SCS/SCSR='integrale' or ./SCS/SCSR='tutta' or ./SCS/SCSR='totale' or ./SCS/SCSR='carattere generale' or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'nr')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intero')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'intera')) or (starts-with(lower-case(normalize-space(./SCS/SCSR)), 'esemplar')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'StairsPart/', arco-fn:urify(normalize-space(./SCS/SCSR)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Stairs'" />
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
		</xsl:for-each>	
									<!-- StairsShape as individual -->
		<xsl:for-each select="record/metadata/schede/*/SC/SCL/SCLF">
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
            			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/StairsShape'" />
	            	</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:for-each>
										<!-- UseFunction as individual -->
		<xsl:for-each select="record/metadata/schede/*/SC/SCL/SCLO">
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
									<!-- VerticalConnectionType as individual -->
		<xsl:for-each select="record/metadata/schede/*/SC/SCL/SCLG ">
			<rdf:Description>
				<xsl:attribute name="rdf:about"> 				
					<xsl:value-of 	select="concat($NS, 'VerticalConnectionType/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
	 	        <rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/VerticalConnectionType'" />
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
		<xsl:if test="record/metadata/schede/*/SC/SCS">
			<xsl:for-each select="record/metadata/schede/A/SC/SCS/SCSC">
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
			<xsl:for-each select="record/metadata/schede/A/SC/SCS/SCSM">
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
		
							<!-- CulturalPropertyPart when there is SIIR (IntenalSubdivision) -->
		<xsl:for-each select="record/metadata/schede/A/SI/SII">
			<xsl:variable name="siir" select="./SIIR" />
			<xsl:if test="./SIIR and not (./SIIR='intero bene' or ./SIIR='integrale' or ./SIIR='tutta' or ./SIIR='totale' or ./SIIR='carattere generale' or (starts-with(lower-case(normalize-space(./SIIR)), 'nr')) or (starts-with(lower-case(normalize-space(./SIIR)), 'n.r')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intero')) or (starts-with(lower-case(normalize-space(./SIIR)), 'intera')) or (starts-with(lower-case(normalize-space(./SIIR)), 'esemplar')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SIIR)))" />
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
					<xsl:if test="./SIIP">
						<xsl:variable name="siip-virgola" select="./SIIP" />
						<xsl:variable name="siip" select="translate($siip-virgola, ';', ',')" />
						<xsl:variable name="floorssplit" select="arco-fn:split($siip)" />
						<xsl:for-each select="$floorssplit">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
	    		    				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', arco-fn:urify(.), '-', arco-fn:urify($siir))" />
								</xsl:attribute>
							</arco-core:hasPart>
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
									<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Floor'" />
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
					<xsl:if test="./PNT/PNTS or ./PNT/PNTF">
						<xsl:variable name="layout"> 		
							<xsl:choose>
								<xsl:when test="./PNT/PNTS and ./PNT/PNTF">
									<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), '-', normalize-space(./PNT/PNTF))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Layout/', $itemURI, '-', arco-fn:urify(concat(normalize-space(./PNT/PNTS), normalize-space(./PNT/PNTF))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<arco-ip:hasLayout>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$layout" />
							</xsl:attribute>
						</arco-ip:hasLayout>
					</xsl:if>			
					<xsl:if test="./PNT/PNTQ or ./PNT/PNTE">
						<arco-ip:hasDesign>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionDesign/', $itemURI, '-', arco-fn:arcofy(normalize-space(./PNT)))" />
							</xsl:attribute>
						</arco-ip:hasDesign>
					</xsl:if>
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
					<arco-ip:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Foundation/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasConstructionElement>
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
					<arco-ip:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'VerticalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasConstructionElement>
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
					<arco-ip:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HorizontalElement/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasConstructionElement>
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
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Roof/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
					</xsl:if>
					<xsl:if test="./CPM">
						<xsl:choose>
							<xsl:when test="not(./CPM/CPMR) or ./CPM/CPMR='intero bene' or ./CPM/CPMR='integrale' or ./CPM/CPMR='tutta' or ./CPM/CPMR='totale' or ./CPM/CPMR='carattere generale' or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'nr')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'n.r')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intero')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'intera')) or (starts-with(lower-case(normalize-space(./CPM/CPMR)), 'esemplar'))">
								<arco-ip:hasCovering>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
									</xsl:attribute>
								</arco-ip:hasCovering>
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
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
						<arco-ip:hasCovering>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Roofing/', $itemURI, '-', arco-fn:arcofy(normalize-space(./CPM)))" />
							</xsl:attribute>
						</arco-ip:hasCovering>
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
					<arco-ip:hasConstructionElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Stairs/', $itemURI, '-', arco-fn:arcofy(normalize-space(.)))" />
						</xsl:attribute>
					</arco-ip:hasConstructionElement>
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
		
						<!-- PG description -->
		<xsl:if test="$sheetType='PG'" >
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        		<xsl:value-of select="$culturalProperty" />
				</xsl:attribute>
				<xsl:if test="record/metadata/schede/PG/UT/RAM or record/metadata/schede/PG/CA/CLM">
					<arco-dd:hasEnvironment>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Environment/', $itemURI)" />
						</xsl:attribute>
					</arco-dd:hasEnvironment>
				</xsl:if>
				<xsl:if test="record/metadata/schede/PG/CA/CAC or record/metadata/schede/PG/CA/CAM or record/metadata/schede/PG/CA/CAG">
					<arco-ip:laysOnSoil>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Soil/', $itemURI)" />
						</xsl:attribute>
					</arco-ip:laysOnSoil>
				</xsl:if>
				<xsl:if test="record/metadata/schede/PG/CA/CAI">
					<arco-ip:hasTechnicalSystem>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
						</xsl:attribute>
					</arco-ip:hasTechnicalSystem>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/PG/IM/IMP">
					<xsl:if test="./IMPT and contains(normalize-space(lower-case(./IMPT)), 'idrico')">
						<xsl:choose>	
							<xsl:when test="not(./IMPU) or ./IMPU='intero bene' or ./IMPU='integrale' or ./IMPU='tutta' or ./IMPU='totale' or ./IMPU='carattere generale' or (starts-with(lower-case(normalize-space(./IMPU)), 'nr')) or (starts-with(lower-case(normalize-space(./IMPU)), 'n.r')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intero')) or (starts-with(lower-case(normalize-space(./IMPU)), 'intera')) or (starts-with(lower-case(normalize-space(./IMPU)), 'esemplar'))">
								<arco-ip:hasTechnicalSystem>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
									</xsl:attribute>
								</arco-ip:hasTechnicalSystem>
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
								<arco-ip:hasTechnicalSystem>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalSystem/', $itemURI, '-', arco-fn:urify(normalize-space(./IMPT)))" />
									</xsl:attribute>
								</arco-ip:hasTechnicalSystem>
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
				<xsl:for-each select="record/metadata/schede/PG/FO/FOT">
					<xsl:choose>	
						<xsl:when test="not(./FOTU) or ./FOTU='intero bene' or ./FOTU='integrale' or ./FOTU='tutta' or ./FOTU='totale' or ./FOTU='carattere generale' or (starts-with(lower-case(normalize-space(./FOTU)), 'nr')) or (starts-with(lower-case(normalize-space(./FOTU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intero')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intera')) or (starts-with(lower-case(normalize-space(./FOTU)), 'esemplar'))">
							<arco-ip:hasWaterElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, position())" />
								</xsl:attribute>
							</arco-ip:hasWaterElement>
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
							<arco-ip:hasTechnicalSystem>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
								</xsl:attribute>
							</arco-ip:hasTechnicalSystem>
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
				<xsl:for-each select="record/metadata/schede/PG/MP/MPT">
					<xsl:if test="./MPTS">
					<xsl:if test="not(./MPTR)  or ./MPTR='intero bene' or ./MPTR='integrale' or ./MPTR='tutta' or ./MPTR='totale' or ./MPTR='carattere generale' or (starts-with(lower-case(normalize-space(./MPTR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPTR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPTR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPTR)), 'esemplar'))">
						<arco-ip:hasLayout>
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
						</arco-ip:hasLayout>
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
				<xsl:for-each select="record/metadata/schede/PG/MP/MPA">
					<xsl:if test="not(./MPAU)  or ./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar'))">
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionElement/', $itemURI, '-', arco-fn:urify(normalize-space(./MPAT)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
					</xsl:if>
					<xsl:if test="./MPAU and not(./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar')))">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPAU)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/PG/MP/MPC">
					<xsl:if test="not(./MPCR)  or ./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar'))">
						<arco-ip:hasConnectionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConnectionElement/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-ip:hasConnectionElement>
					</xsl:if>
					<xsl:if test="./MPCR and not(./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPCR)), 'esemplar')))">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPCR)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:for-each>
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
							<!-- Environment as individual -->
			<xsl:if test="record/metadata/schede/PG/UT/RAM or record/metadata/schede/PG/CA/CLM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	        			<xsl:value-of select="concat($NS, 'Environment/', $itemURI)" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/NaturalEnvironment" />
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
						<arco-dd:hasClimateSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-dd:hasClimateSituation>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
								<!-- Climate situation as individual -->
			<xsl:for-each select="record/metadata/schede/PG/CA/CLM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	        			<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/ClimateSituation" />
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
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/PG/CA/CLM">
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Soil'" />
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
						<arco-dd:morphologicalDescription>
							<xsl:value-of select="record/metadata/schede/PG/CA/CAM" />
						</arco-dd:morphologicalDescription>
					</xsl:if>
					<xsl:if test="record/metadata/schede/PG/CA/CAG/CAGG">
						<arco-dd:geologicalDescription>
							<xsl:value-of select="record/metadata/schede/PG/CA/CAG/CAGG" />
						</arco-dd:geologicalDescription>
					</xsl:if>
					<xsl:if test="record/metadata/schede/PG/CA/CAG/CAGP">
						<arco-dd:geologicalDescription>
							<xsl:value-of select="record/metadata/schede/PG/CA/CAG/CAGP" />
						</arco-dd:geologicalDescription>
					</xsl:if>
					<xsl:if test="record/metadata/schede/PG/CA/CAC">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-soil-measurement-collection')" />
							</xsl:attribute>
						</arco-dd:hasMeasurementCollection>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
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
						<!-- Technical system as individual -->
			<xsl:if test="record/metadata/schede/PG/CA/CAI or record/metadata/schede/PG/FO/FOT">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
					</xsl:attribute>
	 	    	    <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/WaterSystem'" />
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
						<arco-ip:hasWaterElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-ip:hasWaterElement>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/PG/IM/IMP">		
			<xsl:if test="./IMPT and contains(normalize-space(lower-case(./IMPT)), 'idrico')">
				<rdf:Description>
					<xsl:attribute name="rdf:about"> 			
	 					<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
					</xsl:attribute>
	 	    	    <rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/WaterSystem'" />
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/TechnicalSystem'" />
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/WaterElement'" />
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
							<!-- Cultural property time as individual -->
				<xsl:if test="./FOTU and not(./FOTU='intero bene' or ./FOTU='integrale' or ./FOTU='tutta' or ./FOTU='totale' or ./FOTU='carattere generale' or (starts-with(lower-case(normalize-space(./FOTU)), 'nr')) or (starts-with(lower-case(normalize-space(./FOTU)), 'n.r')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intero')) or (starts-with(lower-case(normalize-space(./FOTU)), 'intera')) or (starts-with(lower-case(normalize-space(./FOTU)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of 	select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FOTU)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
						<arco-ip:hasWaterElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'WaterElement/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-ip:hasWaterElement>	
						<arco-ip:hasTechnicalSystem>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'WaterSystem/', $itemURI)" />
							</xsl:attribute>
						</arco-ip:hasTechnicalSystem>
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
						<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/Layout'" />
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/ConstructionElement'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label >
						<xsl:value-of select="normalize-space(./MPAT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./MPAT)" />
					</l0:name>
					<arco-ip:scenografic>
						<xsl:value-of select="true()" />
		           	</arco-ip:scenografic>
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
							<xsl:value-of select="'https://w3id.org/arco/ontology/immovable-property/ConnectionElement'" />
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
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
					<arco-ip:hasTechnicalSystem>
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
					</arco-ip:hasTechnicalSystem>
				</rdf:Description>	
			</xsl:if>
			</xsl:for-each>		
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
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
						<arco-ip:hasLayout>
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
						</arco-ip:hasLayout>
					</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>	
			<xsl:for-each select="record/metadata/schede/PG/MP/MPA">	
				<xsl:if test="./MPAU and not(./MPAU='intero bene' or ./MPAU='integrale' or ./MPAU='tutta' or ./MPAU='totale' or ./MPAU='carattere generale' or (starts-with(lower-case(normalize-space(./MPAU)), 'nr')) or (starts-with(lower-case(normalize-space(./MPAU)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intero')) or (starts-with(lower-case(normalize-space(./MPAU)), 'intera')) or (starts-with(lower-case(normalize-space(./MPAU)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPAU)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
						<arco-ip:hasConstructionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConstructionElement/', $itemURI, '-', arco-fn:urify(normalize-space(./MPAT)))" />
							</xsl:attribute>
						</arco-ip:hasConstructionElement>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/PG/MP/MPC">	
				<xsl:if test="./MPCR and not(./MPCR='intero bene' or ./MPCR='integrale' or ./MPCR='tutta' or ./MPCR='totale' or ./MPCR='carattere generale' or (starts-with(lower-case(normalize-space(./MPCR)), 'nr')) or (starts-with(lower-case(normalize-space(./MPCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intero')) or (starts-with(lower-case(normalize-space(./MPCR)), 'intera')) or (starts-with(lower-case(normalize-space(./MPCR)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MPCR)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
						<arco-ip:hasConnectionElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ConnectionElement/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-ip:hasConnectionElement>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>	
			<xsl:for-each select="record/metadata/schede/PG/FV/FVP">
				<xsl:if test="./FVPD and not(./FVPD='intero bene' or ./FVPD='integrale' or ./FVPD='tutta' or ./FVPD='totale' or ./FVPD='carattere generale' or (starts-with(lower-case(normalize-space(./FVPD)), 'nr')) or (starts-with(lower-case(normalize-space(./FVPD)), 'n.r')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intero')) or (starts-with(lower-case(normalize-space(./FVPD)), 'intera')) or (starts-with(lower-case(normalize-space(./FVPD)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/ontology/immovable-property/ConstructionPart" />
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
							<arco-ip:hasMeasurementCollection>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-part-', arco-fn:urify(normalize-space(./FVPD)))" />
								</xsl:attribute>
							</arco-ip:hasMeasurementCollection>
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
	</xsl:if>								
	
	<xsl:if test="$sheetType='BNB'">
		<xsl:variable name="naaa-naab">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAA/NAAB, record/metadata/schede/BNB/SB/NAA/NAAA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAA/NAAA, '-', record/metadata/schede/BNB/SB/NAA/NAAB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="naaa-naab-name">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAA/NAAB, record/metadata/schede/BNB/SB/NAA/NAAA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAA/NAAA, ' ', record/metadata/schede/BNB/SB/NAA/NAAB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BiologicalTaxon">   
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA))='nr (recupero pregresso)')">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NBN/NBNA)))" />
			</xsl:when>	                	
			<xsl:otherwise>
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($naaa-naab))" />		                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nata-natb">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAT/NATB, record/metadata/schede/BNB/SB/NAT/NATA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAT/NATA, '-', record/metadata/schede/BNB/SB/NAT/NATB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="nata-natb-name">
		<xsl:choose>
			<xsl:when test="not(contains(record/metadata/schede/BNB/SB/NAT/NATB, record/metadata/schede/BNB/SB/NAT/NATA))">
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/NAT/NATA, ' ', record/metadata/schede/BNB/SB/NAT/NATB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TypespecimenTaxon">   
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr (recupero pregresso)')">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN)))" />
			</xsl:when>             		                	
			<xsl:otherwise>
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($nata-natb))" />		                		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BiologicalTaxonType">	
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/NBN/NBNA" >
				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
			</xsl:when>
			<xsl:otherwise>              	
			   <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />     	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>   
	<xsl:variable name="TypespecimenTaxonType">	
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN" >
				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
			</xsl:when>
			<xsl:otherwise>                	
		        <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />     	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>  
	<xsl:variable name="RevisedTaxonType">	
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN" >
				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
			</xsl:when>
			<xsl:otherwise>               	
		       <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />     	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>		             
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/BotanicalHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACE">
			<l0:identifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACE" />
			</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACI">
			<arco-arco:internationalIdentifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACI" />
			</arco-arco:internationalIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACO">
			<l0:identifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACO" />
			</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'contenitore'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACJ">
			<l0:identifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACJ" />
			</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'contenitore'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACZ">
			<arco-mp:containerSequence>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACZ" />
			</arco-mp:containerSequence>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACK">
			<l0:identifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACK" />
			</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNB' and (record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'campione'))">
			<xsl:if test="record/metadata/schede/BNB/AC/ACN">
			<arco-arco:previousIdentifier>
				<xsl:value-of select="record/metadata/schede/BNB/AC/ACN" />
			</arco-arco:previousIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA or record/metadata/schede/BNB/SB/NAA">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN or record/metadata/schede/BNB/RB/RBN">
					<arco-mp:isClassifiedByOriginalTaxon>
						<xsl:attribute name="rdf:resource">
					    	<xsl:value-of select="$BiologicalTaxon" />
					    </xsl:attribute>
					</arco-mp:isClassifiedByOriginalTaxon>
				</xsl:when>
				<xsl:otherwise>
					<arco-mp:isClassifiedByCurrentTaxon>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="$BiologicalTaxon" />
					    </xsl:attribute>
					</arco-mp:isClassifiedByCurrentTaxon>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTS">
			<arco-cd:historicalInformation>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/OG/OGT/OGTS)" />
			</arco-cd:historicalInformation>
		</xsl:if>	

		<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="$BiologicalTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRN">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
			    	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/RB/RBN">
		<xsl:variable name="rbna-rbnb">
			<xsl:choose>
				<xsl:when test="not(contains(./RBNB, ./RBNA))">
					<xsl:value-of select="concat(./RBNA, '-', ./RBNB)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./RBNB" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="rbna-rbnb-name">
			<xsl:choose>
				<xsl:when test="not(contains(./RBNB, ./RBNA))">
					<xsl:value-of select="concat(./RBNA, ' ', ./RBNB)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./RBNB" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="RevisedTaxon">   
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN and not(lower-case(normalize-space(record/metadata/schede/BNB/RB/RBR/RBRN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/RB/RBR/RBRN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/RB/RBR/RBRN))='nr (recupero pregresso)')">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/RB/RBR/RBRN)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($rbna-rbnb))" />		                		
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
 					<xsl:value-of select="$RevisedTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN or record/metadata/schede/BNB/SB/NAT">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		             <xsl:value-of select="$TypespecimenTaxon" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</xsl:if>				
		<xsl:if test="record/metadata/schede/BNB/SB/NBN or record/metadata/schede/BNB/SB/NAA">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification')" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNB/RB">
			<xsl:if test="./RBR/RBRN or ./RB/RBN">
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN or record/metadata/schede/BNB/SB/NAT">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		             <xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-typespecimen-classification')" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/ABC">				
			<arco-mp:hasAccession>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Accession/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasAccession>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPF">
			<arco-arco:numberOfElements>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPF" />			
			</arco-arco:numberOfElements>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPE">
			<arco-mp:numberOfLabels>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPE" />			
			</arco-mp:numberOfLabels>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/CBP/CBPB">
			<arco-mp:numberOfEnvelopes>
				<xsl:value-of select="record/metadata/schede/BNB/SB/CBP/CBPB" />			
			</arco-mp:numberOfEnvelopes>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNB/SB/SBE">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNB/LR">
			<arco-mp:hasSpecimenHarvesting>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasSpecimenHarvesting>
		</xsl:if>				
		<xsl:for-each select="record/metadata/schede/BNB/RB">
			<arco-cd:hasLaboratoryTest>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-cd:hasLaboratoryTest>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBR">
			<arco-mp:hasAssociatedPreparation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Preparation/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasAssociatedPreparation>
		</xsl:for-each>				
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBC">
			<arco-mp:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'FruitSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasRelatedSample>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBX">
			<arco-mp:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'WoodSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasRelatedSample>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBS">
			<arco-mp:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'SeedSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasRelatedSample>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNB/DB/DBP">
			<arco-mp:hasRelatedSample>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'PollenSample/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasRelatedSample>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIM">
			<arco-mp:hasHostIndividual>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'HostIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIM))" />
				</xsl:attribute>
			</arco-mp:hasHostIndividual>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIV">
			<arco-mp:hasCloseIndividual>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CloseIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIV))" />
				</xsl:attribute>
			</arco-mp:hasCloseIndividual>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/TBI">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:if>	
	</rdf:Description>  
						<!-- ClassificationInTime as individual --> 	
	<xsl:if test="record/metadata/schede/BNB/SB/NBN or record/metadata/schede/BNB/SB/NAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-classification')" />
        	</xsl:attribute>
       		<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione nel tempo  del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </l0:name>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/RB/RBR/RBRN or record/metadata/schede/BNB/RB/RBN">  
		            <arco-mp:currentClassification>
        		    	<xsl:value-of select="false()" />
            		</arco-mp:currentClassification>
            	</xsl:when>
            	<xsl:otherwise>
            		<arco-mp:currentClassification>
            	<xsl:value-of select="true()" />
            		</arco-mp:currentClassification>
            	</xsl:otherwise>
            </xsl:choose>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVB">
			<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVC), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVE">
						<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVE), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/DBV/DBVF, '-',  record/metadata/schede/BNB/SB/DBV/DBVF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/SB/DBV/DBVA">
			<xsl:variable name="virgola" select="record/metadata/schede/*/SB/DBV/DBVA" />
			<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
			<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
			<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
				<arco-mp:hasTaxon>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-mp:hasTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA">
				<arco-mp:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="$BiologicalTaxon" />
					</xsl:attribute>
				</arco-mp:hasTaxon>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN or record/metadata/schede/BNB/SB/NAT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-typespecimen-classification')" />
	        </xsl:attribute>
    	   	<rdf:type>
				<xsl:attribute name="rdf:resource">
            	    <xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            </l0:name>
            <arco-mp:originalClassification>
            	<xsl:value-of select="false()" />
            </arco-mp:originalClassification>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIB">
				<xsl:variable name="startDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIC">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIC), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB)" />
					</xsl:otherwise>
				</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIE">
						<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIE), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBID))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBID)" />
					</xsl:otherwise>
				</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/TBI/TBIF, '-',  record/metadata/schede/BNB/SB/TBI/TBIF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL">
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/TBI/TBIA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
				<arco-mp:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="$TypespecimenTaxon" />
					</xsl:attribute>
				</arco-mp:hasTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT">
				<arco-mp:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="$TypespecimenTaxon" />
					</xsl:attribute>
				</arco-mp:hasTaxon>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB">
	<xsl:if test="./RBR/RBRN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
	        </xsl:attribute>
    	   	<rdf:type>
				<xsl:attribute name="rdf:resource">
            	    <xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
        	    	 <xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            	</rdfs:label>
	            <l0:name xml:lang="it">
    	        	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
        	    </l0:name>
				<rdfs:label xml:lang="en">
            		 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
	            </rdfs:label>
    	        <l0:name xml:lang="en">
        	    	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            	</l0:name>
	            <arco-mp:originalClassification>
    	        	<xsl:value-of select="false()" />
        	    </arco-mp:originalClassification>
				<xsl:if test="./RBD/RBDB">
					<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDC">
							<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="./RBDE">
							<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBD/RBDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBD/RBDF, '-',  ./RBD/RBDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBR/RBRB">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:for-each select="./RBR/RBRA">
				<xsl:variable name="virgola" select="." />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="./RBR/RBRN">
				<arco-mp:hasTaxon>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./RBR/RBRN)))" />
					</xsl:attribute>
				</arco-mp:hasTaxon>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RBN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
	        </xsl:attribute>
    	   	<rdf:type>
				<xsl:attribute name="rdf:resource">
            	    <xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
        	    	 <xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
            	</rdfs:label>
	            <l0:name xml:lang="it">
    	        	<xsl:value-of select="concat('Classificazione nel tempo del bene culturale ', $itemURI)" />
        	    </l0:name>
				<rdfs:label xml:lang="en">
            		 <xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
	            </rdfs:label>
    	        <l0:name xml:lang="en">
        	    	<xsl:value-of select="concat('Classification in time of cultural property ', $itemURI)" />
            	</l0:name>
	            <arco-mp:originalClassification>
    	        	<xsl:value-of select="false()" />
        	    </arco-mp:originalClassification>
				<xsl:if test="./RBD/RBDB">
					<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDC">
							<xsl:value-of select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="./RBDE">
							<xsl:value-of 	select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBD/RBDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBD/RBDF, '-',  ./RBD/RBDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBR/RBRB">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, 'bibliography-2-', position())" />
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:for-each select="./RBR/RBRA">
				<xsl:variable name="virgola" select="." />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:for-each>
			<arco-mp:hasTaxon>
			<xsl:variable name="rbna-rbnb">
				<xsl:choose>
					<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
						<xsl:value-of select="concat(./RBN/RBNA, '-', ./RBN/RBNB)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./RBN/RBNB" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($rbna-rbnb))" />		                		
				</xsl:attribute>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
							<!-- BiologicalTaxon as individual --> 
	<xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$BiologicalTaxon" />
        </xsl:attribute>    
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NBN/NBNA" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NBN/NBNA" />
            </l0:name>
		<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
			<arco-cd:hasBibliography>
			<xsl:attribute name="rdf:resource">
	        	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
			</xsl:attribute>
			</arco-cd:hasBibliography>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSN">
            	<arco-mp:genusNumber>
            		<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSN" />
            	</arco-mp:genusNumber>
        </xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSG">
			<arco-mp:taxonomicNumber>
				<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSG" />		
			</arco-mp:taxonomicNumber>
		</xsl:if>
	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$BiologicalTaxon" />
        </xsl:attribute>    
		<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
			<arco-cd:hasBibliography>
			<xsl:attribute name="rdf:resource">
	        	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
			</xsl:attribute>
			</arco-cd:hasBibliography>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAD">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAD)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAF">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAF)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAH">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAH)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAL">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAL)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
	</rdf:Description>
	</xsl:if>																		
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAL)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cultivar'" />      
            	</xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAL" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAL" />
            </l0:name>
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAH)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BotanicalForm'" />      
            	</xsl:attribute>
            </rdf:type>
           <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAH" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAH" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAI">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAI))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAF)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAF" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAF" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAG">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAG))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAA/NAAD)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Subspecies'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAD" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAD" />
            </l0:name>	
            <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAE">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAE))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor> 
            </xsl:if>                       
    	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($naaa-naab))" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
					</xsl:attribute>
				</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="$naaa-naab-name" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="$naaa-naab-name" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAC">
				<arco-cd:hasAuthor>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAC))" />
					</xsl:attribute>
				</arco-cd:hasAuthor>
			</xsl:if>
		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
            </xsl:attribute>
            <arco-mp:hasDirectHigherRank>
            <xsl:attribute name="rdf:resource">
            		 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            </xsl:attribute>
            </arco-mp:hasDirectHigherRank>
            <rdf:type>
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Genus'" />      
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAA" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAA/NAAA" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSN">
            	<arco-mp:genusNumber>
            		<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSN" />
            	</arco-mp:genusNumber>
            </xsl:if>
    	</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            </xsl:attribute>
           <xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAA">
            <arco-mp:hasDirectLowerRank>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAA/NAAA))" />
            </xsl:attribute>
            </arco-mp:hasDirectLowerRank>
            </xsl:if>
            <xsl:if test="record/metadata/schede/BNB/SB/NBN/NBNA">
            <arco-mp:hasLowerRank>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NBN/NBNA))" />
            </xsl:attribute>
            </arco-mp:hasLowerRank>
            </xsl:if>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Family'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSF" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/SBS/SBSF" />
            </l0:name>	           
    	</rdf:Description>
	</xsl:if>	
							<!-- TypespecimenTaxon as individual --> 
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIN))" />
        </xsl:attribute>    
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIN" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIN" />
            </l0:name>
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'n.r')))">
			<arco-cd:hasBibliography>
			<xsl:attribute name="rdf:resource">
	        	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
			</xsl:attribute>
			</arco-cd:hasBibliography>
		</xsl:if>
	</rdf:Description>
	</xsl:if>															
	<xsl:if test="record/metadata/schede/BNB/SB/NAT">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$BiologicalTaxon" />
        </xsl:attribute>    
		<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'n.r')))">
			<arco-cd:hasBibliography>
			<xsl:attribute name="rdf:resource">
	        	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
			</xsl:attribute>
			</arco-cd:hasBibliography>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATD">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATD)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATF">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATF)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATH">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATH)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATL">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATL)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
	</rdf:Description>
	</xsl:if>																		
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATL)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cultivar'" />      
            	</xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATL" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATL" />
            </l0:name>
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATH)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BotanicalForm'" />      
            	</xsl:attribute>
            </rdf:type>
           <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATH" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATH" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATI">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATI))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATF)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATF" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATF" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATG">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATG))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/NAT/NATD)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Subspecies'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATD" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATD" />
            </l0:name>	
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATE">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATE))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor> 
            </xsl:if>                       
    	</rdf:Description>
	</xsl:if>		
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($nata-natb))" />
            </xsl:attribute>
            <arco-mp:hasDirectHigherRank>
            <xsl:attribute name="rdf:resource">
            		 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
            </xsl:attribute>
            </arco-mp:hasDirectHigherRank>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="$nata-natb-name" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="$nata-natb-name" />
            </l0:name>
            <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATC">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATC))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor> 
            </xsl:if>   
            <xsl:choose>
  	          <xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'n.r')))">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	    			    	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
						<arco-cd:hasBibliography>
							<xsl:attribute name="rdf:resource">
	    				    	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
							</xsl:attribute>
						</arco-cd:hasBibliography>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>        	           
    	</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
            </xsl:attribute>
            <arco-mp:hasDirectHigherRank>
            <xsl:attribute name="rdf:resource">
            		 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            </xsl:attribute>
            </arco-mp:hasDirectHigherRank>
            <rdf:type>
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Genus'" />      
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATA" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNB/SB/NAT/NATA" />
            </l0:name>
            <xsl:choose>
  	          <xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)), 'n.r')))">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	    			    	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
						<arco-cd:hasBibliography>
							<xsl:attribute name="rdf:resource">
	    				    	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />	
							</xsl:attribute>
						</arco-cd:hasBibliography>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
    	</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/SBS/SBSF))" />
            </xsl:attribute>
           <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATA">
            <arco-mp:hasDirectLowerRank>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/NAT/NATA))" />
            </xsl:attribute>
            </arco-mp:hasDirectLowerRank>
            </xsl:if>
            <xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
            <arco-mp:hasLowerRank>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIN))" />
            </xsl:attribute>
            </arco-mp:hasLowerRank>
            </xsl:if>  
    	</rdf:Description>
	</xsl:if>
									<!-- Revised BiologicalTaxon as individual --> 
	<xsl:for-each select="record/metadata/schede/BNB/RB">
	<xsl:variable name="rbna-rbnb">
		<xsl:choose>
			<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
				<xsl:value-of select="concat(./RBN/RBNA, '-', ./RBN/RBNB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="./RBN/RBNB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="rbna-rbnb-name">
		<xsl:choose>
			<xsl:when test="not(contains(./RBN/RBNB, ./RBN/RBNA))">
				<xsl:value-of select="concat(./RBN/RBNA, ' ', ./RBN/RBNB)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="./RBN/RBNB" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:if test="./RBR/RBRN">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
    		<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(normalize-space(./RBR/RBRN)))" />
		</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./RBR/RBRN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RBR/RBRN" />
			</l0:name>
	</rdf:Description>
	</xsl:if>	   
	<xsl:if test="./RBN">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify($rbna-rbnb))" />
        </xsl:attribute> 
		<arco-mp:hasDirectHigherRank>
	    	<xsl:attribute name="rdf:resource">
				 <xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./RBN/RBNA))" />
            </xsl:attribute>
        </arco-mp:hasDirectHigherRank>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
        		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Species'" />      
		    </xsl:attribute>
		</rdf:type>
	    <rdfs:label>
			<xsl:value-of select="$rbna-rbnb-name" />
		</rdfs:label>
        <l0:name>
        	<xsl:value-of select="$rbna-rbnb-name" />
    	</l0:name>
	    <xsl:if test="./RBN/RBNC">
    		<arco-cd:hasAuthor>
	    		<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNC))" />
        	    </xsl:attribute>
            </arco-cd:hasAuthor> 
        </xsl:if>           	           	        
		<xsl:if test="./RBR/RBRB and (not(starts-with(lower-case(normalize-space(./RBR/RBRB)), 'nr')) and not(starts-with(lower-case(normalize-space(./RBR/RBRB)), 'n.r')))">
			<arco-cd:hasBibliography>
			<xsl:attribute name="rdf:resource">
	        	<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-laboratory-test-bibliography-', position())" />
			</xsl:attribute>
			</arco-cd:hasBibliography>
		</xsl:if>
		<xsl:if test="./RBN/RBND">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(./RBN/RBND)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="./RBN/RBNF">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RBN/RBNF)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="./RBN/RBNH">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(./RBN/RBNH)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
		<xsl:if test="./RBN/RBNL">
			<arco-mp:hasTaxonSpecification>
				<xsl:attribute name="rdf:resource">
		   			<xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(./RBN/RBNL)))" />
		   		</xsl:attribute>
			</arco-mp:hasTaxonSpecification>
		</xsl:if>
	</rdf:Description>
	</xsl:if>																		
	<xsl:if test="./RBN/RBNL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Cultivar/', arco-fn:urify(normalize-space(./RBN/RBNL)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cultivar'" />      
            	</xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="./RBN/RBNL" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RBN/RBNL" />
            </l0:name>
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RBN/RBNH">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'BotanicalForm/', arco-fn:urify(normalize-space(./RBN/RBNH)))" />
            </xsl:attribute>
            <rdf:type>
            	<xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BotanicalForm'" />      
            	</xsl:attribute>
            </rdf:type>
           <rdfs:label>
            	 <xsl:value-of select="./RBN/RBNH" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RBN/RBNH" />
            </l0:name>
            <xsl:if test="./RBN/RBNI">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNI))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RBN/RBNF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RBN/RBNF)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="./RBN/RBNF" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RBN/RBNF" />
            </l0:name>
            <xsl:if test="./RBN/RBNG">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNG))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor>
            </xsl:if>	           
  		</rdf:Description>
	</xsl:if>	
	<xsl:if test="./RBN/RBND">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Subspecies/', arco-fn:urify(normalize-space(./RBN/RBND)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Subspecies'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="./RBN/RBND" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RBN/RBND" />
            </l0:name>	
            <xsl:if test="./RBN/RBNE">
            	<arco-cd:hasAuthor>
            	<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RBN/RBNE))" />
            	</xsl:attribute>
            	</arco-cd:hasAuthor> 
            </xsl:if>                       
    	</rdf:Description>
	</xsl:if>		     		
		<xsl:if test="./RBN/RBNA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'BiologicalTaxon/', arco-fn:urify(./RBN/RBNA))" />
            	</xsl:attribute>
        	    <rdf:type>
		            <xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Genus'" />      
    	    	    </xsl:attribute>
	            </rdf:type>
            	<rdfs:label>
        	    	 <xsl:value-of select="./RBN/RBNA" />
    	        </rdfs:label>
	            <l0:name>
            		<xsl:value-of select="./RBN/RBNA" />
        	    </l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>	
								<!-- Time Interval as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVC), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/DBV/DBVE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/DBV/DBVE), ' ', normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/DBV/DBVD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/DBV/DBVF, '-',  record/metadata/schede/BNB/SB/DBV/DBVF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/DBV/DBVF, ' - ', record/metadata/schede/BNB/SB/DBV/DBVF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/DBV/DBVF, ' - ', record/metadata/schede/BNB/SB/DBV/DBVF)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/DBV/DBVF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
									<!-- accession as individual  -->
 	<xsl:if test="record/metadata/schede/BNB/SB/ABC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Accession/', $itemURI)" />
			</xsl:attribute>
	        <rdf:type>
				<xsl:attribute name="rdf:resource">
	        		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Accession'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Accessione del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Accessione del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Accession of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Accession of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCC">
							<xsl:value-of	select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCC), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCE), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/ABC/ABCF, '-',  record/metadata/schede/BNB/SB/ABC/ABCF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>			
							<!-- Time Interval as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCC), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/ABC/ABCE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/ABC/ABCE), ' ', normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/ABC/ABCD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/ABC/ABCF, '-',  record/metadata/schede/BNB/SB/ABC/ABCF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/ABC/ABCF, ' - ', record/metadata/schede/BNB/SB/ABC/ABCF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/ABC/ABCF, ' - ', record/metadata/schede/BNB/SB/ABC/ABCF)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/ABC/ABCF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
									<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/SB/SBE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SBEC">
				<arco-dd:hasFontStyle>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(./SBEC)))" />
					</xsl:attribute>
				</arco-dd:hasFontStyle>
			</xsl:if>
			<xsl:if test="./SBET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./SBET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SBEL and (not(starts-with(lower-case(normalize-space(./SBEL)), 'nr')) and not(starts-with(lower-case(normalize-space(./SBEL)), 'n.r')))">
				<xsl:for-each select="./SBEL">
					<language:hasLanguage>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</language:hasLanguage>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./SBEG">
				<arco-mp:graphicSymbols>
					<xsl:value-of select="normalize-space(./SBEG)" />
				</arco-mp:graphicSymbols>
			</xsl:if>
			<xsl:if test="./SBEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./SBEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>		
		</rdf:Description>
	</xsl:for-each>
					<!-- language as an individual -->
	<xsl:for-each select="record/metadata/schede/BNB/SB/SBE/SBEL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Language/', arco-fn:urify(normalize-space(.)))" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/italia/onto/Language/Language" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(.)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(.)" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
									<!-- Font style as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/SBE/SBEC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBE/SBEC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBE/SBEC)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	           	<xsl:value-of select="concat($NS, 'FontStyle/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/SB/SBE/SBEC)))" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/FontStyle" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/SBE/SBEC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/SBE/SBEC)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
						<!-- Specimen Harvesting as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SpecimenHarvesting'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDA">
				<xsl:variable name="virgola" select="record/metadata/schede/BNB/LR/LRD/LRDA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-mp:hasHarvestingOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingOperator>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIE">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRI/LRIE)" />
				</arco-core:note>
			</xsl:if>			
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/LR/LRD/LRDF, '-',  record/metadata/schede/BNB/LR/LRD/LRDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI or record/metadata/schede/BNB/LR/LRV">
				<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
	                        </xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
										<!-- Time Interval as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/LR/LRD/LRDF, '-',  record/metadata/schede/BNB/LR/LRD/LRDF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/BNB/LR/LRD/LRDF, ' - ', record/metadata/schede/BNB/LR/LRD/LRDF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/BNB/LR/LRD/LRDF, ' - ', record/metadata/schede/BNB/LR/LRD/LRDF)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRD/LRDF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>	
										<!-- TimeIndexedTypedLocation as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI or record/metadata/schede/BNB/LR/LRV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIP">
				<arco-dd:hasOrientation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIP)))" />
				</xsl:attribute>
				</arco-dd:hasOrientation>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIB">
				<arco-dd:hasEnvironment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironment/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIB)))" />
					</xsl:attribute>
				</arco-dd:hasEnvironment>
			</xsl:if>						
			<arco-location:hasLocationType>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="'https://w3id.org/arco/ontology/location/CollectingLocation'" />
            	</xsl:attribute>
			</arco-location:hasLocationType>			
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDC">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDC), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDE">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/LR/LRD/LRDE), ' ', normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/LR/LRD/LRDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/LR/LRD/LRDF, '-',  record/metadata/schede/BNB/LR/LRD/LRDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
								<!-- Measurement collection as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH or record/metadata/schede/BNB/LR/LRI/LRIT or record/metadata/schede/BNB/LR/LRI/LRIA or record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-temperature')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-ph')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-altitude')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>		
		</rdf:Description>
	</xsl:if>	
						<!-- measurement as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Depth')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'depth', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-temperature')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Temperature')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'temperature', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-ph')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Ph')" />
			</arco-dd:hasMeasurementType>			
		</rdf:Description>
	</xsl:if>				
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIA">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-altitude')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Altitude')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'altitude', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>		
										<!-- Substrate as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'Substrate/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIR)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Substrate'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIR" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIR" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRII">
				<arco-mp:hasIncline>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Incline/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRII)))" />
					</xsl:attribute>
				</arco-mp:hasIncline>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIJ">
				<arco-mp:hasSubstrateType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SubstrateType/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIJ)))" />
					</xsl:attribute>
				</arco-mp:hasSubstrateType>
			</xsl:if>	
		</rdf:Description>
	</xsl:if>
							<!-- Substrate type as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIJ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'SubstrateType/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIJ)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SubstrateType'" />
                </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIJ" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIJ" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
										<!-- NaturalEnvironment as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="concat($NS, 'NaturalEnvironment/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIB)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/NaturalEnvironment'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIB" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIB" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRID">
				<arco-mp:hasFluidDynamism>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'FluidDynamism/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRID)))" />
				</xsl:attribute>
				</arco-mp:hasFluidDynamism>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIS">
				<arco-mp:hasShadeTolerance>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ShadeTolerance/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIS)))" />
				</xsl:attribute>
				</arco-mp:hasShadeTolerance>
			</xsl:if>

			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIH or record/metadata/schede/BNB/LR/LRI/LRIT or record/metadata/schede/BNB/LR/LRI/LRIA or record/metadata/schede/BNB/LR/LRI/LRIO">
				<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
				</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIR">
				<arco-mp:hasSubstrate>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Substrate/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIR)))" />
				</xsl:attribute>
				</arco-mp:hasSubstrate>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
							<!-- Incline as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRII">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS, 'Incline/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRII)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Incline'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRII" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRII" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
										<!-- Orientation as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIP)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Orientation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIP" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIP" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
									<!-- Fluid dynamism as individual  -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRID">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'FluidDynamism/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRID)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/FluidDynamism'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRID" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRID" />
			</l0:name>
		</rdf:Description>
	</xsl:if>	
							<!-- Shade tolerance as individual  -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'ShadeTolerance/', arco-fn:urify(normalize-space(record/metadata/schede/BNB/LR/LRI/LRIS)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ShadeTolerance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIS" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIS" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
								<!-- Laboraotry test as individual  -->
 	<xsl:for-each select="record/metadata/schede/BNB/RB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
			      	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/LaboratoryTest'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Laboratory test of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Analisi di laboratorio del bene ', $itemURI)" />
			</l0:name>		
			<xsl:for-each select="./RBR/RBRA">
				<xsl:variable name="virgola" select="." />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
				<arco-cd:hasActivityOperator>
					<xsl:attribute name="rdf:resource">
        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
				</arco-cd:hasActivityOperator>
			</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="./RBR/RBRB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-laboratory-test-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RBR/RBRT">	
				<arco-cd:hasLaboratoryTestType>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'LaboratoryTestType/', arco-fn:urify(./RBR/RBRT))" />
				</xsl:attribute>
				</arco-cd:hasLaboratoryTestType>
			</xsl:if>
			<xsl:if test="./RBA">
				<arco-core:note>
					<xsl:value-of select="normalize-space(./RBA)" />
				</arco-core:note>
			</xsl:if>					
			<xsl:if test="./RBR/RBRN or ./RBN">
				<arco-core:hasConsequence>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-revised-classification-', position())" />
				</xsl:attribute>
				</arco-core:hasConsequence>
			</xsl:if>	
			<xsl:if test="./RBD/RBDB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDC">
							<xsl:value-of 	select="concat(normalize-space(./RBD/RBDC), ' ', normalize-space(./RBD/RBDB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="./RBD/RBDE">
							<xsl:value-of select="concat(normalize-space(./RBD/RBDE), ' ', normalize-space(./RBD/RBDD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./RBD/RBDD)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="./RBD/RBDF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBD/RBDF, '-',  ./RBD/RBDF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
							<!-- Time Interval as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBD">
	<xsl:if test="./RBDB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="./RBDC">
					<xsl:value-of select="concat(normalize-space(./RBDC), ' ', normalize-space(./RBDB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(./RBDB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="./RBDE">
					<xsl:value-of select="concat(normalize-space(./RBDE), ' ', normalize-space(./RBDD))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(./RBDD)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RBDF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./RBDF, '-',  ./RBDF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(./RBDF, ' - ', ./RBDF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(./RBDF, ' - ', ./RBDF)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="./RBDF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="./RBDF" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
							<!--Laboratory test Bibliography as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-laboratory-test-bibliography-', position())" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa ad analisi di laboratorio del campione ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa ad analisi di laboratorio del campione', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Bibliography about laboratory test of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Bibliography about laboratory test of cultural property ', $itemURI)" />
			</l0:name>
			<arco-cd:completeBibliographicReference>
				<xsl:value-of select="normalize-space(.)" />
			</arco-cd:completeBibliographicReference>			
		</rdf:Description>
	</xsl:for-each>
								<!--TypeSpecimen Bibliography as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Bibliography about type specime of cultural property ', $itemURI)" />
			</l0:name>
			<arco-cd:completeBibliographicReference>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIL)" />
			</arco-cd:completeBibliographicReference>			
		</rdf:Description>
	</xsl:if>
							<!-- biological-taxon-bibliography as individual  -->
	<xsl:if test="record/metadata/schede/BNB/SB/SBS/SBSC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)), 'n.r')))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-biological-taxon-bibliography')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al taxon biologico del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Bibliografia relativa al taxon biologico del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Bibliography about biological taxon of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Bibliography about biological taxon of cultural property ', $itemURI)" />
			</l0:name>
			<arco-cd:completeBibliographicReference>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/SBS/SBSC)" />
			</arco-cd:completeBibliographicReference>			
		</rdf:Description>
	</xsl:if>
								<!-- Laboratory Test type as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRT">	
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'LaboratoryTestType/', arco-fn:urify(.))" />
			</xsl:attribute>
	        <rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/LaboratoryTestType'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="record/metadata/schede/BNB/RB/RBR/RBRT" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="record/metadata/schede/BNB/RB/RBR/RBRT" />
			</l0:name>	
		</rdf:Description>
	</xsl:for-each>				
							<!-- Preparation as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBR">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Preparation/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Preparation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Preparato ', position(), ' relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Preparato ', position(), ' relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Preparation ', position(), ' related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Preparation ', position(), ' related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBRA">
				<xsl:variable name="virgola" select="./DBRA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBRT">	
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreparationType/', arco-fn:urify(./DBRT))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="./DBRD">
				<arco-mp:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBRD)" />
				</arco-mp:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBRS">
				<arco-core:description>
					<xsl:value-of select="normalize-space(./DBRS)" />
				</arco-core:description>
			</xsl:if>				
		</rdf:Description>
	</xsl:for-each>
							<!-- Preparation type as individual  -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBR/DBRT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	               <xsl:value-of select="concat($NS, 'PreparationType/', arco-fn:urify(.))" />
               </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PreparationType'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="." />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="." />
			</l0:name>		
		</rdf:Description>
	</xsl:for-each>						
									<!-- Fruit sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'FruitSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	        		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/FruitSample'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto carpologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto carpologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Fruit sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Fruit sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBCA">
				<xsl:variable name="virgola" select="./DBCA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBCC">	
				<arco-mp:sampleLocation>
					<xsl:value-of select="normalize-space(./DBCC)" />
				</arco-mp:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBCD">
				<arco-mp:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBCD)" />
				</arco-mp:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBCE">
				<arco-mp:dateOfLastChangePreservative>
					<xsl:value-of select="normalize-space(./DBCE)" />
				</arco-mp:dateOfLastChangePreservative>
			</xsl:if>
			<xsl:if test="./DBCX">
				<arco-mp:hasPreservationType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'PreservationType/', arco-fn:urify(./DBCX))" />
					</xsl:attribute>
				</arco-mp:hasPreservationType>
			</xsl:if>			
		</rdf:Description>
	</xsl:for-each>
							<!-- Preservation Type as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBC/DBCX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'PreservationType/', arco-fn:urify(.))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PreservationType'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="." />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="." />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
							<!--Wood Sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'WoodSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/WoodSample'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto xilologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto xilologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Wood sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Wood sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBXT">
				<xsl:variable name="virgola" select="./DBXT" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBXC">	
				<arco-mp:sampleLocation>
					<xsl:value-of select="normalize-space(./DBXC)" />
				</arco-mp:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBXO">
				<arco-mp:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBXO)" />
				</arco-mp:manufacturingDate>
			</xsl:if>
			<xsl:if test="./DBXX">
				<arco-dd:hasShape>
					<xsl:attribute name="rdf:resource">
		 	           	<xsl:value-of select="concat($NS, 'SampleShape/', arco-fn:urify(./DBXX))" />
		            </xsl:attribute>
				</arco-dd:hasShape>
			</xsl:if>
			<xsl:if test="./DBXA or ./DBXL or ./DBXN or ./DBXD or ./DBXP">
				<arco-cd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', 'WoodSample', '-', position(), '-related-sample-measurement-collection')" />
					</xsl:attribute>
				</arco-cd:hasMeasurementCollection>
			</xsl:if>
		</rdf:Description>
	</xsl:for-each>
										<!-- Measurement collection as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', 'WoodSample', '-', position(), '-related-sample-measurement-collection')" />
    		</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del reperto di collezione di xiloteca'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del reperto di collezione di xiloteca'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of wood sample'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of wood sample'" />
			</l0:name>
			<xsl:if test="./DBXA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-height')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./DBXL">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-width')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./DBXN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-length')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./DBXD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-diameter')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./DBXP">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-weight')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>					
		</rdf:Description>
	</xsl:for-each>							
							<!-- Shape as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'SampleShape/', arco-fn:urify(.))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="." />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="." />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
            	</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>		
		</rdf:Description>
	</xsl:for-each>
							<!-- Pollen Sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PollenSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PollenSample'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto palinologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto palinologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pollen sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pollen sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBPA">
				<xsl:variable name="virgola" select="./DBPA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
    						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBPC">	
				<arco-mp:sampleLocation>
					<xsl:value-of select="normalize-space(./DBPC)" />
				</arco-mp:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBPD">
				<arco-mp:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBPD)" />
				</arco-mp:manufacturingDate>
			</xsl:if>			
		</rdf:Description>
	</xsl:for-each>
							<!-- Seed sample as individual -->
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'SeedSample/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SeedSample'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Reperto spermologico relativo al bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Reperto spermologico relativo al bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Seed sample related to cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Seed sample related to cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./DBSR">
				<xsl:variable name="virgola" select="./DBSR" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-cd:hasAuthor>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:hasAuthor>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="./DBSC">	
				<arco-mp:sampleLocation>
					<xsl:value-of select="normalize-space(./DBSC)" />
				</arco-mp:sampleLocation>
			</xsl:if>
			<xsl:if test="./DBSD">
				<arco-mp:manufacturingDate>
					<xsl:value-of select="normalize-space(./DBSD)" />
				</arco-mp:manufacturingDate>
			</xsl:if>			
		</rdf:Description>
	</xsl:for-each>
							<!-- Type Specimen Identification as individual -->								
 	<xsl:if test="record/metadata/schede/BNB/SB/TBI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIL">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-TypeSpecimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIN">
			<arco-mp:producesTaxon>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="$TypespecimenTaxon" />
				</xsl:attribute>
			</arco-mp:producesTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/NAT">
			<arco-mp:producesTaxon>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="$TypespecimenTaxon" />
				</xsl:attribute>
			</arco-mp:producesTaxon>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIA">
			<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/TBI/TBIA" />
				<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
				<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIB">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIC">
							<xsl:value-of	select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIC), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIE">
							<xsl:value-of 	select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIE), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBID))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBID)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/TBI/TBIF, '-',  record/metadata/schede/BNB/SB/TBI/TBIF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>					
								<!--TypeSpecimen Type as individual -->
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TypeSpecimenType/', arco-fn:urify(record/metadata/schede/BNB/SB/TBI/TBIT))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIT" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIT" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
				<!-- TypespecimenTaxon as individual --> 
	<xsl:if test="record/metadata/schede/BNB/SB/NAT or record/metadata/schede/BNB/SB/TBI/TBIN">
	<rdf:Description>
		<xsl:attribute name="rdf:about">
			<xsl:value-of select="$TypespecimenTaxon" />
		</xsl:attribute>
		<rdf:type>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/NAT">
					<xsl:attribute name="rdf:resource">
                 		<xsl:value-of select="$TypespecimenTaxonType" />
            		</xsl:attribute>
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN">
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiologicalTaxon'" />
					</xsl:attribute>
				</xsl:when>
			</xsl:choose>
		</rdf:type>
		<rdfs:label>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr (recupero pregresso)')">
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNB/SB/NAT">
					<xsl:value-of select="normalize-space(string-join(record/metadata/schede/BNB/SB/NAT/*,', '))" />
				</xsl:when>
			</xsl:choose>
		</rdfs:label>
		<l0:name>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIN and not(lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='n.r.' or lower-case(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN))='nr (recupero pregresso)')">
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIN)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNB/SB/NAT">
					<xsl:value-of select="normalize-space(string-join(record/metadata/schede/BNB/SB/NAT/*,', '))" />
				</xsl:when>
			</xsl:choose>
		</l0:name>
	  </rdf:Description>								
	</xsl:if>							
								<!-- Time Interval as individual for TypeSpecimen -->
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIB">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIC">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIC), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBIB)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNB/SB/TBI/TBIE">
					<xsl:value-of select="concat(normalize-space(record/metadata/schede/BNB/SB/TBI/TBIE), ' ', normalize-space(record/metadata/schede/BNB/SB/TBI/TBID))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/TBI/TBID)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="$startDate" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="$endDate" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/SB/TBI/TBIF, '-',  record/metadata/schede/BNB/SB/TBI/TBIF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/TBI/TBIF, ' - ', record/metadata/schede/BNB/SB/TBI/TBIF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/BNB/SB/TBI/TBIF, ' - ', record/metadata/schede/BNB/SB/TBI/TBIF)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/BNB/SB/TBI/TBIF" />
			</arco-arco:endTime>
		</rdf:Description>														
	</xsl:if>								
								<!--Host Individual as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'HostIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIM))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/HostIndividual'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIM" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIM" />
			</l0:name>
		</rdf:Description>
	</xsl:if>		
									<!--Close Individual as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'CloseIndividual/', arco-fn:arcofy(record/metadata/schede/BNB/LR/LRI/LRIV))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CloseIndividual'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNB/LR/LRI/LRIV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>						
			<!-- measurement as individual -->
	<xsl:variable name="parent-id" select="position()" />
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXA">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-height')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Height')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', WoodSample, '-', 'height', '-', arco-fn:extract-value(.))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:for-each>			
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXL">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-width')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Width')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', WoodSample, '-', 'width', '-', arco-fn:extract-value(.))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXN">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-length')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Length')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/',WoodSample, '-', 'length', '-', arco-fn:extract-value(.))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-diameter')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Diameter')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/',WoodSample, '-', 'diameter', '-', arco-fn:extract-value(.))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXP">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/WoodSample/', '-', position(), '-weight')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of wood sample ', position(), ': ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del reperto xilologico ',  position(), ': ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Weight')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/',WoodSample, '-', 'weight', '-', arco-fn:extract-value(.))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:for-each>
										<!-- value as individual -->	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIT">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'temperature', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIT)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'depth', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIO)" />
			</l0:name>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIA">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'altitude', '-', arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/BNB/LR/LRI/LRIA)" />
			</l0:name>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXA">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'height', '-', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXL">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'width', '-', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:for-each>		
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXN">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'length', '-', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<mu:hasMeasurementUnit>
			<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:for-each>			
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXD">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'diameter', '-', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<mu:hasMeasurementUnit>
			<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:for-each>		
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXP">
		<rdf:Description>
			<xsl:attribute name="rdf:about"
				select="concat($NS, 'Value/', $itemURI, '-', 'wheight', '-', arco-fn:extract-value(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="arco-fn:extract-value(.)" />
			</l0:name>
			<mu:hasMeasurementUnit>
				<xsl:attribute name="rdf:resource"	select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			</mu:hasMeasurementUnit>
		</rdf:Description>
	</xsl:for-each>		
	<xsl:if test="record/metadata/schede/*/SB/DBV/DBVA">
		<xsl:variable name="virgola" select="record/metadata/schede/*/SB/DBV/DBVA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/TBI/TBIA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/TBI/TBIA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
            	<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
            	<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/LR/LRD/LRDA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
               	</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                	</xsl:attribute>
            		<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
										<!-- Agent as individual -->	
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAC))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAC)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAG))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAA/NAAI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAA/NAAI))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAI)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAA/NAAI)" />
			</l0:name>
		</rdf:Description>
	</xsl:if> 
    <xsl:if test="record/metadata/schede/BNB/SB/NAT/NATC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATC))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATC)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>    
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATG))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/NAT/NATI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNB/SB/NAT/NATI))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATI)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNB/SB/NAT/NATI)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
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
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
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
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
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
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBN/RBNI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
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
	<xsl:if test="record/metadata/schede/BNB/SB/DBV/DBVA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/DBV/DBVA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/SB/ABC/ABCA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/SB/ABC/ABCA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRD/LRDA">
		<xsl:variable name="virgola" select="record/metadata/schede/BNB/LR/LRD/LRDA" />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/RB/RBR/RBRA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBC/DBCA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
            	<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXT">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBS/DBSR">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
        	    <rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBP/DBPA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	           			<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBR/DBRA">
		<xsl:variable name="virgola" select="." />
		<xsl:variable name="novirgola" select="translate($virgola, ',', ' ')" />
		<xsl:variable name="aut" select="translate($novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($aut)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
				</xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>
						<!-- MeasurementUnit as individual -->
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIO">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIO))" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNB/LR/LRI/LRIA">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(record/metadata/schede/BNB/LR/LRI/LRIA))" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXA">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXL">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNB/DB/DBX/DBXP">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(.))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/MeasurementUnit" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(arco-fn:extract-unit(.))" />
			</l0:name>
		</rdf:Description>
	</xsl:for-each>
	
	</xsl:if> 
	
	<xsl:if test="$sheetType='BNM'">
		<!-- Properties of MineralHeritage -->
		<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<xsl:if test="$sheetType='BNM'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MineralHeritage'" />
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="not($sheetType='BNB')">
			<xsl:if test="record/metadata/schede/*/AC/ACK">
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:isClassifiedByCurrentTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:isClassifiedByCurrentTaxon>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
		</xsl:for-each>
			
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNP">
			<arco-mp:polytype>
				<xsl:value-of select="true()" />
			</arco-mp:polytype>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSF">
			<arco-mp:hasChemicalFormula>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSF)))" />
				</xsl:attribute>
			</arco-mp:hasChemicalFormula>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSE">
			<arco-mp:hasChemicalFormula>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSE)))" />
				</xsl:attribute>
			</arco-mp:hasChemicalFormula>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC">
			<arco-mp:hasUnitCell>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'UnitCell/',  $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasUnitCell>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA or record/metadata/schede/BNM/SM/SMF/SMFZ">
			<arco-mp:hasCleavage>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Cleavage/',  $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasCleavage>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM">
			<xsl:if test="./RMC">
				<arco-mp:hasUnitCell>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'UnitCell/',  $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasUnitCell>
			</xsl:if>
			<xsl:if test="./RMF/RMFA or ./RMF/RMFZ">
				<arco-mp:hasCleavage>
					<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI, '-', position())" />
				</arco-mp:hasCleavage>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAO">
			<arco-mp:hasHostRock>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/BNM/IM/IMA/IMAO))" />
				</xsl:attribute>
			</arco-mp:hasHostRock>
		</xsl:if>					
		<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMT"> 
			<xsl:if test="./RMTT and not(starts-with(lower-case(normalize-space(./RMTT)), 'non tipo'))">
				<arco-mp:hasTypeSpecimenIdentification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-mp:hasTypeSpecimenIdentification>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SMA/SMAI">
			<arco-mp:hasInclusion>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Inclusion/', arco-fn:urify(.))" />
				</xsl:attribute>
			</arco-mp:hasInclusion>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA">
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAZ and starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAZ)), 'presente')">
			<arco-mp:zoning>
            	<xsl:value-of select="true()" />
			</arco-mp:zoning>
		</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFR and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFR)), 'non rilevata'))">
			<arco-mp:radioactivity>
            	<xsl:value-of select="true()" />
			</arco-mp:radioactivity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)), 'non rilevata'))">
			<arco-mp:pseudomorph>
            	<xsl:value-of select="true()" />
			</arco-mp:pseudomorph>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)), 'non rilevata'))">
			<arco-mp:paramorph>
            	<xsl:value-of select="true()" />
			</arco-mp:paramorph>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAB" >
			<arco-mp:hasCrystalMorphology>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalMorphology/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasCrystalMorphology>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAA" >
			<arco-mp:hasCrystalHabit>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalHabit/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasCrystalHabit>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP" >
			<arco-mp:hasPseudomorhosis>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Pseudomorhosis/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasPseudomorhosis>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS" >
			<arco-mp:hasParamorhosis>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Paramorhosis/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasParamorhosis>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAG" >
			<arco-mp:hasCrystalTwinning>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalTwinning/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasCrystalTwinning>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-dd:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
            	</xsl:attribute>
			</arco-dd:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-dd:hasShape>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
            	</xsl:attribute>
			</arco-dd:hasShape>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasStreak>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
            	</xsl:attribute>
			</arco-mp:hasStreak>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasLustre>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
            	</xsl:attribute>
			</arco-mp:hasLustre>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasDiaphaneity>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
            	</xsl:attribute>
			</arco-mp:hasDiaphaneity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasFracture>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
            	</xsl:attribute>
			</arco-mp:hasFracture>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasTenacity>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
            	</xsl:attribute>
			</arco-mp:hasTenacity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasOpticalPhenomena>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
            	</xsl:attribute>
			</arco-mp:hasOpticalPhenomena>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasMagnetism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
            	</xsl:attribute>
			</arco-mp:hasMagnetism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasFluorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
            	</xsl:attribute>
			</arco-mp:hasFluorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPhosphorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
            	</xsl:attribute>
			</arco-mp:hasPhosphorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-dd:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
            	</xsl:attribute>
			</arco-dd:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
            	</xsl:attribute>
			</arco-mp:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
            	</xsl:attribute>
			</arco-mp:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-mp:hasAnisotropy>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
            	</xsl:attribute>
			</arco-mp:hasAnisotropy>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFG or record/metadata/schede/BNM/SM/SMF/SMFI or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
		<xsl:if test="./RMFV or ./RMFG or ./RMFI or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI or record/metadata/schede/BNM/SM/SMO/SMOR or record/metadata/schede/BNM/SM/SMO/SMOO or record/metadata/schede/BNM/SM/SMO/SMOE or record/metadata/schede/BNM/SM/SMO/SMOA or record/metadata/schede/BNM/SM/SMO/SMOB or record/metadata/schede/BNM/SM/SMO/SMOG or record/metadata/schede/BNM/SM/SMO/SMOV or record/metadata/schede/BNM/SM/SMO/SMOD">
				<arco-mp:hasRefraction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasRefraction>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMO and not(record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF or record/metadata/schede/BNM/SM/SMM/SMMB">
				<arco-mp:hasReflectance>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasReflectance>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMR">
				<arco-mp:internalReflection>
            		<xsl:value-of select="true()" />
				</arco-mp:internalReflection>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMM and not(record/metadata/schede/BNM/SM/SMM or record/metadata/schede/BNM/SM/SMO)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>	
		<xsl:for-each select="record/metadata/schede/BNM/RM">
			<xsl:if test="./RMF or ./RMO or ./RMM">
				<xsl:if test="./RMF/RMFC or ./RMF/RMFT or ./RMF/RMFB or ./RMF/RMFP or ./RMF/RMFU or ./RMF/RMFE or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./RMM/RMMF or ./RMM/RMMB">
				<arco-mp:hasReflectance>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasReflectance>
			</xsl:if>
			<xsl:if test="./RMO/RMOI or ./RMO/RMOR or ./RMO/RMOO or ./RMO/RMOE or ./RMO/RMOA or ./RMO/RMOB or ./RMO/RMOG or ./RMO/RMOV or ./RMO/RMOD">
				<arco-mp:hasRefraction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasRefraction>
			</xsl:if>
		</xsl:for-each>
	</rdf:Description>
	<!-- Cultural entity technical status -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF or record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM">
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC or record/metadata/schede/BNM/SM/SMF/SMFT or record/metadata/schede/BNM/SM/SMF/SMFB or record/metadata/schede/BNM/SM/SMF/SMFP or record/metadata/schede/BNM/SM/SMF/SMFE or record/metadata/schede/BNM/SM/SMF/SMFO or record/metadata/schede/BNM/SM/SMF/SMFM or record/metadata/schede/BNM/SM/SMF/SMFL or record/metadata/schede/BNM/SM/SMF/SMFS or record/metadata/schede/BNM/SM/SMF/SMFU or record/metadata/schede/BNM/SM/SMM/SMMC or record/metadata/schede/BNM/SM/SMM/SMMA or record/metadata/schede/BNM/SM/SMM/SMMP or record/metadata/schede/BNM/SM/SMO/SMOP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Cultural entity technical status -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
		<xsl:if test="./RMF/RMFC or ./RMF/RMFT or ./RMF/RMFB or ./RMF/RMFP or ./RMF/RMFU or ./RMF/RMFE or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RMF/RMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFB">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFB)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFE">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFE)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMO/RMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
				<!-- Physical characteristic as individual -->
	<xsl:if test="./RMF/RMFC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFT)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFT)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFT)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Streak'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFB)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFB)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFB)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Lustre'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Diaphaneity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFU)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fracture'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFE)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFE)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Tenacity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFO)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFO)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/OpticalPhenomena'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFM)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Magnetism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFL)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFL)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fluorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMF/RMFS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMF/RMFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMF/RMFS)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Phosphorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMM/RMMA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMM/RMMA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMM/RMMA)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Anisotropy'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMO/RMOP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(./RMO/RMOP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(./RMO/RMOP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
	<!-- Physical characteristic as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Streak'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Lustre'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Diaphaneity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fracture'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Tenacity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/OpticalPhenomena'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Magnetism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fluorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Phosphorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Anisotropy'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<!-- Measurement collection as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFG or record/metadata/schede/BNM/SM/SMF/SMFI or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
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
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>

			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	<!-- measurement as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFV)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gladstone-dale-relation', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFG)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-compatibility-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFI)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFD)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFF)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFH)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFN)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<!-- Value as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFV)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gladstone-dale-relation', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFG)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-compatibility-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFI)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFI" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFI" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFD)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFF)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFH)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFN)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Taxon of mineral property -->
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
					<!-- Measurement collection as individual -->
	<xsl:if test="./RMFV or ./RMFG or ./RMFI or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</l0:name>
			 <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	
								<!-- measurement as individual -->	
	
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(./RMFV)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFG)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFG)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFG)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFG)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gladstone-dale-relation', '-', arco-fn:urify(normalize-space(./RMFG)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFI)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-compatibility-index', '-', arco-fn:urify(normalize-space(./RMFI)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', arco-fn:urify(normalize-space(./RMFD)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', arco-fn:urify(normalize-space(./RMFF)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', arco-fn:urify(normalize-space(./RMFH)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', arco-fn:urify(normalize-space(./RMFN)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>

								<!-- Value as individual -->
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(./RMFV)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gladstone-dale-relation', '-', arco-fn:urify(normalize-space(./RMFG)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-compatibility-index', '-', arco-fn:urify(normalize-space(./RMFI)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFI" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFI" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-measured-density', '-', arco-fn:urify(normalize-space(./RMFD)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-calculated-density', '-', arco-fn:urify(normalize-space(./RMFF)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'mohs-hardness', '-', arco-fn:urify(normalize-space(./RMFH)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-', 'vhn-hardness', '-', arco-fn:urify(normalize-space(./RMFN)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
	<!-- Taxon Specification of mineral property -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNV)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNV" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNV" />
            </l0:name>           
  		</rdf:Description>
  	</xsl:if>
	<!-- Taxon as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
			    	</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
			    	</xsl:attribute>
			   	</xsl:otherwise>
		  	</xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNI" />
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<rdfs:label xml:lang="it">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNA" />
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<l0:name xml:lang="en">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNI" />
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<l0:name xml:lang="it">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNA" />
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNS">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNS" />
					</arco-cd:synonym>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSK">
					<arco-mp:newDanaCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSK" />
					</arco-mp:newDanaCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
					<arco-mp:strunzCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
					</arco-mp:strunzCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSG">
					<arco-mp:imaCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSG" />
					</arco-mp:imaCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNV">
				<arco-mp:hasTaxonSpecification>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNV)))" />
		    		</xsl:attribute>
            	</arco-mp:hasTaxonSpecification>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC or record/metadata/schede/BNM/SM/SMS/SMSS">
				<arco-mp:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMS/SMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNM/SM/SMS/SMSC" >
					<rdfs:label>
				   		<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMS/SMSC, ' ', record/metadata/schede/BNM/SM/SMS/SMSS)" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMS/SMSC, ' ', record/metadata/schede/BNM/SM/SMS/SMSS)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
				   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
					</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
				<arco-mp:strunzCode>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
				</arco-mp:strunzCode>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
				<xsl:if test="not(record/metadata/schede/BNM/SM/SMS/SMSS)">
					<arco-mp:strunzCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
					</arco-mp:strunzCode>
				</xsl:if>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
			</l0:name>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSK">
				<arco-mp:newDanaCode>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSK" />
				</arco-mp:newDanaCode>
			</xsl:if>
		</rdf:Description>
	</xsl:if>											
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
		<!-- Taxon Specificationof mineral property -->	
	<xsl:if test="./RMN/RMNV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RMN/RMNV)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="./RMN/RMNV" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RMN/RMNV" />
            </l0:name>           
  		</rdf:Description>
  	</xsl:if>
		<!-- Taxon as individual -->
	<xsl:if test="./RMN">
	<rdf:Description>
		<xsl:choose>
				<xsl:when test="./RMN/RMNI">
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)))" />
			    	</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)))" />
			    	</xsl:attribute>
			   	</xsl:otherwise>
		  	</xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="./RMN/RMNI">
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="./RMN/RMNI" />
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="./RMN/RMNA">
				<rdfs:label xml:lang="it">
					<xsl:value-of select="./RMN/RMNA" />
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="./RMN/RMNI">
				<l0:name xml:lang="en">
					<xsl:value-of select="./RMN/RMNI" />
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="./RMN/RMNA">
				<l0:name xml:lang="it">
					<xsl:value-of select="./RMN/RMNA" />
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="./RMN/RMNS">
					<arco-cd:synonym>
						<xsl:value-of select="./RMN/RMNS" />
					</arco-cd:synonym>
			</xsl:if>
			<xsl:if test="./RMN/RMSK">
					<arco-mp:newDanaCode>
						<xsl:value-of select="./RMN/RMSK" />
					</arco-mp:newDanaCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSX">
					<arco-mp:strunzCode>
						<xsl:value-of select="./RMN/RMSX" />
					</arco-mp:strunzCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSG">
					<arco-mp:imaCode>
						<xsl:value-of select="./RMN/RMSG" />
					</arco-mp:imaCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSD">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSD)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="./RMN/RMSC or ./RMN/RMSS">
				<arco-mp:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="./RMN/RMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<rdf:Description>
		<xsl:if test="./RMS/RMSS">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="./RMS/RMSC" >
					<rdfs:label>
				   		<xsl:value-of select="concat(./RMS/RMSC, ' ', ./RMS/RMSS)" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat(./RMS/RMSC, ' ', ./RMS/RMSS)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
				   		<xsl:value-of select="./RMS/RMSS" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RMS/RMSS" />
					</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="./RMS/RMSC">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSC)))" />
		    		</xsl:attribute>
            	</arco-mp:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="./RMS/RMSX">
				<arco-mp:strunzCode>
					<xsl:value-of select="./RMS/RMSX" />
				</arco-mp:strunzCode>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="./RMS/RMSC">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="./RMS/RMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMS/RMSC" />
			</l0:name>
			<xsl:if test="./RMS/RMSX">
				<xsl:if test="not(./RMS/RMSS)">
					<arco-mp:strunzCode>
						<xsl:value-of select="./RMS/RMSX" />
					</arco-mp:strunzCode>
				</xsl:if>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="./RMS/RMSD">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="./RMS/RMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMS/RMSD" />
			</l0:name>
			<xsl:if test="./RMS/RMSK">
				<arco-mp:newDanaCode>
					<xsl:value-of select="./RMS/RMSK" />
				</arco-mp:newDanaCode>
			</xsl:if>
			<arco-mp:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-mp:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	</xsl:for-each>
	<!-- Classification in time -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="./RMNV and (not(starts-with(lower-case(normalize-space(./RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(./RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(./RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:for-each>
	<!-- Identification in time -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'IdentifcationInTime/',$itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="./RMNV and (not(starts-with(lower-case(normalize-space(./RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(./RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(./RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:for-each>
	<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SMET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./SMET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SMEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./SMEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RMET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./RMET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./RMEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./RMEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<!-- Type specimen identification as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>
		
					<!-- Bibliography as individual -->
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
			
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>	
	<!-- Type specimen identification as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="./RMN/RMNV and (not(starts-with(lower-case(normalize-space(./RMN/RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(./RMN/RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(./RMN/RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:if test="./RMT/RMTT and not(starts-with(lower-case(normalize-space(./RMT/RMTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RMT/RMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RMT/RMTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./RMN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="./RMN/RMNI">
						<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    </xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>

		<xsl:if test="./RMT/RMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="./RMT/RMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RMT/RMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMT/RMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
	<!-- Chemical formula as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/EmpiricalChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSF" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SemplifiedChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSE" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSE" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMS">
	<xsl:if test="./RMSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(./RMSF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/EmpiricalChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./RMSF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMSF" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMSE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(./RMSE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SemplifiedChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./RMSE" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMSE" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
	<!-- Host rock as individual -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">							
	<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAO">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/BNM/IM/IMA/IMAO))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/HostRock'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAO" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAO" />
            </l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<!-- Inclusions rock as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/SM/SMA/SMAI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Inclusion/', arco-fn:urify(.))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Inclusion'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="." />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="." />
            </l0:name>
		</rdf:Description>
	</xsl:for-each>
	<!-- Orientation as individual -->	
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">						
	<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/IM/IMA/IMAG)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Orientation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<!-- Morphology as individual -->	
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAB" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalMorphology/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalMorphology'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAB)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAB)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAA" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalHabit/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalHabit'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAA)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Pseudomorhosis/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Pseudomorhosis'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Paramorhosis/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Paramorhosis'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAG" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalTwinning/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalTwinning'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Cleavage as individual -->	
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA or record/metadata/schede/BNM/SM/SMF/SMFZ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cleavage'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura el bene culturale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA">
				<arco-mp:cleavageGrade>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFA" />
				</arco-mp:cleavageGrade>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFZ">
				<arco-mp:cleavageDirection>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFZ" />
				</arco-mp:cleavageDirection>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
	<xsl:if test="./RMF/RMFA or ./RMF/RMFZ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cleavage'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura el bene culturale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RMF/RMFA">
				<arco-mp:cleavageGrade>
					<xsl:value-of select="./RMF/RMFA" />
				</arco-mp:cleavageGrade>
			</xsl:if>
			<xsl:if test="./RMF/RMFZ">
				<arco-mp:cleavageDirection>
					<xsl:value-of select="./RMF/RMFZ" />
				</arco-mp:cleavageDirection>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>	
	<!-- UnitCell as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'UnitCell/',  $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/UnitCell'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA or record/metadata/schede/BNM/SM/SMC/SMCB or record/metadata/schede/BNM/SM/SMC/SMCC or record/metadata/schede/BNM/SM/SMC/SMCF or record/metadata/schede/BNM/SM/SMC/SMCE or record/metadata/schede/BNM/SM/SMC/SMCM or record/metadata/schede/BNM/SM/SMC/SMCV or record/metadata/schede/BNM/SM/SMC/SMCZ">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI)" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS or record/metadata/schede/BNM/SM/SMC/SMCL or record/metadata/schede/BNM/SM/SMC/SMCP or record/metadata/schede/BNM/SM/SMC/SMCG">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-UnitCell')" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
				<arco-mp:hasCrystalSystem>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
            		</xsl:attribute>
				</arco-mp:hasCrystalSystem>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
				<arco-mp:hasCrystalClass>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
            		</xsl:attribute>
				</arco-mp:hasCrystalClass>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
				<arco-mp:hasPointGroup>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
            		</xsl:attribute>
				</arco-mp:hasPointGroup>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
				<arco-mp:hasSpaceGroup>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
            		</xsl:attribute>
				</arco-mp:hasSpaceGroup>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA or record/metadata/schede/BNM/SM/SMC/SMCB or record/metadata/schede/BNM/SM/SMC/SMCC or record/metadata/schede/BNM/SM/SMC/SMCF or record/metadata/schede/BNM/SM/SMC/SMCE or record/metadata/schede/BNM/SM/SMC/SMCM or record/metadata/schede/BNM/SM/SMC/SMCV or record/metadata/schede/BNM/SM/SMC/SMCZ">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misure della cella del minerale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misure della cella del minerale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measuerements of cell of mineral ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measuerements of cell of mineral ', $itemURI)" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="true()" />
        	    </arco-core:current>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-a-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-b-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-c-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCF">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter')" />
							</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCM">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-volume')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCZ">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-z-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-a-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'aParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-a-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-a-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-b-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'bParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-b-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-b-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-c-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'cParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-c-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCC)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-c-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCC)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCC" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCC" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'alfaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-alfa-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-alfa-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'betaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-beta-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-beta-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'gammaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gamma-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCM)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gamma-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCM)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCM" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCM" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-volume')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Volume')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-volume', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-volume', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-z-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'zParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-z-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCZ)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-z-parameter', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCZ)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCZ" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCZ" />
				</l0:name>
			</rdf:Description>
		</xsl:if>			
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS or record/metadata/schede/BNM/SM/SMC/SMCL or record/metadata/schede/BNM/SM/SMC/SMCP or record/metadata/schede/BNM/SM/SMC/SMCG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		       		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-UnitCell')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
         	   		<xsl:value-of select="true()" />
            	</arco-core:current>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalSystem'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalClass'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PointGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SpaceGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>		
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
	<xsl:if test="./RMC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS,'UnitCell/',  $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/UnitCell'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RMC/RMCA or ./RMC/RMCB or ./RMC/RMCC or ./RMC/RMCF or ./RMC/RMCE or ./RMC/RMCM or ./RMC/RMCV or ./RMC/RMCZ">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="./RMC/RMCS or ./RMC/RMCL or ./RMC/RMCP or ./RMC/RMCG">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
		            	    <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-UnitCell-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</rdf:Description>
		<xsl:if test="./RMC/RMCA or ./RMC/RMCB or ./RMC/RMCC or ./RMC/RMCF or ./RMC/RMCE or ./RMC/RMCM or ./RMC/RMCV or ./RMC/RMCZ">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            	   		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure della cella del minerale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure della cella del minerale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of cell of mineral ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of cell of mineral ', $itemURI" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="false()" />
        	    </arco-core:current>
				<xsl:if test="./RMC/RMCA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-a-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-b-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-c-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCF">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCM">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-volume', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCZ">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-z-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
	
		<xsl:if test="./RMC/RMCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-a-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'aParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-a-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-a-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-b-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'bParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-b-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-b-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-c-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCC)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCC)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCC)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCC)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'cParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-c-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCC)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-c-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCC)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCC" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCC" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'alfaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-alfa-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-alfa-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'betaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-beta-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-beta-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCM)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCM)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCM)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCM)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'gammaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gamma-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCM)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gamma-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCM)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCM" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCM" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-volume', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Volume')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-volume', '-', arco-fn:urify(normalize-space(./RMC/RMCV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-volume', '-', arco-fn:urify(normalize-space(./RMC/RMCV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-z-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCZ)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCZ)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'zParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-z-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCZ)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-z-parameter', '-', arco-fn:urify(normalize-space(./RMC/RMCZ)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCZ" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCZ" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		
		<xsl:if test="./RMC/RMCS or ./RMC/RMCL or ./RMC/RMCP or ./RMC/RMCG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		       		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-UnitCell-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
         	   		<xsl:value-of select="false()" />
            	</arco-core:current>
				<xsl:if test="./RMC/RMCS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCS)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCL)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCP)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCG">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCG)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RMC/RMCS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCS)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCS)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalSystem'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCL)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCL)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystalClass'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCP)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCP)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PointGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCG)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCG)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SpaceGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>	
	
					<!-- Reflectance as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF or record/metadata/schede/BNM/SM/SMM/SMMB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Reflectance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
       	    </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-reflectance')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-bireflectance')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-reflectance')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Reflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-reflectance', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-reflectance', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-bireflectance')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Bireflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-bireflectance', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-bireflectance', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMM">
	<xsl:if test="./RMMF or ./RMMB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Reflectance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
       	    </arco-core:current>
			<xsl:if test="./RMMF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-reflectance', '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMMB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-bireflectance', '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RMMF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-reflectance', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Reflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-reflectance', '-', arco-fn:urify(normalize-space(./RMMF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-reflectance', '-', arco-fn:urify(normalize-space(./RMMF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMMF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMMF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMMB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-bireflectance', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Bireflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-bireflectance', '-', arco-fn:urify(normalize-space(./RMMB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-bireflectance', '-', arco-fn:urify(normalize-space(./RMMB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMMB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMMB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>	

				<!-- Refraction as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI or record/metadata/schede/BNM/SM/SMO/SMOR or record/metadata/schede/BNM/SM/SMO/SMOO or record/metadata/schede/BNM/SM/SMO/SMOE or record/metadata/schede/BNM/SM/SMO/SMOA or record/metadata/schede/BNM/SM/SMO/SMOB or record/metadata/schede/BNM/SM/SMO/SMOG or record/metadata/schede/BNM/SM/SMO/SMOV or record/metadata/schede/BNM/SM/SMO/SMOD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Refraction'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
    	       	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOR">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-birefingence')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOO">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOE">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-2vAngle')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-dispersion')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'RefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOI)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOI)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOI" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOI" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOR">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-birefringence')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Birefringence')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-birefringence', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOR)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-birefringence', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOR)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOR" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOO">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'OmegaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOO)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-omega-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOO)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOO" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'EpsilonRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-epsilon-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-epsilon-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'AlfaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-alfa-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-alfa-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'BetaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-beta-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-beta-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOG">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'GammaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gamma-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOG)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gamma-refractive-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOG)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOG" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOG" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-2vAngle')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', '2vAngle')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-2vAngle', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-2vAngle', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOD">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-dispersion')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Dispersion')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-dispersion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOD)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-dispersion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOD)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOD" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
					<!-- Refraction as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
	<xsl:if test="./RMO/RMOI or ./RMO/RMOR or ./RMO/RMOO or ./RMO/RMOE or ./RMO/RMOA or ./RMO/RMOB or ./RMO/RMOG or ./RMO/RMOV or ./RMO/RMOD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Refraction'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="false()" />
        	    </arco-core:current>
				<xsl:if test="./RMO/RMOI">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOR">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-birefingence', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOO">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOG">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-2vAngle', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOD">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-dispersion', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		<xsl:if test="./RMO/RMOI">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOI)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'RefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOI)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOI)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOI" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOI" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOR">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-birefringence', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOR)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOR)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOR)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOR)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Birefringence')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-birefringence', '-', arco-fn:urify(normalize-space(./RMO/RMOR)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-birefringence', '-', arco-fn:urify(normalize-space(./RMO/RMOR)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOR" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOO">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOO)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOO)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOO)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOO)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'OmegaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOO)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-omega-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOO)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOO" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'EpsilonRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-epsilon-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-epsilon-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'AlfaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-alfa-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-alfa-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'BetaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-beta-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-beta-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOG">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOG)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOG)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOG)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOG)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'GammaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-gamma-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOG)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-gamma-refractive-index', '-', arco-fn:urify(normalize-space(./RMO/RMOG)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOG" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOG" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-2vAngle', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', '2vAngle')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-2vAngle', '-', arco-fn:urify(normalize-space(./RMO/RMOV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-2vAngle', '-', arco-fn:urify(normalize-space(./RMO/RMOV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOD">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-dispersion', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOD)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOD)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOD)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOD)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Dispersion')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-dispersion', '-', arco-fn:urify(normalize-space(./RMO/RMOD)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-dispersion', '-', arco-fn:urify(normalize-space(./RMO/RMOD)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOD" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
				
					<!-- Author as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
		<xsl:variable name="lril-virgola" select="record/metadata/schede/*/LR/LRI/LRIL" />
		<xsl:variable name="lril-novirgola" select="translate($lril-virgola, ',', ' ')" />
		<xsl:variable name="lirl" select="translate($lril-novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($lirl)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/CPV/Person'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>	
	</xsl:if>
	
	<xsl:if test="$sheetType='BNPE'" >	
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	        	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PetrologicHeritage'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
			        </xsl:attribute>
				</rdf:type>
				<arco-mp:isClassifiedByCurrentTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-mp:isClassifiedByCurrentTaxon>
				<arco-core:isClassifiedBy>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isClassifiedBy>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
				<arco-core:isClassifiedBy>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-core:isClassifiedBy>
				<arco-core:hasClassificationInTime>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
					</xsl:attribute>
				</arco-core:hasClassificationInTime>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRE">
				<arco-mp:hasLabel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-mp:hasLabel>			
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRE">
				<arco-mp:hasLabel>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
					</xsl:attribute>
				</arco-mp:hasLabel>			
			</xsl:for-each>			
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRT/SRTT)), 'non tipo'))">
				<arco-mp:hasTypeSpecimenIdentification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasTypeSpecimenIdentification>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRT"> 
				<xsl:if test="./RRTT and not(starts-with(lower-case(normalize-space(./RRTT)), 'non tipo'))">
					<arco-mp:hasTypeSpecimenIdentification>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-mp:hasTypeSpecimenIdentification>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	 				</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR">
				<xsl:if test="./RRC/RRCD or ./RRC/RRCM or ./RRC/RRCT or ./RRF/RRFC">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
		    	            <xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD or record/metadata/schede/BNPE/SR/SRG/SRGS  or record/metadata/schede/BNPE/SR/SRG/SRGP or record/metadata/schede/BNPE/SR/SRG/SRGA or record/metadata/schede/BNPE/SR/SRG/SRGB or record/metadata/schede/BNPE/SR/SRG/SRGC or record/metadata/schede/BNPE/SR/SRG/SRGE or record/metadata/schede/BNPE/SR/SRG/SRGR or record/metadata/schede/BNPE/SR/SRF/SRFV or record/metadata/schede/BNPE/SR/SRF/SRFI  or record/metadata/schede/BNPE/SR/SRM/SRMN or record/metadata/schede/BNPE/SR/SRF/SRFP">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>		
			<xsl:for-each select="record/metadata/schede/BNPE/RR">
				<xsl:if test="./RRG/RRGD or ./RRG/RRGS or ./RRG/RRGP or ./RRG/RRGA or ./RRG/RRGB or ./RRG/RRGC or ./RRG/RRGE or ./RRG/RRGR or ./RRF/RRFV or ./RRF/RRFI or ./RRM/RRMN or ./RRF/RRFP">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFR and (starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFR)), 'presente'))">
				<arco-mp:radioactivity>
	            	<xsl:value-of select="true()" />
				</arco-mp:radioactivity>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)), 'nessuna'))">
				<arco-mp:hasAlterationGrade>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'AlterationGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)))" />
	 				</xsl:attribute>
				</arco-mp:hasAlterationGrade>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCH">
				<arco-mp:hasAlterationType>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'AlterationType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)))" />
	 				</xsl:attribute>
				</arco-mp:hasAlterationType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCE">
				<arco-mp:hasEruptiveType>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'EruptiveType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)))" />
	 				</xsl:attribute>
				</arco-mp:hasEruptiveType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCA">
				<arco-mp:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)))" />
	 				</xsl:attribute>
				</arco-mp:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCP">
				<arco-mp:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)))" />
	 				</xsl:attribute>
				</arco-mp:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCS">
				<arco-mp:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)))" />
	 				</xsl:attribute>
				</arco-mp:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCB">
				<arco-mp:hasSedimentaryStructure>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)))" />
	 				</xsl:attribute>
				</arco-mp:hasSedimentaryStructure>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR or record/metadata/schede/BNPE/SR/SRC/SRCX or record/metadata/schede/BNPE/SR/SRC/SRCC or record/metadata/schede/BNPE/SR/SRC/SRCG or record/metadata/schede/BNPE/SR/SRC/SRCF">
				<arco-mp:hasTexture>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
	 				</xsl:attribute>
				</arco-mp:hasTexture>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRC">
				<xsl:if test="./RRCR or ./RRCX or ./RRCC or ./RRCG or ./RRCF">
				<arco-mp:hasTexture>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
	 				</xsl:attribute>
				</arco-mp:hasTexture>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMP">
				<arco-mp:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-', position())" />
	 				</xsl:attribute>
				</arco-mp:hasMineralPresence>
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
		 			</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMA">
				<arco-mp:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-', position())" />
	 				</xsl:attribute>
				</arco-mp:hasMineralPresence>
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
		               	<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
		 			</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMP">
				<arco-mp:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-revised-', position())" />
	 				</xsl:attribute>
				</arco-mp:hasMineralPresence>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMA">
				<arco-mp:hasMineralPresence>
					<xsl:attribute name="rdf:resource">
		        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-revised', position())" />
	 				</xsl:attribute>
				</arco-mp:hasMineralPresence>
			</xsl:for-each>
	
			<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLP">
				<arco-core:hasConstituent>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'Fossil/',  arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)))" />
	 				</xsl:attribute>
				</arco-core:hasConstituent>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age')" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/BNPE/SR/SRR">
				<xsl:if test="./SRRE">
					<arco-cd:hasAgeInterpretation>
						<xsl:attribute name="rdf:resource">
	            	    	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-', position())" />
	 					</xsl:attribute>
					</arco-cd:hasAgeInterpretation>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRL/RRLE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age-', position())" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/BNPE/RR/RRR/RRRE">
				<arco-cd:hasAgeInterpretation>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-revised-', position())" />
	 				</xsl:attribute>
				</arco-cd:hasAgeInterpretation>
			</xsl:for-each>
		</rdf:Description>	
	
						<!-- Taxon of petrologic property -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    		</xsl:attribute>
					</xsl:otherwise>
			    </xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/RockType'" />
	            	</xsl:attribute>
				</rdf:type>	
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNR">
					<rdfs:label xml:lang="en">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNR" />
			   		</rdfs:label>
			   	</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNP">
					<rdfs:label xml:lang="it">
		   				<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNP" />
		   			</rdfs:label>
		    	</xsl:if>
			    <xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNR">
					<l0:name xml:lang="en">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNR" />
		   			</l0:name>
			   	</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNP">
					<l0:name xml:lang="it">
		   				<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNP" />
			  		</l0:name>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNC">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNC" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNN">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNN" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNT">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNT)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNV">
					<arco-mp:hasTaxonSpecification>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNV)))" />
			   			</xsl:attribute>
					</arco-mp:hasTaxonSpecification>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNV)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label>
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNV" />
				   	</rdfs:label>
					<l0:name>
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNV" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRN/SRNT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNT)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/LithologicType'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label xml:lang="it">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNT" />
				   	</rdfs:label>
					<l0:name xml:lang="it">
			   			<xsl:value-of select="record/metadata/schede/BNPE/SR/SRN/SRNT" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if> 
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./RRNR">
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
			    			<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    		</xsl:attribute>
					</xsl:otherwise>
			    </xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/RockType'" />
	            	</xsl:attribute>
				</rdf:type>	
				<xsl:if test="./RRNR">
					<rdfs:label xml:lang="en">
			   			<xsl:value-of select="./RRNR" />
			   		</rdfs:label>
			   	</xsl:if>
				<xsl:if test="./RRNP">
					<rdfs:label xml:lang="it">
		   				<xsl:value-of select="./RRNP" />
		   			</rdfs:label>
		    	</xsl:if>
			    <xsl:if test="./RRNR">
					<l0:name xml:lang="en">
			   			<xsl:value-of select="./RRNR" />
		   			</l0:name>
			   	</xsl:if>
				<xsl:if test="./RRNP">
					<l0:name xml:lang="it">
		   				<xsl:value-of select="./RRNP" />
			  		</l0:name>
				</xsl:if>
				<xsl:if test="./RRNC">
					<arco-cd:synonym>
						<xsl:value-of select="./RRNC" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="./RRNN">
					<arco-cd:synonym>
						<xsl:value-of select="./RRNN" />
					</arco-cd:synonym>
				</xsl:if>
				<xsl:if test="./RRNT">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNT)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
				<xsl:if test="./RRNV">
					<arco-mp:hasTaxonSpecification>
						<xsl:attribute name="rdf:resource">
			   				<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RRNV)))" />
			   			</xsl:attribute>
					</arco-mp:hasTaxonSpecification>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRNV">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RRNV)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Variety'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label>
			   			<xsl:value-of select="./RRNV" />
				   	</rdfs:label>
					<l0:name>
			   			<xsl:value-of select="./RRNV" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRNT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
			    		<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNT)))" />
			    	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/LithologicType'" />
	     	       		</xsl:attribute>
					</rdf:type>	
					<rdfs:label xml:lang="it">
			   			<xsl:value-of select="./RRNT" />
				   	</rdfs:label>
					<l0:name xml:lang="it">
			   			<xsl:value-of select="./RRNT" />
			   		</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>
							<!-- Classification in time -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRN">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
	            	 <xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="it">
	            	<xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
	            </l0:name>
				<rdfs:label xml:lang="en">
	            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="en">
	            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
	            </l0:name>
	            <arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<arco-mp:hasTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-mp:hasTaxon>
			</rdf:Description>
		</xsl:if>	
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRN">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
	            	 <xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="it">
	            	<xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
	            </l0:name>
				<rdfs:label xml:lang="en">
	            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
	            </rdfs:label>
	            <l0:name xml:lang="en">
	            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
	            </l0:name>
	            <arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<arco-mp:hasTaxon>
					<xsl:choose>
						<xsl:when test="./RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-mp:hasTaxon>
			</rdf:Description>
		</xsl:for-each>
		
						<!-- Label as individual  -->
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./SRET">
					<arco-mp:bodyTranscript>
						<xsl:value-of select="normalize-space(./SRET)" />
					</arco-mp:bodyTranscript>
				</xsl:if>
				<xsl:if test="./SREI">
					<arco-mp:headingTranscript>
						<xsl:value-of select="normalize-space(./SREI)" />
					</arco-mp:headingTranscript>
				</xsl:if>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>		
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of	select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RRET">
					<arco-mp:bodyTranscript>
						<xsl:value-of select="normalize-space(./RRET)" />
					</arco-mp:bodyTranscript>
				</xsl:if>
				<xsl:if test="./RREI">
					<arco-mp:headingTranscript>
						<xsl:value-of select="normalize-space(./RREI)" />
					</arco-mp:headingTranscript>
				</xsl:if>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>		
			</rdf:Description>
		</xsl:for-each>
		
						<!-- Geological context as individual -->
		<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">
		
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC or record/metadata/schede/*/IR/IRA/IRAE or record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/GeologicalContext'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAE">
					<arco-mp:hasMineralDeposit>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasMineralDeposit>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAG">
					<arco-mp:hasOutcrop>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasOutcrop>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/IR/IRA/IRAB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAC" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAN)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:if>						
		
							<!-- Mineral deposit as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDeposit'" />
					</xsl:attribute>	
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP">
					<arco-mp:hasMineralDepositType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAP))" />
						</xsl:attribute>
					</arco-mp:hasMineralDepositType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAE">
					<arco-mp:hasMineralDepositType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAE))" />
						</xsl:attribute>
					</arco-mp:hasMineralDepositType>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		
								<!-- Mineral Deposit Type as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAP))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAP)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAE))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAE)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
						
							<!-- OutCrop as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Outcrop'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAF))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAD">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
			        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IR/IRA/IRAD, '-',  record/metadata/schede/*/IR/IRA/IRAD)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAG">
					<arco-dd:hasOrientation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/*/IR/IRA/IRAG)))" />
					</xsl:attribute>
					</arco-dd:hasOrientation>
				</xsl:if>
			</rdf:Description>
		</xsl:if>						
						
						<!-- OutCrop type as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAF))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/OutcropType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAF)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>				
											
						<!-- Time interval as individual -->
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IR/IRA/IRAD, '-',  record/metadata/schede/*/IR/IRA/IRAD)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="concat(record/metadata/schede/*/IR/IRA/IRAD, ' - ', record/metadata/schede/*/IR/IRA/IRAD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="concat(record/metadata/schede/*/IR/IRA/IRAD, ' - ', record/metadata/schede/*/IR/IRA/IRAD)" />
				</l0:name>
				<arco-arco:startTime>
					<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAD" />
				</arco-arco:startTime>
				<arco-arco:endTime>
					<xsl:value-of select="record/metadata/schede/*/IR/IRA/IRAD" />
				</arco-arco:endTime>
			</rdf:Description>
		</xsl:if>
						<!-- Bibliography identification as individual -->					
		<xsl:for-each select="record/metadata/schede/*/IR/IRA/IRAB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
		       	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	           	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="." />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:for-each>	
		</xsl:if>
		
						<!-- Cultural entity technical status -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC or record/metadata/schede/BNPE/SR/SRC/SRCD or record/metadata/schede/BNPE/SR/SRC/SRCM or record/metadata/schede/BNPE/SR/SRC/SRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MetamorphicGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCT)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Roundness'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPE/RR">
			<xsl:if test="./RRC/RRCD or ./RRC/RRCM or ./RRC/RRCT or ./RRF/RRFC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI, '-', position())" />
	 				</xsl:attribute>
	 				<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/CulturalEntityTechnicalStatus'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="./RRC/RRCF">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRF/RRFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCD">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RRC/RRCT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRF/RRFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRF/RRFC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRF/RRFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRF/RRFC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCD)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCD)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/DiagenesisGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCM)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MetamorphicGrade'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RRC/RRCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRC/RRCT)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRC/RRCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRC/RRCT)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
	          			<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Roundness'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
	
						<!--  Measurement collection as individual  -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD or record/metadata/schede/BNPE/SR/SRG/SRGS  or record/metadata/schede/BNPE/SR/SRG/SRGP or record/metadata/schede/BNPE/SR/SRG/SRGA or record/metadata/schede/BNPE/SR/SRG/SRGB or record/metadata/schede/BNPE/SR/SRG/SRGC or record/metadata/schede/BNPE/SR/SRG/SRGE or record/metadata/schede/BNPE/SR/SRG/SRGR or record/metadata/schede/BNPE/SR/SRF/SRFV or record/metadata/schede/BNPE/SR/SRF/SRFI  or record/metadata/schede/BNPE/SR/SRM/SRMN or record/metadata/schede/BNPE/SR/SRF/SRFP">
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
					<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-density')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGS">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-cohesion')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGP">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-primary-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-secondary-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-effective-porosity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-permeability-coefficient')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGR">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-electrical-resistivity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFI">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-colour-index')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRM/SRMN">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-normative-mineralogy')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFP">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-paleomagnetism')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGD">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-density')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGD)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Density')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGD)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-density', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGD)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGD" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGD" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGS">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-cohesion')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGS)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Cohesion')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-cohesion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGS)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-cohesion', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGS)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGS" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGS" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGP">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGP)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Porosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGA">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-primary-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGA)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'PrimaryPorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-primary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGA)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-primary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGA)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGB">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-secondary-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGB)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'SecondaryPorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-secondary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGB)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-secondary-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGB)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGB" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGB" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGC">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-effective-porosity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGC)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'EffectivePorosity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-effective-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGC)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-effective-porosity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGC)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGC" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGC" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGE">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-permeability-coefficient')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGE)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'PermeabilityCoefficient')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-permeability-coefficient', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGE)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-permeability-coefficient', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGE)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGE" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGE" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRG/SRGR">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-electrical-resistivity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRG/SRGR)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ElectricalResistivity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-electrical-resistivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGR)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-electrical-resistivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRG/SRGR)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGR" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRG/SRGR" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFV">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFV)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Radioactivity')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFV)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-radioactivity', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFV)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFV" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFV" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFI">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-colour-index')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFI)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ColourIndex')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-colour-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFI)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-colour-index', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFI)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFI" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFI" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRM/SRMN">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-normative-mineralogy')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRM/SRMN)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'NormativeMineralogy')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-normative-mineralogy', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRM/SRMN)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-normative-mineralogy', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRM/SRMN)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRM/SRMN" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRM/SRMN" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRF/SRFP">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-paleomagnetism')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPE/SR/SRF/SRFP)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'Paleomagnetism')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-paleomagnetism', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-paleomagnetism', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRF/SRFP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRF/SRFP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>								
		
						<!-- Alteration grade as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)), 'nessuna'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'AlterationGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AlterationGrade'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCZ)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
						<!-- Alteration type as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCH">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'AlterationType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AlterationType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCH)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		
							<!-- Eruptive type as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'EruptiveType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/EruptiveType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCE)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		
						<!-- Sedimentary structure as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCA)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PrimarySedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCP)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SecondarySedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCS)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'SedimentaryStructure/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/BiogenicSedimentaryStructure'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCB)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
			
						<!-- Texture as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR or record/metadata/schede/BNPE/SR/SRC/SRCX or record/metadata/schede/BNPE/SR/SRC/SRCC or record/metadata/schede/BNPE/SR/SRC/SRCG or record/metadata/schede/BNPE/SR/SRC/SRCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF or record/metadata/schede/BNPE/SR/SRC/SRCG">
					<arco-mp:hasGrains>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Grains/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasGrains>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCX">
					<arco-mp:hasMatrix>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)))" />
						</xsl:attribute>
					</arco-mp:hasMatrix>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCC">
					<arco-mp:hasCement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)))" />
						</xsl:attribute>
					</arco-mp:hasCement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCR)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF or record/metadata/schede/BNPE/SR/SRC/SRCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Grains/', $itemURI)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Grains'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF">
						<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)))" />
							</xsl:attribute>
						</arco-dd:hasShape>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCG">
						<arco-mp:hasContactType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)))" />
							</xsl:attribute>
						</arco-mp:hasContactType>
					</xsl:if>	
				</rdf:Description>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCF)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    	       				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ContactType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>	
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Matrix'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCX)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRC/SRCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cement'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRC/SRCC)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRC">
			<xsl:if test="./RRCR or ./RRCX or ./RRCC or ./RRCG or ./RRCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<xsl:if test="./RRCR">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RRCR)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>
				<xsl:if test="./RRCF or ./RRCG">
					<arco-mp:hasGrains>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Grains/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-mp:hasGrains>
				</xsl:if>
				<xsl:if test="./RRCX">
					<arco-mp:hasMatrix>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(./RRCX)))" />
						</xsl:attribute>
					</arco-mp:hasMatrix>
				</xsl:if>
				<xsl:if test="./RRCC">
					<arco-mp:hasCement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(./RRCC)))" />
						</xsl:attribute>
					</arco-mp:hasCement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRCR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RRCR)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCR)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCR)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRCF or ./RRCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Grains/', $itemURI, '-', position())" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Grains'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Grani del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Grains of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="./RRCF">
						<arco-dd:hasShape>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRCF)))" />
							</xsl:attribute>
						</arco-dd:hasShape>
					</xsl:if>
					<xsl:if test="./RRCG">
						<arco-mp:hasContactType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(./RRCG)))" />
							</xsl:attribute>
						</arco-mp:hasContactType>
					</xsl:if>	
				</rdf:Description>
				<xsl:if test="./RRCF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RRCF)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./RRCF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./RRCF)" />
						</l0:name>
						<arco-dd:isCharacteristicClassifiedBy>
							<xsl:attribute name="rdf:resource">
	    	       				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
	            			</xsl:attribute>
						</arco-dd:isCharacteristicClassifiedBy>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./RRCG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'ContactType/', arco-fn:urify(normalize-space(./RRCG)))" />
	            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ContactType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./RRCG)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./RRCG)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>	
			</xsl:if>
			<xsl:if test="./RRCX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Matrix/', arco-fn:urify(normalize-space(./RRCX)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Matrix'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCX)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Cement/', arco-fn:urify(normalize-space(./RRCC)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Cement'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RRCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RRCC)" />
					</l0:name>		
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		</xsl:for-each>
		
							<!-- Mineral Presence as individual -->
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
	            <arco-mp:mainMineral>
	            	<xsl:value-of select="true()" />
	            </arco-mp:mainMineral>
				<arco-mp:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-mp:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRM/SRMA">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
	            <arco-mp:secondaryMineral>
	            	<xsl:value-of select="true()" />
	            </arco-mp:secondaryMineral>
				<arco-mp:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-mp:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-main-mineral-revised', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
	            <arco-mp:mainMineral>
	            	<xsl:value-of select="true()" />
	            </arco-mp:mainMineral>
				<arco-mp:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-mp:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
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
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRM/RRMA">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-secondary-mineral-revised', position())" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Presenza di ', normalize-space(.) ,' nel bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(.), ' presence in cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
	            <arco-mp:secondaryMineral>
	            	<xsl:value-of select="true()" />
	            </arco-mp:secondaryMineral>
				<arco-mp:involvesMineral>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
				</arco-mp:involvesMineral>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Mineral/',  arco-fn:urify(normalize-space(.)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
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
		
							<!-- Fossil as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLP">	
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Fossil/',  arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)))" />
				</xsl:attribute>		
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Fossil'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLP)" />
				</l0:name>
			</rdf:Description>	
		</xsl:if>
							<!-- Age interpretation as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRL/SRLE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<arco-mp:relativeAge>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPE/SR/SRL/SRLE)" />
				</arco-mp:relativeAge>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRL/RRLE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-relative-age-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<arco-mp:relativeAge>
					<xsl:value-of select="normalize-space(.)" />
				</arco-mp:relativeAge>
			</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPE/SR/SRR">
		<xsl:if test="./SRRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<arco-mp:absoluteAge>
					<xsl:value-of select="./SRRE" />
				</arco-mp:absoluteAge>
				<xsl:if test="./SRRM">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./SRRM)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./SRRM)))" />
	              </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                   <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
	                </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./SRRM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./SRRM)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>	
		<xsl:for-each select="record/metadata/schede/BNPE/RR/RRR">
		<xsl:if test="./RRRE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-absolute-age-revised-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<arco-mp:absoluteAge>
					<xsl:value-of select="normalize-space(./RRRE)" />
				</arco-mp:absoluteAge>
				<xsl:if test="./RRRM">
					<arco-cd:hasInterpretationCriterion>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./RRRM)))" />
						</xsl:attribute>
					</arco-cd:hasInterpretationCriterion>
				</xsl:if>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'InterpretationCriterion/', arco-fn:urify(normalize-space(./RRRM)))" />
	              </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	                   <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
	                </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RRRM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RRRM)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:for-each>
		
							<!-- Type specimen as individual -->
		<xsl:if test="record/metadata/schede/BNPE/SR/SRT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPE/SR/SRT/SRTT)), 'non tipo'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="true()" />
	            </arco-core:current>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTB">	
					<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
					</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTT">	
					<arco-mp:hasTypeOfTypeSpecimen>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPE/SR/SRT/SRTT))" />
					</xsl:attribute>
					</arco-mp:hasTypeOfTypeSpecimen>
				</xsl:if>								
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRN">
				<arco-mp:producesTaxon>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNPE/SR/SRN/SRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPE/SR/SRN/SRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-mp:producesTaxon>
				</xsl:if>		
				<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTA">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
	        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPE/SR/SRT/SRTA))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
		        	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
					</l0:name>
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTB" />
					</arco-cd:completeBibliographicReference>			
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPE/SR/SRT/SRTT))" />
			        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
		            	</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTT" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPE/SR/SRT/SRTA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPE/SR/SRT/SRTA))" />
					</xsl:attribute>
	    	        <rdf:type>
						<xsl:attribute name="rdf:resource">
		       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPE/SR/SRT/SRTA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPE/RR"> 
			<xsl:if test="./RRT/RRTT and not(starts-with(lower-case(normalize-space(./RRT/RRTT)), 'non tipo'))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
	            	<xsl:value-of select="false()" />
	            </arco-core:current>
				<xsl:if test="./RRT/RRTB">	
					<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
					</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
				<xsl:if test="./RRT/RRTT">	
					<arco-mp:hasTypeOfTypeSpecimen>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RRT/RRTT))" />
					</xsl:attribute>
					</arco-mp:hasTypeOfTypeSpecimen>
				</xsl:if>								
				<xsl:if test="./RRN">
				<arco-mp:producesTaxon>
					<xsl:choose>
						<xsl:when test="./RRN/RRNR">
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNR)))" />
			    			</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
			    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNP)))" />
			    			</xsl:attribute>
						</xsl:otherwise>
			    	</xsl:choose>
				</arco-mp:producesTaxon>
				</xsl:if>		
				<xsl:if test="./RRT/RRTA">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
	        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RRT/RRTA))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./RRT/RRTB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
		        	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
					</l0:name>
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="./RRT/RRTB" />
					</arco-cd:completeBibliographicReference>			
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRT/RRTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RRT/RRTT))" />
			        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
		            	</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="./RRT/RRTT" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RRT/RRTT" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RRT/RRTA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RRT/RRTA))" />
					</xsl:attribute>
	    	        <rdf:type>
						<xsl:attribute name="rdf:resource">
		       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="./RRT/RRTA" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RRT/RRTA" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	
	<xsl:if test="$sheetType='BNPL'" >
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<rdf:type>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PlanetaryScienceHeritage'" />
			</xsl:attribute>
		</rdf:type>
		<xsl:if test="not($sheetType='BNB')">
			<xsl:if test="record/metadata/schede/*/AC/ACK">
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</l0:identifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-mp:isClassifiedByCurrentTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:isClassifiedByCurrentTaxon>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-core:isClassifiedBy>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPN/RPNN">
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(.)))" />
		    	</xsl:attribute>
			</arco-core:isClassifiedBy>
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/SP/SPE">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPE">
			<arco-mp:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
			</arco-mp:hasLabel>			
		</xsl:for-each>			
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPT/SPTT)), 'non tipo'))">
			<arco-mp:hasTypeSpecimenIdentification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
				</xsl:attribute>
			</arco-mp:hasTypeSpecimenIdentification>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPT"> 
			<xsl:if test="./RPTT and not(starts-with(lower-case(normalize-space(./RPTT)), 'non tipo'))">
				<arco-mp:hasTypeSpecimenIdentification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-mp:hasTypeSpecimenIdentification>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO or record/metadata/schede/BNPL/SP/SPC/SPCS">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT">
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
			</xsl:if>
		</xsl:if>		
		<xsl:for-each select="record/metadata/schede/BNPL/RP">
			<xsl:if test="./RPO or ./RPC/RPCS">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCA and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)), 'nessuna'))">
			<arco-mp:hasAlterationGrade>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'WeatheringGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)))" />
 				</xsl:attribute>
			</arco-mp:hasAlterationGrade>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR or record/metadata/schede/BNPL/SP/SPC/SPCT or record/metadata/schede/BNPL/SP/SPC/SPCC">
			<arco-mp:hasTexture>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
 				</xsl:attribute>
			</arco-mp:hasTexture>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC">
			<xsl:if test="./RPCR or ./RPCT or ./RPCC">
			<arco-mp:hasTexture>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
 				</xsl:attribute>
			</arco-mp:hasTexture>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMO">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMP">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPML">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMM">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Metal')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMS">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides')" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
			<arco-core:hasConstituent>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
	 			</xsl:attribute>
			</arco-core:hasConstituent>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPM">
		<xsl:if test="./RPMO">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMP">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPML">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMM">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		<xsl:if test="./RPMS">
			<arco-mp:hasMineralPresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides-', position())" />
 				</xsl:attribute>
			</arco-mp:hasMineralPresence>
		</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
			<arco-mp:hasChondrulePresence>
				<xsl:attribute name="rdf:resource">
	        	       <xsl:value-of select="concat($NS, 'ChondrulePresence/', $itemURI)" />
 				</xsl:attribute>
			</arco-mp:hasChondrulePresence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDE">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDG">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDX">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDT">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age')" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDE">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDG">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDX">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD/RPDT">
			<arco-cd:hasAgeInterpretation>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age-', position())" />
 				</xsl:attribute>
			</arco-cd:hasAgeInterpretation>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK or record/metadata/schede/BNPL/SP/SPN/SPNW">
			<arco-core:isPartOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Meteorite/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
 				</xsl:attribute>
			</arco-core:isPartOf>
		</xsl:if>
	</rdf:Description>	

					<!-- Taxon of planetologic property -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicSpecies'" />
            	</xsl:attribute>
			</rdf:type>	
			<rdfs:label xml:lang="en">
		   		<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNN" />
		   	</rdfs:label>
			<l0:name xml:lang="en">
		   		<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNN" />
	   		</l0:name>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNG">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		   				<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNG)))" />
		   			</xsl:attribute>
				</arco-mp:hasDirectHigherRank>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNG)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGroup'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNG" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNG" />
		   		</l0:name>
		   		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNC">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNC)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNC)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicClass'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNC" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNC" />
		   		</l0:name>
		   		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNE">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNE)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNE)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGenus'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNE" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNE" />
		   		</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if> 	
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPN">
	<xsl:if test="./RPNN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNN)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicSpecies'" />
            	</xsl:attribute>
			</rdf:type>	
			<rdfs:label xml:lang="en">
		   		<xsl:value-of select="./RPNN" />
		   	</rdfs:label>
			<l0:name xml:lang="en">
		   		<xsl:value-of select="./RPNN" />
	   		</l0:name>
			<xsl:if test="./RPNG">
				<arco-mp:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		   				<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNG)))" />
		   			</xsl:attribute>
				</arco-mp:hasDirectHigherRank>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPNG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNG)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGroup'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNG" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNG" />
		   		</l0:name>
		   		<xsl:if test="./RPNC">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNC)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPNC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNC)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicClass'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNC" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNC" />
		   		</l0:name>
		   		<xsl:if test="./RPNE">
					<arco-mp:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
		   					<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNE)))" />
			   			</xsl:attribute>
					</arco-mp:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPNE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNE)))" />
		    	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	    	   	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/PlanetologicGenus'" />
     	       		</xsl:attribute>
				</rdf:type>	
				<rdfs:label xml:lang="it">
		   			<xsl:value-of select="./RPNE" />
			   	</rdfs:label>
				<l0:name xml:lang="it">
		   			<xsl:value-of select="./RPNE" />
		   		</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if> 
	</xsl:for-each>

						<!-- Classification in time -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:if>	
	<xsl:for-each select="record/metadata/schede/BNPL/RR/RRN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-mp:hasTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(./RPNN)))" />
		    	</xsl:attribute>
			</arco-mp:hasTaxon>
		</rdf:Description>
	</xsl:for-each>
	
					<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNPL/SP/SPE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SPET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./SPET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SPEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./SPEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RPET">
				<arco-mp:bodyTranscript>
					<xsl:value-of select="normalize-space(./RPET)" />
				</arco-mp:bodyTranscript>
			</xsl:if>
			<xsl:if test="./RPEI">
				<arco-mp:headingTranscript>
					<xsl:value-of select="normalize-space(./RPEI)" />
				</arco-mp:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>

					<!--  Measurement collection as individual  -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPO">
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
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta18O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPO/SPOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPO/SPOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta17O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPO/SPOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPO/SPOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>								
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
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
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-shok-stage')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCS">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-shok-stage')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPC/SPCS)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ShockStage')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCS)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCS)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPC/SPCS" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPC/SPCS" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPT">
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
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
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-weight')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-weight')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNPL/SP/SPN/SPNP)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
			</arco-dd:hasValue>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RPOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-18-o-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta18O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(./RPOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-18-o', '-', arco-fn:urify(normalize-space(./RPOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-delta-17-o-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RPOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RPOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'delta17O')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(./RPOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-delta-17-o', '-', arco-fn:urify(normalize-space(./RPOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>								
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC/RPCS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test=".">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-shok-stage-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test=".">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-shok-stage-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ',(.))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (.))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/movable-property/', 'ShockStage')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(.)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-shok-stage', '-', arco-fn:urify(normalize-space(.)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNPL/RP">
	<xsl:if test="./RPT">
	<xsl:if test="./RPN/RPNP">
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
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test=".">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-weight-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPN/RPNP">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-weight-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (./RPN/RPNP))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', (./RPN/RPNP))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (./RPN/RPNP))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', (./RPN/RPNP))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(./RPN/RPNP)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', $itemURI, '-weight', '-', arco-fn:urify(normalize-space(./RPN/RPNP)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RPN/RPNP" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPN/RPNP" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>
	
						<!-- Meteorite as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK or record/metadata/schede/BNPL/SP/SPN/SPNW">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Meteorite/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNPL/SP/SPN/SPNL">
						<xsl:attribute name="rdf:resource">
	            	 		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MeteoriteFall'" />
	            		</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
	            	 		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Meteorite'" />
	            		</xsl:attribute>
					</xsl:otherwise>
	            </xsl:choose>
			</rdf:type>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK">
				<arco-core:hasPart>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
					</xsl:attribute>
				</arco-core:hasPart>
			</xsl:if>
			<xsl:if test="not(record/metadata/schede/BNPL/SP/SPT)">
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS or record/metadata/schede/BNPL/SP/SPN/SPNP">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPND">
				<arco-mp:fallDate>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPND) " />
				</arco-mp:fallDate>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="not(record/metadata/schede/BNPL/SP/SPT)">
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS or record/metadata/schede/BNPL/SP/SPN/SPNP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Specimen'" />
	    	        </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
						</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of type specimen of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of
							select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNS))" />
		            	</xsl:attribute>
					</arco-cd:hasOwner>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNS))" />
		            </xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNS)" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)), '-typespecimen')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure del tipo nomenclaturale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of type specimen of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measuerements of type specimen of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-typespecimen-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNP)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNP" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misure del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misure del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNW">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPNW">
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNW)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNW" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNW" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM or record/metadata/schede/BNPL/SP/SPN/SPNK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MainMass'" />
	    	        </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Massa pricipale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Massa pricipale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)) " />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNK">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)),'-main-mass')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
						</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of select="concat($NS, 'LegalSituation/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Condizione giuridica della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Legal situation of main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Legal situation of main mass of meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
						<xsl:value-of
							select="'https://w3id.org/arco/ontology/context-description/LegalSituation'" />
						</xsl:attribute>
					</rdf:type>
					<arco-cd:hasOwner>
						<xsl:attribute name="rdf:resource">
		            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNM))" />
		            	</xsl:attribute>
					</arco-cd:hasOwner>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPN/SPNM))" />
		            </xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNM)" />
					</l0:name>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNK">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	       			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	            	   	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misure della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misure della massa principale del meteorite ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of the main mass of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measuerements of the main mass of meteorite', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)" />
					</l0:name>
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of the main mass of meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura della massa principale del del meteorite: ', normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK))" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotatove-description/', 'Weight')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK)))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/Meteorite-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)), '-main-mass-weight', '-', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNK)))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNK" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNPL/SP/SPN/SPNK" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>
	
					<!-- Alteration grade as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCA and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)), 'nessuna'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'WeatheringGrade/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	 <xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/WeatheringGrade'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCA)" />
			</l0:name>		
		</rdf:Description>
	</xsl:if>
		
					<!-- Texture as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR or record/metadata/schede/BNPL/SP/SPC/SPCT or record/metadata/schede/BNPL/SP/SPC/SPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Texture/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCT">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
				<arco-mp:hasChondrule>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
					</xsl:attribute>
				</arco-mp:hasChondrule>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCR">
				<arco-mp:chondrule-matrixRatio>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCR)" />
				</arco-mp:chondrule-matrixRatio>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCT)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'Chondrule/',arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Chondrule'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>	
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondruleType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>	
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPC">	
		<xsl:if test="./RPCR or ./RPCT or ./RPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Texture/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Texture'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Tessitura del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Texture of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPCT">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RPCT)))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="./RPCC">
				<arco-mp:hasChondrule>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(./RPCC)))" />
					</xsl:attribute>
				</arco-mp:hasChondrule>
			</xsl:if>
			<xsl:if test="./RPCR">
				<arco-mp:chondrule-matrixRatio>
					<xsl:value-of select="normalize-space(./RPCR)" />
				</arco-mp:chondrule-matrixRatio>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPCT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'TextureType/', arco-fn:urify(normalize-space(./RPCT)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TextureType'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RPCT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RPCT)" />
				</l0:name>		
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
			    	<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(./RPCC)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	            		<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Chondrule'" />
		            </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Condrule del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Chondrules of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RPCC">
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(./RPCC)))" />
						</xsl:attribute>
					</arco-core:hasType>
				</xsl:if>	
			</rdf:Description>
			<xsl:if test="./RPCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'ChondruleType/', arco-fn:urify(normalize-space(./RPCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondruleType'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RPCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RPCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>	
		</xsl:if>
		</xsl:if>
	</xsl:for-each>
	
						<!-- Mineral Presence as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Olivine presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Olivine presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMO" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMF" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Olivine'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Olivine'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMP" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMR" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Pyroxene'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Pyroxene'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPML">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPML" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMA" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Plagioclase'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Plagioclase'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Metal presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Metal presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMM" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Metal'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Metal'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPM/SPMS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="record/metadata/schede/BNPL/SP/SPM/SPMS" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Sulphides'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Sulphides'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPM">
	<xsl:if test="./RPMO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-olivine-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di olivina nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Olivine presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Olivine presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMO" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMF" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Olivine')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Olivine'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Olivine'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-pyroxene-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di piroxene nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Pyroxene presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMP" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMR" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Pyroxene')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Pyroxene'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Pyroxene'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPML">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-plagioclase-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di plagioclasio nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Plagioclase presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPML" />
			</arco-mp:modalAnalysis>
			<arco-mp:molePercent>
				<xsl:value-of select="./RPMA" />
			</arco-mp:molePercent>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Plagioclase')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Plagioclase'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Plagioclase'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-metal-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di metallo nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Metal presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Metal presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMM" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Metal')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Metal'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Metal'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	<xsl:if test="./RPMS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MineralPresence/', $itemURI, '-sulphides-', position())" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/MineralPresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di sulfidi nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Sulphides presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesMineral>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
				</xsl:attribute>
			</arco-mp:involvesMineral>
			<arco-mp:modalAnalysis>
				<xsl:value-of select="./RPMS" />
			</arco-mp:modalAnalysis>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Mineral/Sulphides')" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Mineral'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="'Sulphides'" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="'Sulphides'" />
			</l0:name>
		</rdf:Description>	
	</xsl:if>
	</xsl:for-each>
	
					<!-- Chondrule Presence as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPC/SPCC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CondrulePresence/', $itemURI)" />
			</xsl:attribute>		
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/ChondrulePresence'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Presenza di condrule nel bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Presenza di condrule nel bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Chondrule presence in cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Chondrule presence presence in cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-mp:involvesChondrule>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Chondrule/', arco-fn:arcofy(normalize-space(record/metadata/schede/BNPL/SP/SPC/SPCC)))" />
				</xsl:attribute>
			</arco-mp:involvesChondrule>
		</rdf:Description>
	</xsl:if>
	
						<!-- Age interpretation as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDE)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IngeousAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDG)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ShokAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDX)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CosmicRayExposureAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNPL/SP/SPD/SPDT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNPL/SP/SPD/SPDT)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/TerrestrialAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNPL/RP/RPD">
	<xsl:if test="./RPDE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-igneous-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDE)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/IngeousAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-shok-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDG)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ShokAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDX">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-cosmic-ray-exposure-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDX)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CosmicRayExposureAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RPDT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'AgeInterpretation/', $itemURI, '-terrestrial-age-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/AgeInterpretation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Interpretazione dell età del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Age interpretation of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-cd:age>
				<xsl:value-of select="normalize-space(./RPDT)" />
			</arco-cd:age>
			<arco-cd:hasAgeType>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/TerrestrialAge'" />
				</xsl:attribute>
			</arco-cd:hasAgeType>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
		
						<!-- Type specimen as individual -->
	<xsl:if test="record/metadata/schede/BNPL/SP/SPT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNPL/SP/SPT/SPTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPL/SP/SPT/SPTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNPL/SP/SPN/SPNN">
			<arco-mp:producesTaxon>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'PlanetologicTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNPL/SP/SPN/SPNN)))" />
		    	</xsl:attribute>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTA">
				<arco-core:involvesAgent>
					<xsl:attribute name="rdf:resource">
        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPT/SPTA))" />
					</xsl:attribute>
				</arco-core:involvesAgent>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNPL/SP/SPT/SPTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNPL/SP/SPT/SPTA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BNPL/SP/SPT/SPTA))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNPL/SP/SPT/SPTA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>		
	<xsl:for-each select="record/metadata/schede/BNPL/RP"> 
		<xsl:if test="./RPT/RPTT and not(starts-with(lower-case(normalize-space(./RPT/RPTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeSpecimenIdentification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Identification of type specimen of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RPT/RPTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RPT/RPTT">	
				<arco-mp:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RPT/RPTT))" />
				</xsl:attribute>
				</arco-mp:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./RRN">
			<arco-mp:producesTaxon>
				<xsl:choose>
					<xsl:when test="./RRN/RRNR">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNR)))" />
		    			</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'PetrologicTaxon/', arco-fn:urify(normalize-space(./RRN/RRNP)))" />
		    			</xsl:attribute>
					</xsl:otherwise>
		    	</xsl:choose>
			</arco-mp:producesTaxon>
			</xsl:if>		
			<xsl:if test="./RPT/RPTA">
				<arco-core:involvesAgent>
					<xsl:attribute name="rdf:resource">
        				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RPT/RPTA))" />
					</xsl:attribute>
				</arco-core:involvesAgent>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RPT/RPTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="./RPT/RPTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPT/RPTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RPT/RPTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RPT/RPTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPT/RPTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RPT/RPTA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./RPT/RPTA))" />
				</xsl:attribute>
    	        <rdf:type>
					<xsl:attribute name="rdf:resource">
	       		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="./RPT/RPTA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RPT/RPTA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		</xsl:if>
	</xsl:for-each>
	</xsl:if>
	
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
    	    	<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM  or record/metadata/schede/*/IR">
				<arco-mp:hasSpecimenHarvesting>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
					</xsl:attribute>
				</arco-mp:hasSpecimenHarvesting>
			</xsl:if>
		</rdf:Description>				
		<!-- Specimen Harvesting as individual -->
		<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM or record/metadata/schede/*/IR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/SpecimenHarvesting'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
					<xsl:variable name="lril-virgola" select="record/metadata/schede/*/LR/LRI/LRIL" />
					<xsl:variable name="lril-novirgola" select="translate($lril-virgola, ',', ' ')" />
					<xsl:variable name="lirl" select="translate($lril-novirgola, '/', ',')" />
					<xsl:variable name="authorssplit" select="arco-fn:split($lirl)" />
					<xsl:for-each select="$authorssplit">
						<arco-mp:hasHarvestingOperator>
							<xsl:attribute name="rdf:resource">
        						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-mp:hasHarvestingOperator>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
					<arco-mp:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingResponsible>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
					<arco-mp:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingResponsible>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
					<arco-mp:hasHarvestingSponsor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mp:hasHarvestingSponsor>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIE">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIE)" />
					</arco-core:note>
				</xsl:if>			
				<arco-location:hasTimeIndexedTypedLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
					</xsl:attribute>
				</arco-location:hasTimeIndexedTypedLocation>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
					<arco-location:hasHarvestingMethod>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
						</xsl:attribute>
					</arco-location:hasHarvestingMethod>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU">
					<arco-location:hasHarvestingMotivation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
						</xsl:attribute>
					</arco-location:hasHarvestingMotivation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIF">
					<tiapit:atTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/LR/LRI/LRIF)))" />
						</xsl:attribute>
					</tiapit:atTime>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<!-- Time interval as individual -->
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/LR/LRI/LRIF)))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
				</l0:name>
				<tiapit:time>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
				</tiapit:time>
			</rdf:Description>
		</xsl:if>
		<!-- Harvesting Method as individual -->
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of 	select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/HarvestingMethod'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<!-- Harvesting Motivation as individual -->
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        	    <xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/HarvestingMotivation'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>				
		<!-- Bibliography identification as individual -->						
		<xsl:for-each select="record/metadata/schede/*/IM/IMA/IMAB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="." />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:for-each>					
		<!-- Time indexed typed location as individual -->
		<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM or record/metadata/schede/*/IR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAG">
					<arco-mp:hasGeologicalContex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasGeologicalContex>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC or record/metadata/schede/*/IR/IRA/IRAE or record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAG">
					<arco-mp:hasGeologicalContex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasGeologicalContex>
				</xsl:if>						
				<arco-location:hasLocationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/location/CollectingLocation'" />
	            	</xsl:attribute>
				</arco-location:hasLocationType>			
				<xsl:for-each select="record/metadata/schede/*/LR/LRV">
					<arco-location:atLocation>
						<xsl:choose>
							<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-location:atLocation>
				</xsl:for-each>
			</rdf:Description>
		</xsl:if>
		 <!-- Feature as individual -->
		<xsl:for-each select="record/metadata/schede/*/LR/LRV">
		<xsl:variable name="lrvk">
			<xsl:choose>
				<xsl:when test="./LRVK and (not(starts-with(lower-case(normalize-space(./LRVK)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVK)), 'n.r')))">
					<xsl:value-of select="concat(normalize-space(arco-fn:urify(./LRVK)), ' - ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvs">
			<xsl:choose>
				<xsl:when test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
					<xsl:value-of select="normalize-space(arco-fn:urify(./LRVS))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>	
		<xsl:variable name="lrvr">
			<xsl:choose>
				<xsl:when test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
					<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVR)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvp">
			<xsl:choose>
				<xsl:when test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
					<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVP)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvc">
			<xsl:choose>
				<xsl:when test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
					<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVC)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrvl">
			<xsl:choose>
				<xsl:when test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
					<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVL)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="lrve">
			<xsl:choose>
				<xsl:when test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
					<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVE)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="address-label">
			<xsl:value-of select="concat($lrvk, $lrvs, $lrvr, $lrvp, $lrvc, $lrvl, $lrve)" />
		</xsl:variable>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
						<xsl:attribute name="rdf:about">
							<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="$address-label" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="$address-label" />
					</xsl:call-template>
				</l0:name>
				<clvapit:hasAddress>
					<xsl:choose>
						<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</clvapit:hasAddress>		
			</rdf:Description>
			<rdf:Description>
				<xsl:choose>
					<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
						<xsl:attribute name="rdf:about">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="$address-label" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="$address-label" />
					</xsl:call-template>
				</l0:name>
				<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
				<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
					<clvapit:hasRegion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./LRVR)))" />
						</xsl:attribute>
					</clvapit:hasRegion>
				</xsl:if>
				<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>				
				<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
			</rdf:Description>
			<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
				 	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVL)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVL)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
				 	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
			 		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVS)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVS)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./LRVR)))" />
			 		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
				 	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVP)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVP)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
			 		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./LRVC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
		</xsl:for-each>		
		<!-- Address Area -->
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAR">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAR"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAM">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAM"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAT">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAT"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAR">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAR"/>
			</xsl:call-template>	
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAM">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAM"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAT">
			<xsl:call-template name="address-area">
				<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAT"/>
			</xsl:call-template>
		</xsl:if>				
		<!-- Geological context as individual -->					
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/GeologicalContext'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAE">
					<arco-mp:hasMineralDeposit>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasMineralDeposit>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAG">
					<arco-mp:hasOutcrop>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
						</xsl:attribute>
					</arco-mp:hasOutcrop>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/IM/IMA/IMAB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
						</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC">
					<arco-core:description>
						<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAC" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAN">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAN)" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:if>						
		<!-- Mineral deposit as individual -->
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	        	    <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDeposit'" />
					</xsl:attribute>	
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
					<arco-mp:hasMineralDepositType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
						</xsl:attribute>
					</arco-mp:hasMineralDepositType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
					<arco-mp:hasMineralDepositType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
						</xsl:attribute>
					</arco-mp:hasMineralDepositType>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
	<!-- Mineral Deposit Type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- OutCrop as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/movable-property/Outcrop'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAG">
				<arco-dd:hasOrientation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/*/IM/IMA/IMAG)))" />
				</xsl:attribute>
				</arco-dd:hasOrientation>
			</xsl:if>
		</rdf:Description>
	</xsl:if>						
	<!-- OutCrop type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/movable-property/OutcropType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>				
	<!-- Time interval as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
		
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