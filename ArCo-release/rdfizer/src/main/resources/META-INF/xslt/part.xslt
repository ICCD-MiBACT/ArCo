<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="http://w3id.org/arco/saxon-extension" xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-event="https://w3id.org/arco/ontology/cultural-event/" xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:cis="http://dati.beniculturali.it/cis/" xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:roapit="https://w3id.org/italia/onto/RO/" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:language="https://w3id.org/italia/onto/Language/"
	xmlns:frbr="http://purl.org/vocab/frbr/core#" xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	exclude-result-prefixes="xsl php">

	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />
	<!-- xsl:template match="schede/*/MT/MTA"> <xsl:for-each select="MTAP"> 
		<rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of select="concat($NS, 
		'CulturalPropertyPart/', $itemURI, '-part-', position())" />" </xsl:attribute> 
		<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" 
		/> <clvapit:hasGeometry> <xsl:attribute name="rdf:resource"> <xsl:value-of 
		select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" 
		/> </xsl:attribute> </clvapit:hasGeometry> <arco-core:isPartOf> <xsl:attribute 
		name="rdf:resource"> <xsl:value-of select="$objectOfDescription" /> </xsl:attribute> 
		</arco-core:isPartOf> </rdf:Description> </xsl:for-each> </xsl:template -->
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:variable name="itemURI">
		<xsl:choose>
			<xsl:when test="schede/*/RV/RVE/RVEL">
				<xsl:value-of
					select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(schede/*/RV/RVE/RVEL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" />

	<xsl:variable name="culturalPropertyComponent"
		select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />

	<xsl:variable name="culturalProperty"
		select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />

	<xsl:variable name="sheetVersion" select="schede/*/@version"></xsl:variable>
	<xsl:variable name="sheetType" select="name(schede/*)"></xsl:variable>
	<xsl:variable name="cp-name" select="''"></xsl:variable>
	
	<xsl:variable name="objectOfDescription">
		<xsl:choose>
			<xsl:when test="schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:value-of select="$culturalPropertyComponent" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$culturalProperty" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<rdf:RDF>
			<!-- part of cultural property when there is STCP (conservation status) -->
			<xsl:for-each select="schede/*/CO/STC">
				<xsl:variable name="conservationStatus">
					<xsl:value-of
						select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./STCP))='intero bene') and not(lower-case(normalize-space(./STCP))='integrale') and not(lower-case(normalize-space(./STCP))='tutta') and not(lower-case(normalize-space(./STCP))='totale') and (not(starts-with(lower-case(normalize-space(./STCP)), 'nr')) and not(starts-with(lower-case(normalize-space(./STCP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./STCP)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./STCP)), 'intero')) and not(starts-with(lower-case(normalize-space(./STCP)), 'intera')))">
					<xsl:for-each select="./STCP">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>

					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>

			<!-- part of cultural property when there is AUTW (author) -->
			<xsl:for-each select="schede/*/AU/AUT">
				<xsl:variable name="authorAttribution">
					<xsl:value-of
						select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
				</xsl:variable>
				<xsl:if
					test="./AUTW and not(lower-case(normalize-space(./AUTW))='intero bene') and not(lower-case(normalize-space(./AUTW))='integrale') and not(lower-case(normalize-space(./AUTW))='tutta') and not(lower-case(normalize-space(./AUTW))='totale') and (not(starts-with(lower-case(normalize-space(./AUTW)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intero')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'intera')) and not(starts-with(lower-case(normalize-space(./AUTW)), 'esemplar')))">
					<xsl:variable name="part">
						<xsl:value-of
							select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./AUTW)))" />
					</xsl:variable>
					<xsl:variable name="partLabel">
						<xsl:value-of select="normalize-space(./AUTW)" />
					</xsl:variable>
					<xsl:for-each select="./AUTW">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
							<xsl:value-of select="$part" />
						</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
							<rdfs:label>
								<xsl:value-of select="$partLabel" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="$partLabel" />
							</l0:name>

							<arco-cd:hasAuthorshipAttribution>
								<xsl:attribute name="rdf:resource">
								<xsl:value-of select="$authorAttribution" />
		                    </xsl:attribute>
							</arco-cd:hasAuthorshipAttribution>

							<arco-core:hasAuthor>
								<xsl:attribute name="rdf:resource">
		                    		<xsl:variable name="author">
				                            <xsl:choose>
				                                <xsl:when test="./AUTA">
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
				                                </xsl:when>
				                                <xsl:when
									test="../AUF/AUFA and ../AUF/AUFN">
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
				                                </xsl:when>
				                                <xsl:when
									test="../AUF/AUFA and ../AUF/AUFB">
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
				                                </xsl:when>
				                                <xsl:when test="../AUF/AUFB">
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)))" />
				                                </xsl:when>
				                                <xsl:when test="../AUF/AUFN">
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)))" />
				                                </xsl:when>
				                                <xsl:otherwise>
				                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)))" />
				                                </xsl:otherwise>
				                            </xsl:choose>
			                            </xsl:variable>
			                            <xsl:choose>
			                                <xsl:when test="./AUTS">
			                                    <xsl:value-of
									select="concat($author, '-', arco-fn:urify(normalize-space(./AUTS)))" />
			                                </xsl:when>
			                                <xsl:when test="../AUF/AUFS">
			                                    <xsl:value-of
									select="concat($author, '-', arco-fn:urify(normalize-space(../AUF/AUFS)))" />
			                                </xsl:when>
			                                <xsl:otherwise>
			                                    <xsl:value-of
									select="$author" />
			                                </xsl:otherwise>
			                            </xsl:choose>
		                    	</xsl:attribute>
							</arco-core:hasAuthor>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>

			<!-- part of cultural property when there is NVCP (protective measure) -->
			<xsl:for-each select="schede/*/TU/NVC">
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>

					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			
			<!-- part of cultural property when there is VINE (protective measure for A 2.00) -->
			<xsl:for-each select="schede/*/TU/VIN">
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>

					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>

			<!-- part of cultural property when there is MTCP (4.00, material) -->
			<xsl:if
				test="not(starts-with(lower-case(normalize-space(schede/*/MT/MTC/MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(schede/*/MT/MTC/MTCM)), 'n.r'))">
				<xsl:for-each select="schede/*/MT/MTC/MTCM">
					<xsl:variable name="material">
						<xsl:value-of
							select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-', position())" />
					</xsl:variable>
					<xsl:variable name="parentPosition">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<xsl:if
						test="not(lower-case(normalize-space(../MTCP))='intero bene') and not(lower-case(normalize-space(../MTCP))='integrale') and not(lower-case(normalize-space(../MTCP))='tutta') and not(lower-case(normalize-space(../MTCP))='totale') and (not(starts-with(lower-case(normalize-space(../MTCP)), 'nr')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'n.r')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'intero')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'intera')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'esemplar')))">
						<xsl:for-each select="../MTCP">

							<rdf:Description>
								<xsl:attribute name="rdf:about">
						 		<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
								<arco-dd:hasTechnicalDetailOccurrence>
									<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$material" />
								</xsl:attribute>
								</arco-dd:hasTechnicalDetailOccurrence>
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
			</xsl:if>

			<!-- part of cultural property when there is MTCP (4.00, technique) -->
			<xsl:if
				test="not(starts-with(lower-case(normalize-space(schede/*/MT/MTC/MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(schede/*/MT/MTC/MTCM)), 'n.r'))">
				<xsl:for-each select="schede/*/MT/MTC/MTCT">
					<xsl:variable name="technique">
						<xsl:value-of
							select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-technique-', position())" />
					</xsl:variable>
					<xsl:variable name="parentPosition">
						<xsl:value-of select="position()" />
					</xsl:variable>
					<xsl:if
						test="not(lower-case(normalize-space(../MTCP))='integrale') and not(lower-case(normalize-space(../MTCP))='tutta') and not(lower-case(normalize-space(../MTCP))='totale') and (not(starts-with(lower-case(normalize-space(../MTCP)), 'esemplar')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'intero')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'intera')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'nr')) and not(starts-with(lower-case(normalize-space(../MTCP)), 'n.r'))) or $sheetType='VeAC'">
						<xsl:for-each select="../MTCP">

							<rdf:Description>
								<xsl:attribute name="rdf:about">
						 		<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
								<arco-dd:hasTechnicalDetailOccurrence>
									<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$technique" />
								</xsl:attribute>
								</arco-dd:hasTechnicalDetailOccurrence>
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
			</xsl:if>

			<!-- part of cultural property when there is DTP (4.00, dating) -->
			<xsl:for-each select="schede/*/DT">
				<xsl:variable name="dating">
					<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./DTP))='intero bene') and not(lower-case(normalize-space(./DTP))='integrale') and not(lower-case(normalize-space(./DTP))='tutta') and not(lower-case(normalize-space(./DTP))='totale') and (not(starts-with(lower-case(normalize-space(./DTP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DTP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./DTP)), 'intero')) and not(starts-with(lower-case(normalize-space(./DTP)), 'intera')) and not(starts-with(lower-case(normalize-space(./DTP)), 'esemplar')))">
					<xsl:for-each select="./DTP">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$dating" />
								</xsl:attribute>
							</arco-cd:hasDating>
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
			
			<!-- part of cultural property when there is RSTP (4.00, intervention) -->
			<xsl:for-each select="schede/*/CO/RST">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./RSTP))='intero bene') and not(lower-case(normalize-space(./RSTP))='integrale') and not(lower-case(normalize-space(./RSTP))='tutta') and not(lower-case(normalize-space(./RSTP))='totale') and (not(starts-with(lower-case(normalize-space(./RSTP)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'n.r')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'intero')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'intera')) and not(starts-with(lower-case(normalize-space(./RSTP)), 'esemplar')))">
					<xsl:for-each select="./RSTP">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
							<arco-cd:hasIntervention>
								<xsl:choose>
									<xsl:when test="contains(normalize-space(lower-case(./RSTI)), 'consolidamento') or contains(normalize-space(lower-case(./RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(./RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(./RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(./RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(./RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(./RSTI)), 'protezione finale') or contains(normalize-space(lower-case(./RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(./RSTI)), 'trattamento parti metalliche')">
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
			
			<!-- part of cultural property when there is RSTP (< 4.00, conservation intervention) -->
			<xsl:if test="$sheetType='A'">
			<xsl:for-each select="schede/*/RS/RST">
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./RSTR))='intero bene') and not(lower-case(normalize-space(./RSTR))='integrale') and not(lower-case(normalize-space(./RSTR))='tutta') and not(lower-case(normalize-space(./RSTR))='totale') and (not(starts-with(lower-case(normalize-space(./RSTR)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'intero')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'intera')) and not(starts-with(lower-case(normalize-space(./RSTR)), 'esemplar')))">
					<xsl:for-each select="./RSTR">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			</xsl:if>
			
			<!-- part for use (A and PG) -->
			<xsl:for-each select="schede/*/US/USO">
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>

					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="schede/*/US/USA">
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>

					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			
			<xsl:for-each select="schede/*/MT/MIS">
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>
				</xsl:if>
				<xsl:if test="$sheetType='F' and ./MISO and not(lower-case(normalize-space(./MISO))='intero bene') and not(lower-case(normalize-space(./MISO))='integrale') and not(lower-case(normalize-space(./MISO))='tutta') and not(lower-case(normalize-space(./MISO))='totale') and not(starts-with(lower-case(normalize-space(./MISO)), 'nr')) and not(starts-with(lower-case(normalize-space(./MISO)), 'n.r')) and not(starts-with(lower-case(normalize-space(./MISO)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./MISO)), 'intero')) and not(starts-with(lower-case(normalize-space(./MISO)), 'intera'))">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
					 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISO)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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
						</rdf:Description>
				</xsl:if>
			</xsl:for-each>

			<!-- part of cultural property when there is RE/REN/RENR (A and PG, dating) -->
			<xsl:for-each select="schede/A/RE">
				<xsl:variable name="dating">
					<xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./REN/RENR))='intero bene') and not(lower-case(normalize-space(./REN/RENR))='integrale') and not(lower-case(normalize-space(./REN/RENR))='tutta') and not(lower-case(normalize-space(./REN/RENR))='totale') and (not(starts-with(lower-case(normalize-space(./REN/RENR)), 'nr')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'n.r')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'esemplar')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'intero')) and not(starts-with(lower-case(normalize-space(./REN/RENR)), 'intera')))">
					<xsl:for-each select="./REN/RENR">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$dating" />
								</xsl:attribute>
							</arco-cd:hasDating>
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

			<!-- part of cultural property when there is REIP (reuse) -->
			<xsl:for-each select="schede/*/RO/REI">
				<xsl:variable name="reuse">
					<xsl:value-of
						select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
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
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
							<arco-dd:hasRelatedWorkSituation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$reuse" />
								</xsl:attribute>
							</arco-dd:hasRelatedWorkSituation>
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
			<xsl:for-each select="schede/*/DA/ISE">
				<xsl:variable name="element">
					<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./ISED))='timbro'">
								
									<xsl:value-of select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./ISED))='stemma'">
								
									<xsl:value-of select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./ISED))='emblema'">
									<xsl:value-of select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./ISED))='marchio'">
									<xsl:value-of select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./ISED))='logo'">
									<xsl:value-of select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./ISED))='iscrizione'">
									<xsl:value-of select="concat($NS, 'Inscription/', $itemURI, '-affixed-element-', position())" />
							</xsl:when>
							<xsl:otherwise>
									<xsl:value-of select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
							</xsl:otherwise>
						</xsl:choose>
				</xsl:variable>
				<xsl:variable name="parentPosition">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<xsl:if
					test="not(lower-case(normalize-space(./ISER))='intero bene') and not(lower-case(normalize-space(./ISER))='integrale') and not(lower-case(normalize-space(./ISER))='tutta') and not(lower-case(normalize-space(./ISER))='totale') and (not(starts-with(lower-case(normalize-space(./ISER)), 'nr')) and not(starts-with(lower-case(normalize-space(./ISER)), 'n.r')) and not(starts-with(lower-case(normalize-space(./ISER)), 'intero')) and not(starts-with(lower-case(normalize-space(./ISER)), 'intera')) and not(starts-with(lower-case(normalize-space(./ISER)), 'esemplar')))">
					<xsl:for-each select="./ISER">

						<rdf:Description>
							<xsl:attribute name="rdf:about">
						 		<xsl:value-of
								select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
						 	</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyPart" />
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

		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>