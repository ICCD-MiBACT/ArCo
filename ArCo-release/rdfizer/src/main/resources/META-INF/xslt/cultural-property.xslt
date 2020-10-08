<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
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

	<xsl:variable name="itemURI">
	<xsl:choose>
		<xsl:when test="record/metadata/schede/*/CD/NCT/NCTN">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/RV/RVE/RVEL">
				<xsl:value-of
					select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/RV/RVE/RVEL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of
					select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
			</xsl:otherwise>
		</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
					<xsl:value-of select="record/metadata/schede/*/AC/ACC/ACCC" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/*/AC/ACC" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>

	<xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" />

	<xsl:variable name="culturalPropertyComponent"
		select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />

	<xsl:variable name="culturalProperty"
		select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />

	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version"></xsl:variable>
	<xsl:variable name="sheetType"
		select="name(record/metadata/schede/*)"></xsl:variable>
	<xsl:variable name="cp-name" select="''"></xsl:variable>

	<xsl:variable name="objectOfDescription">
		<xsl:choose>
			<xsl:when
				test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
				<xsl:value-of select="$culturalPropertyComponent" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$culturalProperty" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- xsl:import href="part.xsl" / -->

	<xsl:template match="/">

		<xsl:variable name="ogtp"
			select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />


		<!-- variable ogtt -->
		<xsl:variable name="ogtt">
			<xsl:choose>
				<xsl:when
					test="record/metadata/schede/*/OG/OGT/OGTT and not($sheetType='NU')">
					<xsl:value-of
						select="normalize-space(record/metadata/schede/*/OG/OGT/OGTT)" />
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
					<xsl:value-of
						select="normalize-space(record/metadata/schede/*/OG/SGT/SGTA)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- variable sgti -->
		<xsl:variable name="sgti">
			<xsl:choose>
				<xsl:when
					test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
					<xsl:value-of
						select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<rdf:RDF>

			<xsl:if
				test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00')">
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
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
					</rdfs:label>
					<rdf:type
						rdf:resource="https://w3id.org/arco/ontology/arco/CulturalPropertyComponent" />
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		                       <xsl:value-of
							select="arco-fn:getPropertyType($sheetType)" />
		                   </xsl:attribute>
					</rdf:type>
					<!-- rdf:type of cultural property -->
					<rdf:type>
						<xsl:attribute name="rdf:resource">
		                       <xsl:value-of
							select="arco-fn:getSpecificPropertyType($sheetType)" />
		                   </xsl:attribute>
					</rdf:type>

					<arco-arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco-arco:isCulturalPropertyComponentOf>

					<!-- labels of cultural property -->

					<!-- SMO -->
					<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv 
						perché c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi 
						solo se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo 
						se ci sono entrambi -->
					<xsl:if test="$sheetType='SMO'">


						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTA and record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgta, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTA or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgta, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- SM -->
					<!-- la parentesi di apertura viene aggiunta alla variabile ogdn perché 
						c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogdn. 
						La virgola tra ogtd e ogtt viene messa nella variabile ogtt perché c'è solo 
						se c'è ogtt -->

					<xsl:if test="$sheetType='SM'">
						<xsl:variable name="ogdn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGD/OGDN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtw">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTW))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtp">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTP))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- PST or SI -->
					<!-- la parentesi di apertura viene aggiunta alla variabile ogtn perché 
						c'è solo se c'è ogtn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogtn. 
						La virgola tra ogtd e ogtt viene messa nella variabile ogtt perché c'è solo 
						se c'è ogtt -->
					<xsl:if test="$sheetType='PST' or $sheetType='SI'">
						<xsl:variable name="ogtn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- RA -->
					<!-- le parentesi vengono inserite in choose nella label perché ci sono 
						solo se c'è $sgti. Invece, le virgole tra ogtd e ogtt e tra ogtt e ogtn vengono 
						messe nelle variabili $ogtt e $ogtn perché sono sempre presenti se ci sono 
						ogtt e ogtn -->
					<xsl:if test="$sheetType='RA'">
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtn, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtn)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- OA -->
					<!-- la virgola tra ogtd o ogtt e ogtv viene inserita nella variabile 
						ogtv perché c'è sempre se c'è ogtv. Il trattino tra ogtd e ogtt viene inserito 
						nella variabile ogtt perché c'è sempre se c'è ogtt. Invece, nella label si 
						mettono le parentesi solo se c'è o sgta o sgti, mentre si mette la virgola 
						tra sgta e sgti solo se ci sono entrambi -->

					<xsl:if test="$sheetType='OA'">
						<xsl:variable name="sgtt">
							<xsl:choose>
								<xsl:when
									test="record/metadata/schede/*/OG/SGT/SGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r')))">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when
									test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when
									test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
									<xsl:value-of
										select="concat(' - ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when
									test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- F -->
					<!-- Le parentesi le mettiamo nella label, ci sono sempre perché sia 
						sgti sia ogtd sono obbligatori. Le virgole tra ogtd ogtv ogtw ogtp le mettiamo 
						nelle tre variabili perché ci sono sempre se ci sono quegli elementi -->
					<xsl:if test="$sheetType='F'">
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtw">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTW))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(record/metadata/schede/*/SG/SGT/SGTI), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, ' - ', $ogtp, ')')" />
						</rdfs:label>
					</xsl:if>


					<!-- SAS -->
					<xsl:if test="$sheetType='SAS'">
						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- CA or MA -->
					<!-- la parentesi di apertura viene aggiunta alla variabile ogtn perché 
						c'è solo se c'è ogtn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogtn. 
						La virgola tra ogtd e ogtt viene messa nella variabile ogtc perché c'è solo 
						se c'è ogtc -->
					<xsl:if test="$sheetType='CA' or $sheetType='MA'">
						<xsl:variable name="ogtn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- AT -->
					<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv 
						perché c'è sempre se c'è ogtv. Lo stesso per la virgola tra ogtd e ogtt perché 
						sono entrambi obbligatori. La parentesi di apertura e quella di chiusura 
						sono messe nella label solo se c'è o ogtm o ogtp; la virgola tra ogtm e ogtp 
						viene messa nella label solo se ci sono entrambi -->
					<xsl:if test="$sheetType='AT'">
						<xsl:variable name="ogtm">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtp">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTM and record/metadata/schede/*/OG/OGT/OGTP">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, ', ', $ogtp, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTM or record/metadata/schede/*/OG/OGT/OGTP">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, $ogtp, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- TMA -->

					<xsl:if test="$sheetType='TMA'">
						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTM), ')')" />
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- NU -->
					<!-- sia virgola tra ogtt e ogth sia parentesi sono inserite nel choose 
						della label perché la virgola c'è solo se ci sono entrambe le variabili, 
						le parentesi solo se ce ne sono entrambe o una delle due -->
					<xsl:if test="$sheetType='NU'">

						<xsl:variable name="ogth">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTH">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTH)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTT and record/metadata/schede/*/OG/OGT/OGTH">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogth, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTH">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogth, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTO">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' - ', normalize-space(record/metadata/schede/*/OG/OGT/OGTO))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
					</xsl:if>


					<!-- OAC -->
					<!-- nella label si mettono le parentesi solo se c'è o sgta o sgti, 
						mentre si mette la virgola tra sgta e sgti solo se ci sono entrambi -->

					<xsl:if test="$sheetType='OAC'">
						<xsl:variable name="sgtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- D or MI or S -->
					<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv 
						perché c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi 
						solo se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo 
						se ci sono entrambi -->

					<xsl:if
						test="$sheetType='D' or $sheetType='MI' or $sheetType='S'">
						<xsl:variable name="sgtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>



					<!-- VeAC -->
					<!-- la parentesi di apertura viene aggiunta alla variabile ogtn perché 
						c'è solo se c'è ogtn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogtn. 
						Le virgole tra OGTD e $ogtc, $ogtf, $ogtg vengono messe nelle variabili perché 
						ci sono solo se ci sono quei campi -->
					<xsl:if test="$sheetType='VeAC'">
						<xsl:variable name="ogtn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtf">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTF">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTF))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtg">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- A -->
					<!-- la parentesi di apertura viene aggiunta alla variabile ogtn perché 
						c'è solo se c'è ogtn; quindi viene messo un choose per la rdfs:label per 
						inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogtn. 
						La virgola tra ogtd e ogtq viene messa nella variabile ogtq perché c'è solo 
						se c'è ogtq -->
					<xsl:if test="$sheetType='A'">
						<xsl:choose>
							<xsl:when
								test="$sheetVersion='3.00_ICCD0' or $sheetVersion='3.00'">
								<xsl:variable name="ogtn">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
											<xsl:value-of
												select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtq">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when
												test="record/metadata/schede/*/OG/OGT/OGTN">
												<xsl:value-of
													select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>
							</xsl:when>
							<xsl:otherwise>
								<!-- la parentesi di chiusura è inserita nel choose della label perché 
									c'è solo se c'è $ogtd; la parentesi di apertura è nella variabile $ogtd perché 
									c'è solo se c'è $ogtd; la virgola tra OGTT e $ogtq è nella variabile $ogtq 
									perché c'è sempre se c'è ogtq -->
								<xsl:variable name="ogtd">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
											<xsl:value-of
												select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtq">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>


								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when
												test="record/metadata/schede/*/OG/OGT/OGTD">
												<xsl:value-of
													select="concat($ogtd, normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>

					<!-- PG -->
					<!-- le parentesi vengono messe nella label perché ci sono sempre, essendo 
						sia ogtn sia ogtd obbligatori. Le virgole tra ogtd e ogtq e tra ogtq e ogad 
						vengono messe nella variabili ogtq e ogad perché ci sono solo quando ci sono 
						quei campi -->
					<xsl:if test="$sheetType='PG'">
						<xsl:variable name="ogtq">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogad">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGA/OGAD">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGA/OGAD))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')', $ogad, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- BDI -->
					<xsl:if test="$sheetType='BDI'">
						<xsl:choose>
							<xsl:when
								test="$sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01'">
								<!-- la virgola tra dbd e dbl viene inserita nella variabile dbl 
									perché c'è sempre se c'è dbl. Le parentesi di dbc vengono messe nella label 
									perché dbd e dbc sono obbligatori quindi ci sono sempre -->
								<xsl:variable name="dbl">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/DB/DBL">
											<!-- si usa il for-each perché DBL è ripetitivo -->
											<xsl:for-each
												select="record/metadata/schede/*/DB/DBL">
												<xsl:value-of
													select="concat(', ', normalize-space(.))" />
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/DB/DBD), $dbl, ' (', normalize-space(record/metadata/schede/*/DB/DBC), ')')" />
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>
							</xsl:when>
							<xsl:otherwise>
								<!-- la parentesi di apertura viene aggiunta alla variabile ogdn 
									perché c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label 
									per inserire la parentesi di chiusura a seconda dell'esistenza o meno di 
									$ogdn. Le virgole tra ogtd, ogtt e ctg vengono messe nelli variabili ogtt 
									perché ci sono solo se ci sono quei campi -->
								<xsl:variable name="ogdn">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
											<xsl:value-of
												select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGDN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when
												test="record/metadata/schede/*/OG/OGD/OGDN">
												<xsl:value-of
													select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG), ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>

							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>


					<!-- BDM -->
					<xsl:if test="$sheetType='BDM'">
						<xsl:choose>
							<xsl:when
								test="$sheetVersion='2.00_ICCD0' or $sheetVersion='2.00'">
								<!-- la virgola tra ogtd o ogtt e ogtg viene inserita nella variabile 
									ogtg perché c'è sempre se c'è ogtv. La virgola tra ogtd e ogtt viene inserita 
									nella variabile ogtt perché c'è sempre se c'è ogtt. Invece, nella label si 
									mettono le parentesi solo se c'è o sgta o sgti, mentre si mette la virgola 
									tra sgta e sgti solo se ci sono entrambi -->
								<xsl:variable name="sgtt">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT">
											<xsl:value-of
												select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="sgti">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
											<xsl:value-of
												select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtt">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtg">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when
												test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI">
												<xsl:value-of
													select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
											</xsl:when>
											<xsl:when
												test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
												<xsl:value-of
													select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>
							</xsl:when>
							<xsl:otherwise>
								<!-- la parentesi di apertura viene aggiunta alla variabile ogdn 
									perché c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label 
									per inserire la parentesi di chiusura a seconda dell'esistenza o meno di 
									$ogdn. Le virgole tra ogtd, ogtt e ctg vengono messe nelli variabili ogtt 
									perché ci sono solo se ci sono quei campi -->
								<xsl:variable name="ogdn">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
											<xsl:value-of
												select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGDN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtt">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ctg">
									<xsl:choose>
										<xsl:when test="record/metadata/schede/*/OG/CTG">
											<xsl:value-of
												select="concat(', ', normalize-space(record/metadata/schede/*/OG/CTG))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when
												test="record/metadata/schede/*/OG/OGD/OGDN">
												<xsl:value-of
													select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of
										select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>

							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>

					<!-- BNB -->
					<!-- il trattino tra nbna e le virgole tra ogtd e ogte e tra ogte e 
						ogtc vengono messe nelle variabili perché la loro esistenza dipende dall'esistenza 
						di quei campi -->
					<xsl:if test="$sheetType='BNB'">
						<xsl:variable name="nbna">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/SB/NBN/NBNA">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/SB/NBN/NBNA), ' - ')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogte">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTE">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTE))" />
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat($nbna, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogte, $ogtc, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- BNM or BNPE or BNZ or E -->
					<!-- le parentesi vengono inserite nella variabile ogtv perché ci sono 
						solo se c'è ogtv -->
					<xsl:if
						test="$sheetType='BNPE' or $sheetType='BNM' or $sheetType='BNZ' or $sheetType='E'">
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTV), ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- BNP -->
					<!-- sia virgola tra ogtt e ogtv sia parentesi sono inserite nel choose 
						della label perché la virgola c'è solo se ci sono entrambe le variabili, 
						le parentesi solo se ce ne sono entrambe o una delle due -->
					<xsl:if test="$sheetType='BNP'">
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="normalize-space(record/metadata/schede/*/OG/OGT/OGTV)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTT and record/metadata/schede/*/OG/OGT/OGTV">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogtv, ')')" />
									</xsl:when>
									<xsl:when
										test="record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTV">
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of
								select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- FF -->
					<xsl:if test="$sheetType='FF'">
						<rdfs:label>
							<xsl:value-of
								select="normalize-space(record/metadata/schede/*/OG/OGD/OGDN)" />
						</rdfs:label>
					</xsl:if>
				</rdf:Description>

			</xsl:if>

			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                </xsl:attribute>

				<arco-catalogue:describesCulturalProperty>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of
						select="$objectOfDescription" />
                    </xsl:attribute>
				</arco-catalogue:describesCulturalProperty>
				<arco-catalogue:lastUpdateDate>
					<xsl:value-of select="record/header/datestamp" />
				</arco-catalogue:lastUpdateDate>
			</rdf:Description>

			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$objectOfDescription" />
				</xsl:attribute>




				<xsl:for-each select="record/metadata/schede/*/*/RSE">
					<xsl:variable name="create-rel-work-situation">
						<xsl:choose>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='è contenuto in' 
							or lower-case(normalize-space(./RSER))='luogo di collocazione/localizzazione'
							or lower-case(normalize-space(./RSER))='scheda contenitore')">
								<xsl:value-of select="'arco-cd:isLocatedIn'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='era contenuto in' 
							or lower-case(normalize-space(./RSER))='luogo di provenienza')">
								<xsl:value-of
									select="'arco-cd:hasPreviousLocation'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='esecuzione/evento di riferimento' 
							or lower-case(normalize-space(./RSER))='è coinvolto in')">
								<xsl:value-of select="'arco-cd:isInvolvedIn'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='sede di realizzazione' 
							or lower-case(normalize-space(./RSER))='è stato realizzato in')">
								<xsl:value-of
									select="'arco-cd:hasCreationLocation'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='bene composto' 
							or lower-case(normalize-space(./RSER))='è compreso in')">
								<xsl:value-of select="'arco-cd:isReusedBy'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='fonte di rappresentazione' 
							or lower-case(normalize-space(./RSER))='è rappresentato in')">
								<xsl:value-of select="'arco-cd:isSubjectOf'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='relazione urbanistico ambientale' 
							or lower-case(normalize-space(./RSER))='è in relazione urbanistico - ambientale con')">
								<xsl:value-of
									select="'arco-cd:hasUrbanPlanningEnvironmentalRelationWith'" />
							</xsl:when>
							<xsl:when
								test="(lower-case(normalize-space(./RSER))='sede di rinvenimento' 
							or lower-case(normalize-space(./RSER))='è stato rinvenuto in')">
								<xsl:value-of select="'arco-cd:hasFindingLocation'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'true'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="rsec-related-property"
						select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />

					<!-- Rule #RWS -->
					<xsl:if
						test="./* and not(starts-with(lower-case(normalize-space(./RSEC)), 'nr')) and not(starts-with(lower-case(normalize-space(./RSEC)), 'n.r')) and not(lower-case(normalize-space(./RSER))='scheda storica')">
						<xsl:choose>
							<xsl:when test="$create-rel-work-situation='true'">
								<arco-cd:hasRelatedWorkSituation>
									<xsl:attribute name="rdf:resource">
										<!-- The individual typed as RelatedWorkSituation is created within the arco.xslt sheet. -->
										<xsl:value-of
										select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-1-', position())" />
									</xsl:attribute>
								</arco-cd:hasRelatedWorkSituation>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="{$create-rel-work-situation}">
									<xsl:attribute name="rdf:resource">
										<!-- The individual typed as RelatedWorkSituation is created within the arco.xslt sheet. -->
										<xsl:value-of select="$rsec-related-property" />
									</xsl:attribute>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>

				<xsl:variable name="roz-related-property"
					select="arco-fn:related-property(normalize-space(record/metadata/schede/*/*/RSE/RSEC), 'foaf')" />
				<xsl:if test="count($roz-related-property) > 0">
					<xsl:for-each select="record/metadata/schede/*/RV/ROZ">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<!-- The individual typed as RelatedWorkSituation is created within the arco.xslt sheet. -->
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-2-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>

				<xsl:if test="record/metadata/schede/*/RV/RVE/RVER">
					<xsl:if
						test="record/metadata/schede/*/RV/RVE/RVEL and not (record/metadata/schede/*/RV/RVE/RVEL='0' or record/metadata/schede/*/RV/RVE/RVEL='bene complesso')">
						<xsl:variable name="rver"
							select="record/metadata/schede/*/RV/RVE/RVER" />
						<xsl:variable name="rvel-nospace"
							select="translate($rver, ' ', '')" />
						<xsl:variable name="rvel"
							select="translate($rvel-nospace, '/', '')" />
						<xsl:variable name="rvel1"
							select="concat($rvel, '-0')" />
						<xsl:variable name="bene-complesso"
							select="concat($rvel, '-bene complesso')" />
						<xsl:variable name="cri2cp">
							<xsl:choose>
								<xsl:when
									test="record/metadata/schede/*/RV/RVE/RVER and not (record/metadata/schede/*/RV/RVE/RVER='bene componente')">
									<xsl:value-of
										select="arco-fn:catalogue-record-identifier-to-cultural-property($rvel1)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="arco-fn:catalogue-record-identifier-to-cultural-property($bene-complesso)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="count($cri2cp)>0">
							<arco-arco:isCulturalPropertyComponentOf>
								<xsl:attribute name="rdf:resource"><xsl:value-of
									select="$cri2cp" /></xsl:attribute>
							</arco-arco:isCulturalPropertyComponentOf>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if
					test="$sheetType='A' or $sheetType='PG' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')">
					<xsl:if test="record/metadata/schede/*/RV/RVE/RVES">
						<xsl:if
							test="record/metadata/schede/*/RV/RVE/RVEL and not (record/metadata/schede/*/RV/RVE/RVEL='0' or record/metadata/schede/*/RV/RVE/RVEL='bene complesso')">
							<xsl:variable name="rves"
								select="record/metadata/schede/*/RV/RVE/RVES" />
							<xsl:variable name="rvel-nospace"
								select="translate($rves, ' ', '')" />
							<xsl:variable name="rvel"
								select="translate($rvel-nospace, '/', '')" />
							<xsl:variable name="rvel1"
								select="concat($rvel, '-0')" />
							<xsl:variable name="bene-complesso"
								select="concat($rvel, '-bene complesso')" />
							<arco-arco:isCulturalPropertyComponentOf>
								<xsl:choose>
									<xsl:when
										test="record/metadata/schede/*/RV/RVE/RVES and not (record/metadata/schede/*/RV/RVE/RVEL='bene componente')">
										<xsl:value-of
											select="arco-fn:catalogue-record-identifier-to-cultural-property($rvel1)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="arco-fn:catalogue-record-identifier-to-cultural-property($bene-complesso)" />
									</xsl:otherwise>
								</xsl:choose>
							</arco-arco:isCulturalPropertyComponentOf>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<!-- tiratura di una fotografia o di una stampa -->
				<xsl:if
					test="record/metadata/schede/*/PD/TRT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/PD/TRT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/PD/TRT)), 'n.r')))">
					<arco-cd:numberInCirculation>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/PD/TRT)" />
					</arco-cd:numberInCirculation>
				</xsl:if>
				<xsl:if
					test="record/metadata/schede/*/AU/TRT/TRTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/TRT/TRTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/AU/TRT/TRTN)), 'n.r')))">
					<arco-cd:numberInCirculation>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/AU/TRT/TRTN)" />
					</arco-cd:numberInCirculation>
				</xsl:if>
				<!-- position in complex CP -->
				<xsl:if
					test="record/metadata/schede/*/OG/OGT/OGTP and ($sheetType='OA' or $sheetType='RA')">
					<arco-dd:positionInComplexCulturalProperty>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/OG/OGT/OGTP)" />
					</arco-dd:positionInComplexCulturalProperty>
				</xsl:if>
				<!-- rights -->
				<xsl:if test="record/metadata/schede/*/DA/PLC">
					<arco-cd:rights>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/DA/PLC)" />
					</arco-cd:rights>
				</xsl:if>
				<!-- Depiction -->
				<xsl:if
					test="record/metadata/schede/*/DO/FTA/FTAN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DO/FTA/FTAN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DO/FTA/FTAN)), 'n.r')))">
					<xsl:for-each
						select="record/metadata/schede/*/DO/FTA/FTAN">
						<xsl:variable name="url"
							select="arco-fn:find-link-emm(.)" />
						<xsl:for-each select="$url">
							<foaf:depiction>
								<xsl:attribute name="rdf:resource">
                                	<xsl:value-of select="." />
                        		</xsl:attribute>
							</foaf:depiction>
							<arco-cd:hasDepiction>
								<xsl:attribute name="rdf:resource">
                                	<xsl:value-of select="." />
                        		</xsl:attribute>
							</arco-cd:hasDepiction>
							<pico:preview>
								<xsl:attribute name="rdf:resource">
                                	<xsl:value-of select="." />
                        		</xsl:attribute>
							</pico:preview>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:if>
				<!-- isDescribedByCatalogueRecord -->
				<arco-catalogue:isDescribedByCatalogueRecord>
					<xsl:attribute name="rdf:resource">
                    <xsl:value-of
						select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                </xsl:attribute>
				</arco-catalogue:isDescribedByCatalogueRecord>
				<!-- Cultural institute or site -->
				<xsl:if
					test="record/metadata/schede/*/LC/LDC/LDCM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/LC/LDC/LDCM)), 'n.r')))">
					<arco-location:hasCulturalInstituteOrSite>
						<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when
							test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
									<xsl:value-of
							select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)))))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
							select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCM)))))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</arco-location:hasCulturalInstituteOrSite>
				</xsl:if>
				<!-- current physical location -->
				<xsl:if test="record/metadata/schede/*/LC">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
	                        </xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<!-- alternative locations -->
				<xsl:for-each select="record/metadata/schede/*/LA">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
									 <xsl:value-of
							select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-alternative-', position())" />
								</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:for-each>
				<!-- production realization location for BDM < version 4.00 -->
				<xsl:for-each
					select="record/metadata/schede/BDM/AU/LDF">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
									 <xsl:value-of
							select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-production-realization-', position())" />
								</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:for-each>
				<!-- shot location -->
				<xsl:if test="record/metadata/schede/F/LR">
					<arco-location:hasTimeIndexedTypedLocation>
						<xsl:attribute name="rdf:resource">
									 <xsl:value-of
							select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-shot')" />
								</xsl:attribute>
					</arco-location:hasTimeIndexedTypedLocation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/LC/PVC/*">
					<arco-location:hasCulturalPropertyAddress>
						<xsl:attribute name="rdf:resource">
	                            <xsl:choose>
										<xsl:when
							test="record/metadata/schede/*/LC/PVC/PVCS and not(lower-case(normalize-space(record/metadata/schede/*/LC/PVC/PVCS))='italia')">
											<xsl:value-of
							select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCS)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCE)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI))))))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when
							test="record/metadata/schede/*/LC/PVC/PVCI">
													<xsl:value-of
							select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCI)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of
							select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCP)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCC)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCF)), normalize-space(lower-case(record/metadata/schede/*/LC/PVC/PVCL)), normalize-space(lower-case(record/metadata/schede/*/LC/PVL/PVLT)), normalize-space(lower-case(record/metadata/schede/*/LC/LDC/LDCU)))))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
	                        </xsl:attribute>
					</arco-location:hasCulturalPropertyAddress>
				</xsl:if>
				<!-- has number of components -->
				<xsl:if
					test="record/metadata/schede/*/OG/QNT/QNTN or record/metadata/schede/*/OG/QNT/QNTS">
					<arco-arco:numberOfComponents>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/QNT/QNTN">
								<xsl:value-of
									select="normalize-space(record/metadata/schede/*/OG/QNT/QNTN)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/QNT/QNTS">
								<xsl:value-of
									select="normalize-space(record/metadata/schede/*/OG/QNT/QNTS)" />
							</xsl:when>
						</xsl:choose>
					</arco-arco:numberOfComponents>
				</xsl:if>

				<!-- has number of elements -->
				<xsl:if
					test="record/metadata/schede/*/OG/QNT/QNTI or record/metadata/schede/*/OG/QNT/QNTS">
					<arco-arco:numberOfElements>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/QNT/QNTI">
								<xsl:value-of
									select="normalize-space(record/metadata/schede/*/OG/QNT/QNTI)" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/QNT/QNTS">
								<xsl:value-of
									select="normalize-space(record/metadata/schede/*/OG/QNT/QNTS)" />
							</xsl:when>
						</xsl:choose>
					</arco-arco:numberOfElements>
				</xsl:if>

				<!-- position in sequence -->
				<xsl:if test="record/metadata/schede/*/OG/QNT/QNTO">
					<arco-arco:positionInSequence>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/OG/QNT/QNTO)" />
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
						<xsl:when test="record/metadata/schede/NU/DA/DES/DESA and not(record/metadata/schede/NU/DA/DES/DESO)">
							<arco-core:description>
								<xsl:value-of select="concat('Dritto: ', normalize-space(record/metadata/schede/NU/DA/DES/DESA), '. Rovescio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESM))"/>
							</arco-core:description>
						</xsl:when>
						<xsl:when test="record/metadata/schede/*/DA/DES/DESS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESS)), 'n.r'))) and not(record/metadata/schede/*/DA/DES/DESO)">
							<arco-core:description>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESS)"/>
							</arco-core:description>
						</xsl:when>
						<xsl:when test="not(record/metadata/schede/*/DA/DES/*)">
							<arco-core:description>
								<xsl:value-of
									select="normalize-space(record/metadata/schede/*/DA/DES)" />
							</arco-core:description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- keywords (PST) -->
				<xsl:if
					test="(not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTC)), 'n.r')))">
					<xsl:for-each select="record/metadata/schede/*/CT/CTC">
						<arco-core:keyword>
							<xsl:value-of select="normalize-space(.)" />
						</arco-core:keyword>
					</xsl:for-each>
				</xsl:if>
				<!-- main discipline (PST) -->
				<xsl:if
					test="(not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTP)), 'n.r')))">
					<xsl:for-each select="record/metadata/schede/*/CT/CTP">
						<arco-arco:hasMainDiscipline>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
								select="concat($NS, 'SubjectDiscipline/', arco-fn:urify(normalize-space(.)))" />
		                	</xsl:attribute>
						</arco-arco:hasMainDiscipline>
					</xsl:for-each>
				</xsl:if>
				<!-- alternative discipline (PST) -->
				<xsl:if
					test="(not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/CT/CTA)), 'n.r')))">
					<xsl:for-each select="record/metadata/schede/*/CT/CTA">
						<arco-arco:hasAlternativeDiscipline>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
								select="concat($NS, 'SubjectDiscipline/', arco-fn:urify(normalize-space(.)))" />
		                	</xsl:attribute>
						</arco-arco:hasAlternativeDiscipline>
					</xsl:for-each>
				</xsl:if>
				<!-- archaeological material (TMA) -->
				<xsl:for-each select="record/metadata/schede/TMA/MA">
					<xsl:if
						test="(not(starts-with(lower-case(normalize-space(./MAC/MACC)), 'nr')) and not(starts-with(lower-case(normalize-space(./MAC/MACC)), 'n.r')))">
						<arco-core:hasPart>
							<xsl:attribute name="rdf:resource">
							<xsl:choose>
								<xsl:when test="./MAC/MACD">
									<xsl:value-of
								select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MACC)), arco-fn:urify(normalize-space(./MACD)))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
								select="concat($NS, 'ArchaeologicalMaterial/', $itemURI, '-', position(), arco-fn:urify(normalize-space(./MACC)))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						</arco-core:hasPart>
					</xsl:if>
				</xsl:for-each>
				<!-- AT -->
				<xsl:if test="record/metadata/schede/AT/OG/OGT/OGTM">
					<arco-dd:anthropologicalMaterialMorphology>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/AT/OG/OGT/OGTM)" />
					</arco-dd:anthropologicalMaterialMorphology>
				</xsl:if>
				<!-- OGCD -->
				<xsl:if
					test="not($sheetType='AT') and record/metadata/schede/*/OG/OGC/OGCD">
					<arco-arco:definitionAndPositionOfComponents>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/OG/OGC/OGCD)" />
					</arco-arco:definitionAndPositionOfComponents>
				</xsl:if>
				<!-- cadastral identity -->
				<xsl:for-each select="record/metadata/schede/*/CS">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
							select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                	</xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<!-- historical cadastral identity -->
				<xsl:if test="record/metadata/schede/*/LS/CSS/*">
					<xsl:for-each select="record/metadata/schede/*/LS/CSS">
						<arco-location:hasCadastralIdentity>
							<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
								select="concat($NS, 'CadastralIdentity/', $itemURI, '-historical-', position())" />
		                	</xsl:attribute>
						</arco-location:hasCadastralIdentity>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/A/UB/CTS">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
							select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                	</xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/RP/LGC">
					<arco-location:hasCadastralIdentity>
						<xsl:attribute name="rdf:resource">
		                		<xsl:value-of
							select="concat($NS, 'CadastralIdentity/', $itemURI, '-', position())" />
		                	</xsl:attribute>
					</arco-location:hasCadastralIdentity>
				</xsl:for-each>
				<!-- fruition (VeAC) -->
				<xsl:if test="record/metadata/schede/*/AU/FRU">
					<xsl:for-each select="record/metadata/schede/*/AU/FRU">
						<arco-cd:hasFruition>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
	                			</xsl:attribute>
						</arco-cd:hasFruition>
					</xsl:for-each>
				</xsl:if>
				<!-- authorship attribution -->
				<xsl:for-each select="record/metadata/schede/*/AU/ATB">
					<xsl:if
						test="(not(starts-with(lower-case(normalize-space(./ATBD)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATBD)), 'n.r')))">
						<arco-cd:hasAuthorshipAttribution>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
								select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
	                        </xsl:attribute>
						</arco-cd:hasAuthorshipAttribution>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/AAT">
					<arco-cd:hasAuthorshipAttribution>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
	                        </xsl:attribute>
					</arco-cd:hasAuthorshipAttribution>
				</xsl:for-each>
				<!-- AU/AUT -->
				<xsl:for-each select="record/metadata/schede/*/AU/AUT">
					<xsl:if
						test="./AUTN and (not(starts-with(lower-case(normalize-space(./AUTN)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTN)), 'n.r')))">
						<xsl:choose>
							<xsl:when
								test="./* and (not(./AUTW) or ./AUTW='intero bene' or ./AUTW='integrale' or ./AUTW='tutta' or ./AUTW='totale') or (starts-with(lower-case(normalize-space(./AUTW)), 'nr')) or (starts-with(lower-case(normalize-space(./AUTW)), 'n.r')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intero')) or (starts-with(lower-case(normalize-space(./AUTW)), 'intera')) or (starts-with(lower-case(normalize-space(./AUTW)), 'esemplar'))">
								<arco-cd:hasAuthorshipAttribution>
									<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
										select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
				                        </xsl:attribute>
								</arco-cd:hasAuthorshipAttribution>
								<arco-cd:hasAuthor>
									<xsl:attribute name="rdf:resource">
				                    		<xsl:variable name="author">
					                            <xsl:choose>
					                                <xsl:when
										test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
					                                </xsl:when>
					                                <xsl:when
										test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
					                                </xsl:when>
					                                <xsl:otherwise>
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
					                                </xsl:otherwise>
					                            </xsl:choose>
				                            </xsl:variable>
				                            <xsl:value-of
										select="$author" />
				                    	</xsl:attribute>
								</arco-cd:hasAuthor>
								<dc:creator>
									<xsl:attribute name="rdf:resource">
				                    		<xsl:variable name="author">
					                            <xsl:choose>
					                                <xsl:when
										test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
					                                </xsl:when>
					                                <xsl:when
										test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
					                                </xsl:when>
					                                <xsl:otherwise>
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
					                                </xsl:otherwise>
					                            </xsl:choose>
				                            </xsl:variable>
				                            <xsl:value-of
										select="$author" />
				                    	</xsl:attribute>
								</dc:creator>
								<pico:author>
									<xsl:attribute name="rdf:resource">
				                    		<xsl:variable name="author">
					                            <xsl:choose>
					                                <xsl:when
										test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTS)))" />
					                                </xsl:when>
					                                <xsl:when
										test="./AUTA and (not(starts-with(lower-case(normalize-space(./AUTA)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTA)), 'n.r')))">
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUTN, '-', ./AUTA)))" />
					                                </xsl:when>
					                                <xsl:otherwise>
					                                    <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:arcofy(./AUTN))" />
					                                </xsl:otherwise>
					                            </xsl:choose>
				                            </xsl:variable>
				                            <xsl:value-of
										select="$author" />
				                    	</xsl:attribute>
								</pico:author>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./AUTW">
									<arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
					                				<xsl:value-of
											select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
					                	</xsl:attribute>
									</arco-core:hasPart>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
				<!-- AU/AUF (F version 2.00, 3.00) -->
				<xsl:for-each select="record/metadata/schede/F/AU/AUF">
					<xsl:if
						test="./* and ./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFB)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">

						<arco-cd:hasAuthorshipAttribution>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-photographer-', position())" />
		                        </xsl:attribute>
						</arco-cd:hasAuthorshipAttribution>
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
		                    		<xsl:variable name="author">
			                            	<xsl:choose>
			                                	<xsl:when
								test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when
								test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when test="./AUFB">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
			                                	</xsl:when>
			                                	<xsl:otherwise>
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
			                                	</xsl:otherwise>
				                            </xsl:choose>
			                            </xsl:variable>
			                            <xsl:choose>
			                                <xsl:when test="./AUFS">
			                                    <xsl:value-of
								select="concat($author, '-', arco-fn:urify(normalize-space(./AUFS)))" />
			                                </xsl:when>
			                                <xsl:otherwise>
			                                    <xsl:value-of
								select="$author" />
			                                </xsl:otherwise>
			                            </xsl:choose>
		                    	</xsl:attribute>
						</arco-cd:hasAuthor>
						<dc:creator>
							<xsl:attribute name="rdf:resource">
		                    		<xsl:variable name="author">
			                            	<xsl:choose>
			                                	<xsl:when
								test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when
								test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when test="./AUFB">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
			                                	</xsl:when>
			                                	<xsl:otherwise>
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
			                                	</xsl:otherwise>
				                            </xsl:choose>
			                            </xsl:variable>
			                            <xsl:choose>
			                                <xsl:when test="./AUFS">
			                                    <xsl:value-of
								select="concat($author, '-', arco-fn:urify(normalize-space(./AUFS)))" />
			                                </xsl:when>
			                                <xsl:otherwise>
			                                    <xsl:value-of
								select="$author" />
			                                </xsl:otherwise>
			                            </xsl:choose>
		                    	</xsl:attribute>
						</dc:creator>
						<pico:author>
							<xsl:attribute name="rdf:resource">
		                    		<xsl:variable name="author">
			                            	<xsl:choose>
			                                	<xsl:when
								test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when
								test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
			                                	</xsl:when>
			                                	<xsl:when test="./AUFB">
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
			                                	</xsl:when>
			                                	<xsl:otherwise>
			                                    	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
			                                	</xsl:otherwise>
				                            </xsl:choose>
			                            </xsl:variable>
			                            <xsl:choose>
			                                <xsl:when test="./AUFS">
			                                    <xsl:value-of
								select="concat($author, '-', arco-fn:urify(normalize-space(./AUFS)))" />
			                                </xsl:when>
			                                <xsl:otherwise>
			                                    <xsl:value-of
								select="$author" />
			                                </xsl:otherwise>
			                            </xsl:choose>
		                    	</xsl:attribute>
						</pico:author>
					</xsl:if>
				</xsl:for-each>
				<!-- author for BDM < 4.00 -->
				<xsl:for-each
					select="record/metadata/schede/BDM/AU/AUF">
					<xsl:if
						test="./AUFN and not(starts-with(lower-case(normalize-space(./AUFN)), 'n.r')) and not(starts-with(lower-case(normalize-space(./AUFN)), 'nr'))">
						<arco-cd:hasAuthorshipAttribution>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, position())" />
		                        </xsl:attribute>
						</arco-cd:hasAuthorshipAttribution>
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when
								test="./AUFN and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
										<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:when test="./AUFN">
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
		                            </xsl:when>
		                            <xsl:when
								test="./AUFB and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
		                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:otherwise> 
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
									</xsl:otherwise>
								</xsl:choose>
                            </xsl:attribute>
						</arco-cd:hasAuthor>
						<dc:creator>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when
								test="./AUFN and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
										<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:when test="./AUFN">
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
		                            </xsl:when>
		                            <xsl:when
								test="./AUFB and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
		                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:otherwise> 
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
									</xsl:otherwise>
								</xsl:choose>
                            </xsl:attribute>
						</dc:creator>
						<pico:author>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when
								test="./AUFN and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
										<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFN, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:when test="./AUFN">
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFN))" />
		                            </xsl:when>
		                            <xsl:when
								test="./AUFB and (./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))))">
		                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./AUFB, '-', ./AUFS)))" />
		                            </xsl:when>
		                            <xsl:otherwise> 
		                            	<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(./AUFB))" />
									</xsl:otherwise>
								</xsl:choose>
                            </xsl:attribute>
						</pico:author>
					</xsl:if>
				</xsl:for-each>
				<!-- archivalrecordset membership -->
				<xsl:if test="record/metadata/schede/*/UB/UBF/*">
					<arco-cd:isMemberOfArchivalRecordSet>
						<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
							select="concat($NS, 'ArchivalRecordSetMembership/', $itemURI)" />
		                        </xsl:attribute>
					</arco-cd:isMemberOfArchivalRecordSet>
				</xsl:if>
				<!-- photographicseries membership -->
				<xsl:if test="record/metadata/schede/F/PD/SFI/*">
					<xsl:for-each select="record/metadata/schede/F/PD/SFI">
						<arco-cd:isMemberOfPhotographicSeries>
							<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
								select="concat($NS, 'PhotographicSeriesMembership/', $itemURI, position())" />
	                        </xsl:attribute>
						</arco-cd:isMemberOfPhotographicSeries>
					</xsl:for-each>
				</xsl:if>

				<!-- responsibility (F and FF) -->
				<xsl:for-each select="record/metadata/schede/*/PD/PDF">
					<arco-cd:hasResponsibility>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat($NS, 'Responsibility/', $itemURI, '-', position())" />
	                    </xsl:attribute>
					</arco-cd:hasResponsibility>
				</xsl:for-each>
				<!-- inventory -->
				<xsl:for-each select="record/metadata/schede/*/UB/INV">
					<xsl:if test="./*">
						<arco-cd:hasInventory>
							<xsl:attribute name="rdf:resource">
		                			<xsl:value-of
								select="concat($NS, 'Inventory/', $itemURI, '-', position())" />
		                		</xsl:attribute>
						</arco-cd:hasInventory>
					</xsl:if>
				</xsl:for-each>
				<!-- Estimate for version 2.00 -->
				<xsl:if
					test="record/metadata/schede/*/UB/INV/INVS and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
					<arco-cd:hasEstimate>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'CulturalPropertyEstimate/', $itemURI)" />
	                        </xsl:attribute>
					</arco-cd:hasEstimate>
				</xsl:if>
				<!-- commission -->
				<xsl:for-each select="record/metadata/schede/*/AU/CMM">
					<arco-cd:hasCommission>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Commission/', $itemURI, '-', position())" />
	                        </xsl:attribute>
					</arco-cd:hasCommission>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/AU/EDT">
					<xsl:if test="$sheetType='OAC' or $sheetType='S'">
						<xsl:if test="./EDTN">
							<arco-cd:hasEdition>
								<xsl:attribute name="rdf:resource">
	                                <xsl:choose>
	                                    <xsl:when
									test="./EDTE and ./EDTL">
	                                        <xsl:value-of
									select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)), '-', arco-fn:urify(normalize-space(./EDTL)))" />
	                                    </xsl:when>
	                                    <xsl:when test="./EDTE">
	                                        <xsl:value-of
									select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)))" />
	                                    </xsl:when>
	                                    <xsl:when test="./EDTL">
	                                        <xsl:value-of
									select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTL)))" />
	                                    </xsl:when>
	                                    <xsl:otherwise>
	                                        <xsl:value-of
									select="concat($NS, 'Edition/', $itemURI, '-', position())" />
	                                    </xsl:otherwise>
	                                </xsl:choose>
	                            </xsl:attribute>
							</arco-cd:hasEdition>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!-- has dating -->
				<xsl:for-each select="record/metadata/schede/*/DT">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./DTP) or ./DTP='intero bene' or ./DTP='integrale' or ./DTP='tutta' or ./DTP='totale') or (starts-with(lower-case(normalize-space(./DTP)), 'nr')) or (starts-with(lower-case(normalize-space(./DTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./DTP)), 'intero')) or (starts-with(lower-case(normalize-space(./DTP)), 'intera')) or (starts-with(lower-case(normalize-space(./DTP)), 'esemplar'))">
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			                        </xsl:attribute>
							</arco-cd:hasDating>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./DTP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- has dating for BDM < 4.00 norm -->
				<xsl:for-each
					select="record/metadata/schede/BDM/AU/DTF">
					<arco-cd:hasDating>
						<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
							select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			                        </xsl:attribute>
					</arco-cd:hasDating>
				</xsl:for-each>
				<!-- has dating for A norm -->
				<xsl:for-each select="record/metadata/schede/A/RE">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./REN/RENR) or ./REN/RENR='intero bene' or ./REN/RENR='integrale' or ./REN/RENR='tutta' or ./REN/RENR='totale') or (starts-with(lower-case(normalize-space(./REN/RENR)), 'nr')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'n.r')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intero')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'intera')) or (starts-with(lower-case(normalize-space(./REN/RENR)), 'esemplar'))">
							<arco-cd:hasDating>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			                        </xsl:attribute>
							</arco-cd:hasDating>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./REN/RENR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- has author for BDM < 4.00 -->

				<!-- Measurement -->
				<xsl:for-each select="record/metadata/schede/*/MT/MIS">
					<xsl:choose>
						<xsl:when
							test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP and not(lower-case(normalize-space(./MISP))='intero bene' or lower-case(normalize-space(./MISP))='integrale' or lower-case(normalize-space(./MISP))='tutta' or lower-case(normalize-space(./MISP))='totale' or (starts-with(lower-case(normalize-space(./MISP)), 'nr')) or (starts-with(lower-case(normalize-space(./MISP)), 'n.r')))">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
				              		<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISP)))" />
				                </xsl:attribute>
							</arco-core:hasPart>
						</xsl:when>
						<xsl:when
							test="$sheetType='F' and ./MISO and not(lower-case(normalize-space(./MISO))='intero bene' or lower-case(normalize-space(./MISO))='integrale' or lower-case(normalize-space(./MISO))='tutta' or lower-case(normalize-space(./MISO))='totale' or (starts-with(lower-case(normalize-space(./MISO)), 'nr')) or (starts-with(lower-case(normalize-space(./MISO)), 'n.r')))">
							<arco-core:hasPart>
								<xsl:attribute name="rdf:resource">
				              		<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./MISO)))" />
				                </xsl:attribute>
							</arco-core:hasPart>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="measurement-collection">
								<xsl:choose>
									<xsl:when
										test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP">
										<xsl:value-of
											select="concat($NS, 'MeasurementCollection/', $itemURI, '-', arco-fn:urify(normalize-space(./MISP)))" />
									</xsl:when>
									<xsl:when
										test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and not(./MISP)">
										<xsl:value-of
											select="concat($NS, 'MeasurementCollection/', $itemURI)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
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
				<!-- mibact scope of protection (AMB) -->
				<xsl:if test="record/metadata/schede/*/OG/AMB">
					<xsl:for-each select="record/metadata/schede/*/OG/AMB">
						<arco-arco:hasMibacScopeOfProtection>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(.))='archeologico'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/ontology/arco/ArchaeologicalScope'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(.))='architettonico e paesaggistico'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/ontology/arco/ArchitecturalLandscapeScope'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(.))='etnoantropologico'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/ontology/arco/EthnoAnthropologicalScope'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(.))='storico artistico'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/ontology/arco/HistoricalArtisticScope'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
								select="concat($NS, 'MibacScopeOfProtection/', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-arco:hasMibacScopeOfProtection>
						<!-- mibact scope of protection as an individual -->
						<xsl:choose>
							<xsl:when
								test="lower-case(normalize-space(.))='archeologico'" />
							<xsl:when
								test="lower-case(normalize-space(.))='architettonico e paesaggistico'" />
							<xsl:when
								test="lower-case(normalize-space(.))='etnoantropologico'" />
							<xsl:when
								test="lower-case(normalize-space(.))='storico artistico'" />
							<xsl:when test=".">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <xsl:value-of
										select="concat($NS, 'MibacScopeOfProtection/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:attribute>
									<rdf:type
										rdf:resource="https://w3id.org/arco/ontology/arco/MibacScopeOfProtection" />
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
				<xsl:for-each select="record/metadata/schede/*/CO/RST">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./RSTP) or ./RSTP='intero bene' or ./RSTP='integrale' or ./RSTP='tutta' or ./RSTP='totale') or (starts-with(lower-case(normalize-space(./RSTP)), 'nr')) or (starts-with(lower-case(normalize-space(./RSTP)), 'n.r')) or (starts-with(lower-case(normalize-space(./RSTP)), 'intero')) or (starts-with(lower-case(normalize-space(./RSTP)), 'intera')) or (starts-with(lower-case(normalize-space(./RSTP)), 'esemplar'))">
							<arco-cd:hasIntervention>
								<xsl:choose>
									<xsl:when
										test="contains(normalize-space(lower-case(./RSTI)), 'consolidamento') or contains(normalize-space(lower-case(./RSTI)), 'controllo microclimatico') or contains(normalize-space(lower-case(./RSTI)), 'trattamento biocida-disinfestazione') or contains(normalize-space(lower-case(./RSTI)), 'rimozione di elementi non originali') or contains(normalize-space(lower-case(./RSTI)), 'pulitura meccanica') or contains(normalize-space(lower-case(./RSTI)), 'pulitura chimica') or contains(normalize-space(lower-case(./RSTI)), 'protezione finale') or contains(normalize-space(lower-case(./RSTI)), 'riadesione parti') or contains(normalize-space(lower-case(./RSTI)), 'trattamento parti metalliche')">
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Intervention/', $itemURI, '-intervention-', position())" />
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-cd:hasIntervention>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./RSTP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- intervention (RS/RST) -->
				<xsl:for-each select="record/metadata/schede/*/RS/RST">
					<xsl:choose>
						<xsl:when
							test="./* and $sheetType='A' and (not(./RSTR) or ./RSTR='intero bene' or ./RSTR='integrale' or ./RSTR='tutta' or ./RSTR='totale') or (starts-with(lower-case(normalize-space(./RSTR)), 'nr')) or (starts-with(lower-case(normalize-space(./RSTR)), 'n.r')) or (starts-with(lower-case(normalize-space(./RSTR)), 'intero')) or (starts-with(lower-case(normalize-space(./RSTR)), 'intera')) or (starts-with(lower-case(normalize-space(./RSTR)), 'esemplar'))">
							<arco-cd:hasIntervention>
								<xsl:attribute name="rdf:resource">
											<xsl:value-of
									select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
										</xsl:attribute>
							</arco-cd:hasIntervention>
						</xsl:when>
						<xsl:when test="$sheetType='A'">
							<xsl:for-each select="./RSTR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="./*">
							<arco-cd:hasIntervention>
								<xsl:attribute name="rdf:resource">
											<xsl:value-of
									select="concat($NS, 'ConservationIntervention/', $itemURI, '-conservation-intervention-', position())" />
										</xsl:attribute>
							</arco-cd:hasIntervention>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
				<!-- member of collection -->
				<xsl:for-each select="record/metadata/schede/*/UB/COL">
					<xsl:if test="./*">
						<arco-cd:isMemberOfCollection>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
		                        </xsl:attribute>
						</arco-cd:isMemberOfCollection>
					</xsl:if>
				</xsl:for-each>
				<!-- other cultural property records -->
				<xsl:for-each select="record/metadata/schede/*/AC/ACS">
					<xsl:if test="./*">
						<arco-catalogue:isDescribedBy>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'CulturalPropertyRecord/', $itemURI, '-', position())" />
							</xsl:attribute>
						</arco-catalogue:isDescribedBy>
					</xsl:if>
				</xsl:for-each>
				<!-- conservation status -->
				<xsl:for-each select="record/metadata/schede/*/CO/STC">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./STCP) or ./REIP='intero bene' or ./STCP='integrale' or ./REIP='tutta' or ./STCP='totale') or (starts-with(lower-case(normalize-space(./STCP)), 'nr')) or (starts-with(lower-case(normalize-space(./STCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./STCP)), 'intero')) or (starts-with(lower-case(normalize-space(./STCP)), 'intera')) or (starts-with(lower-case(normalize-space(./STCP)), 'esemplar'))">
							<arco-dd:hasConservationStatus>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
		                        </xsl:attribute>
							</arco-dd:hasConservationStatus>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./STCP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="record/metadata/schede/*/CO/STP">
					<arco-dd:proposedIntervention>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/CO/STP)" />
					</arco-dd:proposedIntervention>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CO/STD">
					<arco-dd:storageConditions>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/CO/STD)" />
					</arco-dd:storageConditions>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/CO/STC/STCM">
					<arco-dd:storageConditions>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/CO/STC/STCM)" />
					</arco-dd:storageConditions>
				</xsl:if>
				<!-- information gathered on site -->
				<xsl:if test="record/metadata/schede/*/DA/NRL">
					<arco-cd:informationGatheredOnSite>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/DA/NRL)" />
					</arco-cd:informationGatheredOnSite>
				</xsl:if>
				<!-- historical information -->
				<xsl:if test="record/metadata/schede/*/DA/NSC">
					<arco-cd:historicalInformation>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/DA/NSC)" />
					</arco-cd:historicalInformation>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/DA/NCS">
					<arco-cd:historicalInformation>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/DA/NCS)" />
					</arco-cd:historicalInformation>
				</xsl:if>
				<!-- explanation note -->
				<xsl:if test="record/metadata/schede/CA/DA/INT">
					<arco-cd:explanationNote>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/CA/DA/INT)" />
					</arco-cd:explanationNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/TMA/DA/DES/DESI">
					<arco-cd:explanationNote>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/TMA/DA/DES/DESI)" />
					</arco-cd:explanationNote>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SI/DA/NSC">
					<arco-dd:explanationNote>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/SI/DA/NSC)" />
					</arco-dd:explanationNote>
				</xsl:if>
				<!-- functional purpose for MA and CA -->
				<xsl:if
					test="record/metadata/schede/*/OG/OGT/OGTF and ($sheetType='CA' or $sheetType='MA')">
					<arco-dd:hasFunctionalPurpose>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'FunctionalPurpose/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)))" />
	                        </xsl:attribute>
					</arco-dd:hasFunctionalPurpose>
				</xsl:if>
				<!-- heritage protection agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/ECP">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
		                        </xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-arco:hasHeritageProtectionAgency>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                        </xsl:attribute>
						</arco-arco:hasHeritageProtectionAgency>
					</xsl:if>
				</xsl:for-each>
				<!-- cataloguing agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/ESC">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
		                        </xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-arco:hasCataloguingAgency>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                        </xsl:attribute>
						</arco-arco:hasCataloguingAgency>
					</xsl:if>
				</xsl:for-each>
				<!-- proponent agency -->
				<xsl:for-each select="record/metadata/schede/*/CD/EPR">
					<xsl:if test=".">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
		                        </xsl:attribute>
						</arco-core:hasAgentRole>
						<arco-cd:hasProponentAgency>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
		                        </xsl:attribute>
						</arco-cd:hasProponentAgency>
					</xsl:if>
				</xsl:for-each>
				<!-- Type of context for LC -->
				<xsl:for-each select="record/metadata/schede/*/LC/PVZ">
					<arco-location:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
	                            <xsl:choose>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto urbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Urban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto suburbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Suburban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto territoriale'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Territorial'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Underwater'" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of
							select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
	                                </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:attribute>
					</arco-location:hasTypeOfContext>
				</xsl:for-each>
				<!-- Type of context for LA -->
				<xsl:for-each select="record/metadata/schede/*/LA/PRZ">
					<arco-location:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
	                            <xsl:choose>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto urbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Urban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto suburbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Suburban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto territoriale'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Territorial'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/ontology/location/Underwater'" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of
							select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
	                                </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:attribute>
					</arco-location:hasTypeOfContext>
				</xsl:for-each>
				<!-- Cultural property category -->
				<xsl:if test="record/metadata/schede/*/OG/CTG">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/CTG)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/RA/OG/CLS">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/RA/OG/CLS)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/MA/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/MA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/CA/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/CA/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTC">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/OG/OGT/OGTC)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<xsl:if test="record/metadata/schede/AT/OG/OGT/OGTP">
					<arco-arco:hasCulturalPropertyCategory>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGT/OGTP)))" />
	                    </xsl:attribute>
					</arco-arco:hasCulturalPropertyCategory>
				</xsl:if>
				<!-- detection method -->
				<xsl:if test="record/metadata/schede/*/OG/OGM">
					<arco-cd:hasDetectionMethod>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/DetectionMethod/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGM)))" />
	                    </xsl:attribute>
					</arco-cd:hasDetectionMethod>
				</xsl:if>
				<!-- detection method for SI -->
				<xsl:if test="record/metadata/schede/SI/OG/OGT/OGTA">
					<arco-cd:hasDetectionMethod>
						<xsl:attribute name="rdf:resource">
	                        <xsl:value-of
							select="concat('https://w3id.org/arco/resource/DetectionMethod/', arco-fn:urify(normalize-space(record/metadata/schede/SI/OG/OGT/OGTA)))" />
	                    </xsl:attribute>
					</arco-cd:hasDetectionMethod>
				</xsl:if>
				<!-- Acquisition of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ACQ">
					<arco-cd:hasAcquisition>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasAcquisition>
				</xsl:for-each>
				<!-- Change of availability of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ALN">
					<arco-cd:hasChangeOfAvailability>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
	                		</xsl:attribute>
					</arco-cd:hasChangeOfAvailability>
				</xsl:for-each>
				<!-- Photographic Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/FTA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Graphic or cartographic Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/DRA">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Film Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/VDC">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Audio Documentation of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/REG">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Sources and Documents of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/FNT">
					<arco-cd:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
	                		</xsl:attribute>
					</arco-cd:hasDocumentation>
				</xsl:for-each>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/DO/BIB">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
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
						<xsl:when
							test="not(record/metadata/schede/*/MT/MTA/MTAP) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTA/MTAP)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTA/MTAP)), 'n.r'))">
							<xsl:for-each select="record/metadata/schede/*/GP">
								<clvapit:hasGeometry>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
			                			</xsl:attribute>
								</clvapit:hasGeometry>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="record/metadata/schede/*/GP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', position())" />
			                			</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/GA">
					<xsl:if test="record/metadata/schede/*/GA/*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
	                			</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/GL">
					<xsl:if test="record/metadata/schede/*/GL/*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
	                			</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/GE">
					<xsl:if test="record/metadata/schede/*/GE/*/*">
						<clvapit:hasGeometry>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
	                			</xsl:attribute>
						</clvapit:hasGeometry>
					</xsl:if>
				</xsl:for-each>
				<!-- Geometry for geocoding -->
				<xsl:if test="record/metadata/schede/harvesting/geocoding/*">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
			                <xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
			            </xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>
				<!-- Geometry for RA 2.00 -->
				<xsl:if test="record/metadata/schede/*/RP/LGI">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
	            		</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>
				<!-- Geometry for A 2.00 -->
				<xsl:if test="record/metadata/schede/*/CR">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-point')" />
	            		</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:if>

				<xsl:for-each
					select="record/metadata/schede/*/*/SGT/SGTI">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:subject>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:subject>
						<arco-cd:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
	                    	</xsl:attribute>
						</arco-cd:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/*/THS/THSD">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:subject>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:subject>
						<arco-cd:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
	                    	</xsl:attribute>
						</arco-cd:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/NU/DA/DES/DESU">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:subject>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:subject>
						<arco-cd:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
	                    	</xsl:attribute>
						</arco-cd:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/DA/AID/AIDI">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:subject>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:subject>
						<arco-cd:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:arcofy(.))" />
	                    	</xsl:attribute>
						</arco-cd:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:if
					test="record/metadata/schede/*/DA/DES/DESI and not(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESI))='nr' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESI))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESI))='nr (recupero pregresso)')">
					<xsl:for-each
						select="record/metadata/schede/*/DA/DES/DESI">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:iconclassCode>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each
					select="record/metadata/schede/*/DA/AID/AIDC">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:iconclassCode>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/F/SG/SGS">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(./SGSI)), 'nr')) and not(starts-with(lower-case(normalize-space(./SGSI)), 'n.r'))">
						<arco-cd:iconclassCode>
							<xsl:value-of select="normalize-space(./SGSI)" />
						</arco-cd:iconclassCode>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/OG/SGT/SGTT">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:title>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:title>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/DA/AID/AIDT">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:title>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:title>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/DA/AID/AIDN">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:alternativeTitle>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:alternativeTitle>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<!-- proper title -->
				<xsl:if test="not($sheetType='PST')">

					<xsl:for-each
						select="record/metadata/schede/*/OG/SGT/SGTP">
						<xsl:if
							test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<arco-cd:properTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:properTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
							<xsl:value-of
									select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each
					select="record/metadata/schede/*/SG/SGL/SGLT">
					<xsl:choose>
						<xsl:when
							test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:properTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:properTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
								<xsl:value-of
									select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- attributed title -->
				<xsl:for-each
					select="record/metadata/schede/*/SG/SGL/SGLA">
					<xsl:choose>
						<xsl:when
							test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:attributedTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:attributedTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
								<xsl:value-of
									select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
							</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- parallel title -->
				<xsl:for-each
					select="record/metadata/schede/*/OG/SGT/SGTR">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
						<arco-cd:parallelTitle>
							<xsl:value-of select="normalize-space(.)" />
						</arco-cd:parallelTitle>
						<arco-cd:hasTitle>
							<xsl:attribute name="rdf:resource">
							<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
						</arco-cd:hasTitle>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="record/metadata/schede/*/SG/SGL/SGLL">
					<xsl:choose>
						<xsl:when
							test="(starts-with(lower-case(normalize-space(.)), 'nr')) or (starts-with(lower-case(normalize-space(.)), 'n.r'))">
							<xsl:value-of />
						</xsl:when>
						<xsl:otherwise>
							<arco-cd:parallelTitle>
								<xsl:value-of select="normalize-space(.)" />
							</arco-cd:parallelTitle>
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
							<xsl:value-of
									select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- decorative apparatus -->
				<xsl:for-each select="record/metadata/schede/*/DA/APF">
					<arco-dd:hasIconographicOrDecorativeApparatus>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'IconographicOrDecorativeApparatus/', $itemURI, '-decorative-', position())" />
						</xsl:attribute>
					</arco-dd:hasIconographicOrDecorativeApparatus>
				</xsl:for-each>
				<!-- reference coin legend (NU) -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTL">
					<arco-arco:hasReferenceCoinLegend>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'ReferenceCoinLegend/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTL)))" />
						</xsl:attribute>
					</arco-arco:hasReferenceCoinLegend>
				</xsl:if>
				<!-- cultural property availability -->
				<xsl:if test="record/metadata/schede/*/OG/OGR">
					<arco-dd:hasCulturalPropertyAvailability>
						<xsl:choose>
							<xsl:when
								test="lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='bene disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='reale'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="'https://w3id.org/arco/ontology/denotative-description/Available'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:when
								test="lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='bene già catalogato, non più disponibile' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='documentata' or lower-case(normalize-space(record/metadata/schede/*/OG/OGR))='non più disponibile'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="'https://w3id.org/arco/ontology/denotative-description/NoLongerAvailable'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'CulturalPropertyAvailability/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGR)))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-dd:hasCulturalPropertyAvailability>
				</xsl:if>
				<!-- cultural property accessibility -->
				<xsl:if test="record/metadata/schede/*/LC/ACB">
					<arco-dd:hasCulturalPropertyAccessibility>
						<xsl:choose>
							<xsl:when
								test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='si' or lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='sì'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="'https://w3id.org/arco/ontology/denotative-description/Accessible'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:when
								test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='no'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="'https://w3id.org/arco/ontology/denotative-description/Inaccessible'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:when
								test="lower-case(normalize-space(record/metadata/schede/*/LC/ACB/ACBA))='in parte'">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="'https://w3id.org/arco/ontology/denotative-description/PartiallyAccessible'" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'CulturalPropertyAccessibility/', arco-fn:urify(normalize-space(record/metadata/schede/*/LC/ACB/ACBA)))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-dd:hasCulturalPropertyAccessibility>
				</xsl:if>
				<!-- numismatic property counterstamp -->
				<xsl:for-each select="record/metadata/schede/NU/DA/CON">
					<arco-dd:hasAffixedElement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'Counterstamp/', $itemURI, '-counterstamp')" />
						</xsl:attribute>
					</arco-dd:hasAffixedElement>
				</xsl:for-each>
				<!-- cultural property cataloguing category -->
				<xsl:if test="record/metadata/schede/*/OG/OGT/OGTV">
					<arco-arco:hasCulturalPropertyCataloguingCategory>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'CulturalPropertyCataloguingCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)))" />
						</xsl:attribute>
					</arco-arco:hasCulturalPropertyCataloguingCategory>
				</xsl:if>
				<!-- relation with preparatory or final work (RO/ROF) -->
				<xsl:if test="record/metadata/schede/*/RO/ROF">
					<xsl:for-each select="record/metadata/schede/*/RO/ROF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-preparatory-final-work-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with copy (RO/COP) -->
				<xsl:if
					test="record/metadata/schede/*/RO/COP or record/metadata/schede/*/RO/CRF/CRFT='copia'">
					<xsl:for-each
						select="record/metadata/schede/*/RO/COP | record/metadata/schede/*/RO/CRF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-copy-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a generic derivated work (if RO/CRF/CRFT != 'replica' 
					or 'contraffazione' or 'controtipo' or 'reimpiego' or 'copia') -->
				<xsl:if
					test="record/metadata/schede/*/RO/CRF and not(record/metadata/schede/*/RO/CRF/CRFT='copia' or record/metadata/schede/*/RO/CRF/CRFT='contraffazione' or record/metadata/schede/*/RO/CRF/CRFT='controtipo' or record/metadata/schede/*/RO/CRF/CRFT='replica' or record/metadata/schede/*/RO/CRF/CRFT='reimpiego')">
					<xsl:for-each select="record/metadata/schede/*/RO/CRF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-derivated-work-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: forgery -->
				<xsl:if
					test="record/metadata/schede/*/RO/CRF/CFRT='contraffazione'">
					<xsl:for-each select="record/metadata/schede/*/RO/CRF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-forgery-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: facsimile -->
				<xsl:if
					test="record/metadata/schede/*/RO/CRF/CFRT='controtipo'">
					<xsl:for-each select="record/metadata/schede/*/RO/CRF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-facsimile-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: same author copy -->
				<xsl:if test="record/metadata/schede/*/RO/CRF/CFRT='replica'">
					<xsl:for-each select="record/metadata/schede/*/RO/CRF">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-same-author-copy-', position())" />
							</xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: reuse -->
				<xsl:if
					test="record/metadata/schede/*/RO/REI or record/metadata/schede/*/RO/RIU or record/metadata/schede/*/RO/CRF/CFRT='reimpiego'">
					<xsl:for-each
						select="record/metadata/schede/*/RO/REI | record/metadata/schede/*/RO/RIU | record/metadata/schede/*/RO/CRF">
						<xsl:choose>
							<xsl:when
								test="./* and (not(./REIP) or ./REIP='intero bene' or ./REIP='integrale' or ./REIP='tutta' or ./REIP='totale') or (starts-with(lower-case(normalize-space(./REIP)), 'nr')) or (starts-with(lower-case(normalize-space(./REIP)), 'n.r')) or (starts-with(lower-case(normalize-space(./REIP)), 'intero')) or (starts-with(lower-case(normalize-space(./REIP)), 'intera')) or (starts-with(lower-case(normalize-space(./REIP)), 'esemplar'))">
								<arco-cd:hasRelatedWorkSituation>
									<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
										select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
								</arco-cd:hasRelatedWorkSituation>
							</xsl:when>
							<xsl:when test="../RIU">
								<arco-cd:hasRelatedWorkSituation>
									<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
										select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
								</arco-cd:hasRelatedWorkSituation>
							</xsl:when>
							<xsl:when test="../CRF">
								<arco-cd:hasRelatedWorkSituation>
									<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
										select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
								</arco-cd:hasRelatedWorkSituation>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./REIP">
									<arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
											select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
									</arco-core:hasPart>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: print in publication 
					(S) -->
				<xsl:if test="record/metadata/schede/*/RO/ADL">
					<xsl:for-each select="record/metadata/schede/*/RO/ADL">
						<arco-cd:hasRelatedWorkSituation>
							<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
								select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-print-in-publication-', position())" />
			                        </xsl:attribute>
						</arco-cd:hasRelatedWorkSituation>
					</xsl:for-each>
				</xsl:if>
				<!-- name in time (NU/OG/OGT/OGTO) -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTO">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of
							select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTO)))" />                      	                            
                        </xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:if>
				<!-- name in time (OG/OGD) -->
				<xsl:for-each select="record/metadata/schede/*/OG/OGD">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of
							select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                        </xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:for-each>
				<!-- name in time (OG/OGT/OGTN) -->
				<xsl:for-each
					select="record/metadata/schede/*/OG/OGT/OGTN">
					<arco-dd:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        			<xsl:value-of
							select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />   	                            
                        </xsl:attribute>
					</arco-dd:hasDesignationInTime>
				</xsl:for-each>
				<xsl:if
					test="record/metadata/schede/*/OG/OGT/OGTD and $sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
					<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD">
						<arco-dd:hasDesignationInTime>
							<xsl:attribute name="rdf:resource">
                        			<xsl:value-of
								select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)))" />   	                            
                        </xsl:attribute>
						</arco-dd:hasDesignationInTime>
					</xsl:if>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTE">
					<xsl:choose>
						<xsl:when
							test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'erbario')">
							<arco-dd:hasDesignationInTime>
								<xsl:attribute name="rdf:resource">
                        			<xsl:value-of
									select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTE)))" />   	                            
                        		</xsl:attribute>
							</arco-dd:hasDesignationInTime>
						</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNB/OG/OGT/OGTC">
					<xsl:choose>
						<xsl:when
							test="record/metadata/schede/BNB/OG/OGT/OGTD and starts-with(lower-case(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTD)), 'collezione')">
							<arco-dd:hasDesignationInTime>
								<xsl:attribute name="rdf:resource">
                        			<xsl:value-of
									select="concat('https://w3id.org/arco/resource/DesignationInTime/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/BNB/OG/OGT/OGTC)))" />   	                            
                        		</xsl:attribute>
							</arco-dd:hasDesignationInTime>
						</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- identifier:uniqueIdentifier - concat of NCTR + NCTN + NCTS available 
					in record/metadata/schede/*/CD/NCT) -->
				<xsl:if test="record/metadata/schede/*/CD/NCT/NCTN">
					<arco-arco:uniqueIdentifier>
						<xsl:value-of
							select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
					</arco-arco:uniqueIdentifier>
				</xsl:if>
				<!-- NCTR Codice Regione (record/metadata/schede/*/CD/NCT/NCTR) -->
				<xsl:for-each
					select="record/metadata/schede/*/CD/NCT/NCTR">
					<arco-arco:regionIdentifier>
						<xsl:value-of select="." />
					</arco-arco:regionIdentifier>
				</xsl:for-each>
				<!-- NCTN Numero catalogo generale (record/metadata/schede/*/CD/NCT/NCTN) -->
				<xsl:for-each
					select="record/metadata/schede/*/CD/NCT/NCTN">
					<arco-arco:catalogueNumber>
						<xsl:value-of select="." />
					</arco-arco:catalogueNumber>
				</xsl:for-each>
				<!-- NCTS Suffisso (record/metadata/schede/*/CD/NCT/NCTS) -->
				<xsl:for-each
					select="record/metadata/schede/*/CD/NCT/NCTS">
					<arco-arco:suffix>
						<xsl:value-of select="." />
					</arco-arco:suffix>
				</xsl:for-each>
				<!-- finding note (RE/RES) -->
				<xsl:if test="record/metadata/schede/*/RE/RES">
					<arco-cd:findingNote>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/RE/RES)" />
					</arco-cd:findingNote>
				</xsl:if>
				<!-- finding note (RP/SPR, norm RA 2.00) -->
				<xsl:if test="record/metadata/schede/*/RP/SPR">
					<arco-cd:findingNote>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/*/RP/SPR)" />
					</arco-cd:findingNote>
				</xsl:if>
				<!-- finding note (RP/ROC, norm RA 2.00) -->
				<xsl:for-each select="record/metadata/schede/*/RP/ROC">
					<arco-cd:findingNote>
						<xsl:choose>
							<xsl:when test="./ROCC and ./ROCI">
								<xsl:value-of
									select="concat(normalize-space(./ROCC), ' | ', normalize-space(./ROCI))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(./ROCC), normalize-space(./ROCI))" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:findingNote>
				</xsl:for-each>
				<!-- alternative photographic heritage classification -->
				<xsl:if test="record/metadata/schede/*/SG/CLF/*">
					<xsl:for-each select="record/metadata/schede/*/SG/CLF">
						<arco-arco:hasPhotographicHeritageClassification>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'PhotographicHeritageClassification/', $itemURI, '-alternative-classification-', position())" />
								</xsl:attribute>
						</arco-arco:hasPhotographicHeritageClassification>
					</xsl:for-each>
				</xsl:if>
				<!-- cultural property classification based on inventory -->
				<xsl:if
					test="record/metadata/schede/*/OG/OGT/OGTS and not($sheetType='NU' or $sheetType='VeAC' or $sheetType='F' or $sheetType='BNB')">
					<arco-arco:hasCulturalPropertyInventoryCategory>
						<xsl:attribute name="rdf:resource">
									<xsl:value-of
							select="concat($NS, 'CulturalPropertyInventoryCategory/', arco-fn:urify(normalize-space(record/metadata/schede/*/OG/OGT/OGTS)))" />
								</xsl:attribute>
					</arco-arco:hasCulturalPropertyInventoryCategory>
				</xsl:if>
				<!-- numismatic property functional classification -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTH">
					<arco-arco:hasNumismaticPropertyCategory>
						<xsl:attribute name="rdf:resource">
								<xsl:value-of
							select="concat($NS, 'NumismaticPropertyFunctionalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTH)))" />
							</xsl:attribute>
					</arco-arco:hasNumismaticPropertyCategory>
				</xsl:if>
				<!-- numismatic property typological classification -->
				<xsl:if test="record/metadata/schede/NU/OG/OGT/OGTT">
					<arco-arco:hasNumismaticPropertyCategory>
						<xsl:attribute name="rdf:resource">
								<xsl:value-of
							select="concat($NS, 'NumismaticPropertyTypologicalCategory/', arco-fn:urify(normalize-space(record/metadata/schede/NU/OG/OGT/OGTT)))" />
							</xsl:attribute>
					</arco-arco:hasNumismaticPropertyCategory>
				</xsl:if>
				<!-- copyright -->
				<xsl:for-each select="record/metadata/schede/*/TU/CPR">
					<arco-cd:hasCopyright>
						<xsl:attribute name="rdf:resource">
								<xsl:value-of
							select="concat($NS, 'Copyright/', $itemURI, '-copyright-', position())" />
							</xsl:attribute>
					</arco-cd:hasCopyright>
				</xsl:for-each>
				<!-- dedication (DA/DDC) -->
				<xsl:if test="record/metadata/schede/*/AU/DDC/*">
					<xsl:for-each select="record/metadata/schede/*/AU/DDC">
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Dedication/', $itemURI, '-dedication-', position())" />
								</xsl:attribute>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- inscription (DA/ISR) -->
				<xsl:if test="record/metadata/schede/*/DA/ISR/*">
					<xsl:for-each select="record/metadata/schede/*/DA/ISR">
						<arco-dd:hasAffixedElement>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Inscription/', $itemURI, '-inscription-', position())" />
								</xsl:attribute>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- affixed element (DA/STM) -->
				<xsl:if test="record/metadata/schede/*/DA/STM/*">
					<xsl:for-each select="record/metadata/schede/*/DA/STM">
						<arco-dd:hasAffixedElement>
							<xsl:choose>
								<xsl:when
									test="lower-case(normalize-space(./STMC))='timbro'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./STMC))='stemma'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./STMC))='emblema'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./STMC))='marchio'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./STMC))='logo'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- affixed element (*/LSI) -->
				<xsl:if test="record/metadata/schede/A/*/LSI/*">
					<xsl:for-each select="record/metadata/schede/A/*/LSI">
						<arco-dd:hasAffixedElement>
							<xsl:choose>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='timbro'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='stemma'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='emblema'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='marchio'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='logo'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:when
									test="lower-case(normalize-space(./LSIG))='lapide'">
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'HistoricalPlaque/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
									<xsl:value-of
										select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-dd:hasAffixedElement>
					</xsl:for-each>
				</xsl:if>
				<!-- affixed element (DA/ISE) -->
				<xsl:for-each select="record/metadata/schede/*/DA/ISE">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./ISER) or ./ISER='intero bene' or ./ISER='integrale' or ./ISER='tutta' or ./ISER='totale') or (starts-with(lower-case(normalize-space(./ISER)), 'nr')) or (starts-with(lower-case(normalize-space(./ISER)), 'n.r')) or (starts-with(lower-case(normalize-space(./ISER)), 'intero')) or (starts-with(lower-case(normalize-space(./ISER)), 'intera')) or (starts-with(lower-case(normalize-space(./ISER)), 'esemplar'))">
							<arco-dd:hasAffixedElement>
								<xsl:choose>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='timbro'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'Stamp/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='stemma'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'CoatOfArms/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='emblema'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'Emblem/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='marchio'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'Brand/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='logo'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'Logo/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:when
										test="lower-case(normalize-space(./ISED))='iscrizione'">
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'Inscription/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="rdf:resource">
									<xsl:value-of
											select="concat($NS, 'AffixedElement/', $itemURI, '-affixed-element-', position())" />
								</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</arco-dd:hasAffixedElement>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./ISER">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- finding context (AT) -->
				<xsl:if
					test="record/metadata/schede/AT/OG/OGC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)), 'n.r')))">
					<arco-cd:hasFindingContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'FindingContext/', $itemURI, '-', arco-fn:urify(normalize-space(record/metadata/schede/AT/OG/OGC/OGCT)))" />
						</xsl:attribute>
					</arco-cd:hasFindingContext>
				</xsl:if>
				<!-- coin issuance (NU) -->
				<xsl:for-each select="record/metadata/schede/*/DA/AUE">
					<arco-cd:hasCoinIssuance>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of
							select="concat($NS, 'CoinIssuance/', $itemURI, '-issuance-', position())" />
						</xsl:attribute>
					</arco-cd:hasCoinIssuance>
				</xsl:for-each>
				<!-- Use of cultural property -->
				<xsl:if
					test="not(record/metadata/schede/A/UT or record/metadata/schede/PG/UT)">
					<xsl:for-each select="record/metadata/schede/*/UT">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
								select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
	                		</xsl:attribute>
						</arco-cd:hasUse>
					</xsl:for-each>
				</xsl:if>
				<xsl:if
					test="record/metadata/schede/*/DA/UTF or record/metadata/schede/*/DA/UTM or record/metadata/schede/*/DA/UTS">
					<arco-cd:hasUse>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Use/', $itemURI, '-use')" />
	                		</xsl:attribute>
					</arco-cd:hasUse>
				</xsl:if>
				<xsl:for-each select="record/metadata/schede/*/US/USO">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./USOR) or ./USOR='intero bene' or ./USOR='integrale' or ./USOR='tutta' or ./USOR='totale') or (starts-with(lower-case(normalize-space(./USOR)), 'nr')) or (starts-with(lower-case(normalize-space(./USOR)), 'n.r')) or (starts-with(lower-case(normalize-space(./USOR)), 'intero')) or (starts-with(lower-case(normalize-space(./USOR)), 'intera')) or (starts-with(lower-case(normalize-space(./USOR)), 'esemplar'))">
							<arco-dd:hasUse>
								<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
									select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
 	                	</xsl:attribute>
							</arco-dd:hasUse>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./USOR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="record/metadata/schede/*/US/USA">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./USAR) or ./USAR='intero bene' or ./USAR='integrale' or ./USAR='tutta' or ./USAR='totale') or (starts-with(lower-case(normalize-space(./USAR)), 'nr')) or (starts-with(lower-case(normalize-space(./USAR)), 'n.r')) or (starts-with(lower-case(normalize-space(./USAR)), 'intero')) or (starts-with(lower-case(normalize-space(./USAR)), 'intera')) or (starts-with(lower-case(normalize-space(./USAR)), 'esemplar'))">
							<arco-dd:hasUse>
								<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
									select="concat($NS, 'Use/', $itemURI, '-current-use-', position())" />
 	                	</xsl:attribute>
							</arco-dd:hasUse>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./USAR">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- paleopathology survey -->
				<xsl:for-each select="record/metadata/schede/*/PT/PTC">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./PTCE) or ./PTCE='intero bene' or ./PTCE='integrale' or ./PTCE='tutta' or ./PTCE='totale') or (starts-with(lower-case(normalize-space(./PTCE)), 'nr')) or (starts-with(lower-case(normalize-space(./PTCE)), 'n.r')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intero')) or (starts-with(lower-case(normalize-space(./PTCE)), 'intera')) or (starts-with(lower-case(normalize-space(./PTCE)), 'esemplar'))">
							<arco-cd:hasSurvey>
								<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
									select="concat($NS, 'PaleopathologySurvey/', $itemURI, '-survey-', position())" />
 	                	</xsl:attribute>
							</arco-cd:hasSurvey>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./PTCE">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- obverse of coin -->
				<xsl:if
					test="record/metadata/schede/NU/DA/DES/DESA or record/metadata/schede/NU/DA/DES/DESL or record/metadata/schede/NU/DA/DES/DESN or record/metadata/schede/NU/DA/DES/DESF">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-obverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<!-- reverse of coin -->
				<xsl:if
					test="record/metadata/schede/NU/DA/DES/DESM or record/metadata/schede/NU/DA/DES/DESG or record/metadata/schede/NU/DA/DES/DESR or record/metadata/schede/NU/DA/DES/DEST">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-reverse')" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:if>
				<!-- parts of anthropological material -->
				<xsl:for-each select="record/metadata/schede/AT/EL/ELE">
					<arco-core:hasPart>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(./ELEE)))" />
	                	</xsl:attribute>
					</arco-core:hasPart>
				</xsl:for-each>
				<!-- sex estimate -->
				<xsl:if test="record/metadata/schede/AT/DA/STS">
					<arco-cd:hasSexInterpretation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of
							select="concat($NS, 'SexInterpretation/', $itemURI)" />
                		</xsl:attribute>
					</arco-cd:hasSexInterpretation>
				</xsl:if>
				<!-- age of death estimate -->
				<xsl:if test="record/metadata/schede/AT/DA/SEM">
					<arco-cd:hasAgeOfDeathInterpretation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of
							select="concat($NS, 'AgeOfDeathInterpretation/', $itemURI)" />
                		</xsl:attribute>
					</arco-cd:hasAgeOfDeathInterpretation>
				</xsl:if>
				<!-- material of cultural property (version 4.00) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCM)), 'n.r'))">
					<xsl:if test="record/metadata/schede/*/MT/MTC/MTCM">
						<xsl:choose>
							<xsl:when
								test="(not(record/metadata/schede/*/MT/MTC/MTCP) or record/metadata/schede/*/MT/MTC/MTCP='intero bene' or record/metadata/schede/*/MT/MTC/MTCP='integrale' or record/metadata/schede/*/MT/MTC/MTCP='tutta' or record/metadata/schede/*/MT/MTC/MTCP='totale') or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'esemplar'))">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
										select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<arco-dd:hasMaterial>
									<xsl:attribute name="rdf:resource">
            					<xsl:value-of
										select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/MTC/MTCM)))" />
            			</xsl:attribute>
								</arco-dd:hasMaterial>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each
									select="record/metadata/schede/*/MT/MTC/MTCP">
									<arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
											select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
									</arco-core:hasPart>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:if>
				<!-- material of cultural property (VeAC) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCF)), 'nr'))">
					<xsl:if test="record/metadata/schede/VeAC/MT/MTC/MTCF">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasMaterial>
							<xsl:attribute name="rdf:resource">
 	                	<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCF)))" />
            		</xsl:attribute>
						</arco-dd:hasMaterial>
					</xsl:if>
				</xsl:if>
				<!-- technique of cultural property (4.00) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCT)), 'n.r'))">
					<xsl:if test="record/metadata/schede/*/MT/MTC/MTCT">
						<xsl:choose>
							<xsl:when test="$sheetType='VeAC'">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
										select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<arco-dd:hasTechnique>
									<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
										select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCT)))" />
		            		</xsl:attribute>
								</arco-dd:hasTechnique>
							</xsl:when>
							<xsl:when
								test="(not(record/metadata/schede/*/MT/MTC/MTCP)) or record/metadata/schede/*/MT/MTC/MTCP='intero bene' or record/metadata/schede/*/MT/MTC/MTCP='integrale' or record/metadata/schede/*/MT/MTC/MTCP='tutta' or record/metadata/schede/*/MT/MTC/MTCP='totale' or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'esemplar'))">
								<arco-dd:hasTechnicalStatus>
									<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
										select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
								</arco-dd:hasTechnicalStatus>
								<arco-dd:hasTechnique>
									<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
										select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/MTC/MTCT)))" />
		            		</xsl:attribute>
								</arco-dd:hasTechnique>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each
									select="record/metadata/schede/*/MT/MTC/MTCP">
									<arco-core:hasPart>
										<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
											select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
									</arco-core:hasPart>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:if>
				<!-- materialOrTechnique of cultural property (previous versions) -->
				<xsl:if
					test="not(record/metadata/schede/*/MT/MTC/*) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC)), 'n.r')))">
					<xsl:if test="record/metadata/schede/*/MT/MTC">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasMaterialOrTechnique>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/MTC)))" />
		            		</xsl:attribute>
						</arco-dd:hasMaterialOrTechnique>
					</xsl:if>
				</xsl:if>
				<!-- materialOrTechnique of cultural property (OAC) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/OAC/MT/MTC/MTCI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/OAC/MT/MTC/MTCI)), 'n.r'))">
					<xsl:if test="record/metadata/schede/OAC/MT/MTC/MTCI">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasMaterialOrTechnique>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/OAC/MT/MTC/MTCI)))" />
		            		</xsl:attribute>
						</arco-dd:hasMaterialOrTechnique>
					</xsl:if>
				</xsl:if>
				<!-- shape of cultural property -->
				<xsl:if
					test="record/metadata/schede/*/MT/FRM and not(record/metadata/schede/F/MT/FRM)">
					<xsl:if
						test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FRM)), 'n.r'))">
						<xsl:if test="record/metadata/schede/*/MT/FRM">
							<arco-dd:hasTechnicalStatus>
								<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
									select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
							</arco-dd:hasTechnicalStatus>
							<arco-dd:hasShape>
								<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
									select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FRM)))" />
		            		</xsl:attribute>
							</arco-dd:hasShape>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<!-- filigree of cultural property -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/FIL)), 'n.r'))">
					<xsl:if test="record/metadata/schede/*/MT/FIL">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasFiligree>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/*/MT/FIL)))" />
		            		</xsl:attribute>
						</arco-dd:hasFiligree>
					</xsl:if>
				</xsl:if>
				<!-- file format of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCF">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasFileFormat>
							<xsl:attribute name="rdf:resource">
		 	                	<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCF)))" />
		            		</xsl:attribute>
						</arco-dd:hasFileFormat>
					</xsl:if>
				</xsl:if>
				<!-- photo size of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FRM)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FRM">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasPhotoSize>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FRM)))" />
            			</xsl:attribute>
						</arco-dd:hasPhotoSize>
					</xsl:if>
				</xsl:if>
				<!-- photo program of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCP">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasPhotoProgram>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCP)))" />
            			</xsl:attribute>
						</arco-dd:hasPhotoProgram>
					</xsl:if>
				</xsl:if>
				<!-- storage method and colour depth of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCC">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasStorageMethodOrColourDepth>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCC)))" />
            			</xsl:attribute>
						</arco-dd:hasStorageMethodOrColourDepth>
					</xsl:if>
				</xsl:if>
				<!-- resolution of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCU">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasResolution>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCU)))" />
            			</xsl:attribute>
						</arco-dd:hasResolution>
					</xsl:if>
				</xsl:if>
				<!-- pixel dimension of photograph (F) -->
				<xsl:if
					test="not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)), 'n.r'))">
					<xsl:if test="record/metadata/schede/F/MT/FVC/FVCM">
						<arco-dd:hasTechnicalStatus>
							<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
								select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
						</arco-dd:hasTechnicalStatus>
						<arco-dd:hasPixelDimension>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVC/FVCM)))" />
            			</xsl:attribute>
						</arco-dd:hasPixelDimension>
					</xsl:if>
				</xsl:if>
				<!-- mass storage of photograph (F) -->
				<xsl:if
					test="record/metadata/schede/F/MT/FVM and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/FVM)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
							select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasMassStorage>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/FVM)))" />
            		</xsl:attribute>
					</arco-dd:hasMassStorage>
				</xsl:if>
				<!-- colour of photograph (F) -->
				<xsl:if
					test="record/metadata/schede/F/MT/MTX and (not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/F/MT/MTX)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of
							select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
 	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasPhotoColour>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/F/MT/MTX)))" />
            		</xsl:attribute>
					</arco-dd:hasPhotoColour>
				</xsl:if>
				<!-- digital photo note (F) -->
				<xsl:if
					test="record/metadata/schede/F/MT/FVC/FVCV or record/metadata/schede/F/MT/FVC/FVCN">
					<arco-dd:digitalPhotographNote>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/F/MT/FVC/FVCV">
								<xsl:value-of
									select="record/metadata/schede/F/MT/FVC/FVCV" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="record/metadata/schede/F/MT/FVC/FVCN" />
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of
							select="normalize-space(record/metadata/schede/F/MT/FVC/FVCV)" />
					</arco-dd:digitalPhotographNote>
				</xsl:if>
				<!-- colour of garment (VeAC) -->
				<xsl:if
					test="record/metadata/schede/VeAC/MT/MTC/MTCC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCC)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
							select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasGarmentColour>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCC)))" />
            		</xsl:attribute>
					</arco-dd:hasGarmentColour>
				</xsl:if>
				<!-- analysis of garment (VeAC) -->
				<xsl:if
					test="record/metadata/schede/VeAC/MT/MTC/MTCA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCA)), 'n.r')))">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of
							select="concat($NS, 'CulturalEntityTechnicalStatus/', $itemURI)" />
	                	</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
					<arco-dd:hasGarmentAnalysis>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCA)))" />
            		</xsl:attribute>
					</arco-dd:hasGarmentAnalysis>
				</xsl:if>
				<!-- Legal situation of cultural property -->
				<xsl:if test="record/metadata/schede/*/TU/CDG">
					<arco-cd:hasLegalSituation>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of
							select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(record/metadata/schede/*/TU/CDG/CDGG)))" />
                		</xsl:attribute>
					</arco-cd:hasLegalSituation>
				</xsl:if>
				<!-- Export import certification of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/ESP">
					<arco-cd:hasExportImportCertification>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of
							select="concat($NS, 'ExportImportCertification/', $itemURI, '-export-import-certification-', position())" />
                		</xsl:attribute>
					</arco-cd:hasExportImportCertification>
				</xsl:for-each>
				<!-- Protective measures of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/TU/NVC">
					<xsl:choose>
						<xsl:when
							test="(not(./NVCP) or ./NVCP='intero bene' or ./NVCP='integrale' or ./NVCP='tutta' or ./NVCP='totale') or (starts-with(lower-case(normalize-space(./NVCP)), 'nr')) or (starts-with(lower-case(normalize-space(./NVCP)), 'n.r')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intero')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intera')) or (starts-with(lower-case(normalize-space(./NVCP)), 'esemplar'))">
							<arco-cd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
                			<xsl:value-of
									select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
                		</xsl:attribute>
							</arco-cd:hasProtectiveMeasure>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./NVCP">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
								</arco-core:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- Protective Measure for A 2.00 -->
				<xsl:for-each select="record/metadata/schede/*/TU/VIN">
					<xsl:choose>
						<xsl:when
							test="./* and (not(./VINE) or ./VINE='intero bene' or ./VINE='integrale' or ./VINE='tutta' or ./VINE='totale') or (starts-with(lower-case(normalize-space(./VINE)), 'nr')) or (starts-with(lower-case(normalize-space(./VINE)), 'n.r')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intero')) or (starts-with(lower-case(normalize-space(./NVCP)), 'intera')) or (starts-with(lower-case(normalize-space(./NVCP)), 'esemplar'))">
							<arco-cd:hasProtectiveMeasure>
								<xsl:attribute name="rdf:resource">
                			<xsl:value-of
									select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
                		</xsl:attribute>
							</arco-cd:hasProtectiveMeasure>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="./VINE">
								<arco-core:hasPart>
									<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
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
                			<xsl:value-of
							select="concat($NS, 'UrbanPlanningInstrument/', $itemURI, '-urban-planning-instrument-', position())" />
                		</xsl:attribute>
					</arco-cd:hasUrbanPlanningInstrument>
				</xsl:for-each>
				<!-- Other related agents of cultural property -->
				<xsl:for-each select="record/metadata/schede/*/AU/NMC">
					<arco-cd:hasRelatedAgent>
						<xsl:attribute name="rdf:resource">
                			<xsl:choose>
                				<xsl:when test="./NMCA">
                					<xsl:value-of
							select="concat($NS, 'Agent/', $itemURI, '-', arco-fn:arcofy(concat(./NMCN, '-', ./NMCA)))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of
							select="concat($NS, 'Agent/', $itemURI, '-', arco-fn:arcofy(./NMCN))" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</xsl:attribute>
					</arco-cd:hasRelatedAgent>
				</xsl:for-each>
				<!-- Surveys -->
				<!-- observation survey of cultural property -->
				<xsl:if
					test="record/metadata/schede/BDM/DR/DRV/* and not($sheetVersion='4.00') and not($sheetVersion='4.00_ICCD0')">
					<arco-cd:hasSurvey>
						<xsl:attribute name="rdf:resource">
                			<xsl:value-of
							select="concat($NS, 'ObservationSurvey/', $itemURI)" />
                		</xsl:attribute>
					</arco-cd:hasSurvey>
				</xsl:if>
				<!-- Archaeological field survey of cultural property -->
				<xsl:if
					test="not(record/metadata/schede/*/RE/RCG/RCGD='0000/00/00' or record/metadata/schede/*/RE/RCG/RCGD='/') and record/metadata/schede/*/RE/RCG/*">
					<xsl:for-each select="record/metadata/schede/*/RE/RCG">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                			<xsl:value-of
								select="concat($NS, 'ArchaeologicalFieldSurvey/', $itemURI, '-survey-', position())" />
                		</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Archaeometric and diagnostic survey -->
				<xsl:if
					test="not(record/metadata/schede/*/RE/AIN/AIND='0000/00/00' or record/metadata/schede/*/RE/AIN/AIND='/') and record/metadata/schede/*/RE/AIN/*">
					<xsl:for-each select="record/metadata/schede/*/RE/AIN">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                			<xsl:value-of
								select="concat($NS, 'ArchaeometricDiagnosticSurvey/', $itemURI, '-survey-', position())" />
                		</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Archaeological excavation of cultural property -->
				<xsl:if
					test="not(record/metadata/schede/*/*/DSC/DSCD='0000/00/00' or record/metadata/schede/*/*/DSC/DSCD='/') and record/metadata/schede/*/*/DSC/*">
					<xsl:for-each select="record/metadata/schede/*/*/DSC">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                			<xsl:value-of
								select="concat($NS, 'ArchaeologicalExcavation/', $itemURI, '-survey-', position())" />
                		</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
				<!-- Inspection of cultural property -->
				<xsl:if
					test="not(record/metadata/schede/*/CM/ISP/ISPD='0000/00/00' or record/metadata/schede/*/CM/ISP/ISPD='/') and record/metadata/schede/*/CM/ISP/*">
					<xsl:for-each select="record/metadata/schede/*/CM/ISP">
						<arco-cd:hasSurvey>
							<xsl:attribute name="rdf:resource">
                			<xsl:value-of
								select="concat($NS, 'Inspection/', $itemURI, '-inspection-', position())" />
                		</xsl:attribute>
						</arco-cd:hasSurvey>
					</xsl:for-each>
				</xsl:if>
			</rdf:Description>






			<!-- Images retrieved from the OAI-PMH service of ICCD-MiBAC > <xsl:variable 
				name="image-link" select="arco-fn:find-image($item)" /> <xsl:if test="$image-link 
				!= ''"> <rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
				select="$objectOfDescription" /> </xsl:attribute> <foaf:image> <xsl:attribute 
				name="rdf:resource"> <xsl:value-of select="$image-link" /> </xsl:attribute> 
				</foaf:image> </rdf:Description> </xsl:if> -->
		</rdf:RDF>

	</xsl:template>
</xsl:stylesheet>