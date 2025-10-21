<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:cpv="https://w3id.org/italia/onto/CPV/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
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
	xmlns:ar-SourceOrDocument="https://w3id.org/arco/resource/SourceOrDocument/"
	xmlns:ar-cis="https://w3id.org/arco/resource/CulturalInstituteOrSite/"
	xmlns:ar-SiteDefinition="https://w3id.org/arco/resource/SiteDefinition/"
	xmlns:ar-MeasurementCollection="https://w3id.org/arco/resource/MeasurementCollection/"
	xmlns:ar-CISNameInTime="https://w3id.org/arco/resource/CISNameInTime/"
	xmlns:ar-Measurement="https://w3id.org/arco/resource/Measurement/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>

	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
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
		
	<xsl:template match="/">
	<rdf:RDF>
		<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
		<xsl:if test="$sheetType='AUT'" >
		
			<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
			<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
			<xsl:variable name="cp-name" select="''" />
			<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
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
				<xsl:when test="record/metadata/schede/*/CD/NCU">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/CD/NCU/NCUN">
							<xsl:value-of select="record/metadata/schede/*/CD/NCU/NCUN" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="record/metadata/schede/*/CD/NCU/NCU" />
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
			<xsl:variable name="nameAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
								<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTB, ' - ', record/metadata/schede/*/AU/AUT/AUTA)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTB" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="concat(record/metadata/schede/*/AU/AUT/AUTN, ' - ', record/metadata/schede/*/AU/AUT/AUTA)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTN" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="idAuthor">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTB and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTB)), 'n.r')))">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
								<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTB, '-', record/metadata/schede/*/AU/AUT/AUTA))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTB)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/AU/AUT/AUTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTA)), 'n.r')))">
						<xsl:value-of select="arco-fn:arcofy(concat(record/metadata/schede/*/AU/AUT/AUTN, '-', record/metadata/schede/*/AU/AUT/AUTA))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTN)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="author" select="concat($NS, 'Agent/', $idAuthor)"/>
			
			<xsl:variable name="sex">
			 <xsl:choose>
				<xsl:when test="$sheetVersion='4.00' or $sheetVersion='4.00_ICCD0'">
					<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTE"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTZ"/>
				</xsl:otherwise>
			 </xsl:choose>
			</xsl:variable>
		
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	                <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', 'CatalogueRecord', $sheetType)" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Catalogue Record of author ', $nameAuthor)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Scheda catalografica dell autore ', $nameAuthor)" />
				</rdfs:label>
					<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
				<arco-lite:systemIdentifier>
					<xsl:value-of select="$item" />
				</arco-lite:systemIdentifier>
				<!-- heritage protection agency -->
				<xsl:choose>
					<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-heritage-protection-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-lite:hasHeritageProtectionAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
							</xsl:attribute>
						</arco-lite:hasHeritageProtectionAgency>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="record/metadata/schede/*/CD/ECP">
							<xsl:if test=".">
								<arco-core:hasAgentRole>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-heritage-protection-agency')" />
									</xsl:attribute>
								</arco-core:hasAgentRole>
								<arco-lite:hasHeritageProtectionAgency>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
									</xsl:attribute>
								</arco-lite:hasHeritageProtectionAgency>
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<!-- cataloguing agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/ESC">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-cataloguing-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-record-responsible-agent')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-lite:hasCataloguingAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasCataloguingAgency>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
					<!-- deprecated -->
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idAuthor, '-compilation')" />
						</xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
					<arco-catalogue:hasRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idAuthor, '-compilation')" />
                        </xsl:attribute>
					</arco-catalogue:hasRecordVersion>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AN/OSS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AN/OSS)" />
					</arco-core:note>
				</xsl:if>
				<!-- access profile -->
				<xsl:if test="record/metadata/schede/*/AD/ADS">
					<arco-catalogue:hasAccessProfile>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'AccessProfile/', $idAuthor, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
	                	</xsl:attribute>
					</arco-catalogue:hasAccessProfile>
				</xsl:if>
			</rdf:Description>
			<!-- Cataloguing Agency - Agent Role CD/ESC -->
			<xsl:if test="(not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), 'n.r')))">
				<xsl:for-each select="record/metadata/schede/*/CD/ESC">
					<xsl:variable name="getName">
						<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
					</xsl:variable>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-cataloguing-agency')" />
                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Ente schedatore del bene ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Cataloguing agency for cultural property ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Ente schedatore del bene ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Cataloguing agency for cultural property ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/CataloguinAgency')" />
                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-record-responsible-agent')" />
                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Ente responsabile della scheda del bene ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Agency responsible for record of cultural property ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/ResponsibleAgent')" />
                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                        	<xsl:value-of select="concat($NS, 'Role/CataloguinAgency')" />
                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente schedatore'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Cataloguing agency'" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="'Ente schedatore'" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="'Cataloguing agency'" />
						</l0:name>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-cataloguing-agency')" />
                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
    	                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
                	       </xsl:attribute>
						</rdf:type>
						<xsl:choose>
							<xsl:when test="string-length($getName)>0">
								<rdfs:label>
									<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
								</l0:name>
							</xsl:when>
							<xsl:otherwise>
								<rdfs:label>
									<xsl:value-of select="." />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="." />
								</l0:name>
							</xsl:otherwise>
						</xsl:choose>
						<arco-lite:nationalIdentifier>
							<xsl:value-of select="." />
						</arco-lite:nationalIdentifier>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Heritage Protection Agency - Agent Role CD/ECP -->
			<xsl:choose>
				<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-heritage-protection-agency')" />
	                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                        </xsl:attribute>
						</rdf:type>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Responsibility'" />
	                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Ente competente per tutela del bene ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(record/metadata/schede/harvesting/enteCompetente))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Heritage protection agency for cultural property ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(record/metadata/schede/harvesting/enteCompetente))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
	                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-cd:hasInterventionRole>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
	                        </xsl:attribute>
						</arco-cd:hasInterventionRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
	                        </xsl:attribute>
						</arco-core:hasAgent>
						<arco-cd:hasAgentWithResponsibility>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
	                        </xsl:attribute>
						</arco-cd:hasAgentWithResponsibility>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
	                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
	                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente competente per tutela'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Heritage Protection Agency'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="record/metadata/schede/*/CD/ECP">
						<xsl:variable name="getName">
							<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
						</xsl:variable>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            	            <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-heritage-protection-agency')" />
	                   		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	            	                <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
	                       		</xsl:attribute>
							</rdf:type>
							<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Responsibility'" />
	                        </xsl:attribute>
						</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Ente competente per tutela del bene ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Heritage protection agency for cultural property ', $idAuthor, ': ', arco-fn:get-nome-ente-from-codice(.))" />
							</rdfs:label>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
	                       		</xsl:attribute>
							</arco-core:hasRole>
							<arco-cd:hasInterventionRole>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
	                       		</xsl:attribute>
							</arco-cd:hasInterventionRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                       		</xsl:attribute>
							</arco-core:hasAgent>
							<arco-core:hasAgentWithResponsibility>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                       		</xsl:attribute>
							</arco-core:hasAgentWithResponsibility>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			                       <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
			                   </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
			                       </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Ente competente per tutela'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Heritage Protection Agency'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
	            	                <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-heritage-protection-agency')" />
			                       </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            	            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
			                   </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
	                   		        <xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
			                       </xsl:attribute>
							</rdf:type>
							<xsl:choose>
								<xsl:when test="string-length($getName)>0">
									<rdfs:label>
										<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="arco-fn:get-nome-ente-from-codice(.)" />
									</l0:name>
								</xsl:when>
								<xsl:otherwise>
									<rdfs:label>
										<xsl:value-of select="." />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="." />
									</l0:name>
								</xsl:otherwise>
							</xsl:choose>
							<arco-lite:nationalIdentifier>
								<xsl:value-of select="." />
							</arco-lite:nationalIdentifier>
						</rdf:Description>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idAuthor, '-compilation')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/CatalogueRecordVersion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/CM/CMP">
								<xsl:value-of select="concat(record/metadata/schede/*/CM/CMP/@hint, ' - ', normalize-space(record/metadata/schede/*/CM/CMP))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'COMPILAZIONE'" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<!-- deprecated -->
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
	                            </xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasResponsibleResearchAndCompilation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-lite:hasResponsibleResearchAndCompilation>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/CM/CMP/CMPD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'n.r')))">
						<arco-catalogue:editedAtTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)))" />
							</xsl:attribute>
						</arco-catalogue:editedAtTime>
					</xsl:if>
						<!-- Referente verifica scientifica -->
					<xsl:for-each select="record/metadata/schede/*/CM/RSR">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<!-- deprecated -->
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
								</xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
	                            </xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasScientificDirector>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-lite:hasScientificDirector>
						</xsl:if>
					</xsl:for-each>
						<!-- Funzionario responsabile -->
					<xsl:for-each select="record/metadata/schede/*/CM/FUR">
						<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<!-- deprecated -->
							<arco-catalogue:hasCatalogueRecordVersionRiT>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
								</xsl:attribute>
							</arco-catalogue:hasCatalogueRecordVersionRiT>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasOfficialInCharge>
								<xsl:attribute name="rdf:resource">	
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
								</xsl:attribute>
							</arco-lite:hasOfficialInCharge>
						</xsl:if>
					</xsl:for-each>
				</rdf:Description>
			</xsl:if>
			<!-- Participant role - Compilation -->
			<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<!-- deprecated -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
							</xsl:attribute>
						</rdf:type>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
  							<xsl:value-of select="true()" />
						</owl:deprecated>
						<owl:sameAs>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</owl:sameAs>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Compilation by ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Compilazione da ', normalize-space(.))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
							</xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-compilation-', arco-fn:arcofy(.))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								 <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Compilation by ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Compilazione da ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
				<!-- responsible research and compilation Agent -->
			<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
						<!-- responsible research and compilation role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Responsible research and compilation'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile ricerca e redazione'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
						<!-- Version time interval - CMPD -->
			<xsl:if test="record/metadata/schede/*/CM/CMP/CMPD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
					</rdfs:label>
					<tiapit:time>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
					</tiapit:time>
					<arco-arco:startTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
					</arco-arco:startTime>
					<arco-arco:endTime>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
					</arco-arco:endTime>
				</rdf:Description>
			</xsl:if>
			<!-- Referente verifica scientifica -->
			<xsl:for-each select="record/metadata/schede/*/CM/RSR">
				<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<!-- deprecated -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                          <xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
							</xsl:attribute>
						</rdf:type>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
  <xsl:value-of select="true()" />
</owl:deprecated>
						<owl:sameAs>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
							</xsl:attribute>
						</owl:sameAs>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico', ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Scientific director', ': ', normalize-space(.))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
	                        </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                        </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                          <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico', ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Scientific director', ': ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
	                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Agent: Referente verifica scientifica -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
						<!-- Role: Referente verifica scientifica -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile scientifico'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Scientific Director'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
				<!-- Funzionario responsabile -->
			<xsl:for-each select="record/metadata/schede/*/CM/FUR">
				<xsl:if test="(not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<!-- deprecated -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
		                    </xsl:attribute>
						</rdf:type>
						<owl:deprecated rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
  <xsl:value-of select="true()" />
</owl:deprecated>
						<owl:sameAs>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
							</xsl:attribute>
						</owl:sameAs>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Official in charge', ': ', normalize-space(.))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
		                    </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                     </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'AgentRole/', $idAuthor, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Official in charge', ': ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
		                    </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                     </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
						<!-- Agent: Funzionario responsabile -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
						<!-- Role: Funzionario responsabile -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                      <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="normalize-space(./@hint)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Official in charge'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Access profile as an individual -->
			<xsl:if test="record/metadata/schede/*/AD/ADS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AccessProfile/', $idAuthor, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AccessProfile'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Profilo d''accesso ai dati della scheda catalografica dell autore ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Profilo d''accesso alla scheda catalografica dell autore ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Access profile to catalogue record of author ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Access profile to catalogue record of author ', $nameAuthor, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
					</l0:name>
					<arco-catalogue:hasPrivacyLevel>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='1'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MinimumPrivacy'" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='2'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MediumPrivacy'" />
								</xsl:when>
								<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='3'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MaximumPrivacy'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'PrivacyLevel/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-catalogue:hasPrivacyLevel>
					<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
						<arco-catalogue:hasPrivacyReason>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
							</xsl:attribute>
						</arco-catalogue:hasPrivacyReason>
					</xsl:if>
				</rdf:Description>
				<!-- privacy reason as an individuals -->
				<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/PrivacyReason'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			
			<!-- Author -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$author" />
				</xsl:attribute>
				<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:choose>
						<xsl:when test="($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTP))='p'">
							<xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
						</xsl:when>
						<xsl:when test="($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTP))='e'">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
						</xsl:when>
						<xsl:when test="($sheetVersion='3.01' or $sheetVersion='3.01_ICCD0') and (record/metadata/schede/*/AU/AUT/AUTB)">
							<xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
						</xsl:when>
						<xsl:when test="($sheetVersion='3.01' or $sheetVersion='3.01_ICCD0') and (record/metadata/schede/*/AU/AUT/AUTN)">
							<xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
					</rdf:type>
				<arco-catalogue:isDescribedByCatalogueRecord>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
	                </xsl:attribute>
				</arco-catalogue:isDescribedByCatalogueRecord>
				<arco-core:isDescribedBy>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
	                </xsl:attribute>
				</arco-core:isDescribedBy>
				<dc:source>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
					</xsl:attribute>
				</dc:source>
				<dcterms:isReferencedBy>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idAuthor)" />
					</xsl:attribute>
				</dcterms:isReferencedBy>
				<rdfs:label>
					<xsl:value-of select="$nameAuthor" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="$nameAuthor" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTA">
					<arco-cd:agentDate>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTA)" />
					</arco-cd:agentDate>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTC">
					<cpv:familyName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTC)" />
					</cpv:familyName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTO">
					<cpv:givenName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTO)" />
					</cpv:givenName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTB">
					<arco-lite:primaryName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTB)" />
					</arco-lite:primaryName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTN">
					<arco-lite:primaryName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTN)" />
					</arco-lite:primaryName>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTP and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-lite:pseudonym>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTP)" />
					</arco-lite:pseudonym>
				</xsl:if>
				<!-- deprecated -->
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTP and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:pseudonym>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTP)" />
					</arco-cd:pseudonym>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTF and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:signature>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTF)" />
					</arco-cd:signature>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTF and ($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:nationality>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTF" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTY and ($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
					<arco-cd:nationality>
						<xsl:value-of select="record/metadata/schede/*/AU/AUT/AUTY" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and record/metadata/schede/*/AU/AUT/AUTE">
					<arco-lite:alternativeName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTE)" />
					</arco-lite:alternativeName>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AU/AUV">
					<arco-lite:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-lite:alternativeName>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTV">
					<arco-lite:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-lite:alternativeName>
				</xsl:for-each>
				<!-- deprecated -->
				<xsl:if test="not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and record/metadata/schede/*/AU/AUT/AUTE">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTE)" />
					</arco-cd:alternativeName>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AU/AUV">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-cd:alternativeName>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTV">
					<arco-cd:alternativeName>
						<xsl:value-of select="normalize-space(.)" />
					</arco-cd:alternativeName>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTQ">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:for-each>
				
				<!-- historical information -->
				<xsl:if test="record/metadata/schede/*/AU/NSC">
					<arco-cd:historicalBiographicalInformation>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/NSC)" />
					</arco-cd:historicalBiographicalInformation>
				</xsl:if>
				<xsl:if test="string-length($sex)">
					<arco-lite:sexInformation>
							<xsl:value-of select="$sex" />
					</arco-lite:sexInformation>
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy($sex))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTU">
					<arco-cd:hasCulturalScope>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-cd:hasCulturalScope>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTL">
					<cpv:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTL))" />
						</xsl:attribute>
					</cpv:hasBirthPlace>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTD">
					<cpv:dateOfBirth>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTD)" />
					</cpv:dateOfBirth>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTX">
					<cpv:hasDeathPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTX))" />
						</xsl:attribute>
					</cpv:hasDeathPlace>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTT">
					<cpv:dateOfDeath>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTT)" />
					</cpv:dateOfDeath>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTG">
					<arco-cd:activityPlaceAndPeriod>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTG)" />
					</arco-cd:activityPlaceAndPeriod>
				</xsl:if>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/BIB">
					<arco-cd:hasBibliographicSource>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Publication/', arco-fn:arcofy(normalize-space(./BIBM)))" />
	                	</xsl:attribute>
					</arco-cd:hasBibliographicSource>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/AU/AUT/AUTH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'n.r')))">
					<arco-lite:localIdentifier>
   			        	<xsl:value-of select="concat('aut-', lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), '-', lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)))" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AuthorIdentifier/aut-', arco-fn:urify(record/metadata/schede/*/CD/ESC), '-', arco-fn:urify(record/metadata/schede/*/AU/AUT/AUTH))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
			</rdf:Description>
			<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<xsl:if test="string-length($sex)">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy($sex))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space($sex)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="normalize-space($sex)" />
					</l0:name>
					<arco-cd:sex>
						<xsl:value-of select="normalize-space($sex)" />
					</arco-cd:sex>
				</rdf:Description>
			</xsl:if>
			<!-- cultural context -->
			<xsl:for-each select="record/metadata/schede/*/AU/AUT/AUTU">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(.)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CulturalScope'" />
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
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTL))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(record/metadata/schede/*/AU/AUT/AUTX))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/AUT/AUTX)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/AU/AUT/AUTH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AuthorIdentifier/aut-', arco-fn:urify(record/metadata/schede/*/CD/ESC), '-', arco-fn:urify(record/metadata/schede/*/AU/AUT/AUTH))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
			            </xsl:attribute>
					</rdf:type>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
					  		<xsl:value-of select="'https://w3id.org/arco/ontology/core/LocalIdentifier'" />
						</xsl:attribute>
					</arco-core:hasType>
					<rdfs:label>
						<xsl:value-of select="concat('aut-', lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), '-', lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat('aut-', lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), '-', lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)))" />
					</l0:name>
					<l0:identifier>
						<xsl:value-of select="concat('aut-', lower-case(normalize-space(record/metadata/schede/*/CD/ESC)), '-', lower-case(normalize-space(record/metadata/schede/*/AU/AUT/AUTH)))" />
					</l0:identifier>
					<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
						<xsl:value-of select="true()" />
					</arco-core:current>
				</rdf:Description>
			</xsl:if>
			<!-- Bibliography of cultural property as an individual -->
			<xsl:for-each select="record/metadata/schede/*/DO/BIB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Publication/', arco-fn:arcofy(normalize-space(./BIBM)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Publication'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./BIBM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./BIBM)" />
					</l0:name>
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="normalize-space(./BIBM)" />
					</arco-cd:completeBibliographicReference>
					<xsl:if test="./BIBR and (not(starts-with(lower-case(normalize-space(./BIBR)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBR)), 'n.r')))">
						<arco-cd:abbreviation>
							<xsl:value-of select="normalize-space(./BIBR)" />
						</arco-cd:abbreviation>
					</xsl:if>
					<xsl:if test="./BIBN and (not(starts-with(lower-case(normalize-space(./BIBN)), 'nr')) and not(starts-with(lower-case(normalize-space(./BIBN)), 'n.r')))">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./BIBN)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
		
		<xsl:if test="$sheetType='BIB'" >
			<xsl:variable name="idEdition">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BIB/CD/NCU/NCUN">
							<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/BIB/CD/NUC/NUCN">
							<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BIB/CD/NUC/NUCN))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/BIB/CD//NCU">
							<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BIB/CD/NCU))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBM">
							<xsl:value-of select="arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBH">
							<xsl:value-of select="arco-fn:urify(concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', record/metadata/schede/BIB/*/*/BIBH))" />
						</xsl:when>
						<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBA and record/metadata/schede/BIB/BI/BIB/BIBD">
							<xsl:value-of select="concat(arco-fn:arcofy(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA)), arco-fn:arcofy(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD)))" />
						</xsl:when>
	                </xsl:choose>
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
	    	            <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idEdition)" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat('https://w3id.org/arco/ontology/catalogue/', 'CatalogueRecord', $sheetType)" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Catalogue Record of publication ', $idEdition)" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Scheda catalografica della pubblicazione ', $idEdition)" />
					</rdfs:label>
						<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
					<arco-lite:systemIdentifier>
						<xsl:value-of select="$item" />
					</arco-lite:systemIdentifier>
					<!-- Publication identifiers -->
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH)), 'n.r')))">
						<arco-lite:localIdentifier>
							<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', record/metadata/schede/BIB/*/*/BIBH)" />
						</arco-lite:localIdentifier>
						<arco-core:hasIdentifier>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PublicationIdentifier/', 'bib-', arco-fn:urify(record/metadata/schede/BIB/CD/ESC),'-', arco-fn:urify(record/metadata/schede/BIB/BI/BIB/BIBH), '-local')" />
							</xsl:attribute>
						</arco-core:hasIdentifier>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/CD/NCU/NCUN">
						<arco-lite:ICCDIdentifier>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
						</arco-lite:ICCDIdentifier>
						<arco-core:hasIdentifier>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PublicationIdentifier/', arco-fn:arcofy(record/metadata/schede/BIB/CD/NCU/NCUN))" />
							</xsl:attribute>
						</arco-core:hasIdentifier>
					</xsl:if>
					<!-- heritage protection agency -->
					<xsl:choose>
						<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-heritage-protection-agency')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-lite:hasHeritageProtectionAgency>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
								</xsl:attribute>
							</arco-lite:hasHeritageProtectionAgency>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="record/metadata/schede/*/CD/ECP">
								<xsl:if test=".">
									<arco-core:hasAgentRole>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-heritage-protection-agency')" />
										</xsl:attribute>
									</arco-core:hasAgentRole>
									<arco-lite:hasHeritageProtectionAgency>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
										</xsl:attribute>
									</arco-lite:hasHeritageProtectionAgency>
								</xsl:if>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<!-- cataloguing agency -->
					<xsl:for-each select="record/metadata/schede/*/CD/ESC">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-cataloguing-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-lite:hasCataloguingAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasCataloguingAgency>
					</xsl:if>
				</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/CM/CMP or record/metadata/schede/*/CM/RSR or record/metadata/schede/*/CM/FUR">
						<arco-catalogue:hasRecordVersion>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $idEdition, '-compilation')" />
	                        </xsl:attribute>
						</arco-catalogue:hasRecordVersion>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/AN/OSS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/AN/OSS)" />
						</arco-core:note>
					</xsl:if>
					<!-- access profile -->
					<xsl:if test="record/metadata/schede/*/AD/ADS">
						<arco-catalogue:hasAccessProfile>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'AccessProfile/', $idEdition, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
		                	</xsl:attribute>
						</arco-catalogue:hasAccessProfile>
					</xsl:if>
				</rdf:Description>
				<!-- Participant role - Compilation -->
				<xsl:for-each select="record/metadata/schede/*/CM/CMP/CMPN">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-compilation-', arco-fn:arcofy(.))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								 <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Compilation by ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Compilazione da ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
					<!-- responsible research and compilation role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Responsible research and compilation'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile ricerca e redazione'" />
						</rdfs:label>
					</rdf:Description>
					</xsl:if>
				</xsl:for-each>
						<!-- Version time interval - CMPD -->
				<xsl:if test="record/metadata/schede/*/CM/CMP/CMPD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/CM/CMP/CMPD)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
						</rdfs:label>
						<tiapit:time>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
						</tiapit:time>
						<arco-arco:startTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/CM/CMP/CMPD)" />
						</arco-arco:endTime>
					</rdf:Description>
				</xsl:if>
				<!-- Referente verifica scientifica -->
				<xsl:for-each select="record/metadata/schede/*/CM/RSR">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                          <xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Responsabile scientifico', ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Scientific director', ': ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
	                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Agent: Referente verifica scientifica -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
						<!-- Role: Referente verifica scientifica -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile scientifico'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Scientific Director'" />
						</rdfs:label>
					</rdf:Description>
					</xsl:if>
				</xsl:for-each>
				<!-- Funzionario responsabile -->
				<xsl:for-each select="record/metadata/schede/*/CM/FUR">
					<xsl:if test="(not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                       <xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-', arco-fn:arcofy(concat(./@hint, '-', .)))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ': ', normalize-space(.))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Official in charge', ': ', normalize-space(.))" />
						</rdfs:label>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
		                    </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                     </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- Agent: Funzionario responsabile -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                           <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
					</rdf:Description>
					<!-- Role: Funzionario responsabile -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                      <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
		                </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
		                    </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="normalize-space(./@hint)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Official in charge'" />
						</rdfs:label>
					</rdf:Description>
					</xsl:if>
				</xsl:for-each>
				<!-- Access profile as an individual -->
				<xsl:if test="record/metadata/schede/*/AD/ADS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AccessProfile/', $idEdition, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/AccessProfile'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Profilo d''accesso ai dati della scheda catalografica della pubblicazione ', $idEdition, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Profilo d''accesso alla scheda catalografica della pubblicazione ', $idEdition, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Access profile to catalogue record of publication ', $idEdition, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Access profile to catalogue record of publication ', $idEdition, ': ', normalize-space(record/metadata/schede/*/AD/ADS/ADSP))" />
						</l0:name>
						<arco-catalogue:hasPrivacyLevel>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='1'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MinimumPrivacy'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='2'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MediumPrivacy'" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/AD/ADS/ADSP='3'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/MaximumPrivacy'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'PrivacyLevel/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSP)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-catalogue:hasPrivacyLevel>
						<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
							<arco-catalogue:hasPrivacyReason>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
								</xsl:attribute>
							</arco-catalogue:hasPrivacyReason>
						</xsl:if>
					</rdf:Description>
					<!-- privacy reason as an individuals -->
					<xsl:if test="record/metadata/schede/*/AD/ADS/ADSM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)), 'n.r')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
    	                        <xsl:value-of select="concat($NS, 'PrivacyReason/', arco-fn:urify(normalize-space(record/metadata/schede/*/AD/ADS/ADSM)))" />
        	                </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                    	            <xsl:value-of select="'https://w3id.org/arco/ontology/catalogue/PrivacyReason'" />
                        	    </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/AD/ADS/ADSM)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				
				
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Publication/', $idEdition)" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Publication'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BIB/CD/NCU/NCUN">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/CD/NUC/NUCN">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NUC/NUCN)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB//BIBM">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB//BIBM)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB//BIBH">
								<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', record/metadata/schede/BIB/*/*/BIBH)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat((normalize-space(record/metadata/schede/BIB/BI/BIB//BIBA)), ', ', normalize-space(record/metadata/schede/BIB/BI/BIB//BIBD))" />
							</xsl:otherwise>
	                	</xsl:choose>
					</rdfs:label>
					<l0:name>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BIB/CD/NCU/NCUN">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/CD/NUC/NUCN">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NUC/NUCN)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBM">
								<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBH">
								<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', record/metadata/schede/BIB/*/*/BIBH)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat((normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA)), ', ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD))" />
							</xsl:otherwise>
	                	</xsl:choose>
					</l0:name>
					<arco-core:isDescribedBy>
						<xsl:attribute name="rdf:resource">
	    	            	<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $idEdition)" />
						</xsl:attribute>
					</arco-core:isDescribedBy>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBM">
						<arco-cd:completeBibliographicReference>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM)" />
						</arco-cd:completeBibliographicReference> 
					</xsl:if> 
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBA">
						<arco-lite:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBA))" />
							</xsl:attribute>
						</arco-lite:hasAuthor>
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-author')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBT">
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBT))))" />
							</xsl:attribute>
						</arco-cd:hasTitle>
						<arco-lite:title>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBT)" />
						</arco-lite:title>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBG and not(record/metadata/schede/BIB/BI/BIB/BIBT)">
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBC">
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBC))" />
								</xsl:attribute>
							</arco-lite:hasCurator>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-curator')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBZ">
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
								</xsl:attribute>
							</arco-lite:hasEditor>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-editor')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV))))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG))))" />
									</xsl:otherwise>
								</xsl:choose>				
							</xsl:attribute>
						</arco-cd:hasTitle>	
						<arco-lite:title>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:title>			
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBL">
							<arco-cd:editionLocation>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBL" />
							</arco-cd:editionLocation>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBE">
							<arco-cd:editionNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBE" />
							</arco-cd:editionNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBP">
							<arco-cd:pagesOrCatalogueNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBP" />
							</arco-cd:pagesOrCatalogueNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBD">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
				    	    		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBM">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIB_NU_1">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIB_NU_1)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBA and record/metadata/schede/BIB/BI/BIB/BIBD">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA), ' - ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD))" />
								</arco-cd:completeBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBT and not(record/metadata/schede/BIB/BI/BIB/BIBG)">
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBC">
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBC))" />
								</xsl:attribute>
							</arco-lite:hasCurator>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-curator')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBZ">
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
								</xsl:attribute>
							</arco-lite:hasEditor>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-editor')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV))))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG))))" />
									</xsl:otherwise>
								</xsl:choose>				
							</xsl:attribute>
						</arco-cd:hasTitle>
						<arco-lite:title>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:title>			
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBL">
							<arco-cd:editionLocation>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBL" />
							</arco-cd:editionLocation>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBE">
							<arco-cd:editionNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBE" />
							</arco-cd:editionNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBP">
							<arco-cd:pagesOrCatalogueNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBP" />
							</arco-cd:pagesOrCatalogueNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBD">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
				    	    		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBM">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIB_NU_1">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIB_NU_1)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBA and record/metadata/schede/BIB/BI/BIB/BIBD">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA), ' - ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD))" />
								</arco-cd:completeBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBG and (record/metadata/schede/BIB/BI/BIB/BIBT)">
						<arco-core:isPartOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Publication/', $idEdition, '-main-work' )" />
							</xsl:attribute>
						</arco-core:isPartOf>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH)), 'n.r')))">
						<arco-lite:localIdentifier>
							<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', record/metadata/schede/BIB/*/*/BIBH)" />
						</arco-lite:localIdentifier>
						<arco-core:hasIdentifier>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PublicationIdentifier/', 'bib-', arco-fn:urify(record/metadata/schede/BIB/CD/ESC),'-', arco-fn:urify(record/metadata/schede/BIB/BI/BIB/BIBH), '-local')" />
							</xsl:attribute>
						</arco-core:hasIdentifier>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/CD/NCU/NCUN">
						<arco-lite:ICCDIdentifier>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
						</arco-lite:ICCDIdentifier>
						<arco-core:hasIdentifier>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PublicationIdentifier/', arco-fn:arcofy(record/metadata/schede/BIB/CD/NCU/NCUN))" />
							</xsl:attribute>
						</arco-core:hasIdentifier>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBR and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBR)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBR)), 'n.r')))">
						<arco-cd:abbreviation>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBR)" />
						</arco-cd:abbreviation>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBY and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBY)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBY)), 'n.r')))">
						<arco-cd:hasCopyright>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Copyright/', $idEdition, '-copyright-bibliography-', position())" />
							</xsl:attribute>
						</arco-cd:hasCopyright>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBW">
						<smapit:URL rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBS)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)), 'n.r')))">
						<arco-cd:hasBibliographyType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)))" />
            				</xsl:attribute>
						</arco-cd:hasBibliographyType>
					</xsl:if>
				</rdf:Description>
				<!-- documentation identifier -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBH">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'PublicationIdentifier/', 'bib-', arco-fn:urify(record/metadata/schede/BIB/CD/ESC),'-', arco-fn:urify(record/metadata/schede/BIB/BI/BIB/BIBH), '-local')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
			                </xsl:attribute>
						</rdf:type>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
			    	            <xsl:value-of select="'https://w3id.org/arco/ontology/core/LocalIdentifier'" />
				    	    </xsl:attribute>
						</arco-core:hasType>
						<rdfs:label>
							<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH))" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH))" />
						</l0:name>
						<arco-core:identifier>
							<xsl:value-of select="concat('bib-', record/metadata/schede/BIB/CD/ESC,'-', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBH))" />
						</arco-core:identifier>
						<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'PublicationIdentifier/', arco-fn:arcofy(record/metadata/schede/BIB/CD/NCU/NCUN))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
			                </xsl:attribute>
						</rdf:type>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
			    	            <xsl:value-of select="'https://w3id.org/arco/ontology/core/LocalIdentifier'" />
				    	    </xsl:attribute>
						</arco-core:hasType>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
						</l0:name>
						<arco-core:identifier>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/CD/NCU/NCUN)" />
						</arco-core:identifier>
						<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
							<xsl:value-of select="true()" />
						</arco-core:current>
						<arco-core:issuedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/resource/Agent/050ae5d29fc291b682bcf51f1250ca75'" />
							</xsl:attribute>
						</arco-core:issuedBy>
					</rdf:Description>
				</xsl:if>
				<!-- author as an individual -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-author')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Autore ', position(), ' della pubbicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Author ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Autore ', position(), ' della pubbicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Author ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Author')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBA))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Author')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Autore'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Author'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBA))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBA)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- curator as an individual -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-curator')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Curatore ', position(), ' della pubblicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBC))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Curator ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBC))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Curatore ', position(), ' della pubblicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBC))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Curator ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBC))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Curator')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBC))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Curator')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Curatore'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Curator'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBC))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- editor as an individual -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBZ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-editor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Editore ', position(), ' della pubblicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Editor ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Editore ', position(), ' della pubblicazione: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Editor ', position(), ' of publication: ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Role/Editor')" />
							</xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
							</xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<!-- role as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Role/Editor')" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Editore'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Editor'" />
						</rdfs:label>
					</rdf:Description>
					<!-- agent as an indiviual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
						<rdfs:label>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBZ)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="arco-fn:name-cleaner(record/metadata/schede/BIB/BI/BIB/BIBZ)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- title as an individual -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBT))))" />
					        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
					           	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Title'" />
					           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBG">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
					           	<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Title'" />
					           </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- main work -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBG and (record/metadata/schede/BIB/BI/BIB/BIBT)">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
    	        			<xsl:value-of select="concat($NS, 'Publication/', $idEdition, '-main-work' )" />
        	    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Publication'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBC">
							<arco-lite:hasCurator>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBC))" />
								</xsl:attribute>
							</arco-lite:hasCurator>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-curator')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBZ">
							<arco-lite:hasEditor>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/BIB/BI/BIB/BIBZ))" />
								</xsl:attribute>
							</arco-lite:hasEditor>
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AgentRole/', $idEdition, '-editor')" />
								</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV))))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'Title/', arco-fn:arcofy(concat($idEdition, normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG))))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-cd:hasTitle>
						<arco-lite:title>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBV">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG), '. ', (normalize-space(record/metadata/schede/BIB/BI/BIB/BIBV)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBG)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:title>				
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBL">
							<arco-cd:editionLocation>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBL" />
							</arco-cd:editionLocation>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBE">
							<arco-cd:editionNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBE" />
							</arco-cd:editionNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBP">
							<arco-cd:pagesOrCatalogueNumber>
								<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBP" />
							</arco-cd:pagesOrCatalogueNumber>
						</xsl:if>
						<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBD">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
				    	    		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD)))" />
								</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBM">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBM)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIB_NU_1">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIB_NU_1)" />
								</arco-cd:completeBibliographicReference>  
							</xsl:when>
							<xsl:when test="record/metadata/schede/BIB/BI/BIB/BIBA and record/metadata/schede/BIB/BI/BIB/BIBD">
								<arco-cd:completeBibliographicReference>
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBA), ' - ', normalize-space(record/metadata/schede/BIB/BI/BIB/BIBD))" />
								</arco-cd:completeBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</rdf:Description>
				</xsl:if>
				<!-- Time inverval -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
					    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(record/metadata/schede/BIB/BI/BIB/BIBD))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				        		<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBD" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBD" />
						</l0:name>
						<arco-arco:startTime>
							<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBD" />
						</arco-arco:startTime>
						<arco-arco:endTime>
							<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBD" />
						</arco-arco:endTime>
						<tiapit:time>
							<xsl:value-of select="record/metadata/schede/BIB/BI/BIB/BIBD" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<!-- copyright -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBY and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBY)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBY)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Copyright/', $idEdition, '-copyright-bibliography-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Copyright'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Copyright ', position(), ' of cultural property bibliography ', $idEdition)" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Diritti d''autore ', position(), ' della bibliografia del bene culturale ', $idEdition)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Copyright ', position(), ' of cultural property bibliography ', $idEdition)" />
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Diritti d''autore ', position(), ' della bibliografia del bene culturale ', $idEdition)" />
						</l0:name>
						<arco-core:specifications>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBY)" />
						</arco-core:specifications>
					</rdf:Description>
				</xsl:if>
				<!-- bibliography type as an individual -->
				<xsl:if test="record/metadata/schede/BIB/BI/BIB/BIBF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)), 'n.r')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/BibliographyType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(record/metadata/schede/BIB/BI/BIB/BIBF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
		</xsl:if>
	</rdf:RDF>
	</xsl:template>								
</xsl:stylesheet>