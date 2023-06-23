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
	xmlns:arco-spe="https://w3id.org/arco/ontology/natural-specimen-description/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-con="https://w3id.org/arco/ontology/construction-description/"
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
		<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='BIB') and not(administrativeDataRecord/metadata) and not(root)" >

			<xsl:variable name="itemURI">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/DSC/*/*/DSCH">
						<xsl:value-of select="arco-fn:urify(record/metadata/schede/DSC/*/*/DSCH)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/RCG/*/*/RCGH">
						<xsl:value-of select="arco-fn:urify(record/metadata/schede/RCG/*/*/RCGH)" />
					</xsl:when>
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
							<xsl:when test="record/metadata/schede/*/CD/CBC">
								<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/CD/CBC)" />
							</xsl:when>
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
					<xsl:variable name="acc-space" select="record/metadata/schede/*/*/ACC[1]" />
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
			<!-- variable culturalPropertyResidual -->
			<xsl:variable name="culturalPropertyResidual" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-residual')" />		
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
					<xsl:when test="$sheetType='MINP'">
						<xsl:value-of select="concat($NS, 'ArchaeologicalProperty/', $itemURI)" />
					</xsl:when>
					<xsl:when test="$sheetType='DSC'">
						<xsl:value-of select="concat($NS, 'ArchaeologicalExcavation/', $itemURI)" />
					</xsl:when>
					<xsl:when test="$sheetType='RCG'">
						<xsl:value-of select="concat($NS, 'ArchaeologicalFieldSurvey/', $itemURI)" />
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
					<xsl:value-of select="$objectOfDescription" />
				</xsl:attribute>
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-0')" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyComponentOf>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalEntity'" />
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTW and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
					<arco-arco:isCulturalPropertyResidualOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-0')" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyResidualOf>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalEntity'" />
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
										<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/CM/IMD/IMDT))='bdi'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/IntangibleCulturalProperty'" />
										</xsl:when>	
										<xsl:when test="lower-case(normalize-space(record/metadata/schede/MODI/OG/AMA))='entità immateriali'">
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/IntangibleCulturalProperty'" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MovableCulturalProperty'" />
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
								<xsl:when test="lower-case(normalize-space(record/metadata/schede/SCAN/OG/CTB))='beni immateriali'">
									<xsl:value-of select="'https://w3id.org/arco/ontology/arco/IntangibleCulturalProperty'" />
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="$sheetType='DSC'">
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchaeologicalExcavation'" />
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="$sheetType='RCG'">
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchaeologicalFieldSurvey'" />
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
										<xsl:value-of select="'arco-lite:isLocatedIn'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='era contenuto in' 
												or lower-case(normalize-space(./RSER))='luogo di provenienza'
												or lower-case(normalize-space(./RSER))='sede di provenienza')">
										<xsl:value-of select="'arco-lite:hasPreviousLocation'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='esecuzione/evento di riferimento' 
												or lower-case(normalize-space(./RSER))='è coinvolto in')">
										<xsl:value-of select="'arco-lite:isInvolvedIn'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='sede di realizzazione' 
												or lower-case(normalize-space(./RSER))='è stato realizzato in')">
										<xsl:value-of select="'arco-lite:hasCreationLocation'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='bene composto' 
												or lower-case(normalize-space(./RSER))='è compreso in')">
										<xsl:value-of select="'arco-lite:isReusedBy'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='fonte di rappresentazione' 
												or lower-case(normalize-space(./RSER))='è rappresentato in')">
										<xsl:value-of select="'arco-lite:isSubjectOf'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='relazione urbanistico ambientale' 
												or lower-case(normalize-space(./RSER))='è in relazione urbanistico - ambientale con')">
										<xsl:value-of select="'arco-lite:hasUrbanPlanningEnvironmentalRelationWith'" />
									</xsl:when>
									<xsl:when test="(lower-case(normalize-space(./RSER))='sede di rinvenimento' 
												or lower-case(normalize-space(./RSER))='è stato rinvenuto in')">
										<xsl:value-of select="'arco-lite:hasFindingLocation'" />
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
				<!-- create a related work situation every time for RSE (non solo quando il tipo di relazione è specificato) -->
				<xsl:for-each select="record/metadata/schede/*/*/RSE">
					<arco-cd:hasRelatedWorkSituation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-1-', position())" />
						</xsl:attribute>
					</arco-cd:hasRelatedWorkSituation>
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
				<xsl:if test="record/metadata/schede/SCAN/DA/CRS">
					<arco-core:note>
						<xsl:value-of select="concat('Classificazione-repertorio-sistematica: ', normalize-space(record/metadata/schede/SCAN/DA/CRS))" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SCAN/MT/STA">
					<arco-core:note>
						<xsl:value-of select="concat('Situazione: ', normalize-space(record/metadata/schede/SCAN/MT/STA))" />
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
					<arco-dd:positionOnCulturalProperty>
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/OGT/OGTP,' ; '))" /><!-- RA 3.00 unbounded eg:ICCD10088602 -->
					</arco-dd:positionOnCulturalProperty>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/PLC">
					<arco-core:note>
						<xsl:value-of select="concat('Privilegi o licenze: ', normalize-space(record/metadata/schede/*/DA/PLC))" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="record/metadata/schede/FF/OG/OGT/OGTY">
					<arco-core:note>
						<xsl:value-of select="record/metadata/schede/FF/OG/OGT/OGTY" />
					</arco-core:note>
				</xsl:if>
				<!-- Depiction -->
				<xsl:for-each select="record/metadata/schede/*/*/FTA/FTAN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- xslt2 multiple nodes normalize-space exception  -->
				    <xsl:variable name="url" select="arco-fn:find-link-emm(.)" />
				    <xsl:for-each select="$url">
				        <arco-lite:depiction>
				            <xsl:attribute name="rdf:resource">
				                <xsl:value-of select="." />
				            </xsl:attribute>
				        </arco-lite:depiction>
				        <pico:preview>
				            <xsl:attribute name="rdf:resource">
				                <xsl:value-of select="." />
				            </xsl:attribute>
				        </pico:preview>
				    </xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/DCM"><!-- xslt2 multiple nodes normalize-space exception  -->
					<xsl:if test="contains((./DCMP), 'documentazione fotografica')" >
						<xsl:for-each select="./DCMN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- xslt2 multiple nodes normalize-space exception  -->
					    <xsl:variable name="url" select="arco-fn:find-link-emm(.)" />
					    <xsl:for-each select="$url">
					        <arco-lite:depiction>
					            <xsl:attribute name="rdf:resource">
				    	            <xsl:value-of select="." />
				        	    </xsl:attribute>
					        </arco-lite:depiction>
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
				    </xsl:if>
				</xsl:for-each>
				<!-- isDescribedBy -->
				<arco-core:isDescribedBy>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
					</xsl:attribute>
				</arco-core:isDescribedBy>
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
				<xsl:if test="record/metadata/schede/S/OG/QNT/QNTU or record/metadata/schede/MI/OG/QNT/QNTU">
					<arco-arco:numberOfComponents>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT/QNTU)" />
					</arco-arco:numberOfComponents>
				</xsl:if>
				<!-- has number of elements -->
				<xsl:if test="record/metadata/schede/*/OG/QNT/QNTI">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT/QNTI)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SCAN/OG/QNT">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/QNT)" />
					</arco-arco:numberOfElements>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MINP/MT/QNT/QNTC">
					<arco-arco:numberOfContainers>
						<xsl:value-of select="normalize-space(record/metadata/schede/MINP/MT/QNT/QNTC)" />
					</arco-arco:numberOfContainers>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/MT/QNT/QNTN">
					<arco-arco:numberOfElements>
						<xsl:value-of select="normalize-space(record/metadata/schede/MINP/MT/QNT/QNTN)" />
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
				<xsl:if test="record/metadata/schede/OAC/MT/MTC/MTCZ">
					<arco-core:description>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/OAC/MT/MTC/MTCV">
								<xsl:value-of select="concat('Allestimento-funzionamento: ', record/metadata/schede/OAC/MT/MTC/MTCZ, '. ', string-join(record/metadata/schede/OAC/MT/MTC/MTCV, ', '))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Allestimento-funzionamento: ', record/metadata/schede/OAC/MT/MTC/MTCZ)" />
							</xsl:otherwise>
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
						<xsl:when test="record/metadata/schede/NU/DA/DES/DESA">
							<arco-core:description>
								<xsl:value-of select="concat('Dritto: ', normalize-space(record/metadata/schede/NU/DA/DES/DESA), '. Rovescio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESM), '. Taglio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESO), normalize-space(record/metadata/schede/NU/DA/DES/DESV))" />
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
				<xsl:if test="record/metadata/schede/FF/OG/OGT/OGTO">
					<arco-dd:hasSortingCriterion>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'SortingCriterion/', arco-fn:urify(normalize-space(record/metadata/schede/FF/OG/OGT/OGTO)))" />
						</xsl:attribute>
					</arco-dd:hasSortingCriterion>
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
				<xsl:if test="$sheetType='TMA' or $sheetType='MODI'">
				<xsl:for-each select="record/metadata/schede/*/MA/MAC">
					<xsl:choose>
						<xsl:when test="../MAD">
							<xsl:for-each select="../MAD">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MADD)))" />
								</xsl:attribute>
							</arco-core:hasPart>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./MACD">
											<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MACC)), arco-fn:urify(normalize-space(./MACD)))" />
										</xsl:when>
										<xsl:when test="./MACL">
											<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MACL)))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MACC)))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DA/MTP">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-core:hasPart>
				</xsl:for-each>
				<!-- position on ground level -->
				<xsl:if test="record/metadata/schede/*/DA/PLT">
					<arco-con:hasPositionOnGroundLavel>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', $itemURI)" />
						</xsl:attribute>
					</arco-con:hasPositionOnGroundLavel>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/MT/PLT">
					<xsl:choose>
						<xsl:when test="./PLTP">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
					           		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PLTP)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:when>
						<xsl:otherwise>
							<arco-con:hasPositionOnGroundLavel>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', $itemURI, position())" />
								</xsl:attribute>
							</arco-con:hasPositionOnGroundLavel>
						</xsl:otherwise>
					</xsl:choose>
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
				<!-- support for S -->
				<xsl:for-each select="record/metadata/schede/MI/MT/MIF">
					<arco-dd:hasSupport>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Support/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-dd:hasSupport>
				</xsl:for-each>
				<!-- fruition (VeAC) -->
				<xsl:if test="record/metadata/schede/*/AU/FRU">
					<xsl:for-each select="record/metadata/schede/*/AU/FRU">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-clothing-use-', position())" />
	                		</xsl:attribute>
						</arco-cd:hasUse>
						<arco-lite:hasUser>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./FRUN))" />
	                		</xsl:attribute>
						</arco-lite:hasUser>
					</xsl:for-each>
				</xsl:if>
				<!-- authorship attribution (ATB)-->
				<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
					<xsl:for-each select="record/metadata/schede/*/AU/ATB">
						<xsl:if test="(not(starts-with(lower-case(normalize-space(./ATBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATBD)), 'n.r')))">
							<arco-cd:hasResponsibility>
								<xsl:attribute name="rdf:resource">
	                            	<xsl:value-of select="concat($NS, 'Responsibility/', $itemURI, '-cultural-scope-', position())" />
	                        	</xsl:attribute>
							</arco-cd:hasResponsibility>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="$sheetType='SCAN'">
					<xsl:for-each select="record/metadata/schede/*/DT/ATB">
						<xsl:if test="(not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r')))">
							<arco-cd:hasResponsibility>
								<xsl:attribute name="rdf:resource">
	                            	<xsl:value-of select="concat($NS, 'Responsibility/', $itemURI, '-cultural-scope-', position())" />
	                        	</xsl:attribute>
							</arco-cd:hasResponsibility>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<!-- authorship attribution (AAT)-->
				<xsl:for-each select="record/metadata/schede/*/AU/AAT">
					<arco-cd:hasResponsibility>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AlternativeResponsibility/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasResponsibility>
				</xsl:for-each>
				<!-- authorship attribution AU/AUT -->
				<xsl:if test="not ($sheetType='F' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0' or $sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
					<xsl:for-each select="record/metadata/schede/*/*/AUT">
						<xsl:variable name="aut-position">
							<xsl:value-of select="position()" />
						</xsl:variable>
						<xsl:if test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTN)), '-')))">
							<xsl:choose>
								<xsl:when test="./* and (not(./AUTW) or ./AUTW='intero bene' or ./AUTW='integrale' or ./AUTW='tutta' or ./AUTW='totale') or (starts-with(lower-case(normalize-space(./AUTW)), 'nr')) or (starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intero')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intera')) or (starts-with(lower-case(normalize-space(./AUTW)), 'esemplar'))">
									<arco-cd:hasResponsibility>
										<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
				                        </xsl:attribute>
									</arco-cd:hasResponsibility>
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
									<arco-lite:hasMainAuthor>
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
									</arco-lite:hasMainAuthor>
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
									<xsl:if test="./AUTW and not(lower-case(normalize-space(./AUTW))='integrale') and not(lower-case(normalize-space(./AUTW))='tutta') and not(lower-case(normalize-space(./AUTW))='totale') and (not(starts-with(lower-case(normalize-space(./AUTW)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intero')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intera')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'esemplar')))">
										<arco-core:hasPart>
											<xsl:attribute name="rdf:resource">
					                			<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AUTW)))" />
					                		</xsl:attribute>
										</arco-core:hasPart>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<!--  authorship attribution AU/AAU (for OAC)-->
				<xsl:for-each select="record/metadata/schede/*/AU/AAU">
					<xsl:if test="./AAUN and (not(starts-with(lower-case(normalize-space(./AAUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AAUN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AAUN)), '-')))">
						<arco-cd:hasResponsibility>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasResponsibility>
						<arco-lite:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-lite:hasAuthor>
						<arco-lite:hasMainAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AAUN))" />
							</xsl:attribute>
						</arco-lite:hasMainAuthor>
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
					<xsl:variable name="aut-position">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<xsl:if test="./* and ./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
						<arco-cd:hasResponsibility>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-photographer-', position())" />
							</xsl:attribute>
						</arco-cd:hasResponsibility>
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
						<arco-lite:hasMainAuthor>
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
						</arco-lite:hasMainAuthor>
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
						<arco-cd:hasResponsibility>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'Responsibility/', $itemURI, '-cultural-scope-', position())" />
	                        </xsl:attribute>
						</arco-cd:hasResponsibility>
					</xsl:if>
				</xsl:for-each>
				<!-- authorship attribution  AU/AAF (F version 2.00, 3.00) -->
				<xsl:for-each select="record/metadata/schede/*/AU/AAF">
					<arco-cd:hasResponsibility>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AlternativeOrOutdatedResponsibility/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasResponsibility>
				</xsl:for-each>
				<!-- authorship attribution AU/AUI -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUI">
					<xsl:variable name="aut-position">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<xsl:if test="not(./AUIY) or ./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale' or starts-with(lower-case(normalize-space(./AUIY)), 'intero') or starts-with(lower-case(normalize-space(./AUIY)), 'intera') or starts-with(lower-case(normalize-space(./AUIY)), 'esemplar')">
						<xsl:choose>
							<xsl:when test="./AUIN and (not(starts-with(lower-case(normalize-space(./AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIN)), '-')))">
								<arco-cd:hasResponsibility>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasResponsibility>
								<arco-lite:hasAuthor>
									<xsl:choose>
										<xsl:when test="./AUIA and (not(starts-with(lower-case(normalize-space(./AUIA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIA)), 'n.r')))">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUIN, '-', ./AUIA)))" />
											</xsl:attribute>		
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIN))" />
											</xsl:attribute>		
										</xsl:otherwise>
									</xsl:choose>
								</arco-lite:hasAuthor>
							</xsl:when>
							<xsl:when test="./AUIB and (not(starts-with(lower-case(normalize-space(./AUIB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUIB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUIB)), '-')))">
								<arco-cd:hasResponsibility>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasResponsibility>
								<arco-lite:hasAuthor>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./AUIB))" />
				                    </xsl:attribute>
								</arco-lite:hasAuthor>
							</xsl:when>
						</xsl:choose>
					</xsl:if> 
					<xsl:if test="./AUIY and not(./AUIY='intero bene' or ./AUIY='integrale' or ./AUIY='tutta' or ./AUIY='totale' or starts-with(lower-case(normalize-space(./AUIY)), 'intero') or starts-with(lower-case(normalize-space(./AUIY)), 'intera') or starts-with(lower-case(normalize-space(./AUIY)), 'esemplar'))">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AUIY)))" />
							</xsl:attribute>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:for-each>
				<!-- laboratory test -->
				<xsl:for-each select="record/metadata/schede/*/*/ALB">
					<arco-cd:hasSurvey>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'LaboratoryTest/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-cd:hasSurvey>
				</xsl:for-each>
				<!-- responsibility (F and FF) -->
				<xsl:for-each select="record/metadata/schede/*/PD/PDF">
					<xsl:variable name="aut-position">
						<xsl:value-of select="position()" />
					</xsl:variable>
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
						<arco-cd:hasResponsibility>
							<xsl:attribute name="rdf:resource">
				                <xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasResponsibility>
						<arco-lite:hasAuthor>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="$author" />
	                    	</xsl:attribute>
						</arco-lite:hasAuthor>
						<arco-lite:hasMainAuthor>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="$author" />
	                    	</xsl:attribute>
						</arco-lite:hasMainAuthor>
						<dc:creator>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$author" />
							</xsl:attribute>
						</dc:creator>
						<pico:author>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$author" />
							</xsl:attribute>
						</pico:author>
					</xsl:if>
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
					<xsl:for-each select="./CMMN">
						<arco-lite:hasCommittent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasCommittent>
					</xsl:for-each>
					<xsl:for-each select="./CMME">
						<arco-lite:hasSponsor>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasSponsor>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:if test="not(record/metadata/schede/A/UT or record/metadata/schede/PG/UT)">
					<xsl:for-each select="record/metadata/schede/*/UT">
						<xsl:if test="./UTA and (not(starts-with(lower-case(normalize-space(./UTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./UTA)), 'n.r')))">
							<arco-cd:isKeptIn>
								<xsl:value-of select="normalize-space(./UTA)" />
							</arco-cd:isKeptIn>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AU/CMM/CMMN">
					<arco-lite:hasCommittent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:hasCommittent>
				</xsl:for-each>
				<!-- edition -->
				<xsl:for-each select="record/metadata/schede/*/AU/EDT">
					<xsl:if test="$sheetType='OAC' or $sheetType='S' or $sheetType='MI'">
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
						<xsl:if test="./EDTN and (not(starts-with(lower-case(normalize-space(./EDTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./EDTN)), 'n.r')))">
							<arco-lite:hasEditor>
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./EDTN))" />
							</arco-lite:hasEditor>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/PD/EDI">
					<arco-cd:hasEdition>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDIT)))" />
						</xsl:attribute>
					</arco-cd:hasEdition>
					<xsl:if test="./EDIR and (not(starts-with(lower-case(normalize-space(./EDIR)), 'nr')) and not(starts-with(lower-case(normalize-space(./EDIR)), 'n.r')))">
						<arco-lite:hasEditor>
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./EDIR))" />
						</arco-lite:hasEditor>
					</xsl:if>
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
						<xsl:if test="./DTR">
							<arco-lite:hasRealizationDate>
								<xsl:attribute name="rdf:resource">
            	                    <xsl:choose>
         		                       <xsl:when test="./DTG">
                	    	                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTR)), '-',  arco-fn:urify(normalize-space(./DTG)))" />
                    	    	        </xsl:when>
                                		<xsl:otherwise>
		                                    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTR)))" />
        		                        </xsl:otherwise>
                		            </xsl:choose>
    	                        </xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DT/ADT">
					<xsl:choose>
						<xsl:when test="./* and (not(./DTP) or ./DTP='intero bene' or ./DTP='carattere generale' or ./DTP='integrale' or ./DTP='tutta' or ./DTP='totale') or (starts-with(lower-case(normalize-space(./DTP)), 'nr')) or (starts-with(lower-case(normalize-space(./DTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./DTP)), 'intero')) or (starts-with(lower-case(normalize-space(./DTP)), 'intera')) or (starts-with(lower-case(normalize-space(./DTP)), 'esemplar'))">
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AlternativeDating/', $itemURI, '-', position())" />
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
                                    <xsl:when test="lower-case(normalize-space(.))='demoetnoantropologico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/EthnoAnthropologicalScope'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(.))='storico artistico'">
                                        <xsl:value-of select="'https://w3id.org/arco/ontology/arco/HistoricalArtisticScope'" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-arco:hasMibacScopeOfProtection>
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
									<xsl:when test="contains(normalize-space(lower-case(./RSTI)), 'restaur') or contains(normalize-space(lower-case(./RSTI)), 'conservativi') or contains(normalize-space(lower-case(./RSTI)), 'conservative') or contains(normalize-space(lower-case(./RSTI)), 'conservativa') or contains(normalize-space(lower-case(./RSTI)), 'conservativo') or contains(normalize-space(lower-case(./RSTI)), 'consolidamento') or contains(normalize-space(lower-case(./RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(./RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(./RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(./RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(./RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(./RSTI)), 'protezione finale') or contains(normalize-space(lower-case(./RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(./RSTI)), 'trattamento parti metalliche')">
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
				<xsl:for-each select="record/metadata/schede/VeAC/CO/RIA">
					<xsl:choose>
						<xsl:when test="not(./RIAP) or (starts-with(lower-case(normalize-space(./RIAP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./RIAP)), 'nr')) or (starts-with(lower-case(normalize-space(./RIAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./RIAP)), 'intero')) or (starts-with(lower-case(normalize-space(./RIAP)), 'intera'))">
							<arco-cd:hasIntervention>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, 'intervention-ria-', position())" />
								</xsl:attribute>
							</arco-cd:hasIntervention>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-', arco-fn:urify(normalize-space(./RIAP)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>	
					</xsl:choose>
				</xsl:for-each>
				<!-- other cultural property records -->
				<xsl:for-each select="record/metadata/schede/*/AC/ACS">
					<xsl:if test="./*">
						<arco-catalogue:isDescribedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'CulturalPropertyRecord/', $itemURI, '-', position())" />
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
							<xsl:when test="./* and (not(./STCP) or ./STCP='intero bene' or ./STCP='integrale' or ./STCP='tutta' or ./STCP='totale') or (starts-with(lower-case(normalize-space(./STCP)), 'nr')) or (starts-with(lower-case(normalize-space(./STCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./STCP)), 'intero')) or (starts-with(lower-case(normalize-space(./STCP)), 'intera')) or (starts-with(lower-case(normalize-space(./STCP)), 'esemplar'))">
								<arco-dd:hasConservationStatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
		                        	</xsl:attribute>
								</arco-dd:hasConservationStatus>
								<arco-lite:hasConservationStatusType>
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
								</arco-lite:hasConservationStatusType>
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
							<arco-lite:hasConservationStatusType>
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
							</arco-lite:hasConservationStatusType>
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
					<arco-cd:proposedIntervention>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/CO/STP)" />
					</arco-cd:proposedIntervention>
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
				<xsl:if test="record/metadata/schede/DSC/DS/NSC">
					<arco-cd:historicalInformation>
						<xsl:value-of select="normalize-space(record/metadata/schede/DSC/DS/NSC)" />
					</arco-cd:historicalInformation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/RCG/RG/NSC">
					<arco-cd:historicalInformation>
						<xsl:value-of select="normalize-space(record/metadata/schede/RCG/RG/NSC)" />
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
				<xsl:if test="lower-case(normalize-space(record/metadata/schede/SCAN/MT/INT))='bene di interesse culturale dichiarato'">
					<arco-arco:culturalInterestDeclaration>
						<xsl:value-of select="true()" />
					</arco-arco:culturalInterestDeclaration>
				</xsl:if>
				<!-- functional purpose for MA and CA -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTF and ($sheetType='CA' or $sheetType='MA')">
					<arco-cd:hasFunctionalPurpose>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)))" />
						</xsl:attribute>
					</arco-cd:hasFunctionalPurpose>
				</xsl:if>
				<!-- heritage protection agency -->
				<xsl:choose>
					<xsl:when test="record/metadata/schede/harvesting/enteCompetente">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agent')" />
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
										<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agent')" />
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
								<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
							</xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-lite:hasCataloguingAgency>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasCataloguingAgency>
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
						<arco-lite:hasProponentAgent>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
							</xsl:attribute>
						</arco-lite:hasProponentAgent>
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
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space()))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/CT/CTG">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/CT/CTG)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/RA/OG/CLS">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/RA/OG/CLS)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MA/OG/OGT/OGTC">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/MA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/CA/OG/OGT/OGTC">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/CA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTC">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGT/OGTP">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of select="concat($NS,'CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGT/OGTP)))" />
	                    </xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/BDM/OG/OGT">
					<xsl:if test="./OGTG">
						<arco-core:hasCategory>
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
						</arco-core:hasCategory>
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
				<xsl:for-each select="record/metadata/schede/*/CD/OGM"><!-- allow multiple values es: ICCD13661286 -->
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
				<xsl:if test="record/metadata/schede/PST/OG/OGT/OGTA">
					<arco-dd:hasAccessory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Accessory/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/PST/OG/OGT/OGTA)))" />
						</xsl:attribute>
					</arco-dd:hasAccessory>
				</xsl:if>
				<!-- Acquisition of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ACQ">
					<xsl:choose>
						<xsl:when test="not(./ACQP) or (starts-with(lower-case(normalize-space(./ACQP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./ACQP)), 'nr')) or (starts-with(lower-case(normalize-space(./ACQP)), 'n.r')) or (starts-with(lower-case(normalize-space(./ACQP)), 'intero')) or (starts-with(lower-case(normalize-space(./ACQP)), 'intera'))">
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
									<arco-cd:hasLegalSituation>
										<xsl:attribute name="rdf:resource">
			                				<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', position())" />
		            			    	</xsl:attribute>
									</arco-cd:hasLegalSituation>
									<arco-lite:hasPreviousOwner>
										<xsl:attribute name="rdf:resource">
						           			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						           		</xsl:attribute>
									</arco-lite:hasPreviousOwner>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-', arco-fn:urify(normalize-space(./ACQP)))" />
								</xsl:attribute>
							</arco-core:hasPart>
						</xsl:otherwise>	
					</xsl:choose>
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
					<xsl:if test="contains((./FTAX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
	        	        		<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	    	            	</xsl:attribute>
						</arco-cd:hasAttachedDocumentation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/FTE">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/DCM">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="contains((./DCMP), 'documentazione fotografica')">
									<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-documentation-', position())" />
								</xsl:when>
								<xsl:when test="contains((./DCMP), 'documentazione grafica')">
	                				<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-documentation-', position())" />
								</xsl:when>
								<xsl:when test="contains((./DCMP), 'documentazione audio')">
	                				<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-documentation-', position())" />
								</xsl:when>
								<xsl:when test="contains((./DCMP), 'documentazione video')">
	                				<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-documentation-', position())" />
								</xsl:when>
								<xsl:otherwise>
	                				<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', position())" />
								</xsl:otherwise>
							</xsl:choose>
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
					<xsl:if test="contains((./DRAX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
	                		</xsl:attribute>
						</arco-cd:hasAttachedDocumentation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AL/ALG">
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
					<xsl:if test="contains((./VDCX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
	                		</xsl:attribute>
	                	</arco-cd:hasAttachedDocumentation>
	                </xsl:if>
				</xsl:for-each>
				<!-- Audio Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/REG">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
					<xsl:if test="contains((./REGX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
	                		</xsl:attribute>
	                	</arco-cd:hasAttachedDocumentation>
	                </xsl:if>
				</xsl:for-each>
				<!-- Sources and Documents of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/FNT">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
					<xsl:if test="contains((./FNTX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
							</xsl:attribute>
						</arco-cd:hasAttachedDocumentation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/ADM">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'MultimediaDocumentation/', $itemURI, '-multimedia-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
					<xsl:if test="contains((./ADMX), 'allegat')">
						<arco-cd:hasAttachedDocumentation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'MultimediaDocumentation/', $itemURI, '-multimedia-documentation-', position())" />
							</xsl:attribute>
						</arco-cd:hasAttachedDocumentation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/CTF">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AL/DVA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'Documentation/', $itemURI, '-documentation-', position())" />
	                	</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/BIB">
					<xsl:variable name="edition">
						<xsl:choose>
							<xsl:when test="./NCUN">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./NCUN)))" />
							</xsl:when>
							<xsl:when test="./NUCN">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./NUCN)))" />
							</xsl:when>
							<xsl:when test="./BIBK">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./BIBK)))" />
							</xsl:when>
							<xsl:when test="./BIBM">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./BIBM)))" />
							</xsl:when>
							<xsl:when test="./BIBH">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:urify(normalize-space(./BIBH)), 'local')" />
							</xsl:when>
							<xsl:when test="./BIBA and ./BIBD">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:arcofy(normalize-space(./BIBA)), arco-fn:arcofy(normalize-space(./BIBD)))" />
							</xsl:when>
	                	</xsl:choose>
					</xsl:variable>
					<arco-cd:hasBibliographicSource>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$edition" />
	                	</xsl:attribute>
					</arco-cd:hasBibliographicSource>
					<xsl:choose>
						<xsl:when test="./BIBM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<arco-lite:bibliographicReference>
								<xsl:value-of select="normalize-space()" />
							</arco-lite:bibliographicReference>      
						</xsl:when>
						<xsl:when test="./BIL[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<arco-lite:bibliographicReference>
								<xsl:value-of select="normalize-space()" />
							</arco-lite:bibliographicReference>      
						</xsl:when>
						<xsl:when test="./BIBA and ./BIBD">
							<arco-lite:bibliographicReference>
								<xsl:value-of select="concat(normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
							</arco-lite:bibliographicReference>
						</xsl:when>
					</xsl:choose>
					<xsl:if test="contains(normalize-space(lower-case(./BIBX)), 'specifica')">
						<arco-cd:hasSpecificBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasSpecificBibliographicSource>
						<xsl:choose>
							<xsl:when test="./BIBM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<arco-lite:specificBibliographicReference>
									<xsl:value-of select="normalize-space()" />
								</arco-lite:specificBibliographicReference>      
							</xsl:when>
							<xsl:when test="./BIBA and ./BIBD">
								<arco-lite:specificBibliographicReference>
									<xsl:value-of select="concat(normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
								</arco-lite:specificBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="contains(normalize-space(lower-case(./BIBX)), 'corredo') or contains(normalize-space(lower-case(./BIBX)), 'contesto')">
						<arco-cd:hasContextBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasContextBibliographicSource>
						<xsl:choose>
							<xsl:when test="./BIBM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<arco-lite:contextBibliographicReference>
									<xsl:value-of select="normalize-space()" />
								</arco-lite:contextBibliographicReference>      
							</xsl:when>
							<xsl:when test="./BIBA and ./BIBD">
								<arco-lite:contextBibliographicReference>
									<xsl:value-of select="concat(normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
								</arco-lite:contextBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="contains(normalize-space(lower-case(./BIBX)), 'confront')">
						<arco-cd:hasComparativeBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasComparativeBibliographicSource>
						<xsl:choose>
							<xsl:when test="./BIBM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<arco-lite:comparativeBibliographicReference>
									<xsl:value-of select="normalize-space()" />
								</arco-lite:comparativeBibliographicReference>     
							</xsl:when>
							<xsl:when test="./BIBA and ./BIBD">
								<arco-lite:comparativeBibliographicReference>
									<xsl:value-of select="concat(normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
								</arco-lite:comparativeBibliographicReference>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/DO/BSE">
					<xsl:if test="./BSET">
					<xsl:variable name="edition">
						<xsl:choose>
							<xsl:when test="./BSEA and ./BSED">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:arcofy(normalize-space(./BSET)), arco-fn:arcofy(normalize-space(./BSEA)), arco-fn:arcofy(normalize-space(./BSED)))" />
							</xsl:when>
							<xsl:when test="./BSED">
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:arcofy(normalize-space(./BSET)), arco-fn:arcofy(normalize-space(./BSED)))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($NS, 'Edition/', arco-fn:arcofy(normalize-space(./BSET)))" />
							</xsl:otherwise>
	                	</xsl:choose>
					</xsl:variable>
					<arco-cd:hasBibliographicSource>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$edition" />
	                	</xsl:attribute>
					</arco-cd:hasBibliographicSource>
					<arco-lite:bibliographicReference>
						<xsl:choose>
							<xsl:when test="./BSEA and ./BSED">
								<xsl:value-of select="concat(normalize-space(./BSEA), ', ', normalize-space(./BSET), '. ', normalize-space(./BSED))" />
							</xsl:when>
							<xsl:when test="./BSED">
								<xsl:value-of select="concat(normalize-space(./BSET), '. ', normalize-space(./BSED))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(./BSET)" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-lite:bibliographicReference>
					<xsl:if test="contains(normalize-space(lower-case(./BSEX)), 'specifica')">
						<arco-cd:hasSpecificBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasSpecificBibliographicSource>
						<arco-lite:specificBibliographicReference>
							<xsl:choose>
								<xsl:when test="./BSEA and ./BSED">
									<xsl:value-of select="concat(normalize-space(./BSEA), ', ', normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:when test="./BSED">
									<xsl:value-of select="concat(normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./BSET)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:specificBibliographicReference>
					</xsl:if>
					<xsl:if test="contains(normalize-space(lower-case(./BSEX)), 'corredo') or contains(normalize-space(lower-case(./BSEX)), 'contesto')">
						<arco-cd:hasContextBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasContextBibliographicSource>
						<arco-lite:contextBibliographicReference>
							<xsl:choose>
								<xsl:when test="./BSEA and ./BSED">
									<xsl:value-of select="concat(normalize-space(./BSEA), ', ', normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:when test="./BSED">
									<xsl:value-of select="concat(normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./BSET)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:contextBibliographicReference>
					</xsl:if>
					<xsl:if test="contains(normalize-space(lower-case(./BSEX)), 'confront')">
						<arco-cd:hasComparativeBibliographicSource>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$edition" />
	        	        	</xsl:attribute>
						</arco-cd:hasComparativeBibliographicSource>
						<arco-lite:comparativeBibliographicReference>
							<xsl:choose>
								<xsl:when test="./BSEA and ./BSED">
									<xsl:value-of select="concat(normalize-space(./BSEA), ', ', normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:when test="./BSED">
									<xsl:value-of select="concat(normalize-space(./BSET), '. ', normalize-space(./BSED))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./BSET)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-lite:comparativeBibliographicReference>
					</xsl:if>
				</xsl:if>
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
									<arco-lite:hasCulturalPropertySubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(./SGTI))" />
	  				                  	</xsl:attribute>
									</arco-lite:hasCulturalPropertySubject>
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(./SGTI))" />
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
									<arco-lite:hasCulturalPropertySubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(./SGTI))" />
	  				                  	</xsl:attribute>
									</arco-lite:hasCulturalPropertySubject>
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
	                    					<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(./SGTI))" />
	  				                  	</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
								<arco-lite:hasCulturalPropertySubject>
									<xsl:attribute name="rdf:resource">
	                    				<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(./SGTI))" />
	  								</xsl:attribute>
								</arco-lite:hasCulturalPropertySubject>
								<arco-cd:hasSubject>
									<xsl:attribute name="rdf:resource">
	  									<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(./SGTI))" />
	  				        	  	</xsl:attribute>
								</arco-cd:hasSubject>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/*/THS">
					<xsl:if test="record/metadata/schede/*/*/THS/THSD">
						<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<arco-lite:hasCulturalPropertySubject>
									<xsl:attribute name="rdf:resource">
	                    				<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(./THSD))" />
	  								</xsl:attribute>
								</arco-lite:hasCulturalPropertySubject>
							<arco-cd:hasSubject>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(./THSD))" />
	            	        	</xsl:attribute>
							</arco-cd:hasSubject>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/NU/DA/DES/DESU">
					<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-lite:hasCulturalPropertySubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of select="concat($NS, 'Concept/', arco-fn:arcofy(.))" />
	  						</xsl:attribute>
						</arco-lite:hasCulturalPropertySubject>
						<arco-cd:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of select="concat($NS, 'Subject/', $itemURI, arco-fn:arcofy(.))" />
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
						<arco-lite:title>
							<xsl:value-of select="normalize-space(.)" />
						</arco-lite:title>
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
								<arco-lite:properTitle>
									<xsl:value-of select="normalize-space(.)" />
								</arco-lite:properTitle>
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
							<arco-lite:properTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-lite:properTitle>
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
							<arco-lite:attributedTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-lite:attributedTitle>
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
						<arco-lite:parallelTitle>
							<xsl:value-of select="normalize-space(.)" />
						</arco-lite:parallelTitle>
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
							<arco-lite:parallelTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-lite:parallelTitle>
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
							<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-counterstamp-', position())" />
						</xsl:attribute>
					</arco-dd:hasAffixedElement>
				</xsl:for-each>
				<!-- cultural property cataloguing category -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTV">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyCataloguingCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)))" />
						</xsl:attribute>
					</arco-core:hasCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/OG/OGV">
					<arco-core:hasCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'CulturalPropertyCataloguingCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGV)))" />
						</xsl:attribute>
					</arco-core:hasCategory>
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
						<arco-lite:isReusedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWork/', $itemURI, '-reuse-', position())" />
							</xsl:attribute>
						</arco-lite:isReusedBy>
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-reuse-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RO/REI">
					<xsl:choose>
						<xsl:when test="./* and (not(./REIP) or ./REIP='intero bene' or ./REIP='integrale' or ./REIP='tutta' or ./REIP='totale') or (starts-with(lower-case(normalize-space(./REIP)), 'nr')) or (starts-with(lower-case(normalize-space(./REIP)), 'n.r')) or (starts-with(lower-case(normalize-space(./REIP)), 'intero')) or (starts-with(lower-case(normalize-space(./REIP)), 'intera')) or (starts-with(lower-case(normalize-space(./REIP)), 'esemplar'))">
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-reuse-', position())" />
								</xsl:attribute>
							</arco-cd:hasUse>
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
					<arco-cd:hasUse>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-reuse-', position())" />
						</xsl:attribute>
					</arco-cd:hasUse>
				</xsl:for-each>
				<!-- relation with a particular type of derivated work: print in publication  (S) -->
				<xsl:if test="record/metadata/schede/*/RO/ADL">
					<xsl:for-each select="record/metadata/schede/*/RO/ADL">
					<xsl:variable name="adla" select="./ADLA" />
					<xsl:variable name="adlt" select="./ADLT" />
					<xsl:variable name="adle" select="./ADLE" />
						<arco-lite:isPrintIncludedIn>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'BibliographicWork/', arco-fn:urify($adla), arco-fn:urify($adlt), arco-fn:urify($adle))" />
							</xsl:attribute>
						</arco-lite:isPrintIncludedIn>
					</xsl:for-each>
				</xsl:if>
				<!-- name in time -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
					<arco-cd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />                      	                            
                        </xsl:attribute>
					</arco-cd:hasDesignationInTime>
					<arco-lite:currentDesignation>
						<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)" />
					</arco-lite:currentDesignation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTS">
					<arco-cd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTS)))" />                      	                            
                        </xsl:attribute>
					</arco-cd:hasDesignationInTime>
					<arco-lite:historicalDesignation>
						<xsl:value-of select="normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTS)" />
					</arco-lite:historicalDesignation>
				</xsl:if>
				<xsl:if test="not($sheetType='MODI') and not($sheetType='SCAN')">
					<xsl:for-each select="record/metadata/schede/*/OG/OGD">
						<arco-cd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
                	       		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                    	   	</xsl:attribute>
						</arco-cd:hasDesignationInTime>
						<xsl:if test="contains(normalize-space(lower-case(./OGDT)), 'attuale') or contains(normalize-space(lower-case(./OGDT)), 'corrente')">
							<arco-lite:currentDesignation>
								<xsl:value-of select="normalize-space(./OGDN)" />
							</arco-lite:currentDesignation>
						</xsl:if>
					</xsl:for-each> 
				</xsl:if>
				<xsl:if test="($sheetType='MODI') or ($sheetType='SCAN')">
					<xsl:for-each select="record/metadata/schede/*/OG/OGN">
						<arco-cd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
            	            	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
                	        </xsl:attribute>
						</arco-cd:hasDesignationInTime>
						<arco-lite:currentDesignation>
							<xsl:value-of select="normalize-space(.)" />
						</arco-lite:currentDesignation>
					</xsl:for-each>
				</xsl:if>
		 		<xsl:for-each select="record/metadata/schede/*/OG/OGA">
					<arco-cd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(string-join(./OGAD,'-'))))" />                      	                            
                        </xsl:attribute>
					</arco-cd:hasDesignationInTime>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTN">
					<arco-cd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />   	                            
                        </xsl:attribute>
					</arco-cd:hasDesignationInTime>
					<arco-lite:currentDesignation>
						<xsl:value-of select="normalize-space(./OGTN)" />
					</arco-lite:currentDesignation>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/OG/OGT/OGTU">
					<xsl:if test="not($sheetType='FF')">
						<arco-cd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
        	                	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />                      	                            
            	            </xsl:attribute>
						</arco-cd:hasDesignationInTime>
						<arco-lite:historicalDesignation>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTU)" />
						</arco-lite:historicalDesignation>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTY">
					<arco-cd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/SI/OG/OGT/OGTY)))" />                      	                            
                        </xsl:attribute>
					</arco-cd:hasDesignationInTime>
					<arco-lite:historicalDesignation>
						<xsl:value-of select="normalize-space(record/metadata/schede/SI/OG/OGT/OGTY)" />
					</arco-lite:historicalDesignation>
				</xsl:if>
				<xsl:if test="($sheetType='A' or $sheetType='PG') and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
					<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD">
						<arco-cd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
                        		<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)))" />   	                            
                        	</xsl:attribute>
						</arco-cd:hasDesignationInTime>
						<arco-lite:currentDesignation>
							<xsl:value-of select="normalize-space(./OGTD)" />
						</arco-lite:currentDesignation>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTE">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario')">
							<arco-cd:hasDesignationInTime>
								<xsl:attribute name="rdf:resource">
                        			<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTE)))" />   	                            
                        		</xsl:attribute>
							</arco-cd:hasDesignationInTime>
						</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTC">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione')">
							<arco-cd:hasDesignationInTime>
								<xsl:attribute name="rdf:resource">
                        			<xsl:value-of select="concat($NS,'DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTC)))" />   	                            
                        		</xsl:attribute>
							</arco-cd:hasDesignationInTime>
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
						<arco-core:hasClassificationInTime>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PhotographicHeritageClassification/', $itemURI, '-alternative-classification-', position())" />
							</xsl:attribute>
						</arco-core:hasClassificationInTime>
					</xsl:for-each>
				</xsl:if>
				<!-- cultural property classification based on inventory -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTS and not($sheetType='NU' or $sheetType='VeAC' or $sheetType='F' or $sheetType='BNB')">
					<arco-cd:hasReferenceCatalogue>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTS)))" />
						</xsl:attribute>
					</arco-cd:hasReferenceCatalogue>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MODI/OG/OGS">
					<arco-cd:hasReferenceCatalogue>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGS)))" />
						</xsl:attribute>
					</arco-cd:hasReferenceCatalogue>
				</xsl:if>
				<!-- reference catalogue -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTT">
					<arco-cd:hasReferenceCatalogue>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ReferenceCatalogue/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)))" />
						</xsl:attribute>
					</arco-cd:hasReferenceCatalogue>
				</xsl:if>
				<!-- numismatic property specification -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTS">
					<arco-core:specifications>
						<xsl:value-of select="normalize-space(record/metadata/schede/NU/OG/OGT/OGTS)" />
					</arco-core:specifications>
				</xsl:if>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/TU/CPR">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Copyright/', $itemURI, '-copyright-', position())" />
						</xsl:attribute>
					</arco-cd:hasCopyright>
					<xsl:if test="./CPRN">
						<arco-lite:hasRightsHolder>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CPRN))" />
							</xsl:attribute>
						</arco-lite:hasRightsHolder>
					</xsl:if>
				</xsl:for-each>
				<!-- dedication (DA/DDC) -->
				<xsl:if test="record/metadata/schede/*/AU/DDC/*">
					<xsl:for-each select="record/metadata/schede/*/AU/DDC">
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-dedication-', position())" />
							</xsl:attribute>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- inscription (DA/ISR) -->
				<xsl:for-each select="record/metadata/schede/*/DA/ISR">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="./* and (not(./ISRY) or ./ISRY='intero bene' or ./ISRY='integrale' or ./ISRY='tutta' or ./ISRY='totale' or (starts-with(lower-case(normalize-space(./ISRY)), 'nr')) or (starts-with(lower-case(normalize-space(./ISRY)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISRY)), 'intero')) or (starts-with(lower-case(normalize-space(./ISRY)), 'intera')) or (starts-with(lower-case(normalize-space(./ISRY)), 'esemplar')))">
								<arco-dd:hasAffixedElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-inscription-', position())" />
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
				<!-- quarry mark -->
				<xsl:for-each select="record/metadata/schede/*/DA/MNC">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="./* and (not(./MNCP) or ./MNCP='intero bene' or ./MNCP='integrale' or ./MNCP='tutta' or ./MNCP='totale' or (starts-with(lower-case(normalize-space(./MNCP)), 'nr')) or (starts-with(lower-case(normalize-space(./MNCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MNCP)), 'intero')) or (starts-with(lower-case(normalize-space(./MNCP)), 'intera')) or (starts-with(lower-case(normalize-space(./MNCP)), 'esemplar'))) and (not(./ISRP) or ./ISRP='intero bene' or ./ISRP='integrale' or ./ISRP='tutta' or ./ISRP='totale' or (starts-with(lower-case(normalize-space(./ISRP)), 'nr')) or (starts-with(lower-case(normalize-space(./ISRP)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISRP)), 'intero')) or (starts-with(lower-case(normalize-space(./ISRP)), 'intera')) or (starts-with(lower-case(normalize-space(./ISRP)), 'esemplar')))">
								<arco-dd:hasAffixedElement>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-quarry-or-masonry-mark-', position())" />
									</xsl:attribute>
								</arco-dd:hasAffixedElement>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
					               		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				    	           	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
				<!-- affixed element -->
				<xsl:for-each select="record/metadata/schede/*/DA/STM">
					<xsl:if test="./*">
						<xsl:choose>
							<xsl:when test="./* and (not(./STMY) or ./STMY='intero bene' or ./STMY='integrale' or ./STMY='tutta' or ./STMY='totale' or (starts-with(lower-case(normalize-space(./STMY)), 'nr')) or (starts-with(lower-case(normalize-space(./STMY)), 'n.r')) or (starts-with(lower-case(normalize-space(./STMY)), 'intero')) or (starts-with(lower-case(normalize-space(./STMY)), 'intera')) or (starts-with(lower-case(normalize-space(./STMY)), 'esemplar')))">
								<arco-dd:hasAffixedElement>
									<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
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
						<xsl:choose>	
							<xsl:when test="not(./LSIU) or ./LSIU='intero bene' or ./LSIU='integrale' or ./LSIU='tutta' or ./LSIU='totale' or ./LSIU='carattere generale' or (starts-with(lower-case(normalize-space(./LSIU)), 'nr')) or (starts-with(lower-case(normalize-space(./LSIU)), 'n.r')) or (starts-with(lower-case(normalize-space(./LSIU)), 'intero')) or (starts-with(lower-case(normalize-space(./LSIU)), 'intera')) or (starts-with(lower-case(normalize-space(./LSIU)), 'esemplar'))">
								<arco-dd:hasAffixedElement>
									<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
								</arco-dd:hasAffixedElement>
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./LSIU)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/DA/ISE">
					<xsl:choose>
						<xsl:when test="./* and (not(./ISER) or ./ISER='intero bene' or ./ISER='integrale' or ./ISER='tutta' or ./ISER='totale') or (starts-with(lower-case(normalize-space(./ISER)), 'nr')) or (starts-with(lower-case(normalize-space(./ISER)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISER)), 'intero')) or (starts-with(lower-case(normalize-space(./ISER)), 'intera')) or (starts-with(lower-case(normalize-space(./ISER)), 'esemplar'))">
							<arco-dd:hasAffixedElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
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
							<xsl:value-of select="concat($NS, 'Sample/', $itemURI, '-', arco-fn:urify(normalize-space(./CMND)))" />
						</xsl:attribute>
					</arco-dd:hasSampleCollected>
				</xsl:for-each>
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
						<xsl:for-each select="./UTN">
							<arco-lite:hasUser>
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
							</arco-lite:hasUser>
						</xsl:for-each>
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
	                		<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
 	                	</xsl:attribute>
					</arco-cd:hasUse>
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
								<arco-lite:hasCulturalEntityUseFunction>
									<xsl:attribute name="rdf:resource">
				        				<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(./USAD))" />
									</xsl:attribute>
								</arco-lite:hasCulturalEntityUseFunction>
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
	            		    					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                						</xsl:attribute>
										</arco-dd:hasTechnicalStatus>
										<arco-lite:hasMaterial>
											<xsl:attribute name="rdf:resource">
            									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCM)))" />
            								</xsl:attribute>
										</arco-lite:hasMaterial>
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
					<!-- material of cultural property (PST) -->
					<xsl:for-each select="record/metadata/schede/*/MT/MTW">
						<xsl:choose>
							<xsl:when test="(not(./MTWP) or ./MTWP='intero bene' or ./MTWP='integrale' or ./MTWP='tutta' or ./MTWP='totale') or (starts-with(lower-case(normalize-space(./MTWP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTWP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTWP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTWP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTWP)), 'esemplar'))">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
	            						<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	               					</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<xsl:for-each select="./MTWC">
									<arco-lite:hasMaterial>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
            							</xsl:attribute>
									</arco-lite:hasMaterial>
								</xsl:for-each>	
							</xsl:when>
							<xsl:otherwise>
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			        		    		<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTWP)))" />
			                		</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>	
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
				                					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
			 	                				</xsl:attribute>
											</arco-dd:hasTechnicalStatus>
											<xsl:for-each select="./MTCT"><!-- allow multiple values es: ICCD13661286 -->
												<arco-lite:hasTechnique>
													<xsl:attribute name="rdf:resource">
				            							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
				            						</xsl:attribute>
												</arco-lite:hasTechnique>
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
			                					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
		 	                				</xsl:attribute>
										</arco-dd:hasTechnicalStatus>
										<xsl:for-each select="./MTCI"><!-- allow multiple values es: ICCD11324966 -->
											<arco-lite:hasMaterialOrTechnique>
												<xsl:attribute name="rdf:resource">
			            							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
			            						</xsl:attribute>
											</arco-lite:hasMaterialOrTechnique>
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
		                					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	    	            				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasMaterial>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCF)))" />
            							</xsl:attribute>
									</arco-lite:hasMaterial>
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
	        	        					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	            	    				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasTechnique>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCT)))" />
            							</xsl:attribute>
									</arco-lite:hasTechnique>
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
	        	        					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	            	    				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasColour>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCC)))" />
            							</xsl:attribute>
									</arco-lite:hasColour>
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
	    	            					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	        	        				</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasGarmentAnalysis>
										<xsl:attribute name="rdf:resource">
            								<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCA)))" />
            							</xsl:attribute>
									</arco-lite:hasGarmentAnalysis>
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
 	                			<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-lite:hasMaterialOrTechnique>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
		            		</xsl:attribute>
						</arco-lite:hasMaterialOrTechnique>
					</xsl:if>
				</xsl:for-each>
				<!-- technical status - shape of cultural property -->
				<xsl:if test="record/metadata/schede/*/MT/FRM and not(record/metadata/schede/F/MT/FRM)">
					<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'n.r'))">
						<xsl:if test="record/metadata/schede/*/MT/FRM">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
 	                				<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                			</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-lite:hasShape>
								<xsl:attribute name="rdf:resource">
		 	                		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FRM)))" />
		            			</xsl:attribute>
							</arco-lite:hasShape>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<!-- technical status - filigree of cultural property -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'n.r'))">
					<xsl:if test="record/metadata/schede/*/MT/FIL">
						<arco-dd:hasFiligree>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of select="concat($NS, 'Filigree/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FIL)))" />
		            		</xsl:attribute>
						</arco-dd:hasFiligree>
					</xsl:if>
				</xsl:if>
				<!-- technical status - file format of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCF">
						<arco-dd:hasFormat>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)))" />
 	                		</xsl:attribute>
						</arco-dd:hasFormat>
					</xsl:if>
				</xsl:if>
				<!-- technical status - photo size of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FRM">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-lite:hasPhotoSize>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FRM)))" />
            				</xsl:attribute>
						</arco-lite:hasPhotoSize>
					</xsl:if>
				</xsl:if>
				<!-- technical status -  photo program of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCP">
						<arco-dd:usesSoftware>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Software/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)))" />
            				</xsl:attribute>
						</arco-dd:usesSoftware>
					</xsl:if>
				</xsl:if>
				<!-- technical status - storage method and colour depth of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCC">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-lite:hasStorageMethodOrColourDepth>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)))" />
            				</xsl:attribute>
						</arco-lite:hasStorageMethodOrColourDepth>
					</xsl:if>
				</xsl:if>
				<!-- resolution of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCU">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasMeasurementCollection>
						<arco-lite:hasResolution>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-resolution')" />
            				</xsl:attribute>
						</arco-lite:hasResolution>
					</xsl:if>
				</xsl:if>
				<!-- pixel dimension of photograph (F) -->
				<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCM">
						<arco-dd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
 	                			<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
 	                		</xsl:attribute>
						</arco-dd:hasMeasurementCollection>
						<arco-lite:hasPixelDimension>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-', position(), '-pixel-dimension')" />
            				</xsl:attribute>
						</arco-lite:hasPixelDimension>
					</xsl:if>
				</xsl:if>
				<!-- technical status - mass storage of photograph (F) -->
				<xsl:if test="record/metadata/schede/F/MT/FVM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'n.r')))">>
					<arco-cd:hasStorageMedium>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'StorageMedium/', $itemURI)" />
            			</xsl:attribute>
					</arco-cd:hasStorageMedium>
				</xsl:if>
				<!-- technical status - colour of photograph (F) -->
				<xsl:if test="record/metadata/schede/F/MT/MTX and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-lite:hasPhotoColour>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/MTX)))" />
            			</xsl:attribute>
					</arco-lite:hasPhotoColour>
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
                			<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/TU/CDG)))" />
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
				<xsl:for-each select="record/metadata/schede/*/CO/STC">
					<xsl:if test="./STCT and not($sheetType='BNB' or $sheetType='BNP' or $sheetType='BNZ')">
						<arco-cd:isKeptIn>
							<xsl:value-of select="normalize-space(./STCT)" />
						</arco-cd:isKeptIn>
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
					<xsl:if test="./STUN and (not(starts-with(lower-case(normalize-space(./STUN)), 'nr')) and not(starts-with(lower-case(normalize-space(./STUN)), 'n.r')))">
						<arco-lite:hasEligibleIntervention>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'InterventionType/', arco-fn:urify(normalize-space(./STUN)))" />
							</xsl:attribute>
						</arco-lite:hasEligibleIntervention>
					</xsl:if>
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
				<xsl:if test="not($sheetType='RCG')" >
				<xsl:if test="not(record/metadata/schede/*/RE/RCG/RCGD='0000/00/00' or record/metadata/schede/*/RE/RCG/RCGD='/') and record/metadata/schede/*/RE/RCG/*">
					<xsl:for-each select="record/metadata/schede/*/RE/RCG">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'ArchaeologicalFieldSurvey/', $itemURI, '-survey-', position())" />
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
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
										<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./INDP)))" />
									</xsl:attribute>
								</arco-core:hasPart>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<!-- Archaeological excavation of cultural property -->
				<xsl:if test="not($sheetType='DSC')" >
				<xsl:if test="not(record/metadata/schede/*/*/DSC/DSCD='0000/00/00' or record/metadata/schede/*/*/DSC/DSCD='/') and record/metadata/schede/*/*/DSC/*">
					<xsl:for-each select="record/metadata/schede/*/*/DSC">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:choose>
                					<xsl:when test="record/metadata/schede/DSC/*/*/DSCH">
                						<xsl:value-of select="concat($NS, 'ArchaeologicalExcavation/', arco-fn:urify(record/metadata/schede/DSC/*/*/DSCH))" />
                					</xsl:when>
                					<xsl:otherwise>
                						<xsl:value-of select="concat($NS, 'ArchaeologicalExcavation/', $itemURI, '-survey-', position())" />
                					</xsl:otherwise>
                				</xsl:choose>
                			</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				</xsl:if>
				<!-- Photo interpretation rendering of cultural property -->
				<xsl:if test="record/metadata/schede/*/*/FOI/*">
					<xsl:for-each select="record/metadata/schede/*/*/FOI">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'PhotoInterpretationRendering/', $itemURI, '-survey-', position())" />
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
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/AS/ASS" >
					<xsl:if test="./ASST">
						<arco-dd:hasAccessory>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Accessory/', $itemURI, '-', arco-fn:urify(normalize-space(./ASST)))" />
							</xsl:attribute>
						</arco-dd:hasAccessory>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="$sheetType='CA'" >
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="$sheetType='MA'" >
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
						</xsl:attribute>
					</rdf:type>
				</xsl:if>
				<xsl:if test="$sheetType='SI'" >
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
						</xsl:attribute>
					</rdf:type>
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
							<xsl:when test="$sheetType='DSC'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchaeologicalExcavation'" />
							</xsl:when>
							<xsl:when test="$sheetType='RCG'">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ArchaeologicalFieldSurvey'" />
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
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ArchitecturalOrLandscapeHeritage'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni storici e artistici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/HistoricOrArtisticProperty'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni archeologici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ArchaeologicalProperty'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni demoetnoantopologici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/DemoEthnoAnthropologicalHeritage'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni fotografici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/PhotographicHeritage'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni musicali'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MusicHeritage'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni naturalistici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NaturalHeritage'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni numismatici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NumismaticProperty'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/SET))='beni scientifici e tecnologici'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/arco/ScientificOrTechnologicalHeritage'" />
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
					<xsl:if test="record/metadata/schede/MODI/OG/OGD">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGW">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGW, ' di ', record/metadata/schede/*/OG/OGD, ' ',record/metadata/schede/*/OG/OGT)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD, ' ',record/metadata/schede/*/OG/OGT)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="record/metadata/schede/MINP/OG/OGD">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGW">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGW, ' di ', record/metadata/schede/*/OG/OGD, ' ',record/metadata/schede/*/OG/OGT)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD, ' ',record/metadata/schede/*/OG/OGT)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
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
					<xsl:if test="not($sheetType='BNB')">
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
					</xsl:if>
					<xsl:if test="record/metadata/schede/*/SGT/SGTI">
						<xsl:value-of select="concat(' ', string-join(record/metadata/schede/*/OG/SGT/SGTI,', '))" />
					</xsl:if>
					<xsl:if test="record/metadata/schede/DSC/DS/DSC/DSCV">
						<xsl:value-of select="record/metadata/schede/DSC/DS/DSC/DSCV" />
					</xsl:if>
					<xsl:if test="record/metadata/schede/RCG/RG/RCG/RCGV">
						<xsl:value-of select="record/metadata/schede/RCG/RG/RCG/RCGV" />
					</xsl:if>
				</rdfs:comment>
				<!-- hasCulturalPropertyType -->
				<xsl:if test="not($sheetType='MODI' or $sheetType='SCAN' or $sheetType='MINP')">
					<xsl:for-each select="record/metadata/schede/*/OG/OGT">
						<xsl:if test="./*">
							<xsl:choose>
								<xsl:when test="not($sheetType='BNB') and not($sheetType='NU') and not($sheetType='F' and ($sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')) and not($sheetType='F' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')) and not($sheetType='A' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0')) and not($sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0'))">
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
								<xsl:when test="$sheetType='NU'">
									<arco-dd:hasCulturalPropertyType>
										<xsl:attribute name="rdf:resource">
											<xsl:choose>
												<xsl:when test="./OGTH">
													<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(./OGTD, '-', ./OGTH)))" />
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
				<xsl:if test="$sheetType='SCAN' or $sheetType='MINP'">
					<xsl:if test="record/metadata/schede/*/OG/OGD">
						<arco-dd:hasCulturalPropertyType>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGW">
										<xsl:choose>
											<xsl:when test="record/metadata/schede/*/OG/OGT">
												<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(record/metadata/schede/*/OG/OGW, '-', record/metadata/schede/*/OG/OGD, '-', record/metadata/schede/*/OG/OGT)))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(record/metadata/schede/*/OG/OGW, '-', record/metadata/schede/*/OG/OGD)))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="record/metadata/schede/*/OG/OGT">
												<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(concat(record/metadata/schede/*/OG/OGD, '-', record/metadata/schede/*/OG/OGT)))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:arcofy(record/metadata/schede/*/OG/OGD))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-dd:hasCulturalPropertyType>
					</xsl:if>
				</xsl:if>
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
								<xsl:value-of select="concat($NS, 'ArchivalRecordSet/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/UB/UBF/UBFP)))" />
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
								<xsl:value-of select="concat($NS, 'PhotographicSubSeriesMembership/', $itemURI, position())" />
							</xsl:attribute>
						</arco-cd:isMemberInvolvedIn>
						<arco-lite:isCollectionMemberOf>
							<xsl:choose>
								<xsl:when test="./SSIT">
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PhotographicSubSeries/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(./SSIT)))" />
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PhotographicSubSeries/', $ldcm, '-', $pvcc, '-', position())" />
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
							<xsl:value-of select="concat($NS, 'CollectionMembership/Print', $itemURI)" />
						</xsl:attribute>
					</arco-cd:isMemberInvolvedIn>
					<arco-lite:isCollectionMemberOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PrintCollection/', $ldcm, '-', $pvcc, '-', arco-fn:urify(normalize-space(record/metadata/schede/MI/OG/SGT/SGTS)))" />
						</xsl:attribute>
					</arco-lite:isCollectionMemberOf>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/S/RM/RSM">
					<arco-lite:hasPrintingPlate>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat('https://w3id.org/arco/resource/HistoricOrArtisticProperty/', (.))" />
						</xsl:attribute>
					</arco-lite:hasPrintingPlate>
				</xsl:for-each>
				<!-- scan -->
				<xsl:for-each select="record/metadata/schede/SCAN/BI/RIL/RILA">
					<arco-core:hasAgentRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-main-agent-group', position())" />
						</xsl:attribute>
					</arco-core:hasAgentRole>
					<arco-lite:involvesMainAgent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-lite:involvesMainAgent>
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