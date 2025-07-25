<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension" xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-event="https://w3id.org/arco/ontology/cultural-event/" xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-con="https://w3id.org/arco/ontology/construction-description/"
	xmlns:cis="http://dati.beniculturali.it/cis/" xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:roapit="https://w3id.org/italia/onto/RO/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
	xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:language="https://w3id.org/italia/onto/Language/"
	xmlns:frbr="http://purl.org/vocab/frbr/core#"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />
	<!-- xsl:template match="record/metadata/schede/*/MT/MTA"> <xsl:for-each select="MTAP"> 
		<rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of select="concat($NS, 
		'CulturalPropertyPart/', $itemURI, '-part-', position())" />" </xsl:attribute> 
		<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" 
		/> <clvapit:hasGeometry> <xsl:attribute name="rdf:resource"> <xsl:value-of 
		select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" 
		/> </xsl:attribute> </clvapit:hasGeometry> <arco-core:isPartOf> <xsl:attribute 
		name="rdf:resource"> <xsl:value-of select="$objectOfDescription" /> </xsl:attribute> 
		</arco-core:isPartOf> </rdf:Description> </xsl:for-each> </xsl:template -->
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
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
			<xsl:otherwise>
				<xsl:variable name="accc-space">
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
	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="NS" />
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	<xsl:variable name="cp-name" select="''" />
	<xsl:variable name="culturalPropertyComponent" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />
	<xsl:variable name="culturalPropertyResidual" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-residual')" />
	<xsl:variable name="culturalProperty">
		<xsl:choose>
			<xsl:when test="$sheetType='MODI'">
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType(record/metadata/schede/MODI/OG/AMB)), '/', $itemURI)" />
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
					<xsl:when test="lower-case(normalize-space(record/metadata/schede/*/OG/AMB))='demoetnoantopologico'">
						<xsl:value-of select="concat($NS, 'DemoEthnoAnthropologicalHeritage/', $itemURI)" />
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
			<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:value-of select="$culturalPropertyResidual" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$culturalProperty" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<rdf:RDF>
			<!-- part of cultural property when there is STCP (conservation status) -->
			<xsl:for-each select="record/metadata/schede/*/CO/STC">
				<xsl:variable name="conservationStatus">
					<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not($sheetType='A')">
					<xsl:if test="not(lower-case(normalize-space(./STCP))='intero bene') and not(lower-case(normalize-space(./STCP))='integrale') and not(lower-case(normalize-space(./STCP))='tutta') and not(lower-case(normalize-space(./STCP))='totale') and (not(starts-with(lower-case(normalize-space(./STCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./STCP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./STCP)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./STCP)), 'intero')) and not(starts-with(lower-case(normalize-space(./STCP)), 'intera')))">
						<xsl:for-each select="./STCP">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
								<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
								<arco-dd:hasConservationStatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="$conservationStatus" />
									</xsl:attribute>
								</arco-dd:hasConservationStatus>
								<rdfs:label>
									<xsl:value-of select="normalize-space(.)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(.)" />
								</l0:name>
								<arco-core:isPartOf>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
									</xsl:attribute>
								</arco-core:isPartOf>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is STCR (conservation status) -->
			<xsl:for-each select="record/metadata/schede/A/CO/STC">
				<xsl:variable name="conservationStatus">
					<xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./STCR))='intero bene') and not(lower-case(normalize-space(./STCR))='integrale') and not(lower-case(normalize-space(./STCR))='tutta') and not(lower-case(normalize-space(./STCR))='totale') and (not(starts-with(lower-case(normalize-space(./STCR)), 'nr')) and not(starts-with(lower-case(normalize-space(./STCR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./STCR)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./STCR)), 'intero')) and not(starts-with(lower-case(normalize-space(./STCR)), 'intera')))">
					<xsl:for-each select="./STCR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasConservationStatus>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$conservationStatus" />
								</xsl:attribute>
							</arco-dd:hasConservationStatus>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is AUTW (author) -->
			<xsl:for-each select="record/metadata/schede/*/AU/AUT">
				<xsl:variable name="aut-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:variable name="authorResponsibility">
					<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
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
				<xsl:if test="./AUTW and not(lower-case(normalize-space(./AUTW))='integrale') and not(lower-case(normalize-space(./AUTW))='tutta') and not(lower-case(normalize-space(./AUTW))='totale') and (not(starts-with(lower-case(normalize-space(./AUTW)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intero')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intera')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'esemplar')))">
					<xsl:variable name="part">
						<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AUTW)))" />
					</xsl:variable>
					<xsl:variable name="partLabel">
						<xsl:value-of select="normalize-space(./AUTW)" />
					</xsl:variable>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="$part" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="$partLabel" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="$partLabel" />
						</l0:name>
						<arco-cd:hasResponsibility>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$authorResponsibility" />
							</xsl:attribute>
						</arco-cd:hasResponsibility>
						<arco-lite:hasAuthor>
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
						</arco-lite:hasAuthor>
						<dc:creator>
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
						</dc:creator>
						<pico:author>
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
						</pico:author>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is AUIY (author) -->
			<xsl:for-each select="record/metadata/schede/*/AU/AUI">
				<xsl:variable name="aut-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:for-each select="record/metadata/schede/*/AU/AUI/AUIY">
					<xsl:if test=". and not(.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space(.)), 'intero') or starts-with(lower-case(normalize-space(.)), 'intera') or starts-with(lower-case(normalize-space(.)), 'esemplar'))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<rdfs:label>
								<xsl:value-of select="." />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="." />
							</l0:name>
							<xsl:if test="../AUIN and (not(starts-with(lower-case(normalize-space(../AUIN)), 'nr')) and not(starts-with(lower-case(normalize-space(../AUIN)), 'n.r')) and not(starts-with(lower-case(normalize-space(../AUIN)), '-')))">
								<arco-cd:hasResponsibility>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasResponsibility>
								<arco-lite:hasAuthor>
									<xsl:choose>
										<xsl:when test="../AUIA and (not(starts-with(lower-case(normalize-space(../AUIA)), 'nr')) and not(starts-with(lower-case(normalize-space(../AUIA)), 'n.r')))">
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(../AUIN, '-', ../AUIA)))" />
											</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="rdf:resource">
												<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(../AUIN))" />
											</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
								</arco-lite:hasAuthor>
							</xsl:if>
							<xsl:if test="../AUIB and (not(starts-with(lower-case(normalize-space(../AUIB)), 'nr')) and not(starts-with(lower-case(normalize-space(../AUIB)), 'n.r')) and not(starts-with(lower-case(normalize-space(../AUIB)), '-')))">
								<arco-cd:hasResponsibility>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PreferredResponsibility/', $itemURI, '-', position())" />
									</xsl:attribute>
								</arco-cd:hasResponsibility>
								<arco-lite:hasAuthor>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(../AUIB))" />
									</xsl:attribute>
								</arco-lite:hasAuthor>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<!-- part of cultural property when there is NVCP (protective measure) -->
			<xsl:for-each select="record/metadata/schede/*/TU/NVC">
				<xsl:variable name="protectiveMeasure">
					<xsl:value-of
						select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="./NVCP and not(lower-case(normalize-space(./NVCP))='intero bene') and not(lower-case(normalize-space(./NVCP))='integrale') and not(lower-case(normalize-space(./NVCP))='tutta') and not(lower-case(normalize-space(./NVCP))='totale') and (not(starts-with(lower-case(normalize-space(./NVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./NVCP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./NVCP)), 'intero')) and not(starts-with(lower-case(normalize-space(./NVCP)), 'intera')) and not(starts-with(lower-case(normalize-space(./NVCP)), 'esemplar')))">
					<xsl:for-each select="./NVCP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$protectiveMeasure" />
								</xsl:attribute>
							</arco-dd:hasProtectiveMeasure>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is VINE (protective measure for A 2.00) -->
			<xsl:for-each select="record/metadata/schede/*/TU/VIN">
				<xsl:variable name="protectiveMeasure">
					<xsl:value-of
						select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="./VINE and not(lower-case(normalize-space(./VINE))='intero bene') and not(lower-case(normalize-space(./VINE))='integrale') and not(lower-case(normalize-space(./VINE))='tutta') and not(lower-case(normalize-space(./VINE))='totale') and (not(starts-with(lower-case(normalize-space(./VINE)), 'nr')) and not(starts-with(lower-case(normalize-space(./VINE)), 'n.r')) and not(starts-with(lower-case(normalize-space(./VINE)), 'intero')) and not(starts-with(lower-case(normalize-space(./VINE)), 'intera')) and not(starts-with(lower-case(normalize-space(./VINE)), 'esemplar')))">
					<xsl:for-each select="./VINE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$protectiveMeasure" />
								</xsl:attribute>
							</arco-dd:hasProtectiveMeasure>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is MTCP -->
			<xsl:if test="not($sheetType='VeAC')" >
				<xsl:for-each select="record/metadata/schede/*/MT/MTC">
					<xsl:if test="./MTCP and not((starts-with(lower-case(normalize-space(./MTCP)), 'integrale')) or (starts-with(lower-case(normalize-space(./MTCP)), 'tutto')) or (starts-with(lower-case(normalize-space(./MTCP)), 'tutta')) or (starts-with(lower-case(normalize-space(./MTCP)), 'totale')) or (starts-with(lower-case(normalize-space(./MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTCP)), 'esemplar')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTCP)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./MTCP)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./MTCP)" />
							</l0:name>
							<xsl:if test="./MTCM">
								<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCM)), 'n.r'))">
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTCP)))" />
										</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasMaterial>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCM)))" />
										</xsl:attribute>
									</arco-lite:hasMaterial>
								</xsl:if>
							</xsl:if>
							<xsl:if test="./MTCT[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTCP)))" />
									</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<xsl:for-each select="./MTCT[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
									<!-- allow multiple values es: ICCD13661286 -->
									<arco-lite:hasTechnique>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space()))" />
										</xsl:attribute>
									</arco-lite:hasTechnique>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="./MTCI">
								<xsl:if test="not(starts-with(lower-case(normalize-space(./MTCI)), 'nr')) and not(starts-with(lower-case(normalize-space(./MTCI)), 'n.r'))">
									<arco-dd:hasTechnicalStatus>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTCP)))" />
										</xsl:attribute>
									</arco-dd:hasTechnicalStatus>
									<arco-lite:hasMaterialOrTechnique>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./MTCI)))" />
										</xsl:attribute>
									</arco-lite:hasMaterialOrTechnique>
								</xsl:if>
							</xsl:if>
							<xsl:if test="./MTCD or ./MTCN">
								<arco-dd:hasIconographicOrDecorativeApparatus>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
									</xsl:attribute>
								</arco-dd:hasIconographicOrDecorativeApparatus>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- TechnicalStatus when there is MTCP  -->
			<xsl:for-each select="record/metadata/schede/*/MT/MTC">
				<xsl:if test="not($sheetType='VeAC')" >
					<xsl:if test="./MTCP and not((starts-with(lower-case(normalize-space(./MTCP)), 'integrale')) or (starts-with(lower-case(normalize-space(./MTCP)), 'tutto')) or (starts-with(lower-case(normalize-space(./MTCP)), 'tutta')) or (starts-with(lower-case(normalize-space(./MTCP)), 'totale')) or (starts-with(lower-case(normalize-space(./MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTCP)), 'esemplar')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTCP)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico della parte di bene culturale ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Stato tecnico della parte di bene culturale ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Technical status of part of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Technical status of part of cultural property ', $itemURI)" />
							</l0:name>
							<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
								<xsl:value-of select="true()" />
							</arco-core:current>
							<xsl:if test="./MTCS">
								<arco-core:note>
									<xsl:value-of select="./MTCS" />
								</arco-core:note>
							</xsl:if>
							<xsl:for-each select="./MTCM">
								<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr'))  and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
									<arco-dd:includesTechnicalCharacteristic>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
										</xsl:attribute>
									</arco-dd:includesTechnicalCharacteristic>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="./MTCF">
								<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr'))  and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
									<arco-dd:includesTechnicalCharacteristic>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
										</xsl:attribute>
									</arco-dd:includesTechnicalCharacteristic>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="./MTCT">
								<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr'))  and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
									<arco-dd:includesTechnicalCharacteristic>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
										</xsl:attribute>
									</arco-dd:includesTechnicalCharacteristic>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="./MTCI">
								<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr'))  and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
									<arco-dd:includesTechnicalCharacteristic>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
										</xsl:attribute>
									</arco-dd:includesTechnicalCharacteristic>
								</xsl:if>
							</xsl:for-each>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- material of cultural property (PST) -->
			<xsl:for-each select="record/metadata/schede/*/MT/MTW">
				<xsl:if test="./MTWP and not ((./MTWP='intero bene' or ./MTWP='integrale' or ./MTWP='tutta' or ./MTWP='totale') or (starts-with(lower-case(normalize-space(./MTWP)), 'nr')) or (starts-with(lower-case(normalize-space(./MTWP)), 'n.r')) or (starts-with(lower-case(normalize-space(./MTWP)), 'intero')) or (starts-with(lower-case(normalize-space(./MTWP)), 'intera')) or (starts-with(lower-case(normalize-space(./MTWP)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTWP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./MTCP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./MTCP)" />
						</l0:name>
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTWP)))" />
							</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<xsl:for-each select="./MTWC">
							<arco-lite:hasMaterial>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-lite:hasMaterial>
						</xsl:for-each>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MTWP)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Stato tecnico della parte di bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Stato tecnico della parte di bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Technical status of part of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Technical status of part of cultural property ', $itemURI)" />
						</l0:name>
						<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
							<xsl:value-of select="true()" />
						</arco-core:current>
						<xsl:if test="./MTWS">
							<arco-core:note>
								<xsl:value-of select="./MTWS" />
							</arco-core:note>
						</xsl:if>
						<xsl:for-each select="./MTWC">
							<arco-dd:includesTechnicalCharacteristic>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-dd:includesTechnicalCharacteristic>
						</xsl:for-each>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- inventory -->
			<xsl:for-each select="record/metadata/schede/*/UB/INV">
				<xsl:if test="./INVP and not((starts-with(lower-case(normalize-space(./INVP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./INVP)), 'nr')) or (starts-with(lower-case(normalize-space(./INVP)), 'n.r')) or (starts-with(lower-case(normalize-space(./INVP)), 'intero')) or (starts-with(lower-case(normalize-space(./INVP)), 'intera')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-', arco-fn:urify(normalize-space(./INVP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./INVP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./INVP)" />
						</l0:name>
						<arco-cd:hasInventorySituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'InventorySituation/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasInventorySituation>
						<arco-lite:alternativeInventoryNumber>
							<xsl:value-of select="normalize-space(./INVN)" />
						</arco-lite:alternativeInventoryNumber>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is DTP (4.00, dating) -->
			<xsl:for-each select="record/metadata/schede/*/DT">
				<xsl:variable name="dating">
					<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./DTP))='intero bene') and not(lower-case(normalize-space(./DTP))='integrale') and not(lower-case(normalize-space(./DTP))='carattere generale') and not(lower-case(normalize-space(./DTP))='tutta') and not(lower-case(normalize-space(./DTP))='totale') and (not(starts-with(lower-case(normalize-space(./DTP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DTP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./DTP)), 'intero')) and not(starts-with(lower-case(normalize-space(./DTP)), 'intera')) and not(starts-with(lower-case(normalize-space(./DTP)), 'esemplar')))">
					<xsl:for-each select="./DTP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', $parentPosition)" />
								</xsl:attribute>
							</arco-cd:hasDating>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
							<xsl:if test="not(../DTN/DTNS)">
								<arco-lite:hasRealizationDate>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="../DTZ/DTZS">
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(../DTZ/DTZS)))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</arco-lite:hasRealizationDate>
							</xsl:if>
							<xsl:if test="starts-with(lower-case(normalize-space(../DTN/DTNS)), 'realizzazione')">
								<arco-lite:hasRealizationDate>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="../DTZ/DTZS">
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(../DTZ/DTZS)))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</arco-lite:hasRealizationDate>
							</xsl:if>
							<xsl:if test="starts-with(lower-case(normalize-space(../DTN/DTNS)), 'costruzione')">
								<arco-lite:hasRealizationDate>
									<xsl:attribute name="rdf:resource">
										<xsl:choose>
											<xsl:when test="../DTZ/DTZS">
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(../DTZ/DTZS)))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(../DTZ/DTZG)))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								</arco-lite:hasRealizationDate>
							</xsl:if>
						</rdf:Description>
					</xsl:for-each>
					<xsl:for-each select="./ADT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'AlternativeDating/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-cd:hasDating>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is RIAP -->
			<xsl:for-each select="record/metadata/schede/VeAC/CO/RIA">
				<xsl:if test="./RIAP and not((starts-with(lower-case(normalize-space(./RIAP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./RIAP)), 'nr')) or (starts-with(lower-case(normalize-space(./RIAP)), 'n.r')) or (starts-with(lower-case(normalize-space(./RIAP)), 'intero')) or (starts-with(lower-case(normalize-space(./RIAP)), 'intera')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./RIAP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, 'intervention-ria-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is RSTP (4.00, intervention) -->
			<xsl:for-each select="record/metadata/schede/*/*/RST">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./RSTP))='intero bene') and not(lower-case(normalize-space(./RSTP))='integrale') and not(lower-case(normalize-space(./RSTP))='tutta') and not(lower-case(normalize-space(./RSTP))='totale') and (not(starts-with(lower-case(normalize-space(./RSTP)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'intero')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'intera')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'esemplar')))">
					<xsl:for-each select="./RSTP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasIntervention>
								<xsl:choose>
									<xsl:when test="contains(normalize-space(lower-case(../RSTI)), 'consolidamento') or contains(normalize-space(lower-case(../RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(../RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(../RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(../RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(../RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(../RSTI)), 'protezione finale') or contains(normalize-space(lower-case(../RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(../RSTI)), 'trattamento parti metalliche')">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', $parentPosition)" />
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-intervention-', $parentPosition)" />
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-cd:hasIntervention>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is RSTR (< 4.00, conservation intervention) -->
			<xsl:if test="$sheetType='A' or $sheetType='PG'">
				<xsl:for-each select="record/metadata/schede/*/RS/RST">
					<xsl:variable name="parentPosition">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<xsl:if test="not(lower-case(normalize-space(./RSTR))='intero bene') and not(lower-case(normalize-space(./RSTR))='integrale') and not(lower-case(normalize-space(./RSTR))='tutta') and not(lower-case(normalize-space(./RSTR))='totale') and (not(starts-with(lower-case(normalize-space(./RSTR)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'intero')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'intera')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'esemplar')))">
						<xsl:for-each select="./RSTR">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
								<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
								<arco-cd:hasIntervention>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', $parentPosition)" />
									</xsl:attribute>
								</arco-cd:hasIntervention>
								<rdfs:label>
									<xsl:value-of select="normalize-space(.)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(.)" />
								</l0:name>
								<arco-core:isPartOf>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
									</xsl:attribute>
								</arco-core:isPartOf>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- part for use (A and PG) -->
			<xsl:for-each select="record/metadata/schede/*/US/USO">
				<xsl:variable name="use">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./USOR))='intero bene') and not(lower-case(normalize-space(./USOR))='integrale') and not(lower-case(normalize-space(./USOR))='tutta') and not(lower-case(normalize-space(./USOR))='totale') and (not(starts-with(lower-case(normalize-space(./USOR)), 'nr')) and not(starts-with(lower-case(normalize-space(./USOR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./USOR)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./USOR)), 'intero')) and not(starts-with(lower-case(normalize-space(./USOR)), 'intera')))">
					<xsl:for-each select="./USOR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$use" />
								</xsl:attribute>
							</arco-cd:hasUse>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/US/USA">
				<xsl:variable name="use">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-current-use-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./USAR))='intero bene') and not(lower-case(normalize-space(./USAR))='integrale') and not(lower-case(normalize-space(./USAR))='tutta') and not(lower-case(normalize-space(./USAR))='totale') and (not(starts-with(lower-case(normalize-space(./USAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./USAR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./USAR)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./USAR)), 'intero')) and not(starts-with(lower-case(normalize-space(./USAR)), 'intera')))">
					<xsl:for-each select="./USAR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$use" />
								</xsl:attribute>
							</arco-cd:hasUse>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/MT/MIS">
				<xsl:variable name="measurementCollection">
					<xsl:choose>
						<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP" >
							<xsl:value-of
									select="concat($NS, 'MeasurementCollection/', $itemURI, '-', arco-fn:urify(normalize-space(./MISP)))" />
						</xsl:when>
						<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and not(./MISP)" >
							<xsl:value-of
									select="concat($NS, 'MeasurementCollection/', $itemURI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of
									select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:if test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP and not(lower-case(normalize-space(./MISP))='intero bene') and not(lower-case(normalize-space(./MISP))='integrale') and not(lower-case(normalize-space(./MISP))='tutta') and not(lower-case(normalize-space(./MISP))='totale') and not(starts-with(lower-case(normalize-space(./MISP)), 'nr')) and not(starts-with(lower-case(normalize-space(./MISP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./MISP)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./MISP)), 'intero')) and not(starts-with(lower-case(normalize-space(./MISP)), 'intera'))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<arco-cd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$measurementCollection" />
							</xsl:attribute>
						</arco-cd:hasMeasurementCollection>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./MISP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./MISP)" />
						</l0:name>
						<arco-core:isPartOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
							</xsl:attribute>
						</arco-core:isPartOf>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="$sheetType='F' and ./MISO and not(lower-case(normalize-space(./MISO))='intero bene') and not(lower-case(normalize-space(./MISO))='integrale') and not(lower-case(normalize-space(./MISO))='tutta') and not(lower-case(normalize-space(./MISO))='totale') and not(starts-with(lower-case(normalize-space(./MISO)), 'nr')) and not(starts-with(lower-case(normalize-space(./MISO)), 'n.r')) and not(starts-with(lower-case(normalize-space(./MISO)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./MISO)), 'intero')) and not(starts-with(lower-case(normalize-space(./MISO)), 'intera'))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISO)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<arco-cd:hasMeasurementCollection>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$measurementCollection" />
							</xsl:attribute>
						</arco-cd:hasMeasurementCollection>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./MISO)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./MISO)" />
						</l0:name>
						<arco-core:isPartOf>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
							</xsl:attribute>
						</arco-core:isPartOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is RE/REN/RENR (A and PG, dating) -->
			<xsl:for-each select="record/metadata/schede/A/RE">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./REN/RENR))='intero bene') and not(lower-case(normalize-space(./REN/RENR))='carattere generale') and not(lower-case(normalize-space(./REN/RENR))='integrale') and not(lower-case(normalize-space(./REN/RENR))='tutta') and not(lower-case(normalize-space(./REN/RENR))='totale') and (not(starts-with(lower-case(normalize-space(./REN/RENR)), 'nr')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'intero')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'intera')))">
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
					<xsl:for-each select="./REN/RENR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', $parentPosition)" />
								</xsl:attribute>
							</arco-cd:hasDating>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
								</xsl:attribute>
							</arco-core:isPartOf>
							<xsl:if test="not(./REN/RENS)">
								<arco-lite:hasRealizationDate>
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
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is REIP (reuse) -->
			<xsl:for-each select="record/metadata/schede/*/RO/REI">
				<xsl:variable name="reuse">
					<xsl:value-of
						select="concat($NS, 'Use/', $itemURI, '-reuse-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./REIP))='intero bene') and not(lower-case(normalize-space(./REIP))='integrale') and not(lower-case(normalize-space(./REIP))='tutta') and not(lower-case(normalize-space(./REIP))='totale') and (not(starts-with(lower-case(normalize-space(./REIP)), 'nr')) and not(starts-with(lower-case(normalize-space(./REIP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./REIP)), 'intero')) and not(starts-with(lower-case(normalize-space(./REIP)), 'intera')) and not(starts-with(lower-case(normalize-space(./REIP)), 'esemplar')))">
					<xsl:for-each select="./REIP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasUse>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$reuse" />
								</xsl:attribute>
							</arco-cd:hasUse>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is ISER (4.00, affixed elements) -->
			<xsl:for-each select="record/metadata/schede/*/DA/ISE">
				<xsl:variable name="element">
					<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./ISER))='intero bene') and not(lower-case(normalize-space(./ISER))='integrale') and not(lower-case(normalize-space(./ISER))='tutta') and not(lower-case(normalize-space(./ISER))='totale') and (not(starts-with(lower-case(normalize-space(./ISER)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISER)), 'n.r')) and not(starts-with(lower-case(normalize-space(./ISER)), 'intero')) and not(starts-with(lower-case(normalize-space(./ISER)), 'intera')) and not(starts-with(lower-case(normalize-space(./ISER)), 'esemplar')))">
					<xsl:for-each select="./ISER">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasAffixedElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$element" />
								</xsl:attribute>
							</arco-dd:hasAffixedElement>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is LSI (4.00, affixed elements) -->
			<xsl:if test="record/metadata/schede/*/*/LSI/*">
				<xsl:for-each select="record/metadata/schede/*/*/LSI">
					<xsl:if test="./LSIU and not(./LSIU='intero bene' or ./LSIU='integrale' or ./LSIU='tutta' or ./LSIU='totale' or ./LSIU='carattere generale' or (starts-with(lower-case(normalize-space(./LSIU)), 'nr')) or (starts-with(lower-case(normalize-space(./LSIU)), 'n.r')) or (starts-with(lower-case(normalize-space(./LSIU)), 'intero')) or (starts-with(lower-case(normalize-space(./LSIU)), 'intera')) or (starts-with(lower-case(normalize-space(./LSIU)), 'esemplar')))">
						<xsl:variable name="element">
							<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
						</xsl:variable>
						<xsl:variable name="parentPosition">
							<xsl:value-of select="position()" />
						</xsl:variable>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./LSIU)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasAffixedElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$element" />
								</xsl:attribute>
							</arco-dd:hasAffixedElement>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./LSIU)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./LSIU)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- part of cultural property when there is ISRY (4.00, affixed elements) -->
			<xsl:for-each select="record/metadata/schede/*/DA/ISR">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="./ISRY and not(lower-case(normalize-space(./ISRY))='intero bene') and not(lower-case(normalize-space(./ISRY))='integrale') and not(lower-case(normalize-space(./ISRY))='tutta') and not(lower-case(normalize-space(./ISRY))='totale') and (not(starts-with(lower-case(normalize-space(./ISRY)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISRY)), 'n.r')) and not(starts-with(lower-case(normalize-space(./ISRY)), 'intero')) and not(starts-with(lower-case(normalize-space(./ISRY)), 'intera')) and not(starts-with(lower-case(normalize-space(./ISRY)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ISRY)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-inscription-', position())" />
							</xsl:attribute>
						</arco-dd:hasAffixedElement>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ISRY)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ISRY)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is ISRY (4.00, affixed elements) -->
			<xsl:for-each select="record/metadata/schede/*/DA/MNC">
				<xsl:if test="./MNCP and not(lower-case(normalize-space(./MNCP))='intero bene') and not(lower-case(normalize-space(./MNCP))='integrale') and not(lower-case(normalize-space(./MNCP))='tutta') and not(lower-case(normalize-space(./MNCP))='totale') and (not(starts-with(lower-case(normalize-space(./MNCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./MNCP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./MNCP)), 'intero')) and not(starts-with(lower-case(normalize-space(./MNCP)), 'intera')) and not(starts-with(lower-case(normalize-space(./MNCP)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MNCP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-quarry-or-masonry-mark-', position())" />
							</xsl:attribute>
						</arco-dd:hasAffixedElement>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./MNCP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./MNCP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- part of cultural property when there is ISER (4.00, affixed elements) -->
			<xsl:for-each select="record/metadata/schede/*/DA/STM">
				<xsl:variable name="element">
					<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if test="not(lower-case(normalize-space(./STMY))='intero bene') and not(lower-case(normalize-space(./STMY))='integrale') and not(lower-case(normalize-space(./STMY))='tutta') and not(lower-case(normalize-space(./STMY))='totale') and (not(starts-with(lower-case(normalize-space(./STMY)), 'nr')) and not(starts-with(lower-case(normalize-space(./STMY)), 'n.r')) and not(starts-with(lower-case(normalize-space(./STMY)), 'intero')) and not(starts-with(lower-case(normalize-space(./STMY)), 'intera')) and not(starts-with(lower-case(normalize-space(./STMY)), 'esemplar')))">
					<xsl:for-each select="./STMY">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-dd:hasAffixedElement>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$element" />
								</xsl:attribute>
							</arco-dd:hasAffixedElement>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<!-- Archaeometric and diagnostic survey -->
			<xsl:if test="not(record/metadata/schede/*/RE/IND/INDD='0000/00/00' or record/metadata/schede/*/RE/IND/INDD='/') and record/metadata/schede/*/RE/IND/*">
				<xsl:for-each select="record/metadata/schede/*/RE/IND">
					<xsl:if test="./INDP and not(./INDP='intero bene' or ./INDP='integrale' or ./INDP='tutta' or ./INDP='totale' or ./INDP='carattere generale' or (starts-with(lower-case(normalize-space(./INDP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./INDP)), 'nr')) or (starts-with(lower-case(normalize-space(./INDP)), 'n.r')) or (starts-with(lower-case(normalize-space(./INDP)), 'intero')) or (starts-with(lower-case(normalize-space(./INDP)), 'intera')) or (starts-with(lower-case(normalize-space(./INDP)), 'esemplar')))">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./INDP)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<arco-cd:hasSurvey>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ArchaeometricDiagnosticSurvey/', $itemURI, '-survey-', position())" />
								</xsl:attribute>
							</arco-cd:hasSurvey>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- CulturalPropertyPart when there is DECU -->
			<xsl:for-each select="record/metadata/schede/*/DE/DEC">
				<xsl:if test="./DECU and not(./DECU='intero bene' or ./DECU='integrale' or ./DECU='tutta' or ./DECU='totale' or ./DECU='carattere generale' or (starts-with(lower-case(normalize-space(./DECU)), 'nr')) or (starts-with(lower-case(normalize-space(./DECU)), 'n.r')) or (starts-with(lower-case(normalize-space(./DECU)), 'intero')) or (starts-with(lower-case(normalize-space(./DECU)), 'intera')) or (starts-with(lower-case(normalize-space(./DECU)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./DECU)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DECU)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DECU)" />
						</l0:name>
						<arco-dd:hasIconographicOrDecorativeApparatus>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
							</xsl:attribute>
						</arco-dd:hasIconographicOrDecorativeApparatus>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CulturalPropertyPart when there is AIDA -->
			<xsl:for-each select="record/metadata/schede/*/DA/AID">
				<xsl:if test="./AIDA and not(./AIDA='intero bene' or ./AIDA='integrale' or ./AIDA='tutta' or ./AIDA='totale' or ./AIDA='carattere generale' or (starts-with(lower-case(normalize-space(./AIDA)), 'nr')) or (starts-with(lower-case(normalize-space(./AIDA)), 'n.r')) or (starts-with(lower-case(normalize-space(./AIDA)), 'intero')) or (starts-with(lower-case(normalize-space(./AIDA)), 'intera')) or (starts-with(lower-case(normalize-space(./AIDA)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AIDA)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AIDA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AIDA)" />
						</l0:name>
						<arco-dd:hasIconographicOrDecorativeApparatus>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-dd:hasIconographicOrDecorativeApparatus>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CulturalPropertyPart when there is ACQP -->
			<xsl:for-each select="record/metadata/schede/*/TU/ACQ">
				<xsl:if test="./ACQP and not((starts-with(lower-case(normalize-space(./ACQP)), 'non accertabile')) or (starts-with(lower-case(normalize-space(./ACQP)), 'nr')) or (starts-with(lower-case(normalize-space(./ACQP)), 'n.r')) or (starts-with(lower-case(normalize-space(./ACQP)), 'intero')) or (starts-with(lower-case(normalize-space(./ACQP)), 'intera')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-', arco-fn:urify(normalize-space(./ACQP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ACQP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ACQP)" />
						</l0:name>
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
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- CulturalPropertyPart when there is AT -->
			<xsl:for-each select="record/metadata/schede/AT/PR/PRM">
				<xsl:if test="./PRME and not(./PRME='intero bene' or ./PRME='integrale' or ./PRME='tutta' or ./PRME='totale' or ./PRME='carattere generale' or (starts-with(lower-case(normalize-space(./PRME)), 'nr')) or (starts-with(lower-case(normalize-space(./PRME)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRME)), 'intero')) or (starts-with(lower-case(normalize-space(./PRME)), 'intera')) or (starts-with(lower-case(normalize-space(./PRME)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRME)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PRME)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PRME)" />
						</l0:name>
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-handling-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
						<xsl:if test="./PRMP">
							<arco-dd:hasPosition>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Position/', arco-fn:urify(normalize-space(./PRMP)))" />
								</xsl:attribute>
							</arco-dd:hasPosition>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/PR/PRI">
				<xsl:if test="./PRIP and not(./PRIP='intero bene' or ./PRIP='integrale' or ./PRIP='tutta' or ./PRIP='totale' or ./PRIP='carattere generale' or (starts-with(lower-case(normalize-space(./PRIP)), 'nr')) or (starts-with(lower-case(normalize-space(./PRIP)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRIP)), 'intero')) or (starts-with(lower-case(normalize-space(./PRIP)), 'intera')) or (starts-with(lower-case(normalize-space(./PRIP)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRIP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PRIP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PRIP)" />
						</l0:name>
						<arco-cd:hasIntervention>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Intervention/', $itemURI, '-specimen-intervention-', position())" />
							</xsl:attribute>
						</arco-cd:hasIntervention>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/PR/PRF">
				<xsl:if test="./PRFP and not(./PRFP='intero bene' or ./PRFP='integrale' or ./PRFP='tutta' or ./PRFP='totale' or ./PRFP='carattere generale' or (starts-with(lower-case(normalize-space(./PRFP)), 'nr')) or (starts-with(lower-case(normalize-space(./PRFP)), 'n.r')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intero')) or (starts-with(lower-case(normalize-space(./PRFP)), 'intera')) or (starts-with(lower-case(normalize-space(./PRFP)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PRFP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PRFP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PRFP)" />
						</l0:name>
						<arco-dd:hasBandage>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Bandage/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-dd:hasBandage>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/PT/PTC">
				<xsl:if test="./PTCE and not(./PTCE='intero bene' or ./PTCE='integrale' or ./PTCE='tutta' or ./PTCE='totale' or ./PTCE='carattere generale' or (starts-with(lower-case(normalize-space(./PTCE)), 'nr')) or (starts-with(lower-case(normalize-space(./PTCE)), 'n.r')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intero')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intera')) or (starts-with(lower-case(normalize-space(./PTCE)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PTCE)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PTCE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PTCE)" />
						</l0:name>
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS,'PalaeopathologySurvey/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasSurvey>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/AT/IN/INI">
				<xsl:if test="./INIE and not(./INIE='intero bene' or ./INIE='integrale' or ./INIE='tutta' or ./INIE='totale' or ./INIE='carattere generale' or (starts-with(lower-case(normalize-space(./INIE)), 'nr')) or (starts-with(lower-case(normalize-space(./INIE)), 'n.r')) or (starts-with(lower-case(normalize-space(./INIE)), 'intero')) or (starts-with(lower-case(normalize-space(./INIE)), 'intera')) or (starts-with(lower-case(normalize-space(./INIE)), 'esemplar')))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./INIE)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./INIE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./INIE)" />
						</l0:name>
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS,'Survey/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-cd:hasSurvey>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/*/SGT">
				<xsl:if test="$sheetType='PST'">
					<xsl:if test="./SGTP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(../SGTP)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./SGTP)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./SGTP)" />
							</l0:name>
							<xsl:for-each select="./SGTI">
								<arco-cd:hasSubject>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
									</xsl:attribute>
								</arco-cd:hasSubject>
							</xsl:for-each>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
				<xsl:if test="$sheetType='SMO'">
					<xsl:if test="./SGTA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(../SGTA)))" />
							</xsl:attribute>
							<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./SGTA)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./SGTA)" />
							</l0:name>
							<xsl:for-each select="./SGTI">
								<arco-cd:hasSubject>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
									</xsl:attribute>
								</arco-cd:hasSubject>
							</xsl:for-each>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/MT/PLT">
				<xsl:if test="./PLTP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./PLTP)))" />
						</xsl:attribute>
						<rdf:type rdf:resource="http://dati.beniculturali.it/cis/CulturalEntity" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PLTP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PLTP)" />
						</l0:name>
						<arco-con:hasPositionOnGroundLavel>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'PositionOnGroundLevel/', $itemURI, position())" />
							</xsl:attribute>
						</arco-con:hasPositionOnGroundLavel>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>