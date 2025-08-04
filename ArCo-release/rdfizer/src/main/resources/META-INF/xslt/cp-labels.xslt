<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension" 
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:l0="https://w3id.org/italia/onto/l0/" xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#"
	exclude-result-prefixes="xsl php">

	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />
	<xsl:param name="NS" />

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
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])"></xsl:variable>
				  <!-- variable culturalPropertyComponent -->	
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
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version"></xsl:variable>
	<xsl:variable name="cp-name" select="''"></xsl:variable>
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
			<xsl:when test="$sheetType='MIDF'">
				<xsl:value-of select="concat($NS, 'PhotographicHeritage/', $itemURI)" />
			</xsl:when>
			<xsl:when test="$sheetType='MINP'">
				<xsl:value-of select="concat($NS, 'ArchaeologicalProperty/', $itemURI)" />
			</xsl:when>
			<xsl:when test="$sheetType='MINV'">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/AMB))='storico artistico'">
								<xsl:value-of select="concat($NS, 'HistoricOrArtisticProperty/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/AMB))='archeologico'">
								<xsl:value-of select="concat($NS, 'ArchaeologicalProperty/', $itemURI)" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/AMB))='demoetnoantropologico'">
								<xsl:value-of select="concat($NS, 'DemoEthnoAnthropologicalHeritage/', $itemURI)" />
							</xsl:when>
						</xsl:choose>
					</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>       		
	<!-- variable sgta -->
	<xsl:variable name="sgta">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'n.r')))">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTA)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="sgti"><!-- allow multiple values ? ICCD11389099 ICCD13074440 -->
		<!-- <xsl:value-of select="record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))][1]"/> -->
		<xsl:value-of select="string-join(record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))],', ')"/>
	</xsl:variable>
	<!-- variable aut -->
	<xsl:variable name="author-string">
		<xsl:variable name="aut-string">
			<xsl:if test="record/metadata/schede/*/AU/AUT">
				<xsl:for-each select="record/metadata/schede/*/AU/AUT">
					<xsl:choose>
						<xsl:when test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUTB and (not(starts-with(lower-case(normalize-space(./AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTB)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTB, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTB, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUTN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUTN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="dt-aut-string">
			<xsl:if test="record/metadata/schede/*/DT/AUT">
				<xsl:for-each select="record/metadata/schede/*/DT/AUT">
					<xsl:choose>
						<xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUTN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUTN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="auf-string">
			<xsl:if test="record/metadata/schede/*/AU/AUF">
				<xsl:for-each select="record/metadata/schede/*/AU/AUF">
					<xsl:choose>
						<xsl:when test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(./AUFN, ' (', ./AUFS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFN, ' (', ./AUFS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(./AUFB, ' (', ./AUFS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFB, ' (', ./AUFS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUFB">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUFB" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFB)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUFN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($aut-string='')">
				<xsl:choose>
					<xsl:when test="not($auf-string='')">
						<xsl:value-of select="concat(' di ', $aut-string, ', ', $auf-string)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(' di ', $aut-string)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="not($auf-string='')">
				<xsl:value-of select="concat(' di ', $auf-string)" />
			</xsl:when>
			<xsl:when test="not($dt-aut-string='')">
				<xsl:value-of select="concat(' di ', $dt-aut-string)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="author-string-en">
		<xsl:variable name="aut-string">
			<xsl:if test="record/metadata/schede/*/AU/AUT">
				<xsl:for-each select="record/metadata/schede/*/AU/AUT">
					<xsl:choose>
						<xsl:when test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUTB and (not(starts-with(lower-case(normalize-space(./AUTB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTB)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTB, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTB, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUTN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUTN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="auf-string">
			<xsl:if test="record/metadata/schede/*/AU/AUF">
				<xsl:for-each select="record/metadata/schede/*/AU/AUF">
					<xsl:choose>
						<xsl:when test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(./AUFN, ' (', ./AUFS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFN, ' (', ./AUFS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(./AUFB, ' (', ./AUFS, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFB, ' (', ./AUFS, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="./AUFB">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUFB" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFB)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUFN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUFN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="dt-aut-string">
			<xsl:if test="record/metadata/schede/*/DT/AUT">
				<xsl:for-each select="record/metadata/schede/*/DT/AUT">
					<xsl:choose>
						<xsl:when test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="concat(arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', arco-fn:name-cleaner(./AUTN), ' (', ./AUTA, ')')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>	
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./AUTN" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./AUTN)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($aut-string='')">
				<xsl:choose>
					<xsl:when test="not($auf-string='')">
						<xsl:value-of select="concat(' by ', $aut-string, ', ', $auf-string)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(' by ', $aut-string)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="not($auf-string='')">
				<xsl:value-of select="concat(' by ', $auf-string)" />
			</xsl:when>
			<xsl:when test="not($dt-aut-string='')">
				<xsl:value-of select="concat(' by ', $dt-aut-string)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<!-- variable cultural context -->
	<xsl:variable name="cultural-context">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/AU/ATB/ATBD">
				<xsl:value-of select="concat(' - ', string-join(record/metadata/schede/*/AU/ATB/ATBD, ', '))" /><!-- multiple ATB eg:ICCD14291641 -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- variable date string -->
	<xsl:variable name="date-string">
		<xsl:choose>
			<xsl:when test="$sheetType='A' and $sheetType='PG'">
				<xsl:choose>
					<xsl:when test="not(record/metadata/schede/A/RE/REN/RENS)">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/A/RE/REL/RELF">
								<xsl:value-of select="concat(' (', record/metadata/schede/A/RE/REL/RELS, ', ',  record/metadata/schede/A/RE/REL/RELF, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(' (', record/metadata/schede/A/RE/REL/RELS, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$sheetType='BNB'">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDB">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDD">
								<xsl:value-of select="concat(' (', record/metadata/schede/BNB/LR/LRD/LRDB, ' - ',  record/metadata/schede/BNB/LR/LRD/LRDD, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(' (', record/metadata/schede/BNB/LR/LRD/LRDB, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="record/metadata/schede/BNB/LR/LRD/LRDF">
						<xsl:value-of select="concat(' (', record/metadata/schede/BNB/LR/LRD/LRDF, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$sheetType='BNM'">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/IM/IMG">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGC">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGC, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGS">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGS, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGT">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGT, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGO">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGO, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGP">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGP, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/IM/IMG/IMGR">
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGR, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(' (', record/metadata/schede/*/IM/IMG/IMGE, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$sheetType='BDM'">
	 			<xsl:choose>
					<xsl:when test="record/metadata/schede/BDM/AU/DTF/DTFZ">
						<xsl:value-of select="concat(' (', string-join(record/metadata/schede/BDM/AU/DTF/DTFZ[not(.=../preceding-sibling::DTF/DTFZ)], ', '), ')')" /><!-- multiple DTF eg:ICCD8531832 -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
       			</xsl:choose>
			</xsl:when>
			<xsl:when test="$sheetType='MODI'">
				<xsl:for-each select="record/metadata/schede/*/DT">
					<xsl:if test="./* and (not(./DTP) or ./DTP='intero bene' or ./DTP='carattere generale' or ./DTP='integrale' or ./DTP='tutta' or ./DTP='totale') or (starts-with(lower-case(normalize-space(./DTP)), 'nr')) or (starts-with(lower-case(normalize-space(./DTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./DTP)), 'intero')) or (starts-with(lower-case(normalize-space(./DTP)), 'intera')) or (starts-with(lower-case(normalize-space(./DTP)), 'esemplar'))">
						<xsl:choose>
							<xsl:when test="./DTR">					
								<xsl:value-of select="concat(' (', ./DTR, ')')" /><!-- multiple DTF eg:ICCD8531832 -->
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/DT/DTZ"><!-- TODO multiple values? (DT maxOccurs unbounded) -->
					<xsl:variable name="date">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DT/DTZ/DTZS">
								<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/DT/DTZ/DTZS,', ')), ' ', normalize-space(string-join(record/metadata/schede/*/DT/DTZ/DTZG,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/DT/DTZ/DTZG,', '))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
						<xsl:value-of select="concat(' (', $date, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/DT/DTS"><!-- TODO multiple values? (DT maxOccurs unbounded) -->
					<xsl:variable name="startDate">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DT/DTS/DTSV">
								<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSV,', ')), ' ', normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSI,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSI,', '))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endDate">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DT/DTS/DTSL">
								<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSL,', ')), ' ', normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSF,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/DT/DTS/DTSF,', '))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
						<xsl:value-of select="concat(' (', $startDate, ' - ', $endDate, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:template name="label">
							<!-- labels of cultural property -->
		<!-- MIDF -->
		<xsl:if test="$sheetType='MIDF'">
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGN">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGN)" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGD), ' ', normalize-space(record/metadata/schede/*/OG/OGT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">									
				<xsl:value-of select="concat($tmp-label, ', ', $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">			
				<xsl:value-of select="concat($tmp-label, ', ', $date-string)" />
			</rdfs:label>
		</xsl:if>		
		<!-- MINP -->
		<xsl:if test="$sheetType='MINP'">
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGD), ' ', normalize-space(record/metadata/schede/*/OG/OGT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">									
				<xsl:value-of select="concat($tmp-label, ', ', normalize-space(record/metadata/schede/*/DT/DTR))" />
			</rdfs:label>
			<rdfs:label xml:lang="en">			
				<xsl:value-of select="concat($tmp-label, ', ', normalize-space(record/metadata/schede/*/DT/DTR))" />
			</rdfs:label>
		</xsl:if>
		<!-- SMO -->
		<xsl:if test="$sheetType='SMO'">
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat($sgta, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA or record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:value-of select="concat($sgta, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">									
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">			
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- SM -->
		<xsl:if test="$sheetType='SM'">
			<xsl:variable name="ogdn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/OG/OGD/OGDN,', ')), ' (')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtw">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTW))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtp">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTP))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
						<xsl:value-of select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">	
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- PST -->
		<xsl:if test="$sheetType='PST'">
			<xsl:variable name="ogtn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
						<xsl:value-of select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">	
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
			<!-- SI -->
			<xsl:if test="$sheetType='SI'">
				<xsl:variable name="ogtn">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="ogtt">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
							<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="tmp-label">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
							<xsl:value-of select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, ')')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<rdfs:label xml:lang="it">	
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
				</rdfs:label>
			</xsl:if>
		<!-- RA -->
		<xsl:if test="$sheetType='RA'">
			<xsl:variable name="ogtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTN))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:value-of select="concat($sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtn, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtn)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- OA -->
		<xsl:if test="$sheetType='OA'">
			<xsl:variable name="sgtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))]">
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
						<xsl:value-of select="concat(' - ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:value-of select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">					
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- F -->
		<xsl:if test="$sheetType='F'">
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtw">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTW))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtp">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTP))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:for-each select="record/metadata/schede/*/SG/SGT/SGTI">
				<xsl:variable name="tmp-label">
					<xsl:value-of select="concat(normalize-space(), ' (', normalize-space(/record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
				</xsl:variable>
				<rdfs:label xml:lang="it">						
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:for-each>				
		</xsl:if>
		<!-- SAS -->
		<xsl:if test="$sheetType='SAS'">
			<rdfs:label xml:lang="it">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
			</rdfs:label>
		</xsl:if>
		<!-- CA or MA -->
		<xsl:if test="$sheetType='CA' or $sheetType='MA'">
			<xsl:variable name="ogtn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtc">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
						<xsl:value-of select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">				
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- AT -->
		<xsl:if test="$sheetType='AT'">
			<xsl:variable name="ogtm">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'n.r')))">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTM)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtp">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM and record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, ', ', $ogtp, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM or record/metadata/schede/*/OG/OGT/OGTP">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, $ogtp, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- TMA -->
		<xsl:if test="$sheetType='TMA'">
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTM), ')')" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- NU -->
		<xsl:if test="$sheetType='NU'">
			<xsl:variable name="ogth">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTH and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTH)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTH)), 'n.r')))">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTH)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTO">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' - ', normalize-space(record/metadata/schede/*/OG/OGT/OGTO))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">		
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">					
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- OAC -->
		<xsl:if test="$sheetType='OAC'">
			<xsl:variable name="sgtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '))" /><!-- ICCD11324919  -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:value-of select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">			
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- D or MI or S -->
		<xsl:if test="$sheetType='D' or $sheetType='MI' or $sheetType='S'">
			<xsl:variable name="sgtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))]">
						<xsl:value-of select="normalize-space(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<xsl:value-of select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:value-of select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- VeAC -->
		<xsl:if test="$sheetType='VeAC'">
			<xsl:variable name="ogtn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtc">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtf">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTF))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtg">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
						<xsl:value-of select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- A -->
		<xsl:if test="$sheetType='A'">
			<xsl:choose>
				<xsl:when test="$sheetVersion='3.00_ICCD0' or $sheetVersion='3.00'">
					<xsl:variable name="ogtn">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtq">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'n.r')))">
								<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
								<xsl:value-of select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label xml:lang="it">
							<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
							<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
					</rdfs:label>
				</xsl:when>
				<xsl:otherwise>
					<!-- la parentesi di chiusura è inserita nel choose della label perché c'è solo se c'è $ogtd; 
					la parentesi di apertura è nella variabile $ogtd perché c'è solo se c'è $ogtd; la virgola tra OGTT e $ogtq è nella variabile
					$ogtq perché c'è sempre se c'è ogtq -->
					<xsl:variable name="ogtd">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)), 'n.r')))">
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtq">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'n.r')))">
								<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
								<xsl:value-of select="concat($ogtd, normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label xml:lang="it">							
						<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
					</rdfs:label>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!-- PG -->
		<xsl:if test="$sheetType='PG'">
			<xsl:variable name="ogtq">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogad">
				<xsl:if test="record/metadata/schede/*/OG/OGA/OGAD[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
					<xsl:value-of select="concat(', ', normalize-space(string-join(record/metadata/schede/*/OG/OGA/OGAD[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))], ', ')))"/>
				</xsl:if>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')', $ogad)" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
					<xsl:value-of select="concat($tmp-label, ' - ', record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') ', $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- BDI -->
		<xsl:if test="$sheetType='BDI'">
			<xsl:choose>
				<xsl:when test="$sheetVersion='4.00_ICCD0' or $sheetVersion='4.00'">
					<!-- la parentesi di apertura viene aggiunta alla variabile ogdn perché 
						c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogdn. 
						Le virgole tra ogtd, ogtt e ctg vengono messe nelli variabili ogtt perché 
						ci sono solo se ci sono quei campi -->
					<xsl:variable name="ogdn">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/OG/OGD/OGDN,', ')), ' (')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
								<xsl:value-of select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(string-join(record/metadata/schede/*/OG/CTG,'; ')), ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(string-join(record/metadata/schede/*/OG/CTG,'; ')))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label xml:lang="it">
						 <xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
					</rdfs:label>
				</xsl:when>					
				<xsl:otherwise>					
					<xsl:variable name="dbl"><!-- allow multiple values ? ICCD11389099 ICCD13074440 -->
						<xsl:value-of select="string-join(record/metadata/schede/*/DB/DBL[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))],', ')"/>
					</xsl:variable>
					<xsl:variable name="dbc"><!-- allow multiple values ? ICCD11389099 ICCD13074440 -->
						<xsl:value-of select="string-join(record/metadata/schede/*/DB/DBC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))],', ')"/>
					</xsl:variable>
					<xsl:variable name="dbd"><!-- allow multiple values ? ICCD11389099 ICCD13074440 -->
						<xsl:value-of select="string-join(record/metadata/schede/*/DB/DBD[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))],', ')"/>
					</xsl:variable>
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/DB/DBC">
								<xsl:value-of select="concat($dbd, ' - ', $dbl, ' (', $dbc, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($dbd, ' - ', $dbl)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
					</rdfs:label>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!-- BDM -->
		<xsl:if test="$sheetType='BDM'">
			<xsl:choose>
				<xsl:when test="$sheetVersion='2.00_ICCD0' or $sheetVersion='2.00'">
					<xsl:variable name="sgtt">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r')))">
								<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtt">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
								<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtg">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'n.r')))">
								<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and record/metadata/schede/*/OG/SGT/SGTI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:value-of select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
					</rdfs:label>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="ogdn">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:value-of select="concat(normalize-space(string-join(record/metadata/schede/*/OG/OGD/OGDN,', ')), ' (')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtt">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
								<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ctg">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/CTG[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
								<xsl:value-of select="concat(', ', normalize-space(string-join(record/metadata/schede/*/OG/CTG,', ')))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ogtp">
							<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTP), ' - ')" />
							</xsl:if>
						</xsl:variable>
						<xsl:variable name="tmp-label">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
									<xsl:value-of select="concat($ogtp, $ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg, ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($ogtp, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
					</rdfs:label>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

		<!-- BNB -->
		<xsl:if test="$sheetType='BNB'">
			<xsl:variable name="nbna">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/SB/NBN/NBNA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SB/NBN/NBNA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SB/NBN/NBNA)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/SB/NBN/NBNA), ' - ')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogte">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTE)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTE))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtc">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat($nbna, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogte, $ogtc)" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- BNM or BNPE or BNPL or BNZ or E -->
		<xsl:if test="$sheetType='BNPE' or $sheetType='BNM' or $sheetType='BNPL' or $sheetType='BNZ' or $sheetType='E'">
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTV), ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- BNP -->
		<xsl:if test="$sheetType='BNP'">
			<xsl:variable name="ogtt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTT)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogtv">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTV)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogtv, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTV">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogtv, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<!-- FF -->
			<xsl:if test="$sheetType='FF'">
				<xsl:variable name="ogtp">
					<xsl:if test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
						<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTP), ' - ')" />
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="tmp-label">
					<xsl:value-of select="concat($ogtp, normalize-space(string-join(record/metadata/schede/*/OG/OGD/OGDN,' ; ')))" />
				</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>

		<!-- MODI -->
		<xsl:if test="$sheetType='MODI'">
			<xsl:variable name="ogt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGN[not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGN)), 'nr') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGN)), 'n.r'))]">
						<xsl:value-of select="concat(', ', normalize-space(string-join(record/metadata/schede/*/OG/OGN,', ')))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGD), $ogt, $ogn)" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		<xsl:if test="$sheetType='SCAN'">
			<xsl:variable name="ogt">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT)), 'n.r')))">
						<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="ogn">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGN[not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGN)), 'nr') or starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGN)), 'n.r'))]">
						<xsl:value-of select="concat(', ', normalize-space(string-join(record/metadata/schede/*/OG/OGN,', ')))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="''" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="tmp-label">
				<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/OG/OGD), $ogt, $ogn)" />
			</xsl:variable>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
			</rdfs:label>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
			</rdfs:label>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="/">
		<rdf:RDF>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$culturalProperty" />
				</xsl:attribute>
				<xsl:call-template name="label"/>
			</rdf:Description>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>