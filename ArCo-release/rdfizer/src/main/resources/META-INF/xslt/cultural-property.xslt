<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:arco-location="https://w3id.org/arco/ontology/location/"
	xmlns:language="https://w3id.org/italia/onto/Language/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	exclude-result-prefixes="xsl php">

	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />
	<!-- xsl:variable name="NS" select="$NS,'" /-->
	<xsl:param name="NS" />
	
	<!-- xsl:import href="part.xsl" / -->

	<xsl:template name="sgti"><!-- allow multiple values ? ICCD11389099 ICCD13074440 -->
		<!--
        <xsl:value-of select="record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))][1]"/>
        -->
        <xsl:value-of select="string-join(record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))],', ')"/>
	</xsl:template>
    
	<xsl:template match="/">

		<rdf:RDF>
	<!-- <xsl:if test="record/metadata/schede/*/RV/RVE/RVEL">
			<xsl:variable name="rvel-punto" select="lower-case(normalize-space(record/metadata/schede/*/RV/RVE/RVEL))" />
			<xsl:variable name="rvel" select="translate($rvel-punto, '.', '_')" />		
		</xsl:if>  -->	
	    <xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
		<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >

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
		    <xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
		    <xsl:variable name="cp-name" select="''" />
					<!-- variable culturalPropertyComponent -->	
			<xsl:variable name="culturalPropertyComponent" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />		
					<!-- variable culturalProperty -->	
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
			<xsl:variable name="objectOfDescription">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
						<xsl:value-of select="$culturalPropertyComponent" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$culturalProperty" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ldcm"><xsl:for-each select="record/metadata/schede/*/LC/LDC/LDCM"><xsl:value-of select="arco-fn:urify(.)"/></xsl:for-each></xsl:variable>
			<xsl:variable name="pvcc"><xsl:for-each select="record/metadata/schede/*/LC/PVC/PVCC"><xsl:value-of select="arco-fn:urify(.)"/></xsl:for-each></xsl:variable>
							<!-- variable ogtp -->
			<xsl:variable name="ogtp">
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
				</xsl:if>
			</xsl:variable>
							<!-- variable ogtt -->
			<xsl:variable name="ogtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and not($sheetType='NU')">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTT)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
							<!-- variable sgta -->
			<xsl:variable name="sgta">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTA)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
							<!-- variable sgti -->
			<xsl:variable name="sgti">
				<xsl:call-template name="sgti"/>
			</xsl:variable>		
		
							<!-- cultural property component -->
					
		<!--	<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
					<arco-arco:hasCulturalPropertyComponent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalPropertyComponent" />
						</xsl:attribute>
					</arco-arco:hasCulturalPropertyComponent>
				</rdf:Description> 
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalPropertyComponent" />
					</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
					</rdfs:label>
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyComponent" />
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="arco-fn:getPropertyType($sheetType)" />
						</xsl:attribute>
					</rdf:type>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="arco-fn:getSpecificPropertyType($sheetType)" />
						</xsl:attribute>
					</rdf:type>
				<arco-arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyComponentOf>
				</rdf:Description>
			</xsl:if> -->
					<!-- description of catalogue record -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                </xsl:attribute>
				<arco-catalogue:describes>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of
						select="$culturalProperty" />
                    </xsl:attribute>
				</arco-catalogue:describes>
				<arco-catalogue:lastUpdateDate>
					<xsl:value-of select="record/header/datestamp" />
				</arco-catalogue:lastUpdateDate>
			</rdf:Description>
					<!-- cultural property direct relations -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$culturalProperty" />
				</xsl:attribute>
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-0')" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyComponentOf>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/arco/CulturalPropertyComponent'" />
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/RV/RVE/RVEL and not($sheetVersion='2.00_ICCD0' or $sheetVersion='2.00')">
					<xsl:variable name="rvel-punto" select="lower-case(normalize-space(record/metadata/schede/*/RV/RVE/RVEL))" />
					<xsl:variable name="rvel" select="translate($rvel-punto, '.', '_')" />
					<xsl:if test="not($rvel='0' or $rvel='bene componente' or $rvel='bene complesso' or $rvel='bene individuo')">
					<arco-arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-0')" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyComponentOf>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/arco/CulturalPropertyComponent'" />
						</xsl:attribute>
					</rdf:type>
					</xsl:if>
				</xsl:if>		
				<xsl:if test="$sheetType='MODI'">
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/AMB))='architettonico e paesaggistico'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ImmovableCulturalProperty'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/AMB))='storico artistico'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MovableCulturalProperty'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/AMB))='archeologico'">
									<xsl:choose>
										<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/CM/IMD/IMDT))='ra' or lower-case(normalize-space(record/metadata/schede/MODI/CM/IMD/IMDT))='tma'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MovableCulturalProperty'" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ImmovableCulturalProperty'" />
										</xsl:otherwise>									
									</xsl:choose>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/AMB))='etnoantropologico'">
									<xsl:choose>
										<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/CM/IMD/IMDT))='bdm'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MovableCulturalProperty'" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/IntangibleCulturalProperty'" />
										</xsl:otherwise>									
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="$sheetType='SCAN'">
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/SCAN/OG/CTB))='beni immobili'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ImmovableCulturalProperty'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/SCAN/OG/CTB))='beni mobili'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MovableCulturalProperty'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/CTB))='beni immateriali'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/IntangibleCulturalProperty'" />
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<!-- related work situation -->
				<xsl:for-each select="record/metadata/schede/*/*/RSE">
					<xsl:if test="./RSEC and not(lower-case(normalize-space(./RSER))='scheda storica')"><!-- e.g.ICCD2284134  -->
						<!-- Rule #RWS -->
						<xsl:variable name="rels" select="arco-fn:related-property(normalize-space(./RSEC),'')" />
						<xsl:variable name="rset" select="name(./RSET)" />
						<xsl:if test="count($rels)">
							<xsl:variable name="create-rel-work-situation">
								<xsl:choose>
									<xsl:when test="(lower-case(normalize-space(./RSER))='è contenuto in' 
												or lower-case(normalize-space(./RSER))='luogo di collocazione/localizzazione'
												or lower-case(normalize-space(./RSER))='scheda contenitore')">
										<xsl:value-of select="'arco-cd:isLocatedIn'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='era contenuto in' 
												or lower-case(normalize-space(./RSER))='luogo di provenienza'
												or lower-case(normalize-space(./RSER))='sede di provenienza')">
										<xsl:value-of select="'arco-cd:hasPreviousLocation'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='esecuzione/evento di riferimento' 
												or lower-case(normalize-space(./RSER))='è coinvolto in')">
										<xsl:value-of select="'arco-cd:isInvolvedIn'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='sede di realizzazione' 
												or lower-case(normalize-space(./RSER))='è stato realizzato in')">
										<xsl:value-of select="'arco-cd:hasCreationLocation'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='bene composto' 
												or lower-case(normalize-space(./RSER))='è compreso in')">
										<xsl:value-of select="'arco-cd:isReusedBy'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='fonte di rappresentazione' 
												or lower-case(normalize-space(./RSER))='è rappresentato in')">
										<xsl:value-of select="'arco-cd:isSubjectOf'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='relazione urbanistico ambientale' 
												or lower-case(normalize-space(./RSER))='è in relazione urbanistico - ambientale con')">
										<xsl:value-of select="'arco-cd:hasUrbanPlanningEnvironmentalRelationWith'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='sede di rinvenimento' 
												or lower-case(normalize-space(./RSER))='è stato rinvenuto in')">
										<xsl:value-of select="'arco-cd:hasFindingLocation'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'true'" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<!-- 
							<xsl:for-each select="$rels[not(.=$culturalProperty)]">
							<xsl:choose>
								<xsl:when test="$create-rel-work-situation='true'">
									<arco-cd:hasRelatedWorkSituation>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-1-', position())" />
										</xsl:attribute>
									</arco-cd:hasRelatedWorkSituation>
								</xsl:when>
								<xsl:otherwise>
									
										<xsl:element name="{$create-rel-work-situation}">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="." />
											</xsl:attribute>
										</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							</xsl:for-each>
							-->
							<xsl:choose>
								<xsl:when test="$create-rel-work-situation='true'">
									<arco-cd:hasRelatedWorkSituation>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-1-', position())" />
										</xsl:attribute>
									</arco-cd:hasRelatedWorkSituation>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="{$create-rel-work-situation}">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType(./RSET)), '/', normalize-space(./RSEC))" />
										</xsl:attribute>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose> 
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				
				<xsl:for-each select="record/metadata/schede/*/RV/ROZ">
					<xsl:variable name="rel-work" select="arco-fn:related-property(normalize-space(.), '')" />
					<xsl:if test="count($rel-work) > 0">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-2-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- cultural property component -->
				<xsl:if test="record/metadata/schede/*/RV/RVE/RVER">
					<xsl:if test="record/metadata/schede/*/RV/RVE/RVEL and not (record/metadata/schede/*/RV/RVE/RVEL='0' or record/metadata/schede/*/RV/RVE/RVEL='bene complesso' or record/metadata/schede/*/RV/RVE/RVEL='bene individuo')">
						<xsl:variable name="rver" select="record/metadata/schede/*/RV/RVE/RVER" />
						<xsl:variable name="rvel-nospace" select="translate($rver, ' ', '')" />
						<xsl:variable name="rvel" select="translate($rvel-nospace, '/', '')" />
						<xsl:variable name="rvel1" select="concat($rvel, '-0')" />
						<xsl:variable name="bene-complesso" select="concat($rvel, '-bene complesso')" />
						<xsl:variable name="cri2cp">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/RV/RVE/RVER and not (record/metadata/schede/*/RV/RVE/RVER='bene componente')">
									<xsl:value-of select="arco-fn:catalogue-record-identifier-to-cultural-property($rvel1)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="arco-fn:catalogue-record-identifier-to-cultural-property($bene-complesso)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!-- xsl:if test="count($cri2cp)>0"> <arco-arco:isCulturalPropertyComponentOf> 
							<xsl:attribute name="rdf:resource"> <xsl:value-of select="$cri2cp" /></xsl:attribute> 
							</arco-arco:isCulturalPropertyComponentOf> </xsl:if RVERFIX -->
						<xsl:choose>
							<xsl:when test="string-length($cri2cp)>0">
								<arco-arco:isCulturalPropertyComponentOf>
									<xsl:attribute name="rdf:resource">
        								<xsl:value-of select="$cri2cp" />
      								</xsl:attribute>
								</arco-arco:isCulturalPropertyComponentOf>
							</xsl:when>
							<xsl:otherwise>
								<arco-arco:RVERidentifier>
									<xsl:value-of select="record/metadata/schede/*/RV/RVE/RVER" />
								</arco-arco:RVERidentifier>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:if>
				<xsl:if test="$sheetType='A' or $sheetType='PG' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')">
					<xsl:if test="record/metadata/schede/*/RV/RVE/RVES">
						<xsl:if test="record/metadata/schede/*/RV/RVE/RVEL and not (record/metadata/schede/*/RV/RVE/RVEL='0' or record/metadata/schede/*/RV/RVE/RVEL='bene complesso' or record/metadata/schede/*/RV/RVE/RVEL='bene individuo')">
							<xsl:variable name="rves" select="record/metadata/schede/*/RV/RVE/RVES" />
							<xsl:variable name="rvel-nospace" select="translate($rves, ' ', '')" />
							<xsl:variable name="rvel" select="translate($rvel-nospace, '/', '')" />
							<xsl:variable name="rvel1" select="concat($rvel, '-0')" />
							<xsl:variable name="bene-complesso" select="concat($rvel, '-bene complesso')" />
							<xsl:variable name="cri2cp">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/RV/RVE/RVES and not (record/metadata/schede/*/RV/RVE/RVEL='bene componente')">
										<xsl:value-of select="arco-fn:catalogue-record-identifier-to-cultural-property($rvel1)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="arco-fn:catalogue-record-identifier-to-cultural-property($bene-complesso)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<!-- xsl:if test="count($cri2cp)>0"> <arco-arco:isCulturalPropertyComponentOf> 
								<xsl:attribute name="rdf:resource"> <xsl:value-of select="$cri2cp" /></xsl:attribute> 
								</arco-arco:isCulturalPropertyComponentOf> </xsl:if -->
							<xsl:choose>
								<xsl:when test="string-length($cri2cp)>0">
									<arco-arco:isCulturalPropertyComponentOf>
										<xsl:attribute name="rdf:resource">
	        								<xsl:value-of select="$cri2cp" />
	      								</xsl:attribute>
									</arco-arco:isCulturalPropertyComponentOf>
								</xsl:when>
								<xsl:otherwise>
									<arco-arco:RVERidentifier>
										<xsl:value-of select="record/metadata/schede/*/RV/RVE/RVER" />
									</arco-arco:RVERidentifier>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:if>
				</xsl:if>				
				<xsl:if test="record/metadata/schede/*/RV/RVE/RVEZ and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RV/RVE/RVEZ)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/RV/RVE/RVEZ)), 'n.r'))">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/RV/RVE/RVEZ)" />
					</arco-core:note>
				</xsl:if>
				<!-- RFid -->
				<xsl:if test="record/metadata/schede/*/RF/RFI/RFID and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RF/RFI/RFID)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/RF/RFI/RFID)), 'n.r')))">
					<arco-arco:hasRFid>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RFid', $itemURI, arco-fn:arcofy(record/metadata/schede/*/RF/RFI/RFID))" />
						</xsl:attribute>
					</arco-arco:hasRFid>
				</xsl:if>
				<!-- tiratura di una fotografia o di una stampa -->
				<xsl:if test="record/metadata/schede/*/PD/TRT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/PD/TRT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/PD/TRT)), 'n.r')))">
					<arco-cd:numberInCirculation>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/PD/TRT)" />
					</arco-cd:numberInCirculation>
				</xsl:if>
				<!-- archaeological site identifier -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTI)), 'n.r')))">
					<arco-lite:localIdentifier>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTI)" />
					</arco-lite:localIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Identifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/OG/OGT/OGTI))" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/AU/TRT/TRTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/TRT/TRTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/TRT/TRTN)), 'n.r')))">
					<arco-cd:numberInCirculation>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/AU/TRT/TRTN)" />
					</arco-cd:numberInCirculation>
				</xsl:if>
				<!-- position in complex CP -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and not($sheetType='AT' or $sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-dd:positionInComplexCulturalProperty>
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/OGT/OGTP,' ; '))" /><!-- RA 3.00 unbounded eg:ICCD10088602 -->
					</arco-dd:positionInComplexCulturalProperty>
				</xsl:if>
				<!-- rights -->
				<xsl:if test="record/metadata/schede/*/DA/PLC">
					<arco-cd:rights>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/PLC)" />
					</arco-cd:rights>
				</xsl:if>
				<!-- Depiction -->
				<xsl:for-each select="record/metadata/schede/*/*/FTA/FTAN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- xslt2 multiple nodes normalize-space exception  -->
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
				<xsl:for-each select="record/metadata/schede/*/DO/DCM/DCMN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- xslt2 multiple nodes normalize-space exception  -->
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
				<!-- isDescribedBy -->
				<arco-catalogue:isDescribedBy>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
					</xsl:attribute>
				</arco-catalogue:isDescribedBy>
				<!-- Cultural institute or site -->
				<xsl:choose>
					<xsl:when test="record/metadata/schede/harvesting/idContenitoreGiuridico">
						<xsl:variable name="CG" select="record/metadata/schede/harvesting/idContenitoreGiuridico" />
						<xsl:variable name="idCG">
							<xsl:value-of select="arco-fn:find-cg($CG)"/>
						</xsl:variable>
						<arco-location:hasCulturalInstituteOrSite>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', $idCG)" />
							</xsl:attribute>
						</arco-location:hasCulturalInstituteOrSite>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/LC/LDC/LDCM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCM)), 'n.r')))">
								<arco-location:hasCulturalInstituteOrSite>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
												<xsl:choose>	
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCN">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCN)))))" />
													</xsl:when>
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCC">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCC)))))" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)))))" />
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when test="record/metadata/schede/*/LC/LCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/LCS))='italia')">
												<xsl:choose>	
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCN">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCS)), normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCN)))))" />
													</xsl:when>
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCC">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCS)), normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCC)))))" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCS)), normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)))))" />
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when test="record/metadata/schede/*/LC/LCC">
												<xsl:choose>	
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCN">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCN)))))" />
													</xsl:when>
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCC">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCC)))))" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)))))" />
													</xsl:otherwise>
												</xsl:choose>	
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>	
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCN">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCN)))))" />
													</xsl:when>
													<xsl:when test="record/metadata/schede/*/LC/LDC/LDCC">
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCC)))))" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)))))" />
													</xsl:otherwise>
												</xsl:choose>								
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</arco-location:hasCulturalInstituteOrSite>
							</xsl:when>
							<xsl:otherwise></xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
				<!-- current physical location -->
				<xsl:if test="record/metadata/schede/*/LC">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- alternative locations -->
				<xsl:for-each select="record/metadata/schede/*/LA">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-alternative-', position())" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:for-each>
				<!-- shot location -->
				<xsl:if test="record/metadata/schede/F/LR">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-shot')" />
						</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- cultural property address -->
				<xsl:if test="record/metadata/schede/*/LC/PVC/*">
					<arco-lite:hasCulturalPropertyAddress>
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
					</arco-lite:hasCulturalPropertyAddress>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MODI/LC/* or record/metadata/schede/SCAN/LC/*">
					<arco-lite:hasCulturalPropertyAddress>
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
										<xsl:when test="record/metadata/schede/*/LC/PVL/PVLT">
											<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVLT)))))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/LCP)), normalize-space(lower-case(record/metadata/schede/*/LC/LCC)), normalize-space(lower-case(record/metadata/schede/*/LC/LCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVL)))))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-lite:hasCulturalPropertyAddress>
				</xsl:if>
				<!-- has number of components -->
				<xsl:if test="record/metadata/schede/*/OG/QNT/QNTN">
					<arco-arco:numberOfComponents>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT/QNTN)" />
					</arco-arco:numberOfComponents>
				</xsl:if>
				<!-- has number of elements -->
				<xsl:if test="record/metadata/schede/*/OG/QNT/QNTI">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT/QNTI)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<!-- position in sequence -->
				<xsl:if test="record/metadata/schede/*/OG/QNT/QNTO">
					<arco-arco:positionInSequence>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT/QNTO)" />
					</arco-arco:positionInSequence>
				</xsl:if>
				<!-- cultural property description -->
				<xsl:if test="record/metadata/schede/A/IS">
					<arco-core:description>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/A/IS/ISP">
								<xsl:value-of select="normalize-space(record/metadata/schede/A/IS/ISP)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/A/IS/IST">
								<xsl:value-of select="normalize-space(record/metadata/schede/A/IS/IST)" />
							</xsl:when>
						</xsl:choose>
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/DES">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/DA/DES/DESO and not($sheetType='NU')">
							<xsl:if test="not(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='nr' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='nr (recupero pregresso)')">
								<arco-core:description>
									<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESO)" />
								</arco-core:description>
							</xsl:if>
						</xsl:when>
						<xsl:when test="record/metadata/schede/NU/DA/DES/DESD">
							<arco-core:description>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESD)" />
							</arco-core:description>
						</xsl:when>
						<xsl:when test="record/metadata/schede/NU/DA/DES/DESA and not(record/metadata/schede/NU/DA/DES/DESO)">
							<arco-core:description>
								<xsl:value-of select="concat('Dritto: ', normalize-space(record/metadata/schede/NU/DA/DES/DESA), '. Rovescio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESM), '. Taglio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESO))" />
							</arco-core:description>
						</xsl:when>
						<xsl:when test="record/metadata/schede/NU/DA/DES/DESO  and not(record/metadata/schede/NU/DA/DES/DESA)">
							<arco-core:description>
								<xsl:value-of select="concat('Taglio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESO))" />
							</arco-core:description>
						</xsl:when>
						<xsl:when test="record/metadata/schede/*/DA/DES/DESS[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and not(record/metadata/schede/*/DA/DES/DESO)">
							<xsl:for-each select="record/metadata/schede/*/DA/DES/DESS[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD11389099 -->
								<arco-core:description>
									<xsl:value-of select="normalize-space()" />
								</arco-core:description>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="not(record/metadata/schede/*/DA/DES/*)">
							<arco-core:description>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES)" />
							</arco-core:description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/DRE">
					<arco-core:description>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DRE)" />
					</arco-core:description>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/DSO">
					<arco-core:note>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DSO)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="record/metadata/schede/FF/OG/OGT/OGTC">
					<arco-core:description>
						<xsl:value-of select="normalize-space(record/metadata/schede/FF/OG/OGT/OGTC)" />
					</arco-core:description>
				</xsl:if>
				<!-- keywords (PST) -->
				<xsl:for-each select="record/metadata/schede/*/CT/CTC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-core:keyword>
						<xsl:value-of select="normalize-space(.)" />
					</arco-core:keyword>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/OG/CTC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-core:keyword>
						<xsl:value-of select="normalize-space(.)" />
					</arco-core:keyword>
				</xsl:for-each>
				<!-- main discipline (PST) -->
				<xsl:for-each select="record/metadata/schede/*/CT/CTP[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-arco:hasMainDiscipline>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'SubjectDiscipline/', arco-fn:urify(normalize-space(.)))" />
	                	</xsl:attribute>
					</arco-arco:hasMainDiscipline>
				</xsl:for-each>
				<!-- alternative discipline (PST) -->
				<xsl:for-each select="record/metadata/schede/*/CT/CTA[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-arco:hasAlternativeDiscipline>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'SubjectDiscipline/', arco-fn:urify(normalize-space(.)))" />
	                	</xsl:attribute>
					</arco-arco:hasAlternativeDiscipline>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/OG/CTA[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<arco-arco:hasAlternativeDiscipline>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'SubjectDiscipline/', arco-fn:urify(normalize-space(.)))" />
	                	</xsl:attribute>
					</arco-arco:hasAlternativeDiscipline>
				</xsl:for-each>
				<!-- archaeological material (TMA) -->
				<xsl:for-each select="record/metadata/schede/TMA/MA">
					<xsl:if test="(not(starts-with(lower-case(normalize-space(./MAC/MACC)), 'nr')) and not(starts-with(lower-case(normalize-space(./MAC/MACC)), 'n.r')))">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./MAC/MACD">
										<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MAC/MACC)), arco-fn:urify(normalize-space(./MAC/MACD)))" />
									</xsl:when>
									<xsl:when test="./MAC/MACL">
										<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MAC/MACL)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MAC/MACC)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:for-each>
				<!-- anthropological material (AT) -->
				<xsl:if test="record/metadata/schede/AT/OG/OGT/OGTM">
					<arco-dd:anthropologicalMaterialMorphology>
						<xsl:value-of select="normalize-space(record/metadata/schede/AT/OG/OGT/OGTM)" />
					</arco-dd:anthropologicalMaterialMorphology>
				</xsl:if>
				<!-- definition and position of components (OGCD) -->
				<xsl:if test="not($sheetType='AT') and record/metadata/schede/*/OG/OGC/OGCD">
					<arco-arco:definitionAndPositionOfComponents><!-- multiple OGCD eg:ICCD14371179 -->
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/OGC/OGCD, ' ; '))" />
					</arco-arco:definitionAndPositionOfComponents>
				</xsl:if>
				<!-- cadastral identity -->
				<xsl:for-each select="record/metadata/schede/*/CS">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                	<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                </xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<!-- historical cadastral identity -->
				<xsl:if test="record/metadata/schede/*/LS/CSS/*">
					<xsl:for-each select="record/metadata/schede/*/LS/CSS">
						<arco-location:hasCadastralIdentity>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-historical-', position())" />
		                	</xsl:attribute>
						</arco-location:hasCadastralIdentity>
					</xsl:for-each>
				</xsl:if>
				<!-- naming matches above criterion record/metadata/schede/*/CS in cadastral-identity.xslt 
				<xsl:for-each select="record/metadata/schede/*/CS/CTS">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                	<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                </xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				 -->
				<xsl:for-each select="record/metadata/schede/*/UB[CTS]">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                	<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                </xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RP/LGC">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                	<xsl:value-of select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                </xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<!-- fruition (VeAC) -->
				<xsl:if test="record/metadata/schede/*/AU/FRU">
					<xsl:for-each select="record/metadata/schede/*/AU/FRU">
						<arco-cd:hasFruition>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
	                		</xsl:attribute>
						</arco-cd:hasFruition>
					</xsl:for-each>
				</xsl:if>
				<!-- authorship attribution (ATB)-->
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
				<xsl:if test="$sheetType='SCAN'">
					<xsl:for-each select="record/metadata/schede/*/DT/ATB">
						<xsl:if test="(not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
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
				<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
					<xsl:for-each select="record/metadata/schede/*/*/AUT">
						<xsl:if test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTN)), '-')))">
							<xsl:choose>
								<xsl:when test="./* and (not(./AUTW) or ./AUTW='intero bene' or ./AUTW='integrale' or ./AUTW='tutta' or ./AUTW='totale') or (starts-with(lower-case(normalize-space(./AUTW)), 'nr')) or (starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intero')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intera')) or (starts-with(lower-case(normalize-space(./AUTW)), 'esemplar'))">
									<arco-cd:hasAuthorshipAttribution>
										<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
				                        </xsl:attribute>
									</arco-cd:hasAuthorshipAttribution>
									<arco-lite:hasAuthor>
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
									</arco-lite:hasAuthor>
									<arco-lite:hasPreferredAuthor>
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
									</arco-lite:hasPreferredAuthor>
									<dc:creator>
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
									</dc:creator>
									<pico:author>
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
									</pico:author>
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
						<arco-lite:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-lite:hasAuthor>
						<arco-lite:hasPreferredAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-lite:hasPreferredAuthor>
						<dc:creator>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</dc:creator>
						<pico:author>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</pico:author>
					</xsl:if>
				</xsl:for-each>
				<!--  authorship attribution AU/AUF (F version 2.00, 3.00 and BDM) -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUF">
					<xsl:if test="./* and ./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
						<arco-cd:hasAuthorshipAttribution>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-photographer-', position())" />
							</xsl:attribute>
						</arco-cd:hasAuthorshipAttribution>
						<arco-lite:hasAuthor>
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
						</arco-lite:hasAuthor>
						<arco-lite:hasPreferredAuthor>
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
						</arco-lite:hasPreferredAuthor>
						<dc:creator>
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
						</dc:creator>
						<pico:author>
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
						</pico:author>
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
				<!-- authorship attribution AU/AUI -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUI">
					<xsl:if test="./AUIN and (not(starts-with(lower-case(normalize-space(./AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIN)), '-')))">
						<xsl:choose>
							<xsl:when test="./* and (not(./AUIY) or ./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale') or (starts-with(lower-case(normalize-space(./AUIY)), 'nr')) or (starts-with(lower-case(normalize-space(./AUIY)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intero')) or (starts-with(lower-case(normalize-space(./AUIY)), 'intera')) or (starts-with(lower-case(normalize-space(./AUIY)), 'esemplar'))">
								<arco-cd:hasAuthorshipAttribution>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasAuthorshipAttribution>
								<arco-lite:hasAuthor>
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
								</arco-lite:hasAuthor>
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
								<arco-cd:hasAuthorshipAttribution>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasAuthorshipAttribution>
								<arco-lite:hasAuthor>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIB))" />
				                    </xsl:attribute>
								</arco-lite:hasAuthor>
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
				<!-- laboratory test -->
				<xsl:for-each select="record/metadata/schede/*/*/ALB">
					<arco-cd:hasLaboratoryTest>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasLaboratoryTest>
				</xsl:for-each>
				<!-- responsibility (F and FF) -->
				<xsl:for-each select="record/metadata/schede/*/PD/PDF">
					<arco-cd:hasResponsibility>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS, 'Responsibility/', $itemURI, '-', position())" />
	                    </xsl:attribute>
					</arco-cd:hasResponsibility>
				</xsl:for-each>
				<!-- inventory -->
				<xsl:for-each select="record/metadata/schede/*/UB/INV">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="not(./INVP) or (starts-with(lower-case(normalize-space(./INVP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./INVP)), 'nr')) or (starts-with(lower-case(normalize-space(./INVP)), 'n.r')) or (starts-with(lower-case(normalize-space(./INVP)), 'intero')) or (starts-with(lower-case(normalize-space(./INVP)), 'intera'))">
								<arco-cd:hasInventorySituation>
									<xsl:attribute name="rdf:resource">
				                		<xsl:value-of select="concat($NS, 'InventorySituation/', $itemURI, '-', position())" />
		        		        	</xsl:attribute>
								</arco-cd:hasInventorySituation>
								<xsl:if test="./INVN and (not(starts-with(lower-case(normalize-space(./INVN)), 'nr')) and not(starts-with(lower-case(normalize-space(./INVN)), 'n.r')))">
									<arco-lite:alternativeInventoryNumber>
										<xsl:value-of select="normalize-space(./INVN)" />
									</arco-lite:alternativeInventoryNumber>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-', arco-fn:urify(normalize-space(./INVP)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>	
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/UB/INP">
					<xsl:if test="record/metadata/schede/*/UB/INP/*">
						<arco-cd:hasInventorySituation>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of select="concat($NS, 'InventorySistuation/', $itemURI, '-current')" />
		                	</xsl:attribute>
						</arco-cd:hasInventorySituation>
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/UB/INP/INPC">
						<arco-lite:currentInventoryNumber>
		                	<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/INP/INPC)" />
						</arco-lite:currentInventoryNumber>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SCAN/CD/INP">
					<arco-cd:hasInventorySituation>
						<xsl:attribute name="rdf:resource">
		               		<xsl:value-of select="concat($NS, 'InventorySistuation/', $itemURI, '-current')" />
		               	</xsl:attribute>
					</arco-cd:hasInventorySituation>
					<arco-lite:currentInventoryNumber>
	                	<xsl:value-of select="normalize-space(record/metadata/schede/SCAN/CD/INP)" />
					</arco-lite:currentInventoryNumber>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/UB/INP/INPA  and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/INP/INPA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/UB/INP/INPA)), 'n.r')))">
					<arco-cd:hasEstimate>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Estimate/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:hasEstimate>
					<arco-lite:culturalPropertyValue>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/UB/INP/INPA)" />
					</arco-lite:culturalPropertyValue>
				</xsl:if>
				<!-- Estimate for version 2.00 -->
				<xsl:if test="$sheetVersion='1.00' or $sheetVersion='1.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0'">
					<xsl:for-each select="record/metadata/schede/*/UB/INV/INVS">
						<arco-cd:hasEstimate>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Estimate/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasEstimate>
						<arco-lite:culturalPropertyValue>
						<xsl:value-of select="normalize-space(.)" />
					</arco-lite:culturalPropertyValue>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/UB/STI">
					<arco-cd:hasEstimate>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Estimate/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasEstimate>
					<arco-lite:culturalPropertyValue>
						<xsl:value-of select="normalize-space(./STIS)" />
					</arco-lite:culturalPropertyValue>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/UB/COL">
					<xsl:if test="./COLV and (not(starts-with(lower-case(normalize-space(./COLV)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLV)), 'n.r')))">
						<arco-cd:hasEstimate>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Estimate/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasEstimate>
						<arco-lite:culturalPropertyValue>
							<xsl:value-of select="normalize-space(./COLV)" />
						</arco-lite:culturalPropertyValue>
					</xsl:if>
				</xsl:for-each>
				<!-- commission -->
				<xsl:for-each select="record/metadata/schede/*/AU/CMM">
					<arco-cd:hasCommission>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Commission/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasCommission>
				</xsl:for-each>
				<!-- edition -->
				<xsl:for-each select="record/metadata/schede/*/AU/EDT">
					<xsl:if test="$sheetType='OAC' or $sheetType='S'">
						<arco-cd:hasEdition>
							<xsl:attribute name="rdf:resource">
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
						</arco-cd:hasEdition>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/PD/EDI">
					<arco-cd:hasEdition>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDIT)))" />
						</xsl:attribute>
					</arco-cd:hasEdition>
				</xsl:for-each>
				<!-- has dating -->
				<xsl:for-each select="record/metadata/schede/*/DT">
					<xsl:choose>
						<xsl:when test="./* and (not(./DTP) or ./DTP='intero bene' or ./DTP='carattere generale' or ./DTP='integrale' or ./DTP='tutta' or ./DTP='totale') or (starts-with(lower-case(normalize-space(./DTP)), 'nr')) or (starts-with(lower-case(normalize-space(./DTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./DTP)), 'intero')) or (starts-with(lower-case(normalize-space(./DTP)), 'intera')) or (starts-with(lower-case(normalize-space(./DTP)), 'esemplar'))">
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-cd:hasDating>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./DTP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="(not(./DTP) or ./DTP='intero bene' or ./DTP='carattere generale' or ./DTP='integrale' or ./DTP='tutta' or ./DTP='totale') or (starts-with(lower-case(normalize-space(./DTP)), 'nr')) or (starts-with(lower-case(normalize-space(./DTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./DTP)), 'intero')) or (starts-with(lower-case(normalize-space(./DTP)), 'intera')) or (starts-with(lower-case(normalize-space(./DTP)), 'esemplar'))">
						<xsl:if test="not($sheetType='SCAN')">
						<xsl:if test="not(./DTN/DTNS)">
							<arco-lite:hasRealizationDate>
								<xsl:attribute name="rdf:resource">
            	                    <xsl:choose>
                	                    <xsl:when test="./DTZ/DTZS">
                    	                    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                        	            </xsl:when>
                            	        <xsl:otherwise>
                                	        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
                                    	</xsl:otherwise>
	                                </xsl:choose>
    	                        </xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
						</xsl:if>
						<xsl:if test="starts-with(lower-case(normalize-space(./DTN/DTNS)), 'realizzazione')">
							<arco-lite:hasRealizationDate>
								<xsl:attribute name="rdf:resource">
                            	    <xsl:choose>
                                	    <xsl:when test="./DTZ/DTZS">
                                    	    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
	                                    </xsl:when>
    	                                <xsl:otherwise>
        	                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
            	                        </xsl:otherwise>
                	                </xsl:choose>
                    	        </xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
						<xsl:if test="starts-with(lower-case(normalize-space(./DTN/DTNS)), 'costruzione')">
							<arco-lite:hasRealizationDate>
								<xsl:attribute name="rdf:resource">
                	                <xsl:choose>
                    	                <xsl:when test="./DTZ/DTZS">
                        	                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                            	        </xsl:when>
                                	    <xsl:otherwise>
                                    	    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
	                                    </xsl:otherwise>
    	                            </xsl:choose>
        	                    </xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- has dating for A norm -->
				<xsl:for-each select="record/metadata/schede/A/RE">
					<xsl:choose>
						<xsl:when test="./* and (not(./REN/RENR) or ./REN/RENR='intero bene' or ./REN/RENR='carattere generale' or ./REN/RENR='integrale' or ./REN/RENR='tutta' or ./REN/RENR='totale') or (starts-with(lower-case(normalize-space(./REN/RENR)), 'nr')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'n.r')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intero')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intera')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'esemplar'))">
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-cd:hasDating>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./REN/RENR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="(not(./REN/RENR) or ./REN/RENR='intero bene' or ./REN/RENR='carattere generale' or ./REN/RENR='integrale' or ./REN/RENR='tutta' or ./REN/RENR='totale') or (starts-with(lower-case(normalize-space(./REN/RENR)), 'nr')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'n.r')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intero')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intera')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'esemplar'))">
						<xsl:if test="not(./REN/RENS)">
							<arco-lite:hasRealizationDate>
								<xsl:variable name="relv">
								<xsl:choose>
									<xsl:when test="./REL/RELV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relw">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relf">
								<xsl:choose>
									<xsl:when test="./REL/RELF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revv">
								<xsl:choose>
									<xsl:when test="./REV/REVV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revw">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revf">
								<xsl:choose>
									<xsl:when test="./REV/REVF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="rels">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat($relw, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($relv, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revs">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat($revw, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($revv, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relx">
								<xsl:choose>
									<xsl:when test="./REL/RELX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revx">
								<xsl:choose>
									<xsl:when test="./REV/REVX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./REL/RELS and not(./REV/REVS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revx, arco-fn:urify(normalize-space(./REV/REVI)))" />
										</xsl:when>
										<xsl:when test="./REV/REVS and not(./REL/RELS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $relx, arco-fn:urify(normalize-space(./REL/RELI)), '-', $revs)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revs)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
						<xsl:if test="starts-with(lower-case(normalize-space(./REN/RENS)), 'realizzazione')">
							<arco-lite:hasRealizationDate>
								<xsl:variable name="relv">
								<xsl:choose>
									<xsl:when test="./REL/RELV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relw">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relf">
								<xsl:choose>
									<xsl:when test="./REL/RELF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revv">
								<xsl:choose>
									<xsl:when test="./REV/REVV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revw">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revf">
								<xsl:choose>
									<xsl:when test="./REV/REVF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="rels">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat($relw, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($relv, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revs">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat($revw, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($revv, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relx">
								<xsl:choose>
									<xsl:when test="./REL/RELX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revx">
								<xsl:choose>
									<xsl:when test="./REV/REVX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./REL/RELS and not(./REV/REVS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revx, arco-fn:urify(normalize-space(./REV/REVI)))" />
										</xsl:when>
										<xsl:when test="./REV/REVS and not(./REL/RELS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $relx, arco-fn:urify(normalize-space(./REL/RELI)), '-', $revs)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revs)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
						<xsl:if test="starts-with(lower-case(normalize-space(./REN/RENS)), 'costruzione')">
							<arco-lite:hasRealizationDate>
							<xsl:variable name="relv">
								<xsl:choose>
									<xsl:when test="./REL/RELV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relw">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relf">
								<xsl:choose>
									<xsl:when test="./REL/RELF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revv">
								<xsl:choose>
									<xsl:when test="./REV/REVV">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVV)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revw">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVW)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revf">
								<xsl:choose>
									<xsl:when test="./REV/REVF">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVF)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="rels">
								<xsl:choose>
									<xsl:when test="./REL/RELW">
										<xsl:value-of select="concat($relw, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($relv, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revs">
								<xsl:choose>
									<xsl:when test="./REV/REVW">
										<xsl:value-of select="concat($revw, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($revv, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="relx">
								<xsl:choose>
									<xsl:when test="./REL/RELX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="revx">
								<xsl:choose>
									<xsl:when test="./REV/REVX">
										<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVX)), '-')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="''" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./REL/RELS and not(./REV/REVS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revx, arco-fn:urify(normalize-space(./REV/REVI)))" />
										</xsl:when>
										<xsl:when test="./REV/REVS and not(./REL/RELS)">
											<xsl:value-of select="concat($NS, 'TimeInterval/', $relx, arco-fn:urify(normalize-space(./REL/RELI)), '-', $revs)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revs)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- Measurement -->
				<xsl:for-each select="record/metadata/schede/*/MT/MIS">
					<xsl:choose>
						<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP and not(lower-case(normalize-space(./MISP))='intero bene' or lower-case(normalize-space(./MISP))='integrale' or lower-case(normalize-space(./MISP))='tutta' or lower-case(normalize-space(./MISP))='totale' or (starts-with(lower-case(normalize-space(./MISP)), 'nr')) or (starts-with(lower-case(normalize-space(./MISP)), 'n.r')))">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
				              		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISP)))" />
				                </xsl:attribute>
							</arco-core:hasPart>
						</xsl:when>
						<xsl:when test="$sheetType='F' and ./MISO and not(lower-case(normalize-space(./MISO))='intero bene' or lower-case(normalize-space(./MISO))='integrale' or lower-case(normalize-space(./MISO))='tutta' or lower-case(normalize-space(./MISO))='totale' or (starts-with(lower-case(normalize-space(./MISO)), 'nr')) or (starts-with(lower-case(normalize-space(./MISO)), 'n.r')))">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
				              		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISO)))" />
				                </xsl:attribute>
							</arco-core:hasPart>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="measurement-collection">
								<xsl:choose>
									<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP">
										<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', arco-fn:urify(normalize-space(./MISP)))" />
									</xsl:when>
									<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and not(./MISP)">
										<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<arco-dd:hasMeasurementCollection>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$measurement-collection" />
				              	</xsl:attribute>
							</arco-dd:hasMeasurementCollection>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/PG/CA/HAT">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				        </xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<!-- mibact scope of protection (AMB) - relation and individual -->
				<xsl:if test="record/metadata/schede/*/OG/AMB">
					<xsl:for-each select="record/metadata/schede/*/OG/AMB">
						<arco-arco:hasMibacScopeOfProtection>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(.))='archeologico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/ArchaeologicalScope'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(.))='architettonico e paesaggistico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/ArchitecturalLandscapeScope'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(.))='etnoantropologico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/EthnoAnthropologicalScope'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(.))='storico artistico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/HistoricalArtisticScope'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat($NS, 'MibacScopeOfProtection/', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-arco:hasMibacScopeOfProtection>
						<!-- mibact scope of protection as an individual -->
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(.))='archeologico'" />
							<xsl:when test="lower-case(normalize-space(.))='architettonico e paesaggistico'" />
							<xsl:when test="lower-case(normalize-space(.))='etnoantropologico'" />
							<xsl:when test="lower-case(normalize-space(.))='storico artistico'" />
							<xsl:when test=".">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
										<xsl:value-of select="concat($NS, 'MibacScopeOfProtection/', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
									<rdf:type rdf:resource="https://w3id.org/arco/ontology/arco/MibacScopeOfProtection" />
									<rdfs:label>
										<xsl:value-of select="normalize-space(.)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(.)" />
									</l0:name>
								</rdf:Description>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<!-- intervention (CO/RST) -->
				<xsl:for-each select="record/metadata/schede/*/*/RST">
					<xsl:if test="./*">
					<xsl:if test="not($sheetType='A' or $sheetType='PG')">
					<xsl:choose>
						<xsl:when test="./* and (not(./RSTP) or ./RSTP='intero bene' or ./RSTP='integrale' or ./RSTP='tutta' or ./RSTP='totale') or (starts-with(lower-case(normalize-space(./RSTP)), 'nr')) or (starts-with(lower-case(normalize-space(./RSTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./RSTP)), 'intero')) or (starts-with(lower-case(normalize-space(./RSTP)), 'intera')) or (starts-with(lower-case(normalize-space(./RSTP)), 'esemplar'))">
							<arco-cd:hasIntervention>
								<xsl:choose>
									<xsl:when test="contains(normalize-space(lower-case(./RSTI)), 'consolidamento') or contains(normalize-space(lower-case(./RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(./RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(./RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(./RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(./RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(./RSTI)), 'protezione finale') or contains(normalize-space(lower-case(./RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(./RSTI)), 'trattamento parti metalliche')">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-intervention-', position())" />
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-cd:hasIntervention>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./RSTP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- intervention (RS/RST for A and PG) -->
				<xsl:for-each select="record/metadata/schede/*/*/RST">
					<xsl:if test="./*">
					<xsl:if test="$sheetType='A' or $sheetType='PG'">
						<xsl:choose>
								<xsl:when test="./* and $sheetType='A' and (not(./RSTR) or ./RSTR='intero bene' or ./RSTR='integrale' or ./RSTR='tutta' or ./RSTR='totale') or ./RSTR[starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')]">
								<arco-cd:hasIntervention>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
									</xsl:attribute>
								</arco-cd:hasIntervention>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
					               		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./RSTR)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- intervention (RO/RIS) -->
				<xsl:for-each select="record/metadata/schede/*/RO/RIS">
					<xsl:if test="./*">
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, 'intervention-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/MT/RST">
					<arco-cd:hasIntervention>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, 'intervention-', position())" />
						</xsl:attribute>
					</arco-cd:hasIntervention>
				</xsl:if>
				<!-- other cultural property records -->
				<xsl:for-each select="record/metadata/schede/*/AC/ACS">
					<xsl:if test="./*">
						<arco-catalogue:isDescribedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Record/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-catalogue:isDescribedBy>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AC/MOD">
					<xsl:if test="./*">
						<arco-catalogue:isDescribedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Record/', $itemURI, '-modi-', position())" />
							</xsl:attribute>
						</arco-catalogue:isDescribedBy>
					</xsl:if>
				</xsl:for-each>
				<!-- conservation status -->
				<xsl:for-each select="record/metadata/schede/*/CO/STC">
					<xsl:if test="not($sheetType='A')">
						<xsl:choose>
							<xsl:when test="./* and (not(./STCP) or ./REIP='intero bene' or ./STCP='integrale' or ./REIP='tutta' or ./STCP='totale') or (starts-with(lower-case(normalize-space(./STCP)), 'nr')) or (starts-with(lower-case(normalize-space(./STCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./STCP)), 'intero')) or (starts-with(lower-case(normalize-space(./STCP)), 'intera')) or (starts-with(lower-case(normalize-space(./STCP)), 'esemplar'))">
								<arco-dd:hasConservationStatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
		                        	</xsl:attribute>
								</arco-dd:hasConservationStatus>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./STCP">
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
				<xsl:for-each select="record/metadata/schede/A/CO/STC">
					<xsl:choose>
						<xsl:when test="./* and (not(./STCR) or ./STCR='intero bene' or ./STCR='integrale' or ./STCR='tutta' or ./STCR='totale') or (starts-with(lower-case(normalize-space(./STCR)), 'nr')) or (starts-with(lower-case(normalize-space(./STCR)), 'n.r')) or (starts-with(lower-case(normalize-space(./STCR)), 'intero')) or (starts-with(lower-case(normalize-space(./STCR)), 'intera')) or (starts-with(lower-case(normalize-space(./STCR)), 'esemplar'))">
							<arco-dd:hasConservationStatus>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
		                        </xsl:attribute>
							</arco-dd:hasConservationStatus>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./STCR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/MT/STC">
					<arco-dd:hasConservationStatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
						</xsl:attribute>
					</arco-dd:hasConservationStatus>
				</xsl:if>
				<!-- proposed intervention -->
				<xsl:if test="record/metadata/schede/*/CO/STP">
					<arco-dd:proposedIntervention>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CO/STP)" />
					</arco-dd:proposedIntervention>
				</xsl:if>
				<!-- storage condition -->
				<xsl:if test="record/metadata/schede/*/CO/STD">
					<arco-dd:storageConditions>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CO/STD)" />
					</arco-dd:storageConditions>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CO/STC/STCM">
					<arco-dd:storageConditions><!-- multiple STC eg:ICCD12095643 -->
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/CO/STC/STCM[not(.=../preceding-sibling::STC/STCM)],' ; '))" />
					</arco-dd:storageConditions>
				</xsl:if>
				<!-- information gathered on site -->
				<xsl:if test="record/metadata/schede/*/DA/NRL">
					<arco-cd:informationGatheredOnSite>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/NRL)" />
					</arco-cd:informationGatheredOnSite>
				</xsl:if>
				<!-- historical information -->
				<xsl:if test="record/metadata/schede/*/DA/NSC">
					<arco-cd:historicalInformation>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/NSC)" />
					</arco-cd:historicalInformation>
				</xsl:if>
				<!-- explanation note -->				
				<xsl:if test="record/metadata/schede/*/DA/NCS">
					<arco-cd:explanationNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/NCS)" />
					</arco-cd:explanationNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/CA/DA/INT">
					<arco-cd:explanationNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/CA/DA/INT)" />
					</arco-cd:explanationNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/TMA/DA/DES/DESI">
					<arco-cd:explanationNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/TMA/DA/DES/DESI)" />
					</arco-cd:explanationNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/DA/NSC">
					<arco-dd:explanationNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/SI/DA/NSC)" />
					</arco-dd:explanationNote>
				</xsl:if>
				<!-- functional purpose for MA and CA -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTF and ($sheetType='CA' or $sheetType='MA')">
					<arco-dd:hasFunctionalPurpose>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FunctionalPurpose/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)))" />
						</xsl:attribute>
					</arco-dd:hasFunctionalPurpose>
				</xsl:if>
				<!-- heritage protection agency -->
				<xsl:choose>
					<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-arco:hasHeritageProtectionAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(record/metadata/schede/harvesting/enteCompetente))" />
							</xsl:attribute>
						</arco-arco:hasHeritageProtectionAgency>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="record/metadata/schede/*/CD/ECP">
							<xsl:if test=".">
								<arco-core:hasAgentRole>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
									</xsl:attribute>
								</arco-core:hasAgentRole>
								<arco-arco:hasHeritageProtectionAgency>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
									</xsl:attribute>
								</arco-arco:hasHeritageProtectionAgency>
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<!-- cataloguing agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/ESC">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-arco:hasCataloguingAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-arco:hasCataloguingAgency>
					</xsl:if>
				</xsl:for-each>
				<!-- proponent agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/EPR">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-cd:hasProponentAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-cd:hasProponentAgency>
					</xsl:if>
				</xsl:for-each>
				<!-- Type of context for LC and LA-->
				<xsl:for-each select="record/metadata/schede/*/LC/PVZ">
					<arco-location:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/UrbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/TerritorialContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/UnderwaterContext'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasTypeOfContext>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/LA/PRZ">
					<arco-location:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/UrbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/TerritorialContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/UnderwaterContext'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasTypeOfContext>
				</xsl:for-each>
				<!-- Type of context for SETT-->
				<xsl:for-each select="record/metadata/schede/*/LC/SET/SETT">
					<arco-location:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(.)) = 'su'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/UrbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'tp'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/ExtraurbanContext'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(.)) = 'su anomalo'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
								</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasTypeOfContext>
				</xsl:for-each>
				<!-- Cultural property category -->
				<xsl:for-each select="record/metadata/schede/*/OG/CTG">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space()))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/CT/CTG">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/CT/CTG)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/RA/OG/CLS">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/RA/OG/CLS)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MA/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/MA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/CA/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/CA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGT/OGTP">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGT/OGTP)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/BDM/OG/OGT">
					<xsl:if test="./OGTG">
						<arco-arco:hasCulturalPropertyCategory>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./OGTE">
										<xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(./OGTG)), '-', arco-fn:urify(normalize-space(./OGTE)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(./OGTG)))" />
									</xsl:otherwise>
								</xsl:choose>
	    	                </xsl:attribute>
						</arco-arco:hasCulturalPropertyCategory>
					</xsl:if>
				</xsl:for-each>
				<!-- detection method -->
				<xsl:for-each select="record/metadata/schede/*/OG/OGM"><!-- allow multiple values es: ICCD13661286 -->
					<arco-cd:hasDetectionMethod>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'DetectionMethod/', arco-fn:urify(normalize-space()))" />
	                    </xsl:attribute>
					</arco-cd:hasDetectionMethod>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTA">
					<arco-cd:hasDetectionMethod>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat($NS,'DetectionMethod/', arco-fn:urify(normalize-space(record/metadata/schede/SI/OG/OGT/OGTA)))" />
	                    </xsl:attribute>
					</arco-cd:hasDetectionMethod>
				</xsl:if>
				<!-- Acquisition of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ACQ">
					<xsl:if test="./ACQT and (not(starts-with(lower-case(normalize-space(./ACQT)), 'nr')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'n.r.')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'dato non')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'non ')) and not(starts-with(lower-case(normalize-space(./ACQT)), 'ignota')) and not(starts-with(lower-case(normalize-space(./ACQT)), '-')))">
						<arco-cd:hasAcquisition>
							<xsl:attribute name="rdf:resource">
	    	            		<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
	        	        	</xsl:attribute>
						</arco-cd:hasAcquisition>
						<xsl:for-each select="./ACQN">
							<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r.')) and not(starts-with(lower-case(normalize-space(.)), '.')) and not(starts-with(lower-case(normalize-space(.)), ' ')) and not(starts-with(lower-case(normalize-space(.)), '-')) and not(starts-with(lower-case(normalize-space(.)), '(')))">
								<arco-lite:hasTransferor>
									<xsl:attribute name="rdf:resource">
	            						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
	            					</xsl:attribute>
								</arco-lite:hasTransferor>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
				<!-- Change of availability of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ALN">
					<arco-cd:hasChangeOfAvailability>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
	                	</xsl:attribute>
					</arco-cd:hasChangeOfAvailability>
				</xsl:for-each>
				<!-- Photographic Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/FTA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/DCM">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AL/FTA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Graphic or cartographic Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/DRA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Film Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/VDC">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Audio Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/REG">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Sources and Documents of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/FNT">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/BIB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:for-each>
				<!-- Geometry of cultural property -->
				<xsl:if test="record/metadata/schede/*/GP/*/*">
					<xsl:choose>
						<!-- if does not exist the element MTAP we refer the geometry directly 
							to the cultural property. Otherwise: (i) we generate a number of parts (i.e. 
							the values for MTAP elements) - both here and in the rule below; (ii) we 
							associate each geometry value in MTAP to generated parts - see rule below; 
							(iii) we associate the cultural property to its parts - here. -->
						<xsl:when test="not(record/metadata/schede/*/MT/MTA/MTAP) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTA/MTAP)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTA/MTAP)), 'n.r'))">
							<xsl:for-each select="record/metadata/schede/*/GP">
								<clvapit:hasGeometry>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
			                		</xsl:attribute>
								</clvapit:hasGeometry>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="record/metadata/schede/*/GP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', position())" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/GA">
					<xsl:if test="./*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
	                		</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/GL">
					<xsl:if test="record/metadata/schede/*/GL/*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
	                		</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/GE">
					<xsl:if test="record/metadata/schede/*/GE/*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
	                		</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<!-- Geometry for geocoding|puntoPrincipale -->
				<xsl:if test="record/metadata/schede/harvesting/*[name()='geocoding' or name()='puntoPrincipale']/*">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
			                <xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
			            </xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>
				<!-- Geometry for RA 2.00 -->
				<xsl:if test="record/metadata/schede/*/RP/LGI">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
	            		</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>
				<!-- Geometry for A 2.00 -->
				<xsl:if test="record/metadata/schede/*/CR">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
	            		</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>
				<!-- subject -->
				<xsl:for-each select="record/metadata/schede/*/*/SGT">
					<xsl:choose>
						<xsl:when test="$sheetType='PST'">
							<xsl:choose>
								<xsl:when test="./SGTP">
									 <arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SGTP)))" />
										</xsl:attribute>
									</arco-core:hasPart>
								</xsl:when>
								<xsl:otherwise>
									<arco-cd:subject>
										<xsl:value-of select="normalize-space(./SGTI)" />
										</arco-cd:subject>
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(./SGTI))" />
	  				                  	</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:when>
						<xsl:when test="$sheetType='SMO'">
							<xsl:choose>
								<xsl:when test="./SGTA">
									 <arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./SGTA)))" />
										</xsl:attribute>
									</arco-core:hasPart>
								</xsl:when>
								<xsl:otherwise>
									<arco-cd:subject>
										<xsl:value-of select="normalize-space(./SGTI)" />
										</arco-cd:subject>
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(./SGTI))" />
	  				                  	</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
								<arco-cd:subject>
									<xsl:value-of select="normalize-space(./SGTI)" />
								</arco-cd:subject>
								<arco-cd:hasSubject>
									<xsl:attribute name="rdf:resource">
	  									<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(./SGTI))" />
	  				        	  	</xsl:attribute>
								</arco-cd:hasSubject>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/*/THS">
					<xsl:if test="record/metadata/schede/*/*/THS/THSD">
						<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<arco-cd:subject>
								<xsl:value-of select="normalize-space(./THSD)" />
							</arco-cd:subject>
							<arco-cd:hasSubject>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(./THSD))" />
	            	        	</xsl:attribute>
							</arco-cd:hasSubject>
						</xsl:if>
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
				<!-- iconclass code -->
				<xsl:if test="record/metadata/schede/*/*/SGT/SGTC and not(lower-case(normalize-space(record/metadata/schede/*/*/SGT/SGTC))='nr' or lower-case(normalize-space(record/metadata/schede/*/*/SGT/SGTC))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/*/SGT/SGTC))='nr (recupero pregresso)')">
					<xsl:for-each select="record/metadata/schede/*/*/SGT/SGTC">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:iconclassCode>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="not($sheetType='TMA')">
					<xsl:if test="record/metadata/schede/*/*/DES/DESI[not(lower-case(normalize-space())='nr' or lower-case(normalize-space())='n.r.' or lower-case(normalize-space())='nr (recupero pregresso)')]">
						<xsl:for-each select="record/metadata/schede/*/*/DES/DESI">
							<arco-cd:iconclassCode>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:iconclassCode>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DA/AID/AIDC">
					<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:iconclassCode>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/F/SG/SGS">
					<xsl:if test="not(starts-with(lower-case(normalize-space(./SGSI)), 'nr')) and not(starts-with(lower-case(normalize-space(./SGSI)), 'n.r'))">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(./SGSI)" />
						</arco-cd:iconclassCode>
					</xsl:if>
				</xsl:for-each>
				<!-- title -->
				<xsl:for-each select="record/metadata/schede/*/OG/SGT/SGTT">
					<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:title>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:title>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<!-- proper title -->
				<xsl:if test="not($sheetType='PST' or $sheetType='SMO')">
					<xsl:for-each select="record/metadata/schede/*/*/SGT/SGTP">
						<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:if test="$sheetType='MI' or 'S'">
								<arco-cd:properTitle>
									<xsl:value-of select="normalize-space(.)" />
								</arco-cd:properTitle>
								<arco-cd:hasTitle>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
									</xsl:attribute>
								</arco-cd:hasTitle>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/SG/SGL/SGLT">
					<xsl:choose>
						<xsl:when test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:properTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:properTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- attributed title -->
				<xsl:for-each select="record/metadata/schede/*/SG/SGL/SGLA">
					<xsl:choose>
						<xsl:when test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:attributedTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:attributedTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- parallel title -->
				<xsl:for-each select="record/metadata/schede/*/OG/SGT/SGTR">
					<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:parallelTitle>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:parallelTitle>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/SG/SGL/SGLL">
					<xsl:choose>
						<xsl:when test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:parallelTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:parallelTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- decorative apparatus -->
				<xsl:for-each select="record/metadata/schede/*/DA/APF">
					<arco-dd:hasIconographicOrDecorativeApparatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
						</xsl:attribute>
					</arco-dd:hasIconographicOrDecorativeApparatus>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DA/AID">	
					<xsl:choose>	
						<xsl:when test="not(./AIDA) or ./AIDA='intero bene' or ./AIDA='integrale' or ./AIDA='tutta' or ./AIDA='totale' or ./AIDA='carattere generale' or (starts-with(lower-case(normalize-space(./AIDA)), 'nr')) or (starts-with(lower-case(normalize-space(./AIDA)), 'n.r')) or (starts-with(lower-case(normalize-space(./AIDA)), 'intero')) or (starts-with(lower-case(normalize-space(./AIDA)), 'intera')) or (starts-with(lower-case(normalize-space(./AIDA)), 'esemplar'))">
							<arco-dd:hasIconographicOrDecorativeApparatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-dd:hasIconographicOrDecorativeApparatus>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AIDA)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DE/DEC">	
					<xsl:choose>	
						<xsl:when test="not(./DECU) or ./DECU='intero bene' or ./DECU='integrale' or ./DECU='tutta' or ./DECU='totale' or ./DECU='carattere generale' or (starts-with(lower-case(normalize-space(./DECU)), 'nr')) or (starts-with(lower-case(normalize-space(./DECU)), 'n.r')) or (starts-with(lower-case(normalize-space(./DECU)), 'intero')) or (starts-with(lower-case(normalize-space(./DECU)), 'intera')) or (starts-with(lower-case(normalize-space(./DECU)), 'esemplar'))">
							<arco-dd:hasIconographicOrDecorativeApparatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
								</xsl:attribute>
							</arco-dd:hasIconographicOrDecorativeApparatus>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./DECU)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- reference coin legend (NU) -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTL">
					<arco-arco:hasReferenceCoinLegend>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ReferenceCoinLegend/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTL)))" />
						</xsl:attribute>
					</arco-arco:hasReferenceCoinLegend>
				</xsl:if>
				<!-- cultural property availability -->
				<xsl:if test="record/metadata/schede/*/OG/OGR">
					<arco-dd:hasCulturalPropertyAvailability>
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='bene disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='reale'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Available'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='bene già catalogato, non più disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='documentata' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='non più disponibile'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/NoLongerAvailable'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyAvailability/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGR)))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-dd:hasCulturalPropertyAvailability>
				</xsl:if>
				<!-- cultural property accessibility -->
				<xsl:if test="record/metadata/schede/*/LC/ACB">
					<arco-dd:hasCulturalPropertyAccessibility>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='si' or lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='sì'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Accessible'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='no'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Inaccessible'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='in parte'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PartiallyAccessible'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CulturalPropertyAccessibility/', arco-fn:urify(normalize-space(record/metadata/schede/*/LC/ACB/ACBA)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-dd:hasCulturalPropertyAccessibility>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/UT/CNU/CNUV">
					<arco-dd:hasCulturalPropertyAccessibility>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/UT/CNU/CNUV))='aperto al pubblico'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Accessible'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/UT/CNU/CNUV))='no'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Inaccessible'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/UT/CNU/CNUV))='parzialmente aperto al pubblico'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/PartiallyAccessible'" />
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/UT/CNU/CNUV))='accessibile con permesso'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/AccessibleWithAutorisation'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CulturalPropertyAccessibility/', arco-fn:urify(normalize-space(record/metadata/schede/*/UT/CNU/CNUV)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-dd:hasCulturalPropertyAccessibility>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/UT/CNU/CNUN">
					<arco-core:note>
						<xsl:value-of select="concat('Condizione d uso: ', normalize-space(record/metadata/schede/*/UT/CNU/CNUN), '. ', normalize-space(record/metadata/schede/*/UT/CNU/CNUS))" />
					</arco-core:note>
				</xsl:if>
				<!-- numismatic property counterstamp -->
				<xsl:for-each select="record/metadata/schede/NU/DA/CON">
					<arco-dd:hasAffixedElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Counterstamp/', $itemURI, '-counterstamp-', position())" />
						</xsl:attribute>
					</arco-dd:hasAffixedElement>
				</xsl:for-each>
				<!-- cultural property cataloguing category -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTV">
					<arco-arco:hasCulturalPropertyCataloguingCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyCataloguingCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)))" />
						</xsl:attribute>
					</arco-arco:hasCulturalPropertyCataloguingCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OG/OGV">
					<arco-arco:hasCulturalPropertyCataloguingCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyCataloguingCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGV)))" />
						</xsl:attribute>
					</arco-arco:hasCulturalPropertyCataloguingCategory>
				</xsl:if>
				<!-- relation with preparatory or final work (RO/ROF) -->
				<xsl:if test="record/metadata/schede/*/RO/ROF">
					<xsl:for-each select="record/metadata/schede/*/RO/ROF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-preparatory-final-work-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with copy (RO/COP) -->
				<xsl:for-each select="record/metadata/schede/*/RO/COP">
					<arco-cd:hasRelatedWorkSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-copy-', position())" />
						</xsl:attribute>
					</arco-cd:hasRelatedWorkSituation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test="./CRFT='copia'">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-copy-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- relation with a generic derivated work (if RO/CRF/CRFT != 'replica' 
					or 'contraffazione' or 'controtipo' or 'reimpiego' or 'copia') -->
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test=". and not(./CRFT='copia' or ./CRFT='contraffazione' or ./CRFT='controtipo' or ./CRFT='replica' or ./CRFT='reimpiego')">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-derivated-work-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: forgery -->
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test="./CRFT='contraffazione'">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-forgery-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: facsimile -->
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test="./CRFT='controtipo'">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-facsimile-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: same author copy -->
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test="./CRFT='replica'">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-same-author-copy-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: reuse -->
				<xsl:for-each select="record/metadata/schede/*/RO/CRF">
					<xsl:if test="./CRFT='reimpiego'">	
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RO/REI">
					<xsl:choose>
						<xsl:when test="./* and (not(./REIP) or ./REIP='intero bene' or ./REIP='integrale' or ./REIP='tutta' or ./REIP='totale') or (starts-with(lower-case(normalize-space(./REIP)), 'nr')) or (starts-with(lower-case(normalize-space(./REIP)), 'n.r')) or (starts-with(lower-case(normalize-space(./REIP)), 'intero')) or (starts-with(lower-case(normalize-space(./REIP)), 'intera')) or (starts-with(lower-case(normalize-space(./REIP)), 'esemplar'))">
							<arco-cd:hasRelatedWorkSituation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
								</xsl:attribute>
							</arco-cd:hasRelatedWorkSituation>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./REIP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				               			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				               		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RO/RIU">
					<arco-cd:hasRelatedWorkSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
						</xsl:attribute>
					</arco-cd:hasRelatedWorkSituation>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: print in publication  (S) -->
				<xsl:if test="record/metadata/schede/*/RO/ADL">
					<xsl:for-each select="record/metadata/schede/*/RO/ADL">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-print-in-publication-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- name in time -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />                      	                            
                        </xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/OG/OGD/*">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                       		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                       	</xsl:attribute>
					</arco-dd:hasDesignationInTime>
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
					<xsl:if test="not($sheetType='FF')">
						<arco-dd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
        	                	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
            	            </xsl:attribute>
						</arco-dd:hasDesignationInTime>
					</xsl:if>
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
				<!-- identifier:uniqueIdentifier - concat of NCTR + NCTN + NCTS available in record/metadata/schede/*/CD/NCT) -->
				<xsl:if test="record/metadata/schede/*/CD/NCT/NCTN">
					<arco-lite:uniqueIdentifier>
						<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
					</arco-lite:uniqueIdentifier>
					<arco-core:hasIdentifier>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'UniqueIdentifier/', $itemURI)" />
						</xsl:attribute>
					</arco-core:hasIdentifier>
				</xsl:if>
				<!-- NCTR Codice Regione (record/metadata/schede/*/CD/NCT/NCTR) -->
				<xsl:for-each select="record/metadata/schede/*/CD/NCT/NCTR">
					<arco-arco:regionIdentifier>
						<xsl:value-of select="." />
					</arco-arco:regionIdentifier>
				</xsl:for-each>
				<!-- NCTN Numero catalogo generale (record/metadata/schede/*/CD/NCT/NCTN) -->
				<xsl:for-each select="record/metadata/schede/*/CD/NCT/NCTN">
					<arco-arco:catalogueNumber>
						<xsl:value-of select="." />
					</arco-arco:catalogueNumber>
				</xsl:for-each>
				<!-- NCTS Suffisso (record/metadata/schede/*/CD/NCT/NCTS) -->
				<xsl:for-each select="record/metadata/schede/*/CD/NCT/NCTS">
					<arco-arco:suffix>
						<xsl:value-of select="." />
					</arco-arco:suffix>
				</xsl:for-each>
				<!-- finding note -->
				<xsl:if test="record/metadata/schede/*/RE/RES">
					<arco-cd:findingNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/RE/RES)" />
					</arco-cd:findingNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/RES">
					<arco-cd:findingNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/RES)" />
					</arco-cd:findingNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/RP/SPR">
					<arco-cd:findingNote>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/RP/SPR)" />
					</arco-cd:findingNote>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/RP/ROC">
					<arco-cd:findingNote>
						<xsl:choose>
							<xsl:when test="./ROCC and ./ROCI">
								<xsl:value-of select="concat(normalize-space(./ROCC), ' | ', normalize-space(./ROCI))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(./ROCC), normalize-space(./ROCI))" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:findingNote>
				</xsl:for-each>
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
				<!-- numismatic property specification -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTS">
					<arco-core:specification>
						<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTS)" />
					</arco-core:specification>
				</xsl:if>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/TU/CPR">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Copyright/', $itemURI, '-copyright-', position())" />
						</xsl:attribute>
					</arco-cd:hasCopyright>
				</xsl:for-each>
				<!-- dedication (DA/DDC) -->
				<xsl:if test="record/metadata/schede/*/AU/DDC/*">
					<xsl:for-each select="record/metadata/schede/*/AU/DDC">
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Dedication/', $itemURI, '-dedication-', position())" />
							</xsl:attribute>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- inscription (DA/ISR) -->
				<xsl:for-each select="record/metadata/schede/*/DA/ISR">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="./* and (not(./ISRY) or ./ISRY='intero bene' or ./ISRY='integrale' or ./ISRY='tutta' or ./ISRY='totale') or (starts-with(lower-case(normalize-space(./ISRY)), 'nr')) or (starts-with(lower-case(normalize-space(./ISRY)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISRY)), 'intero')) or (starts-with(lower-case(normalize-space(./ISRY)), 'intera')) or (starts-with(lower-case(normalize-space(./ISRY)), 'esemplar'))">
								<arco-dd:hasAffixedElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Inscription/', $itemURI, '-inscription-', position())" />
									</xsl:attribute>
								</arco-dd:hasAffixedElement>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./ISRY">
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
				<!-- affixed element -->
				<xsl:for-each select="record/metadata/schede/*/DA/STM">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="./* and (not(./STMY) or ./STMY='intero bene' or ./STMY='integrale' or ./STMY='tutta' or ./STMY='totale') or (starts-with(lower-case(normalize-space(./STMY)), 'nr')) or (starts-with(lower-case(normalize-space(./STMY)), 'n.r')) or (starts-with(lower-case(normalize-space(./STMY)), 'intero')) or (starts-with(lower-case(normalize-space(./STMY)), 'intera')) or (starts-with(lower-case(normalize-space(./STMY)), 'esemplar'))">
								<arco-dd:hasAffixedElement>
									<xsl:choose>
										<xsl:when test="lower-case(normalize-space(./STMC))='timbro'">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./STMC))='stemma'">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./STMC))='emblema'">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./STMC))='marchio'">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="lower-case(normalize-space(./STMC))='logo'">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
											</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
								</arco-dd:hasAffixedElement>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./STMY">
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
				<xsl:if test="record/metadata/schede/*/*/LSI/*">
					<xsl:for-each select="record/metadata/schede/*/*/LSI">
						<arco-dd:hasAffixedElement>
							<xsl:choose>
								<xsl:when test="lower-case(normalize-space(./LSIG))='timbro'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./LSIG))='stemma'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./LSIG))='emblema'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./LSIG))='marchio'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./LSIG))='logo'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:when test="lower-case(normalize-space(./LSIG))='lapide'">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'HistoricalPlaque/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DA/ISE">
					<xsl:choose>
						<xsl:when test="./* and (not(./ISER) or ./ISER='intero bene' or ./ISER='integrale' or ./ISER='tutta' or ./ISER='totale') or (starts-with(lower-case(normalize-space(./ISER)), 'nr')) or (starts-with(lower-case(normalize-space(./ISER)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISER)), 'intero')) or (starts-with(lower-case(normalize-space(./ISER)), 'intera')) or (starts-with(lower-case(normalize-space(./ISER)), 'esemplar'))">
							<arco-dd:hasAffixedElement>
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Inscription/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-dd:hasAffixedElement>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./ISER">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/SCAN/DA/ELR">
					<arco-dd:hasAffixedElement>
						<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, position())" />
					</arco-dd:hasAffixedElement>
				</xsl:if>
				<!-- Sample Collected (CMN) -->
				<xsl:for-each select="record/metadata/schede/*/MC/CMN">
					<arco-dd:hasSampleCollected>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'SampleCollected/', $itemURI, '-', arco-fn:urify(normalize-space(./CMND)))" />
						</xsl:attribute>
					</arco-dd:hasSampleCollected>
				</xsl:for-each>
				<!-- finding context (AT) -->
				<xsl:if test="record/metadata/schede/AT/OG/OGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)), 'n.r')))">
					<arco-cd:hasFindingContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'FindingContext/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)))" />
						</xsl:attribute>
					</arco-cd:hasFindingContext>
				</xsl:if>
				<!-- coin issuance (NU) -->
				<xsl:for-each select="record/metadata/schede/*/AU/EDT">
					<xsl:if test="$sheetType='OA' or $sheetType='NU'">
						<arco-cd:hasCoinIssuance>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CoinIssuance/', $itemURI, '-issuance-', position())" />
							</xsl:attribute>
						</arco-cd:hasCoinIssuance>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DA/AUE">
					<arco-cd:hasCoinIssuance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CoinIssuance/', $itemURI, '-issuance-', position())" />
						</xsl:attribute>
					</arco-cd:hasCoinIssuance>
				</xsl:for-each>
				<!-- Use of cultural property -->
				<xsl:if test="not(record/metadata/schede/A/UT or record/metadata/schede/PG/UT)">
					<xsl:for-each select="record/metadata/schede/*/UT">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
	                		</xsl:attribute>
						</arco-cd:hasUse>
						<xsl:for-each select="(./UTU/UTUF)[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<arco-lite:hasCulturalEntityUseFunction>
								<xsl:attribute name="rdf:resource">
		        					<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-lite:hasCulturalEntityUseFunction>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/UTF or record/metadata/schede/*/DA/UTM or record/metadata/schede/*/DA/UTS">
					<arco-cd:hasUse>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use')" />
	                	</xsl:attribute>
					</arco-cd:hasUse>
					<xsl:for-each select="(./UTF)[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<arco-lite:hasCulturalEntityUseFunction>
							<xsl:attribute name="rdf:resource">
		        				<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
							</xsl:attribute>
						</arco-lite:hasCulturalEntityUseFunction>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/US/USO">
					<xsl:choose>
						<xsl:when test="./* and (not(./USOR) or ./USOR='intero bene' or ./USOR='integrale' or ./USOR='tutta' or ./USOR='totale') or (starts-with(lower-case(normalize-space(./USOR)), 'nr')) or (starts-with(lower-case(normalize-space(./USOR)), 'n.r')) or (starts-with(lower-case(normalize-space(./USOR)), 'intero')) or (starts-with(lower-case(normalize-space(./USOR)), 'intera')) or (starts-with(lower-case(normalize-space(./USOR)), 'esemplar'))">
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
	                				<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
 	                			</xsl:attribute>
							</arco-cd:hasUse>
							<xsl:for-each select="./USOD[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"> <!-- allow multiple values eg:ICCD14295730  -->
								<arco-lite:hasCulturalEntityUseFunction>
									<xsl:attribute name="rdf:resource">
		        						<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
									</xsl:attribute>
								</arco-lite:hasCulturalEntityUseFunction>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./USOR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/US/USA">
					<xsl:choose>
						<xsl:when test="./* and (not(./USAR) or ./USAR='intero bene' or ./USAR='integrale' or ./USAR='tutta' or ./USAR='totale') or (starts-with(lower-case(normalize-space(./USAR)), 'nr')) or (starts-with(lower-case(normalize-space(./USAR)), 'n.r')) or (starts-with(lower-case(normalize-space(./USAR)), 'intero')) or (starts-with(lower-case(normalize-space(./USAR)), 'intera')) or (starts-with(lower-case(normalize-space(./USAR)), 'esemplar'))">
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
	                				<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-current-use-', position())" />
 	                			</xsl:attribute>
							</arco-cd:hasUse>
							<xsl:if test="./USAD and (not(starts-with(lower-case(normalize-space(./USAD)), 'nr')) and not(starts-with(lower-case(normalize-space(./USAD)), 'n.r')))">
								<arco-cd:hasUseFunction>
									<xsl:attribute name="rdf:resource">
				        				<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(./USAD))" />
									</xsl:attribute>
								</arco-cd:hasUseFunction>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./USAR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- obverse of coin -->
				<xsl:if test="record/metadata/schede/NU/DA/DES/DESA or record/metadata/schede/NU/DA/DES/DESL or record/metadata/schede/NU/DA/DES/DESN or record/metadata/schede/NU/DA/DES/DESF">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-obverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<xsl:if test="record/metadata/schede/NU/DA/CON/COND">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-obverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<!-- reverse of coin -->
				<xsl:if test="record/metadata/schede/NU/DA/DES/DESM or record/metadata/schede/NU/DA/DES/DESG or record/metadata/schede/NU/DA/DES/DESR or record/metadata/schede/NU/DA/DES/DEST">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-reverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<xsl:if test="record/metadata/schede/NU/DA/CON/CONR">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-reverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<!-- parts of anthropological material -->
				<xsl:for-each select="record/metadata/schede/AT/EL/ELE">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ELEE)))" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:for-each>
				<!-- sex estimate -->
				<xsl:if test="record/metadata/schede/AT/DA/STS">
					<arco-cd:hasSexInterpretation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'SexInterpretation/', $itemURI)" />
                		</xsl:attribute>
					</arco-cd:hasSexInterpretation>
				</xsl:if>
				<!-- technical status of cultural property (version 4.00) -->
				<xsl:if test="record/metadata/schede/*/MT/MTC/*">
					<!-- material of cultural property (version 4.00) -->
					<xsl:for-each select="record/metadata/schede/*/MT/MTC">
						<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCM)), 'n.r'))">
							<xsl:if test="./MTCM">
								<xsl:choose>
									<xsl:when test="(not(./MTCP) or ./MTCP='intero bene' or ./MTCP='integrale' or ./MTCP='tutta' or ./MTCP='totale') or (starts-with(lower-case(normalize-space(./MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTCP)), 'esemplar'))">
										<arco-dd:hasTechnicalStatus>
											<xsl:attribute name="rdf:resource">
	            		    					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                						</xsl:attribute>
										</arco-dd:hasTechnicalStatus>
										<arco-dd:hasMaterial>
											<xsl:attribute name="rdf:resource">
            									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCM)))" />
            								</xsl:attribute>
										</arco-dd:hasMaterial>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="./MTCP">
											<arco-core:hasPart>
												<xsl:attribute name="rdf:resource">
			        		        				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                					</xsl:attribute>
											</arco-core:hasPart>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>								
					<!-- technique of cultural property  -->
					<xsl:if test="not($sheetType='VeAC')" >
						<xsl:for-each select="record/metadata/schede/*/MT/MTC">
							<xsl:if test="not(./MTCT[starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r')])"><!-- allow multiple values es: ICCD13661286 -->
								<xsl:if test="./MTCT">
									<xsl:choose>
										<xsl:when test="not(./MTCP) or ./MTCP[.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')]">
											<arco-dd:hasTechnicalStatus>
												<xsl:attribute name="rdf:resource">
				                					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
			 	                				</xsl:attribute>
											</arco-dd:hasTechnicalStatus>
											<xsl:for-each select="./MTCT"><!-- allow multiple values es: ICCD13661286 -->
												<arco-dd:hasTechnique>
													<xsl:attribute name="rdf:resource">
				            							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
				            						</xsl:attribute>
												</arco-dd:hasTechnique>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="./MTCP">
												<arco-core:hasPart>
													<xsl:attribute name="rdf:resource">
						                				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						                			</xsl:attribute>
												</arco-core:hasPart>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- materialOrTechnique of cultural property (OAC) -->
					<xsl:for-each select="record/metadata/schede/*/MT/MTC">
						<xsl:if test="not(./MTCI[starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r')])">
							<xsl:if test="./MTCI">
								<xsl:choose>
									<xsl:when test="not(./MTCP) or ./MTCP[.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')]">
										<arco-dd:hasTechnicalStatus>
											<xsl:attribute name="rdf:resource">
			                					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
		 	                				</xsl:attribute>
										</arco-dd:hasTechnicalStatus>
										<xsl:for-each select="./MTCI"><!-- allow multiple values es: ICCD11324966 -->
											<arco-dd:hasMaterialOrTechnique>
												<xsl:attribute name="rdf:resource">
			            							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
			            						</xsl:attribute>
											</arco-dd:hasMaterialOrTechnique>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="./MTCP">
											<arco-core:hasPart>
												<xsl:attribute name="rdf:resource">
					                				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
					                			</xsl:attribute>
											</arco-core:hasPart>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
					<!-- material of cultural property (VeAC) -->
					<xsl:for-each select="record/metadata/schede/*/MT/MTC">
						<xsl:if test="$sheetType='VeAC'" >
							<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCF)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCF)), 'n.r'))">
								<xsl:if test="./MTCF">
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
		                					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	    	            				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
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
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
	        	        					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	            	    				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
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
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
	        	        					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	            	    				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
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
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
	    	            					<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	        	        				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-dd:hasGarmentAnalysis>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCA)))" />
            							</xsl:attribute>
									</arco-dd:hasGarmentAnalysis>
								</xsl:if>	
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>	
				<!-- technical status - materialOrTechnique of cultural property (previous versions) -->
				<xsl:for-each select="record/metadata/schede/*/MT/MTC">
					<xsl:if test="not(./*) and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
 	                				<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                			</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
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
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasPixelDimension>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)))" />
            				</xsl:attribute>
						</arco-dd:hasPixelDimension>
					</xsl:if>
				</xsl:if>
				<!-- technical status - mass storage of photograph (F) -->
				<xsl:if test="record/metadata/schede/F/MT/FVM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasMassStorage>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVM)))" />
            			</xsl:attribute>
					</arco-dd:hasMassStorage>
				</xsl:if>
				<!-- technical status - colour of photograph (F) -->
				<xsl:if test="record/metadata/schede/F/MT/MTX and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasPhotoColour>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/MTX)))" />
            			</xsl:attribute>
					</arco-dd:hasPhotoColour>
				</xsl:if>
				<!-- digital photo note (F) -->
				<xsl:if test="record/metadata/schede/F/MT/FVC/FVCV or record/metadata/schede/F/MT/FVC/FVCN">
					<arco-dd:digitalPhotographNote>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/F/MT/FVC/FVCV">
								<xsl:value-of select="record/metadata/schede/F/MT/FVC/FVCV" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="record/metadata/schede/F/MT/FVC/FVCN" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-dd:digitalPhotographNote>
				</xsl:if>	
				<!-- Legal situation of cultural property -->
				<xsl:if test="record/metadata/schede/*/TU/CDG">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/TU/CDG/CDGG)))" />
                		</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/MT/CDG">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/TU/CDG/CDGG)))" />
                		</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/TU/CDG/CDGS">
					<xsl:if test=". and (not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
						<arco-lite:hasOwner>
							<xsl:attribute name="rdf:resource">
		            			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		            		</xsl:attribute>
						</arco-lite:hasOwner>
					</xsl:if>
				</xsl:for-each>
				<!-- Export import certification of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ESP">
					<arco-cd:hasExportImportCertification>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'ExportImportCertification/', $itemURI, '-export-import-certification-', position())" />
                		</xsl:attribute>
					</arco-cd:hasExportImportCertification>
				</xsl:for-each>
				<!-- Protective measures of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/NVC">
					<xsl:choose>
						<xsl:when test="(not(./NVCP) or ./NVCP='intero bene' or ./NVCP='integrale' or ./NVCP='tutta' or ./NVCP='totale') or (starts-with(lower-case(normalize-space(./NVCP)), 'nr')) or (starts-with(lower-case(normalize-space(./NVCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intero')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intera')) or (starts-with(lower-case(normalize-space(./NVCP)), 'esemplar'))">
							<arco-cd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
                					<xsl:value-of select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
		                		</xsl:attribute>
							</arco-cd:hasProtectiveMeasure>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./NVCP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/MT/NVC">
					<arco-cd:hasProtectiveMeasure>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
		                </xsl:attribute>
					</arco-cd:hasProtectiveMeasure>
				</xsl:for-each>
				<!-- Protective Measure for A 2.00 -->
				<xsl:for-each select="record/metadata/schede/*/TU/VIN">
					<xsl:choose>
						<xsl:when test="./* and (not(./VINE) or ./VINE='intero bene' or ./VINE='integrale' or ./VINE='tutta' or ./VINE='totale') or (starts-with(lower-case(normalize-space(./VINE)), 'nr')) or (starts-with(lower-case(normalize-space(./VINE)), 'n.r')) or (starts-with(lower-case(normalize-space(./VINE)), 'intero')) or (starts-with(lower-case(normalize-space(./VINE)), 'intera')) or (starts-with(lower-case(normalize-space(./VINE)), 'esemplar'))">
							<arco-cd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
                					<xsl:value-of select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
                				</xsl:attribute>
							</arco-cd:hasProtectiveMeasure>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./VINE">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- Urban planning instrument of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/STU">
					<arco-cd:hasUrbanPlanningInstrument>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'UrbanPlanningInstrument/', $itemURI, '-urban-planning-instrument-', position())" />
                		</xsl:attribute>
					</arco-cd:hasUrbanPlanningInstrument>
				</xsl:for-each>
				<!-- Other related agents of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/AU/NMC">
					<arco-cd:hasRelatedAgent>
						<xsl:attribute name="rdf:resource">
                			<xsl:choose>
                				<xsl:when test="./NMCA">
                					<xsl:value-of select="concat($NS, 'Agent/', $itemURI, '-', arco-fn:arcofy(concat(./NMCN, '-', ./NMCA)))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat($NS, 'Agent/', $itemURI, '-', arco-fn:arcofy(./NMCN))" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</xsl:attribute>
					</arco-cd:hasRelatedAgent>
				</xsl:for-each>
				<!-- Surveys -->
				<!-- Archaeological field survey of cultural property -->
				<xsl:if test="not(record/metadata/schede/*/RE/RCG/RCGD='0000/00/00' or record/metadata/schede/*/RE/RCG/RCGD='/') and record/metadata/schede/*/RE/RCG/*">
					<xsl:for-each select="record/metadata/schede/*/RE/RCG">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'ArchaeologicalFieldSurvey/', $itemURI, '-survey-', position())" />
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Archaeometric and diagnostic survey -->
				<xsl:if test="not(record/metadata/schede/*/RE/IND/INDD='0000/00/00' or record/metadata/schede/*/RE/IND/INDD='/') and record/metadata/schede/*/RE/IND/*">
					<xsl:for-each select="record/metadata/schede/*/RE/IND">
						<xsl:choose>
							<xsl:when test="not(./INDP) or ./INDP='intero bene' or ./INDP='integrale' or ./INDP='tutta' or ./INDP='totale' or ./INDP='carattere generale' or (starts-with(lower-case(normalize-space(./INDP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./INDP)), 'nr')) or (starts-with(lower-case(normalize-space(./INDP)), 'n.r')) or (starts-with(lower-case(normalize-space(./INDP)), 'intero')) or (starts-with(lower-case(normalize-space(./INDP)), 'intera')) or (starts-with(lower-case(normalize-space(./INDP)), 'esemplar'))">
								<arco-cd:hasSurvey>
									<xsl:attribute name="rdf:resource">
                						<xsl:value-of select="concat($NS, 'ArchaeometricDiagnosticSurvey/', $itemURI, '-survey-', position())" />
                					</xsl:attribute>
								</arco-cd:hasSurvey>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./INP)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<!-- Archaeological excavation of cultural property -->
				<xsl:if test="not(record/metadata/schede/*/*/DSC/DSCD='0000/00/00' or record/metadata/schede/*/*/DSC/DSCD='/') and record/metadata/schede/*/*/DSC/*">
					<xsl:for-each select="record/metadata/schede/*/*/DSC">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'ArchaeologicalExcavation/', $itemURI, '-survey-', position())" />
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Other survey -->
				<xsl:if test="not(record/metadata/schede/*/RE/AIN/AIND='0000/00/00' or record/metadata/schede/*/RE/AIN/AIND='/') and record/metadata/schede/*/RE/AIN/*">
					<xsl:for-each select="record/metadata/schede/*/RE/AIN">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Survey/', $itemURI, '-survey-', position())" />
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Inspection of cultural property -->
				<xsl:if test="not(record/metadata/schede/*/ISP/ISPD='0000/00/00' or record/metadata/schede/*/CM/ISP/ISPD='/') and record/metadata/schede/*/CM/ISP/*">
					<xsl:for-each select="record/metadata/schede/*/CM/ISP">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Inspection/', $itemURI, '-inspection-', position())" />
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>		
				<!-- method of intervention and digitization -->
				<xsl:if test="record/metadata/schede/FF/DA/MTI">
					<arco-cd:methodOfInterventionAndDigitization>
						<xsl:value-of select="record/metadata/schede/FF/DA/MTI" />
					</arco-cd:methodOfInterventionAndDigitization>
				</xsl:if>
				<xsl:if test="$sheetType='SM'" >
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MusicalInstrument'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:for-each select="record/metadata/schede/*/AS/ASS/ASST" >
						<arco-dd:hasAccessory>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Accessory/', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
						</arco-dd:hasAccessory>
					</xsl:for-each>
				</xsl:if>
			</rdf:Description>
			<!-- Property related to cultural property -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$culturalProperty" />
                </xsl:attribute>
                <rdf:type>
					<xsl:attribute name="rdf:resource">
						 <xsl:choose>
							<xsl:when test="$sheetType='MODI'">
								<xsl:value-of select="arco-fn:getPropertyType(record/metadata/schede/MODI/OG/AMB)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="arco-fn:getPropertyType($sheetType)" />
							</xsl:otherwise>
						</xsl:choose>
                    </xsl:attribute>
				</rdf:type>
				<!-- rdf:type of cultural property -->
				<rdf:type>
					<xsl:attribute name="rdf:resource">
                        <xsl:choose>
							<xsl:when test="$sheetType='MODI'">
								<xsl:value-of select="arco-fn:getSpecificPropertyType(record/metadata/schede/MODI/OG/AMB)" />
							</xsl:when>
							<xsl:when test="$sheetType='SCAN'">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni architettonici e paesaggistici'">
										<xsl:value-of select="concat($NS, 'arco/ArchitecturalOrLandscapeHeritage')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni storici e artistici'">
										<xsl:value-of select="concat($NS, 'arco/HistoricOrArtisticProperty')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni archeologici'">
										<xsl:value-of select="concat($NS, 'arco/ArchaeologicalProperty')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni demoetnoantopologici'">
										<xsl:value-of select="concat($NS, 'arco/DemoEthnoAnthropologicalHeritage')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni fotografici'">
										<xsl:value-of select="concat($NS, 'arco/PhotographicHeritage')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni musicali'">
										<xsl:value-of select="concat($NS, 'arco/MusicHeritage')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni naturalistici'">
										<xsl:value-of select="concat($NS, 'arco/NaturalHeritage')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni numismatici'">
										<xsl:value-of select="concat($NS, 'arco/NumismaticProperty')" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni scientifici e tecnologici'">
										<xsl:value-of select="concat($NS, 'arco/ScientificOrTechnologicalHeritage')" />
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="arco-fn:getSpecificPropertyType($sheetType)" />
							</xsl:otherwise>
						</xsl:choose>
                    </xsl:attribute>
				</rdf:type>
				<!-- rdfs:comment of cultural property -->
				<rdfs:comment>
					<xsl:for-each select="record/metadata/schede/SCAN/OG/OGN">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:for-each select="record/metadata/schede/*/OG/OGT/*">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:for-each select="record/metadata/schede/*/DB/*">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:if test="record/metadata/schede/*/SGT/SGTI">
						<xsl:value-of select="concat(' ', string-join(record/metadata/schede/*/OG/SGT/SGTI,', '))" />
					</xsl:if>
				</rdfs:comment>
				<!-- hasCulturalPropertyType -->
				<xsl:if test="not($sheetType='MODI')">
					<xsl:for-each select="record/metadata/schede/*/OG/OGT">
						<xsl:if test="./*">
							<xsl:choose>
								<xsl:when test="not($sheetType='BNB') and not($sheetType='F' and ($sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')) and not($sheetType='F' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')) and not($sheetType='A' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0')) and not($sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0'))">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTT">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, '-', ./OGTT)))" />
												</xsl:when>
												<xsl:when test="./OGTD">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:when>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='F' and ($sheetVersion='1.00' or $sheetVersion='1.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTS">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, '-', ./OGTS)))" />
												</xsl:when>
												<xsl:when test="./OGTD">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:when>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='A' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0')">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTQ">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, '-', ./OGTQ)))" />
												</xsl:when>
												<xsl:when test="./OGTD">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:when>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTQ">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTT, '-', ./OGTQ)))" />
												</xsl:when>
												<xsl:when test="./OGTT">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTT))" />
												</xsl:when>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'campione'))">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTK">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, ' ', ./OGTK)))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'erbario'))">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTR">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, ' ', ./OGTR)))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'collezione'))">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTZ">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, ' ', ./OGTZ)))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
								<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'contenitore'))">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTO">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, ' ', ./OGTO)))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(./OGTD))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</arco-dd:hasCulturalPropertyType>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>			
				</xsl:if>
				<xsl:if test="record/metadata/schede/MODI/OG">
					<arco-dd:hasCulturalPropertyType>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/MODI/OG/OGT">
									<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(record/metadata/schede/MODI/OG/OGD, '-', record/metadata/schede/MODI/OG/OGT)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(record/metadata/schede/MODI/OG/OGD))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-dd:hasCulturalPropertyType>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SCAN/OG/OGD">
					<arco-dd:hasCulturalPropertyType>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/SCAN/OG/OGT">
									<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(record/metadata/schede/SCAN/OG/OGD, '-', record/metadata/schede/SCAN/OG/OGT)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(record/metadata/schede/SCAN/OG/OGD))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-dd:hasCulturalPropertyType>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/*/SGT/SGTD">
					<arco-cd:subjectDescription>
						<xsl:value-of select="." />
					</arco-cd:subjectDescription>
				</xsl:for-each>
				<!-- member of collection -->
				<xsl:for-each select="record/metadata/schede/*/UB/COL">
					<xsl:if test="./*">
					<xsl:variable name="collection-membership-position">
						<xsl:value-of select="position()" />
					</xsl:variable>
						<arco-cd:isMemberInvolvedIn>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, position())" />
							</xsl:attribute>
						</arco-cd:isMemberInvolvedIn>
						<arco-lite:isCollectionMemberOf>
							<xsl:choose>
								<xsl:when test="./COLD and (not(starts-with(lower-case(normalize-space(./COLD)), 'nr')) and not(starts-with(lower-case(normalize-space(./COLD)), 'n.r')))">
									<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./COLD)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'CollectionCulEnt/', $ldcm, '-', $pvcc, '-',  $collection-membership-position)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:isCollectionMemberOf>
					</xsl:if>
				</xsl:for-each>
				<!-- archivalrecordset membership -->
				<xsl:if test="record/metadata/schede/*/UB/UBF/*">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
					<arco-lite:isCollectionMemberOf>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/UB/UBF/UBFU">
								<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFU)))" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/UB/UBF/UBFT">
								<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFT)))" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/UB/UBF/UBFS">
								<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFS)))" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-lite:isCollectionMemberOf>
				</xsl:if>
				<!-- photographicseries membership -->
				<xsl:if test="record/metadata/schede/F/PD/SFI/*">
					<xsl:for-each select="record/metadata/schede/F/PD/SFI">
						<arco-cd:isMemberInvolvedIn>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeriesMembership/', $itemURI, position())" />
							</xsl:attribute>
						</arco-cd:isMemberInvolvedIn>
						<arco-lite:isCollectionMemberOf>
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
						</arco-lite:isCollectionMemberOf>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="record/metadata/schede/F/PD/SSI/*">
					<xsl:for-each select="record/metadata/schede/F/PD/SSI">
						<arco-cd:isMemberInvolvedIn>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicSeriesMembership/', $itemURI, position())" />
							</xsl:attribute>
						</arco-cd:isMemberInvolvedIn>
						<arco-lite:isCollectionMemberOf>
							<xsl:choose>
								<xsl:when test="./SSIT">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PhotographicSeries/', arco-fn:urify(normalize-space(./SSIT)))" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PhotographicSeries/', $ldcm, '-', $pvcc, '-', position())" />
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:isCollectionMemberOf>
					</xsl:for-each>
				</xsl:if>
				<!-- Numismatic property member -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTR">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'NumismaticSeriesMembership/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
					<arco-lite:isCollectionMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'NumismaticSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTR)))" />
						</xsl:attribute>
					</arco-lite:isCollectionMemberOf>
				</xsl:if>
				<!-- Printing plate member -->
				<xsl:if test="record/metadata/schede/MI/OG/SGT/SGTS">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PrintingPlatesSeriesMembership/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
					<arco-lite:isCollectionMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/MI/OG/SGT/SGTS)))" />
						</xsl:attribute>
					</arco-lite:isCollectionMemberOf>
				</xsl:if>
				<xsl:if test="record/metadata/schede/S/OG/SGT/SGTS">
					<arco-cd:isMemberInvolvedIn>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PrintingPlatesSeriesMembership/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
					<arco-lite:isCollectionMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PrintingPlatesSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/MI/OG/SGT/SGTS)))" />
						</xsl:attribute>
					</arco-lite:isCollectionMemberOf>
				</xsl:if>
				<!-- scan -->
				<xsl:for-each select="record/metadata/schede/SCAN/BI/RIL/RILA">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-group', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
					<arco-cd:involvesMainAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-cd:involvesMainAgent>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/SCAN/BI/RIL">
					<arco-cd:hasSurvey>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ObservationSurvey/', $itemURI)" />
						</xsl:attribute>
					</arco-cd:hasSurvey>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/SCAN/BI/DTC/DTCO">
					<arco-cd:hasCircumstance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Circumstance/', $itemURI, arco-fn:urify(.))" />
						</xsl:attribute>
					</arco-cd:hasCircumstance>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/SCAN/BI/DTC/DTCP">
					<arco-ce:isSituationMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RecurrentSituationSeries/', $itemURI)" />
						</xsl:attribute>
					</arco-ce:isSituationMemberOf>
				</xsl:if>
			</rdf:Description>

			<!-- Images retrieved from the OAI-PMH service of ICCD-MiBAC > <xsl:variable 
				name="image-link" select="arco-fn:find-image($item)" /> <xsl:if test="$image-link 
				!= ''"> <rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
				select="$objectOfDescription" /> </xsl:attribute> <foaf:image> <xsl:attribute 
				name="rdf:resource"> <xsl:value-of select="$image-link" /> </xsl:attribute> 
				</foaf:image> </rdf:Description> </xsl:if> -->
		</xsl:if>
		</rdf:RDF>

	</xsl:template>
</xsl:stylesheet>